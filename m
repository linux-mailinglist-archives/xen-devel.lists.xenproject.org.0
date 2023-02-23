Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B7B6A0BD8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500440.771825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCYJ-0006Ih-DN; Thu, 23 Feb 2023 14:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500440.771825; Thu, 23 Feb 2023 14:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCYJ-0006Fo-9A; Thu, 23 Feb 2023 14:26:31 +0000
Received: by outflank-mailman (input) for mailman id 500440;
 Thu, 23 Feb 2023 14:26:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVCYH-0006F5-Re
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:26:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ee26c73-b386-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 15:26:27 +0100 (CET)
Received: from AM5PR0701CA0022.eurprd07.prod.outlook.com
 (2603:10a6:203:51::32) by AS8PR08MB7942.eurprd08.prod.outlook.com
 (2603:10a6:20b:53a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 14:26:22 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::7e) by AM5PR0701CA0022.outlook.office365.com
 (2603:10a6:203:51::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17 via Frontend
 Transport; Thu, 23 Feb 2023 14:26:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 14:26:22 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Thu, 23 Feb 2023 14:26:21 +0000
Received: from 4eab9c6ecb50.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEE96907-732C-44E2-A93D-BE0E7460D939.1; 
 Thu, 23 Feb 2023 14:26:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4eab9c6ecb50.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 14:26:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB8650.eurprd08.prod.outlook.com (2603:10a6:10:3d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Thu, 23 Feb
 2023 14:26:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:26:06 +0000
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
X-Inumbo-ID: 0ee26c73-b386-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYV1UllHu+z5OezRdKEkSVtgLGDsGPCpzAw1biBkPAQ=;
 b=TC7xOHzu9BptJSD7t1JteeBHeOIhXMdVtgAhfLPZxG2r6Y8GO43D3ivjuO/F4xGsYyi1Z0WGtOp0fB3zN8XhwvKZn8oI8KJ5wbXPYdCqemeAs+i83xmlXDeP7zOTdR3o1A+4tCJRVyOTIXFIxDO4x5AcnmN+iIYSGQwKrrLMMjc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78048b12f75a9532
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaU1ukEK8KyvjeEwXt3JAR+aQFnQb9EX5HUpTjsY+DkfJDbEtbJBjiopWf56EqUYlWApXnQ8LM7XaQ88bLnWZT3BSUzlPc1TJSW8TLv2wUHCDrUpucKANtaXS4CP+2cswr+cg2uyQaWXhHmx6RsO3jlQKVRMXtChlrLcN5NimbL6xrmHr3sNbG8p9/M0lCkDbb0zcCyJv8m7pXBwlW9iG+RCdWN43RQVIPuwsHfbEfTK9+cKGTLJL0UAH9558WA7LjYuUdFJB/6igZJslaspCh436OvcekgHrJb4WsM+9RwZBIyz/K+r307Z6Em+EdSWaNlf2WJc2P/1tWtFqBeITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYV1UllHu+z5OezRdKEkSVtgLGDsGPCpzAw1biBkPAQ=;
 b=VDq+KYwoDll7SNJxyDC38O3QeQzuHEsXhnFQhqL6K+ipUhFIOsfpsV9ElkON1TylHAX0oAIwLVockBGJjHUFvxPgdAF2a9EwA6EVp2M/vXCITo2AimswxBrBoi2e8dPezDGI1czxkwzuEGY8mvN1dYBKiVUtyb4SBB4whjNujBVr+DsL1w5DdQHeB+ns2MdlXXMEEMjOZEPyK7taRxAwLMoYqssvaLfSUOh94/FVM0gUEO6cxNLJpBDkHsxZ+FATsz3ohwd7n1DDdoUnPdNulnRcw9JVaKyYMxMjXRsYjWD5OVL5jZAUQmw4HefFNGu1dBiF3VKqidT3cvMAlzL46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYV1UllHu+z5OezRdKEkSVtgLGDsGPCpzAw1biBkPAQ=;
 b=TC7xOHzu9BptJSD7t1JteeBHeOIhXMdVtgAhfLPZxG2r6Y8GO43D3ivjuO/F4xGsYyi1Z0WGtOp0fB3zN8XhwvKZn8oI8KJ5wbXPYdCqemeAs+i83xmlXDeP7zOTdR3o1A+4tCJRVyOTIXFIxDO4x5AcnmN+iIYSGQwKrrLMMjc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/5] xen/arm64: Rework the memory layout
Thread-Topic: [PATCH v5 2/5] xen/arm64: Rework the memory layout
Thread-Index: AQHZMolNKWoO8TApqkilwj+aGDfZ6q7cu74AgAAEqwA=
Date: Thu, 23 Feb 2023 14:26:06 +0000
Message-ID: <10C94F78-A46D-48CE-8E6F-90F78153C02F@arm.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-3-julien@xen.org>
 <FCB35FDB-C5BA-44F8-BB4B-BB576D2C4AE4@arm.com>
In-Reply-To: <FCB35FDB-C5BA-44F8-BB4B-BB576D2C4AE4@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB8650:EE_|AM7EUR03FT006:EE_|AS8PR08MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b5b2df-8e16-477e-2f3b-08db15a9eff6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QclXPf2QUR9yTCxn7aGK6QWplqsg1qaeSyHpwU3tOZFLCHugDo/59BJrWiewLb+jWXWQ7b/nO8X2CMvJMp2ZHfYI/XOQ1/2XIcA1j0sitQtkxe/EbPK3f/WUzBVlL5dunST4mEfyggqrxVNucXZb5+LbxrH+nfwRLJCXZq9NZKslHyFP2AzDRUbrwVH1oVRXZNrt6KB+MrvELWwH9q/YBs//QHRETcgcEyiNAayc1HxStnxwj3IRu2Jye59sx0W0KNP5L6IYIaW8ZwmiXg+CbxH0o+n7rG72LiyQnbg+9Ea3nSRNqIlCQmn4tqhRH5K7j9N6+MmxsCUZMcwu2jHSfqNOhNyvNSS9ZpFjKrmbo5+Ny/whwQuk1PAM8pMeS+fG8PlZlRdKQGq34tOsDmO0dEHVr4OrjvWpR2kpCTiwYyRJONC33kymm9TXDGAhedxvifRvXg0VzeK/MBpMurxFIDxqTTcERGFhIS//J3197TiBb1PRuVSvq5ZV6kH5pIOZf88WmYa/8zhpt1Es5D3ZzAgUBsJPvKhYC7efKKkECLd9Ksvylz/tKNmxmvMFj6fgB/oamKtScAMUP6ODT+7ZdBcx6O4UvdXEoNWxq9tK6YafhaFhnWSoLvwljzf0zC/HsvhIchjv4W5DCmcZV8TirWIP7tdGB9H7M+XQL2m7KXKyCy6q39CRHAn4qkAyc5mM3JveVsFfhwYeXEdIYpBG7DZOXIiSD9/Ji6DYZFxdimN2chgO3UAuwPSwebNqRqEw94i14n5TTuUoCIASy+/XbZRwyZ4ipVV4Y/PusUIkGYo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199018)(6486002)(76116006)(71200400001)(66556008)(122000001)(6916009)(4326008)(8676002)(66446008)(66476007)(38070700005)(66946007)(64756008)(86362001)(2906002)(41300700001)(91956017)(5660300002)(8936002)(38100700002)(2616005)(316002)(33656002)(54906003)(83380400001)(36756003)(478600001)(26005)(6512007)(6506007)(186003)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4A7A0B213CD1CF438E40FFCCCE4DBA7D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c45304d5-3fef-4507-86df-08db15a9e6bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	guIUi2GKxJmPMiFBce0CTjkBz8D3oKJg4NNR0hhVu6fxlUJ1XmScI5q8FXgjkbXoz5xF9QKT2iCJaC4KRV8pbOefCSME3d36YxtQZM5n0QZ1H4SEvaJCHQS2h9kaja+s4NRB25A7JANYBmvTvn5CW0jI6XNXQTW3SQQFGXC58fNaXQEMj5bEDHLBTRkM3b7mc21Y9J1KSReSfrz+1ocFVVEZSSXq0KPS9y5AA4f5wj9g2U4t+lAf8a16ZnX31ZP/Ch40dYOcHq6qJk+NtBJJraQDLpDgCx4TuIq5tLyLTQ9cvzQUkFydWOgu8XOjurpj8gVxl/uwizNp16764apBTov2X6/l3rOEnNSX/vvoJmyvuNM/fcHPoXQWWYs3n4JxiSHVzwjCO+SHkwyNK4Us7Fy5IEzhMIU/vG7VWkRw3LsVsuUmR6iaYcCrM4tKZlLtDpRNtTCroA7X+aJI4R9uJBbZ+Qjf78fvc71Polvqwb6uXa9PXZmk/tErTjCt4QzgOwrEU0SztSQqCG4tzNXYT6/yn5/JW7CElIX1qg5kLdn3sQtkM4XK6Vd+ypIajvydXiU0tCt71vt6UoidAqSbvwlmiazVTwZqq8N/eoXd3iKPmqCXfVxKosmPrbsKyx2KqEor4KRb/gezXqDY1Q6VDl8w40zsHCt5G9xoFzqufKqNF44LLN/Su9KGm4lMXSnwQjwtp/qgtsCogBpK68GyUA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199018)(46966006)(36840700001)(40470700004)(2616005)(26005)(5660300002)(6512007)(186003)(8936002)(40460700003)(6486002)(6862004)(6506007)(336012)(53546011)(4326008)(47076005)(107886003)(83380400001)(356005)(36756003)(82310400005)(40480700001)(81166007)(478600001)(8676002)(82740400003)(41300700001)(2906002)(70206006)(70586007)(36860700001)(33656002)(316002)(86362001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:26:22.1664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b5b2df-8e16-477e-2f3b-08db15a9eff6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7942



> On 23 Feb 2023, at 15:09, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Julien,
>=20
>> On 27 Jan 2023, at 20:55, Julien Grall <julien@xen.org> wrote:
>>=20
>> From: Julien Grall <jgrall@amazon.com>
>>=20
>> Xen is currently not fully compliant with the Arm Arm because it will
>> switch the TTBR with the MMU on.
>>=20
>> In order to be compliant, we need to disable the MMU before
>> switching the TTBR. The implication is the page-tables should
>> contain an identity mapping of the code switching the TTBR.
>>=20
>> In most of the case we expect Xen to be loaded in low memory. I am aware
>> of one platform (i.e AMD Seattle) where the memory start above 512GB.
>> To give us some slack, consider that Xen may be loaded in the first 2TB
>> of the physical address space.
>>=20
>> The memory layout is reshuffled to keep the first four slots of the zero=
eth
>> level free. Xen will now be loaded at (2TB + 2MB). This requires a sligh=
t
>> tweak of the boot code because XEN_VIRT_START cannot be used as an
>> immediate.
>>=20
>> This reshuffle will make trivial to create a 1:1 mapping when Xen is
>> loaded below 2TB.
>>=20
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
> With the finding for the comparison to 4 and not 2 found by Michal fixed:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com <mailto:bertrand.=
marquis@arm.com>>

Sorry for that:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> Cheers
> Bertrand
>=20
>>=20
>> ---
>>   Changes in v5:
>>       - We are reserving 4 slots rather than 2.
>>       - Fix the addresses in the layout comment.
>>       - Fix the size of the region in the layout comment
>>       - Add Luca's tested-by (the reviewed-by was not added
>>         because of the changes requested by Michal
>>       - Add Michal's reviewed-by
>>=20
>>   Changes in v4:
>>       - Correct the documentation
>>       - The start address is 2TB, so slot0 is 4 not 2.
>>=20
>>   Changes in v2:
>>       - Reword the commit message
>>       - Load Xen at 2TB + 2MB
>>       - Update the documentation to reflect the new layout
>> ---
>> xen/arch/arm/arm64/head.S         |  3 ++-
>> xen/arch/arm/include/asm/config.h | 34 +++++++++++++++++++++----------
>> xen/arch/arm/mm.c                 | 11 +++++-----
>> 3 files changed, 31 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 4a3f87117c83..663f5813b12e 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -607,7 +607,8 @@ create_page_tables:
>>         * need an additional 1:1 mapping, the virtual mapping will
>>         * suffice.
>>         */
>> -        cmp   x19, #XEN_VIRT_START
>> +        ldr   x0, =3DXEN_VIRT_START
>> +        cmp   x19, x0
>>        bne   1f
>>        ret
>> 1:
>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/as=
m/config.h
>> index 5df0e4c4959b..e388462c23d1 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -72,16 +72,13 @@
>> #include <xen/page-size.h>
>>=20
>> /*
>> - * Common ARM32 and ARM64 layout:
>> + * ARM32 layout:
>> *   0  -   2M   Unmapped
>> *   2M -   4M   Xen text, data, bss
>> *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>> *   6M -  10M   Early boot mapping of FDT
>> *   10M - 12M   Livepatch vmap (if compiled in)
>> *
>> - * ARM32 layout:
>> - *   0  -  12M   <COMMON>
>> - *
>> *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>> * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>> *                    space
>> @@ -90,14 +87,23 @@
>> *   2G -   4G   Domheap: on-demand-mapped
>> *
>> * ARM64 layout:
>> - * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
>> - *   0  -  12M   <COMMON>
>> + * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
>> + *
>> + *  Reserved to identity map Xen
>> + *
>> + * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4]
>> + *  (Relative offsets)
>> + *   0  -   2M   Unmapped
>> + *   2M -   4M   Xen text, data, bss
>> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>> + *   6M -  10M   Early boot mapping of FDT
>> + *  10M -  12M   Livepatch vmap (if compiled in)
>> *
>> *   1G -   2G   VMAP: ioremap and early_ioremap
>> *
>> *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>> *
>> - * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
>> + * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
>> *  Unused
>> *
>> * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
>> @@ -107,7 +113,17 @@
>> *  Unused
>> */
>>=20
>> +#ifdef CONFIG_ARM_32
>> #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
>> +#else
>> +
>> +#define SLOT0_ENTRY_BITS  39
>> +#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>> +#define SLOT0_ENTRY_SIZE  SLOT0(1)
>> +
>> +#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
>> +#endif
>> +
>> #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
>>=20
>> #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
>> @@ -163,10 +179,6 @@
>>=20
>> #else /* ARM_64 */
>>=20
>> -#define SLOT0_ENTRY_BITS  39
>> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
>> -
>> #define VMAP_VIRT_START  GB(1)
>> #define VMAP_VIRT_SIZE   GB(1)
>>=20
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index f758cad545fa..0b0edf28d57a 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -153,7 +153,7 @@ static void __init __maybe_unused build_assertions(v=
oid)
>> #endif
>>    /* Page table structure constraints */
>> #ifdef CONFIG_ARM_64
>> -    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
>> +    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START) < 2);
>> #endif
>>    BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
>> #ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
>> @@ -496,10 +496,11 @@ void __init setup_pagetables(unsigned long boot_ph=
ys_offset)
>>    phys_offset =3D boot_phys_offset;
>>=20
>> #ifdef CONFIG_ARM_64
>> -    p =3D (void *) xen_pgtable;
>> -    p[0] =3D pte_of_xenaddr((uintptr_t)xen_first);
>> -    p[0].pt.table =3D 1;
>> -    p[0].pt.xn =3D 0;
>> +    pte =3D pte_of_xenaddr((uintptr_t)xen_first);
>> +    pte.pt.table =3D 1;
>> +    pte.pt.xn =3D 0;
>> +    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] =3D pte;
>> +
>>    p =3D (void *) xen_first;
>> #else
>>    p =3D (void *) cpu0_pgtable;
>> --=20
>> 2.38.1



