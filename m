Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A99A6B21AE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 11:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508225.782671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paDgx-0000zB-PZ; Thu, 09 Mar 2023 10:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508225.782671; Thu, 09 Mar 2023 10:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paDgx-0000wM-Lg; Thu, 09 Mar 2023 10:40:11 +0000
Received: by outflank-mailman (input) for mailman id 508225;
 Thu, 09 Mar 2023 10:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3pJ=7B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1paDgw-0000wG-Qb
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 10:40:11 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe13::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1c06245-be66-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 11:40:08 +0100 (CET)
Received: from AS8PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:20b:127::31)
 by AS8PR08MB10224.eurprd08.prod.outlook.com (2603:10a6:20b:62b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Thu, 9 Mar
 2023 10:39:59 +0000
Received: from VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::cb) by AS8PR04CA0146.outlook.office365.com
 (2603:10a6:20b:127::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 10:39:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT039.mail.protection.outlook.com (100.127.144.77) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19 via Frontend Transport; Thu, 9 Mar 2023 10:39:58 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Thu, 09 Mar 2023 10:39:58 +0000
Received: from fcc12fa1fd1f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EBF7C3B6-C8C0-41B8-99A9-12B9230F7F4F.1; 
 Thu, 09 Mar 2023 10:39:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcc12fa1fd1f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Mar 2023 10:39:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5473.eurprd08.prod.outlook.com (2603:10a6:208:180::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 10:39:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 10:39:44 +0000
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
X-Inumbo-ID: c1c06245-be66-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWTyIrOXbBopUAGGFYtHLCsRTeQBppWQ3pIVJMCYV5c=;
 b=wh1IHVVYBoMUb+1y/tGnbxYGXIMb1p+PcnTxJyTOjIIH0kK4bYG+6f0sQetVIcb8BWQRzzV+dkQ4eQNVIPRYzHXmwasHOWetY2jbmplGb8+A0hxAWXR+3rEXyfX+Iki9e3856muEkQOsKgMvX62MmjCx25hQ+Re0+cyfv0Pd3+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e0011f062adfc4a5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ped5G5u54kRWRNFLCRoC8YysqaGtEWFN7eJOfX8thpQ6rfKOaNhiXeMoFi8JG7YJ9gR1FWPDRaPKyGS7ZYx+5oFBtwsAAuGXjGm/sNAiaWmOKRESKUWXR32oqC1oEtDcwY8zfdmXYjYvItaxLpGOk10xYJ05KLbwWwnoZLqK+C1sc7KWYEo0fKHoyh/XaGIsY0cf19W8CbadKIcR+hAIxGO4cSlGjPUqcxZvN4vpFomoBIFATkOHYbsRatf9RgS3ktUKQlBkent14nzDq8FFarxPO7ZzajE7TcSbouDVvRfdtCXdM4WdZ4HLr9r4ERxRJ6CbBqJq+XRFbkwz47DTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWTyIrOXbBopUAGGFYtHLCsRTeQBppWQ3pIVJMCYV5c=;
 b=e4OJ4R91zOORL/9oLkGbGNHVhei6TGsNXqWba5XHDtT0RvM81SYtom2OO6HKBwI7gHoOV/ZxIkPnekyl1OsYhJIv+M/+I3UZbdd3jZ2+/BLH9RVtc5xmKOIqvygx9U6p6cwEn8Rr6pDwi3/Z4xKCp0RfqTgrhX5n0vH78k9i8Ua6K6AAFsIkkZW3X48fG2RB6LU5cfJrQkwztnW0gnNQfGEzU9XmIyl9J7sSDrjiGyoR0iIow6ClyBrNLC3IS7UD1hGeu2pAf3OkQEU5uTIDyYnY352+JbtHoafbSZg5hDGNVViwOaYXnvV2O6igCj26PI1isnp+5C5pDWlKmep/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWTyIrOXbBopUAGGFYtHLCsRTeQBppWQ3pIVJMCYV5c=;
 b=wh1IHVVYBoMUb+1y/tGnbxYGXIMb1p+PcnTxJyTOjIIH0kK4bYG+6f0sQetVIcb8BWQRzzV+dkQ4eQNVIPRYzHXmwasHOWetY2jbmplGb8+A0hxAWXR+3rEXyfX+Iki9e3856muEkQOsKgMvX62MmjCx25hQ+Re0+cyfv0Pd3+c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Andrei Cherechesu (OSS)"
	<andrei.cherechesu@oss.nxp.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Thread-Topic: [PATCH v1 2/2] arch/arm: time: Add support for parsing
 interrupts by names
Thread-Index: AQHZUN0sbGmRWBiDtEmQnPFLsz5lVK7vc/8AgABafACAAkqcgIAAIo2AgAAJfwA=
Date: Thu, 9 Mar 2023 10:39:42 +0000
Message-ID: <0932C0EB-F90A-45D4-87F4-3594E6E74C64@arm.com>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
 <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
 <7a0734e9-a980-3dc1-026d-0c96a89c4d5c@amd.com>
In-Reply-To: <7a0734e9-a980-3dc1-026d-0c96a89c4d5c@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM0PR08MB5473:EE_|VI1EUR03FT039:EE_|AS8PR08MB10224:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa5f393-f19d-4abe-bcc5-08db208aa142
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 l/EL4YfBgyxDGi3/iC5gaBqGNVZsgwiSmI59xp4J+lozE83w3aJBDCP0uqDiANDainuteam7em3hD1UcOEDJFSGnjJwTqn+41BkfmY76JNqy8KoXWPPugguR5YjXyHxiSpEeudEbx4PYXJRiBu9L04dBqHf2w2bQLugUvKiMPd9Wizu0I7U/JAT117Gint6NT9lINYX8pRrFSVPf+UmgAMAzHmJk0gAHGS3Vg48o7cNWct2F5FuUs7MHf74gx2gErvwt2FX28wHZ+GPPEZven/bQq7aiK8Aidho6nYlsfz0zyZjfyUEshmVYSbpCCBFUv+nunJRXrbQuX0P9AhS8fEav/EHd1uUNW/joCa1/jwvOfeia0FlNGBITxteafcf+64mxKxOtdyQ/+By0zYONnFS8jAnpZi5yXut4H7DYHo78y+mNQOaK6QQwmd3stJqywTUYhnKsI8WhFQFdwOz/tzEzrNQgpKkNrcMIXjrOkvsz29UR+OkadbkAuYSE3InmXCMMHsxR/9EDZCqicb5ooAbUFaZhahhU3FynXjpIPOsXtrptO4SlBO80Nl2C19fP7GV4S8/s/suE46O/dJYbGskQ142WMeEOieqztfgiUXyljuiRsYsmvC/0/BdY3lr+MhY3oYcVRaokVfSg/ce0buM4CA86OLAPurD1lZbyzti0i3jr33mb5M5qImeNZlURjIZHBwX1FVsKXzGEWwIRjEvP0qI6jH5navUcAeRZ+sQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199018)(36756003)(33656002)(316002)(54906003)(6486002)(478600001)(38070700005)(5660300002)(71200400001)(8936002)(2906002)(66476007)(91956017)(6916009)(76116006)(4326008)(64756008)(8676002)(66556008)(66446008)(66946007)(41300700001)(122000001)(186003)(86362001)(38100700002)(2616005)(6512007)(53546011)(6506007)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C4F78FC39A169348A0F2D28C64E806AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5473
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1f147420-c8aa-41c8-4161-08db208a97f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	26VRKjZrpcuQYVZDvycHjE1+A2YGdplSRtfsck2q5wynXGgk2M7b+5flq+WTWaAMGtn//R30U3gzLtbZpDsGY/esfiMvqu8maVR7JYq1Xrgv5R91GefamrWm7+wI2Rv1tXt1ESU5/HO29HMAM6Gm3AIuEzezGpZUShfSYlal2QUKJVr1nHUPGZxuTPJ9MgmyGHZ+AklJeUvLav+sNVHkpH9pOsY932cFdfr54wI3bthvQR/IDWQX0fbQ6+pIyaymYnE+JP43A3Az9hMRgfbIGBhr0FuSiK0hxonwBiMlS6sQeDE50nwi/5A5qxca4nS8FTMO6tEhlL8AQ5O76BhDn/BWi0/x/SOXimzAqZB2tShxxeiK40ifMy5oFir8XTt2pesXFyBstC7zoSP2Ndet24VC47i61YRF7opIXa3wy+OJZz/5UO/xXrej6LMra25Y3Toay15I2zSyCBF/BdHv3Kgjj8hpJSvTC5PNZJDJC1gRNUpPOZkTPcRE232d4xl0VsdySIoAsISPK9K1Sirqk3NKddL2MuJPwZPxhzHYjnM0esywjkm2WprkIlNqj1RVgLQevdYN8NBF3GQaEkxk7KmNe0PQYdhK8D64URQQMZWnfjFOWyNL761vGJdOaG0dFzZ0m/F8/c7RYTlsdFezqcJD8kcW5Sa6qeWIgLVEYmsiHIxu2NBL2HzMNCLpLv42VMT0DF4BU8rPqcwIH/v6CA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(36840700001)(46966006)(40470700004)(36860700001)(478600001)(47076005)(82310400005)(33656002)(36756003)(336012)(26005)(82740400003)(81166007)(54906003)(356005)(316002)(83380400001)(2616005)(40460700003)(6512007)(186003)(41300700001)(40480700001)(6486002)(53546011)(8676002)(70586007)(5660300002)(70206006)(2906002)(6862004)(86362001)(6506007)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 10:39:58.4732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa5f393-f19d-4abe-bcc5-08db208aa142
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10224

Hi Michal,

> On 9 Mar 2023, at 11:05, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 09/03/2023 09:02, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Stefano,
>>=20
>>> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@o=
ss.nxp.com> wrote:
>>>>>=20
>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>=20
>>>>> Added support for parsing the ARM generic timer interrupts DT
>>>>> node by the "interrupt-names" property, if it is available.
>>>>>=20
>>>>> If not available, the usual parsing based on the expected
>>>>> IRQ order is performed.
>>>>>=20
>>>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>>>> though it's currently not in use. If the "hyp-virt" PPI is
>>>>> not found, the hypervisor won't panic.
>>>>>=20
>>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>> ---
>>>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>>>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>>>=20
>>>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/a=
sm/time.h
>>>>> index 4b401c1110..49ad8c1a6d 100644
>>>>> --- a/xen/arch/arm/include/asm/time.h
>>>>> +++ b/xen/arch/arm/include/asm/time.h
>>>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>>>   TIMER_PHYS_NONSECURE_PPI =3D 1,
>>>>>   TIMER_VIRT_PPI =3D 2,
>>>>>   TIMER_HYP_PPI =3D 3,
>>>>> -    MAX_TIMER_PPI =3D 4,
>>>>> +    TIMER_HYP_VIRT_PPI =3D 4,
>>>>> +    MAX_TIMER_PPI =3D 5,
>>>>> };
>>>>>=20
>>>>> /*
>>>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>>>> index 433d7be909..794da646d6 100644
>>>>> --- a/xen/arch/arm/time.c
>>>>> +++ b/xen/arch/arm/time.c
>>>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>>>>>=20
>>>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>>>=20
>>>>> +static const char *timer_irq_names[MAX_TIMER_PPI] =3D {
>>>>> +    [TIMER_PHYS_SECURE_PPI] =3D "sec-phys",
>>>>> +    [TIMER_PHYS_NONSECURE_PPI] =3D "phys",
>>>>> +    [TIMER_VIRT_PPI] =3D "virt",
>>>>> +    [TIMER_HYP_PPI] =3D "hyp-phys",
>>>>> +    [TIMER_HYP_VIRT_PPI] =3D "hyp-virt",
>>>>> +};
>>>>> +
>>>>=20
>>>> I would need some reference or a pointer to some doc to check those.
>>>>=20
>>>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>>>> {
>>>>>   ASSERT(ppi >=3D TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>>>>> {
>>>>>   int res;
>>>>>   unsigned int i;
>>>>> +    bool has_names;
>>>>> +
>>>>> +    has_names =3D dt_property_read_bool(timer, "interrupt-names");
>>>>>=20
>>>>>   /* Retrieve all IRQs for the timer */
>>>>>   for ( i =3D TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>>>   {
>>>>> -        res =3D platform_get_irq(timer, i);
>>>>> -
>>>>> -        if ( res < 0 )
>>>>> +        if ( has_names )
>>>>> +            res =3D platform_get_irq_byname(timer, timer_irq_names[i=
]);
>>>>> +        else
>>>>> +            res =3D platform_get_irq(timer, i);
>>>>> +
>>>>> +        if ( res > 0 )
>>>>=20
>>>> The behaviour of the code is changed here compared to the current
>>>> version as res =3D 0 will now generate a panic.
>>>>=20
>>>> Some device tree might not specify an interrupt number and just put
>>>> 0 and Xen will now panic on those systems.
>>>> As I have no idea if such systems exists and the behaviour is modified
>>>> you should justify this and mention it in the commit message or keep
>>>> the old behaviour and let 0 go through without a panic.
>>>>=20
>>>> @stefano, julien any idea here ? should just keep the old behaviour ?
>>>=20
>>> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 because
>>> 0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0 an
>>> error.
>>=20
>> Problem here is that a DTB might not specify all interrupts and just put
>> 0 for the one not used (or not available for example if you have no secu=
re
>> world).
> Xen requires presence of EL3,EL2 and on such system, at least the followi=
ng timers needs to be there
> according to Arm ARM:
> - EL3 phys (if EL3 is there)

This might be needed by EL3 but not by Xen.

> - EL1 phys (always)
> - EL1 virt (always)
> - NS EL2 phys (if EL2 is there)

Agree

>=20
> therefore, if we get 0 for one of those, it means that something went wro=
ng and we shall consider
> it as an error.

Agree except for the EL3 one :-)

Cheers
Bertrand

>=20
> ~Michal



