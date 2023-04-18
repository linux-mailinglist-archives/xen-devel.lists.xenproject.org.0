Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74686E6677
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 15:59:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522922.812585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polro-0008Q0-Kk; Tue, 18 Apr 2023 13:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522922.812585; Tue, 18 Apr 2023 13:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polro-0008NL-Hx; Tue, 18 Apr 2023 13:59:32 +0000
Received: by outflank-mailman (input) for mailman id 522922;
 Tue, 18 Apr 2023 13:59:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1polrm-0008NA-Tw
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 13:59:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d15c8dc-ddf1-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 15:59:30 +0200 (CEST)
Received: from AS8PR04CA0035.eurprd04.prod.outlook.com (2603:10a6:20b:312::10)
 by AM7PR08MB5431.eurprd08.prod.outlook.com (2603:10a6:20b:10c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:59:00 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::a4) by AS8PR04CA0035.outlook.office365.com
 (2603:10a6:20b:312::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 13:59:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 13:58:59 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Tue, 18 Apr 2023 13:58:59 +0000
Received: from 953d40ecfdfd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 073B72D5-8D01-424A-9865-3D02F11ADA55.1; 
 Tue, 18 Apr 2023 13:58:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 953d40ecfdfd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 13:58:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB8479.eurprd08.prod.outlook.com (2603:10a6:20b:55d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 13:58:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 13:58:45 +0000
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
X-Inumbo-ID: 3d15c8dc-ddf1-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmNww2X8yBE+p66gp08L+YaqPUcK4zCTMo5f2J6NXB4=;
 b=6dD9/+kZ4jb3wgbvTX+J3vpKNBvOqHWKmYYSQPnYA17oXsvitsK+ww6OSgWXfNa2JUALpun1tVxror5lus1PucOon4fn3XbwU3GuRFsyX4MWRLOtFwRPDjg460AIuIfxbBlgbSqP5PJcvOXebpy5WDp6nVpsebXwlNhHMrTAu/E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3978173ef834f1b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfM+vY9l9eKHnow2/yhLxjfhKS4O/G8BBZjrewi1WqjXlk2pjl4hL9b7HvnhiLiFftOamXlqhtKZ4mMjMBzW+vWiYqtRRfrdhLOEMVBBib6L6jeFa/2wdizpwQsodN7NTv3AuIYUIVOmTQUe0XEiWzfbhRrGvRe/6AQYV9D1IZ7b6SGuw6SILkQkcQIFstL1fa46f0LN4tKztop232MxtYqWymMJcAfK1iuqfYgPXwcfoDLnKwsqk/SMN+mGUVhFdvYM4P+qJpXtJU0EfUGM1YGWMH/iml8hoF3SwY9s0ouwt0iBS5zn8iZrpvjJ1/g7WvQ1tZOmmMg8Pb3d/EB6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmNww2X8yBE+p66gp08L+YaqPUcK4zCTMo5f2J6NXB4=;
 b=BktKO+Gr3j0YRVa0bA68xaq+Mc2SRrnjMuw8Ick+MRNkJuTc1J2Z25FVY2iANEIW2i9L2iA/qY9Sp66rI8+QVtWtVHSYIU/BjV8XKI0k30/K5ZpSNG5GrZySafVKgFQl0b9Tm4cqpbG4HhgwCK0NvGaS6PcONFUUnmGatYXernu+0RB01DP+Ke6im6GdhZSXcAnFDWQ+6xbOsmXRjCqu5W7SGAkUyfCw+w9F41Bx4P0oKlL3DRWfDeJ4akgvV/1+3PIfwPf3XjS8dENuclLMZbvm8HLdaygIA8GU/oMq65DJFOK3tA3AsCZyuU3TJBzuGKK6DlkKJKCIJfEXkCofGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmNww2X8yBE+p66gp08L+YaqPUcK4zCTMo5f2J6NXB4=;
 b=6dD9/+kZ4jb3wgbvTX+J3vpKNBvOqHWKmYYSQPnYA17oXsvitsK+ww6OSgWXfNa2JUALpun1tVxror5lus1PucOon4fn3XbwU3GuRFsyX4MWRLOtFwRPDjg460AIuIfxbBlgbSqP5PJcvOXebpy5WDp6nVpsebXwlNhHMrTAu/E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Thread-Topic: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Thread-Index: AQHZcHBTPKRFJKI7hUu6krfNforKJa8xGWKAgAABeAA=
Date: Tue, 18 Apr 2023 13:58:45 +0000
Message-ID: <1AB976E8-4A52-4392-899B-7ECFEF12F8E9@arm.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-3-julien@xen.org>
 <D357504A-B3BA-4058-98AF-973A7286D19A@arm.com>
In-Reply-To: <D357504A-B3BA-4058-98AF-973A7286D19A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB8479:EE_|AM7EUR03FT046:EE_|AM7PR08MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6bca53-3d58-462e-6232-08db40150f4f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bcSwEKVlNTk2bHieK2osvxotwPXIjnjFxWyHBX3vpk2j58Ee+bcXM7Wpg+e6ak4tc4G5Xme/4fFRMy9MHP9DM9qzS8JQ7vN9TgE0zWRe2GQGQZklH51REKZUAyPLdfGZsln5FO+MWkHYYUKGM81K9CQW92DszH8nASSc5DMwlqSG0YO5IN/F9kexSpabsyj5Qy8VgaVzR6nM67muiuKENpMZ+zyGJRSXDocgRU/SlDwFGLj83/yir1+5joKSbSSrpdF1lg3XtyOaU7fs9a8JIamt//tsfpmOQKBa8FDUkySssQBvjVr497AD2d2axsg+bdPhqAICg2xBr6CNAj59I7w1BLRnbU7iWKi74z7wgJ7fWtrSkGvkbqw5EwcOYxy9GkMNdK2etwrhPJhAZRQ6kX7aDE8XCJdhWMyJt1zEg3fJK/6RKJatmUgBD9aXwTVxRs3BvS0krM2bPM0FS22FGa7RVohhoNLjyC37TBBoO30TCHRdepX6Fsj8fu6xCaPi9BlMXQ9Dy5n1zaXlg62Gsd45VHiBGeISlL1DDSsHvt3lYn0Pu4ZO/0hYCF/5ScsetpIUS7PS7EBIACivd+p2OO130/D61oElju4JwDJgKljHvIhxpqmc8/NJE/yZvWpuBt/Au4YK/n10SRzWZ1r5LA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(66946007)(38070700005)(91956017)(66476007)(53546011)(76116006)(4326008)(64756008)(66446008)(66556008)(6506007)(6512007)(36756003)(71200400001)(2906002)(83380400001)(2616005)(6486002)(6916009)(186003)(86362001)(54906003)(5660300002)(8936002)(8676002)(38100700002)(122000001)(33656002)(478600001)(41300700001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3AA1E2DE678BE441AD7EB08A92B3BCC2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8479
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7214eae8-7ad1-43a3-a304-08db401506a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TkFDXjffWtsbhPWxL7n5/mTaFQ2+/tIPwVMOWRo217m5qBAm4H+XRkIZC6MS/1cL4a5ixcylpsJ7C1QguAAqweQjzcV9ZfGVeVwjnOpeNFwA1Zfqi3KOC9oXPDLD0Rl0hG56lvSysUUKNTzYC1j78JktNkyuvg/353zdiUOmlJTcUUrCvssoMFNhNsPLE5bk8lwPTaIPVchIeKIthdIL6e+x4svHpYZ+faohauvJZJnhPPIzXmoyZxXIDQNCWnkEvJ6fwI/dCP/VCwbvwm2haC80z2XyqZdUxMwCEphclvJf1sesQ0ofV2ZRDacwNELwIVSlhVefVLSM0t8+wrZl2dw6w6B2uSn6K9aL7ws/ibMYx+PVEa07qO5v14sdhYnom2kNvGHLsoBuHz0tQseOc635m7l/Shj+lGdHvOzaHXMVcmb1CwjLmxpA+o6zC8rmT2mO6U4Z2hPAZ7qLigotyWxgYByTz8nJGSn57JfP/4ldMUg/3xOMlt+cKUoYXIezN+JgVCWeTI0U830CNbf4SW3luhHLldZB4n2/0I1K2hW3hhmjk8tKwC9M5EVytoZT2Wo1DyFEug7lv2Md4T2gn3zXAV3yayXsoXTLtFV2YwmUU7dagX7P2fBqMIhmJTgYJUEnx6T88E+t8NvDkVBAxHZ17TtTJVpoC96kvfrQqmbIEnV99EHpxPCYLJJKggDIhUIcH8QfdHSl9bbnU3psEQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39850400004)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(81166007)(6486002)(40480700001)(86362001)(33656002)(316002)(36756003)(40460700003)(47076005)(82740400003)(356005)(36860700001)(83380400001)(2616005)(186003)(107886003)(53546011)(6512007)(336012)(6506007)(26005)(54906003)(478600001)(82310400005)(6862004)(8676002)(70586007)(70206006)(8936002)(41300700001)(4326008)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:58:59.7627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6bca53-3d58-462e-6232-08db40150f4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5431



> On 18 Apr 2023, at 15:53, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Julien,
>=20
>> On 16 Apr 2023, at 16:32, Julien Grall <julien@xen.org> wrote:
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
>> level free. All the regions currently in L0 slot 0 will not be part of
>> slot 4 (2TB). This requires a slight tweak of the boot code because
>> XEN_VIRT_START (2TB + 2MB) cannot be used as an immediate.
>>=20
>> This reshuffle will make trivial to create a 1:1 mapping when Xen is
>> loaded below 2TB.
>>=20
>> Lastly, take the opportunity to check a compile time if any of the
>> regions may overlap with the reserved area for identity mapping.
>>=20
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> With the 2 typos found by Michal fixed:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

You can fix them on commit definitely :-)

Cheers
Bertrand

>=20
> Cheers
> Bertrand
>=20
>>=20
>> ----
>>   Changes in v7:
>>       - Remove all tags
>>       - Add BUILD_BUG_ON()s
>>       - Don't forget to update FRAMETABLE_VIRT_START and
>>         VMAP_VIRT_START
>>=20
>>   Changes in v6:
>>       - Correct the BUILD_BUG_ON(), Xen virtual address should be
>>         above 2TB (i.e. slot0 > 4).
>>       - Add Bertrand's reviewed-by
>>=20
>>   Changes in v5:
>>       - We are reserving 4 slots rather than 2.
>>       - Fix the addresses in the layout comment.
>>       - Fix the size of the region in the layout comment
>>       - Add Luca's tested-by (the reviewed-by was not added
>>         because of the changes requested by Michal)
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
>> xen/arch/arm/include/asm/config.h | 38 +++++++++++++++++++++----------
>> xen/arch/arm/mm.c                 | 23 +++++++++++++++----
>> 3 files changed, 46 insertions(+), 18 deletions(-)
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
>> index 5df0e4c4959b..2cfe5e480256 100644
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
>> @@ -163,14 +179,12 @@
>>=20
>> #else /* ARM_64 */
>>=20
>> -#define SLOT0_ENTRY_BITS  39
>> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
>> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
>> +#define IDENTITY_MAPPING_AREA_NR_L0  4
>>=20
>> -#define VMAP_VIRT_START  GB(1)
>> +#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
>> #define VMAP_VIRT_SIZE   GB(1)
>>=20
>> -#define FRAMETABLE_VIRT_START  GB(32)
>> +#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
>> #define FRAMETABLE_SIZE        GB(32)
>> #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>>=20
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index b99806af996c..1d09d61dd922 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -153,7 +153,19 @@ static void __init __maybe_unused build_assertions(=
void)
>> #endif
>>    /* Page table structure constraints */
>> #ifdef CONFIG_ARM_64
>> -    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
>> +    /*
>> +     * The first few slots of the L0 table is reserved for the identity
>> +     * mapping. Check that none of the other regions are overlapping
>> +     * with it.
>> +     */
>> +#define CHECK_OVERLAP_WITH_IDMAP(virt) \
>> +    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_=
L0)
>> +
>> +    CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
>> +    CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);
>> +    CHECK_OVERLAP_WITH_IDMAP(FRAMETABLE_VIRT_START);
>> +    CHECK_OVERLAP_WITH_IDMAP(DIRECTMAP_VIRT_START);
>> +#undef CHECK_OVERLAP_WITH_IDMAP
>> #endif
>>    BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
>> #ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
>> @@ -496,10 +508,11 @@ void __init setup_pagetables(unsigned long boot_ph=
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
>> 2.39.2



