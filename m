Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6264DD666
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 09:46:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291943.495830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV8FO-0002n8-IJ; Fri, 18 Mar 2022 08:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291943.495830; Fri, 18 Mar 2022 08:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV8FO-0002kh-F4; Fri, 18 Mar 2022 08:46:10 +0000
Received: by outflank-mailman (input) for mailman id 291943;
 Fri, 18 Mar 2022 08:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prJz=T5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nV8FN-0002kb-65
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 08:46:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da8ce04f-a697-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 09:46:08 +0100 (CET)
Received: from AM0PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:208:1::41)
 by AM6PR08MB2968.eurprd08.prod.outlook.com (2603:10a6:209:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 08:46:06 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:1:cafe::17) by AM0PR04CA0064.outlook.office365.com
 (2603:10a6:208:1::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Fri, 18 Mar 2022 08:46:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Fri, 18 Mar 2022 08:46:05 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Fri, 18 Mar 2022 08:46:05 +0000
Received: from 06eb4856fe1e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60C635F4-80E9-44DA-B0C6-05A95CDCDCF2.1; 
 Fri, 18 Mar 2022 08:45:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06eb4856fe1e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Mar 2022 08:45:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB7364.eurprd08.prod.outlook.com (2603:10a6:150:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 18 Mar
 2022 08:45:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 08:45:57 +0000
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
X-Inumbo-ID: da8ce04f-a697-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vYsQuEsUZwzCWA1Pb2hcmj/8hztnph8Q+lwBvEea5A=;
 b=yE+bD0JuzAre9mjVXpWqIZLIQjyYDdM7B3Gq21sOzEahKGDmt9THJnXQH9sjjLpkVk9JioW4dmMVZYtGACuFV1xT3kPKYdQUUrkH57Xs1n3a3mkJBASLGERWv8ilNP8QAncc+H/YYzAm2JDWbjwirfKx5Du+EiysyYISF2H2jiA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 21ec059039ac5651
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXtqVx/vCDKbf7nG/AtUBXgfpghPqUut0GuSvepxcGb25tyZ11DNU3q3tJVs1I6E0P0er8WKcGVRmGjCW9orLfo2E4xXs9mxDSDMeB+hWRStyuAofNsSjv+u04I6Z7Qmf2krfFku5ow63P1h0P8E+RFcst5lpJfmX5FzRRIi4ne4sFzQqjHtjvHHUF9kkg5AnIO5TnF2/9Ef5RSPQF/b/gBESwtHzKGek2md3/OO7LVaOBbCxCu50oeG+Q/X32ccFkvGrJID4E2dRMxHs3B4IAk1HP9maE6BHPdj5owDeaAfHO5DtcSM15ljr0ur96/oPUSgmqYGMbMOdiyjNKnIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vYsQuEsUZwzCWA1Pb2hcmj/8hztnph8Q+lwBvEea5A=;
 b=ZFIfmyeTlL+7VKz9B+42kIJfI1AQM4+tWAsVUWSDWZMKu7dqYiNZ2P3CsaayM2EvRoeAX9eyR27idt/JmyGZiCqi5Oi+DhFvBXsXJHPBvtBKGRW3JQCooSOVnh/BS2Xd3TpUR2iHqAqAOfL1vn7ZCCTkWQ+6saNIri0R+2xqKEpv7Mx2E4rh1t0JeYS2ax+6fc1Nowok5h9uCiJPOdmMU36PwavY3ecbO597KbPLVaqCsHpld0xk1Xh8M4adeRXsOYKZoPtAjnVZmZJNjT6jbAYEjTRdyMkCNSp6AxrfWDCU2OwA7wDlc8qrl+F6AKZ63ojFPiL1Mx70LmuTGokX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vYsQuEsUZwzCWA1Pb2hcmj/8hztnph8Q+lwBvEea5A=;
 b=yE+bD0JuzAre9mjVXpWqIZLIQjyYDdM7B3Gq21sOzEahKGDmt9THJnXQH9sjjLpkVk9JioW4dmMVZYtGACuFV1xT3kPKYdQUUrkH57Xs1n3a3mkJBASLGERWv8ilNP8QAncc+H/YYzAm2JDWbjwirfKx5Du+EiysyYISF2H2jiA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 1/5] xen/arm: Clean-up the memory layout
Thread-Topic: [PATCH early-RFC 1/5] xen/arm: Clean-up the memory layout
Thread-Index: AQHYM6fgzbIssM9RMEi7y17EBtCCCazDvrYAgABWJYCAAMz/AA==
Date: Fri, 18 Mar 2022 08:45:57 +0000
Message-ID: <2265666F-8CE4-4018-81E7-AD022F612F3B@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-2-julien@xen.org>
 <0E4A176E-BE1F-427F-8D4E-1AAEA811964C@arm.com>
 <78aaa9be-328b-76e4-42c0-b116ab194bdf@xen.org>
In-Reply-To: <78aaa9be-328b-76e4-42c0-b116ab194bdf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e8f9df70-d4a4-404c-f073-08da08bbbd58
x-ms-traffictypediagnostic:
	GV1PR08MB7364:EE_|VE1EUR03FT023:EE_|AM6PR08MB2968:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB2968E295FB02A29D36094D889D139@AM6PR08MB2968.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6DFgHCO1rUge0dzKgzLknyS3eqNHvpC878gJyeXZXCmOtDyHjVp32GagJeE/qaKrt/nSg7c5z0biPO+GLhubsbqdu6OA2VbqDKCoVeFi2wGOWbDK4EkdsetBRrtSEHRf5R0Bva6aNMGaeVsuaZ1Bq5ja97DWgQI4t2gtkB71gdgsLMomRdnxVftHBTqPgJTZmc9F9p5JODbyrGS2nOupjAnGxKImOVITFp3F03Y0Ki086PsaEy9CRZtmQjoLohw392F7v+8jXMmCnfPe+dm86ra2JkaA7L3zZSBheQpUc7bqfJ31aDDu1AJ8VlO8E1ebFhKQqTqRrg2uwsudBP1it+W6nzRhKBtOK2ydFvElq0x7KS+Iy5c65tqTe3KsYjvHgmpt2LEa5ofCt7RMVBjn5VcN22T3s6R1bHzfn8qeaamFQHMT2GVarr/B8pbd2AzydvUsB7Ui4ePk597ZxJSFPNIcK7tAxjWsm3IVcnYQnWdKqpypaCAmKgtjx9JXhCmURwAXcvZYXL7tdWtcJ2vccZwMMwMtI0iZlrlfiPd8ou0nVq41Qpph346X5IE/Cm4g4AlA/J2UCSokwGo5MmlI3IFyLAELpYUD2WfnMH6Pic2SLcjSG/IDJXgh20fx/Ta69FWJa48ZkjVEtBjPUf2vV9wG/krZxvoDhFKwJ4mqbwuOa9kz2AU/ysJi65dv0EPM+g3s28IH3ZJnlBu5EVtQxhpPWI706JkupDP46ZggZXATctmlA1OC4jZizvdwYSie
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(36756003)(5660300002)(38070700005)(83380400001)(186003)(26005)(2906002)(2616005)(6506007)(53546011)(122000001)(33656002)(38100700002)(54906003)(316002)(4326008)(6512007)(6916009)(86362001)(71200400001)(508600001)(6486002)(66446008)(64756008)(8676002)(76116006)(91956017)(66946007)(66476007)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29D83D5821E2A34E9AAE5C81EC2E5528@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7364
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9beea2f-1171-4387-04aa-08da08bbb85f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vns8vVPNcuQz8ZpCgoTU11beFolBNpC8o91a7tqUHzDKAPEUiIyu9cCxDqVk0zcqQDuQkVFDg+zrs5AwnbVwG/OaQmzBKOmrk0DZR87sE3bEJ81ez49ubQmR52wU9fGiPBJpP+VkAZe0ti/lgtapkt4LFJ152nVELBwsoM3apX3khL37l+g+DjHMkpoXnfMiYXkrluuOZvE2wAO6A3ntUK8AowvePLVQMoOf283Y4jSGCoALTOnwIYiOxRMfz9TTy1+XDDLNDt7Ym/WDeep5Hwi528hHnRbNn4ZPbv+dYOO0ZIEgffImJ5S9Y66rlSVQW+5dgubVbx8LIL1osmIfXzQQU77Fmj0fs4KqS/zH3H+QICJB6bv7Mszakn8M3vHK62+wmWppZyk6f/EZIdEdDPq8KLgdSlkHcbnIcoZW87sG9g3ReS2dF0o/1lmCVDvaTOJSe6/VIQtQQkIAPYayWpZ/7H97Y6OYGF3ookFvuBhZ9tSXKlmZ1WrzRXooY6q5i3Na7TUOvGOZiukS/4vyZPkbLehGfi+7o5CsXrK2SZyRGOxstZj01j/6q4Ui0NJEG8Dvrw6NvVtMV/j1YGWZDGP5nXN68Yuqw7cyo5VjzG7AQi/VN1reI+Aj8+YSYcPE9cDqCRLrIpOYdBIPPP567Lgg10MiTqlm8Ct56shiOF0QyByLYWNZKFXdhS1hY1IP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(508600001)(107886003)(4326008)(6862004)(70586007)(70206006)(2616005)(8676002)(26005)(186003)(336012)(81166007)(36860700001)(6486002)(53546011)(47076005)(6512007)(6506007)(5660300002)(2906002)(40460700003)(54906003)(316002)(82310400004)(83380400001)(33656002)(36756003)(86362001)(8936002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 08:46:05.3881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f9df70-d4a4-404c-f073-08da08bbbd58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2968

Hi Julien,

> On 17 Mar 2022, at 20:32, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 17/03/2022 15:23, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 9 Mar 2022, at 11:20, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> From: Julien Grall <jgrall@amazon.com>
>>>=20
>>> In a follow-up patch, the base address for the common mappings will
>>> vary between arm32 and arm64. To avoid any duplication, define
>>> every mapping in the common region from the previous one.
>>>=20
>>> Take the opportunity to add mising *_SIZE for some mappings.
>>>=20
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Changes looks ok to me so:
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Only one question after.
>>>=20
>>> ---
>>>=20
>>> After the next patch, the term "common" will sound strange because
>>> the base address is different. Any better suggestion?
>> MAPPING_VIRT_START ?
>=20
> For arm32, I am planning to reshuffle the layout so the runtime address i=
s always at the end of the layout.
>=20
> So I think MAPPING_VIRT_START may be as confusing. How about SHARED_ARCH_=
VIRT_MAPPING?

>=20
>> Or space maybe..
>=20
> I am not sure I understand this suggestion. Can you clarify?

VIRT_SPACE_START was in my mind at that time but that is also not good

How about using BASE instead of start: MAPPING_COMMON_VIRT_BASE ?

Anyway hard to find a nice name, so your solution with SHARED is ok for me =
unless someone has a better suggestion.

>=20
>>> ---
>>> xen/arch/arm/include/asm/config.h | 24 +++++++++++++++++-------
>>> 1 file changed, 17 insertions(+), 7 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/a=
sm/config.h
>>> index aedb586c8d27..5db28a8dbd56 100644
>>> --- a/xen/arch/arm/include/asm/config.h
>>> +++ b/xen/arch/arm/include/asm/config.h
>>> @@ -107,16 +107,26 @@
>>>  *  Unused
>>>  */
>>>=20
>>> -#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
>>> -#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SI=
ZE)
>>> +#define COMMON_VIRT_START       _AT(vaddr_t, 0)
>>>=20
>>> -#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
>>> -#define BOOT_FDT_SLOT_SIZE     MB(4)
>>> -#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SI=
ZE)
>>> +#define XEN_VIRT_START          (COMMON_VIRT_START + MB(2))
>>> +#define XEN_SLOT_SIZE           MB(2)
>> I know this is not modified by your patch, but any idea why SLOT is used=
 here ?
>> XEN_VIRT_SIZE would sound a bit more logic.
>=20
> No idea. I can add a patch to rename it.

I think it would be a good idea, we already have a lot of terms in here and=
 SLOT is just adding to the confusion I find.

Thanks
Bertrand


