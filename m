Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3E76B1D45
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 09:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508177.782541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paBEI-0000bn-3v; Thu, 09 Mar 2023 08:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508177.782541; Thu, 09 Mar 2023 08:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paBEH-0000Za-WC; Thu, 09 Mar 2023 08:02:26 +0000
Received: by outflank-mailman (input) for mailman id 508177;
 Thu, 09 Mar 2023 08:02:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3pJ=7B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1paBEG-0000ZT-Pw
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 08:02:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b733b446-be50-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 09:02:20 +0100 (CET)
Received: from AS9PR06CA0732.eurprd06.prod.outlook.com (2603:10a6:20b:487::31)
 by AS8PR08MB6149.eurprd08.prod.outlook.com (2603:10a6:20b:29d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 08:02:14 +0000
Received: from VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::89) by AS9PR06CA0732.outlook.office365.com
 (2603:10a6:20b:487::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 08:02:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT007.mail.protection.outlook.com (100.127.144.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29 via Frontend Transport; Thu, 9 Mar 2023 08:02:13 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Thu, 09 Mar 2023 08:02:12 +0000
Received: from 71d7470ec30e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B415D238-A52B-4100-9011-AD233A8B9627.1; 
 Thu, 09 Mar 2023 08:02:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71d7470ec30e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Mar 2023 08:02:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9265.eurprd08.prod.outlook.com (2603:10a6:20b:5a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 08:02:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 08:02:04 +0000
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
X-Inumbo-ID: b733b446-be50-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6z2eCYOhAuCy4nY35X0DY8hI2xNdIE+3LHpKqXRYrVY=;
 b=8J8TP3jac4TKHLDOXdsLcGhu6L3BW/MHpfnD5N+tiPqwq9TBukNhLZXjPre+khoaTIbGsg9+zfVuHD0rz81EALDAJEDkWbCUKrIjAqxkW7nS2l9Q069kpGuxR0NneWUXjIam6UKcOsebLpsp7OKCKktzU4gaFY9/pRlKdy23V9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 203fac07519e7dc5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5ZuNQpM1qwKsn8/46QCCFcJv6UVtGuolObAvc6MXU9XVMmFpXLoiU/FBSatXtnIKsedwnJ8GvpCE+gA+o54ovvTz0btHSeKgjfgYb5Q+v/LJV4XHkJil8WMY6rRpa5ZCq+2d86NfhvIaBT2lzfGKG+mOYvFqriZgzYr97sGJ8kzX3YX4C3E3Ahys1yg8nMPFHUecyGNPP6L9/ED59d3ssRQxxtzdJUc7DocgF4UOJzWpCmSZ43A+jcQ9Td7UQgC3z+iZoUqyUir3U+xQnuHoLyBgQgKbltfwCACTsH7qkPAzBuQLOnkFFOALoffQPf9jMLbEQtJqkPVH40oHYz/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6z2eCYOhAuCy4nY35X0DY8hI2xNdIE+3LHpKqXRYrVY=;
 b=j0LBzshbuNKJ5HkIdYej3i5Pvll9KJnqIValukdgSQAOqi7JD2i6JqzmhL/Q3GvaSLcpjpNxqPX+fnp963D/+MVwwzxXEovPXRUlt8FNNORGKMjaf8HVhyCXSKcpN5AHXFP5HE6MaQIlIWtFiDEOqXHSJiTJvz7PoRsKjF0PyLDgJnZDgdiMRmE4saw7mHuv6ADRul2XHjTzAG289iTHYK791YpTnS3s0WxsBJKhh3PcadxCvJgGx6ClbxfoPqUw8NaKOzT1/hJzaBV/FjYmOJzC42dPTzHm1SPr1d2h0jy5igq+Fb/ZCWE5aPlAeO02bHB66oNAGzZRXO3FecGSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6z2eCYOhAuCy4nY35X0DY8hI2xNdIE+3LHpKqXRYrVY=;
 b=8J8TP3jac4TKHLDOXdsLcGhu6L3BW/MHpfnD5N+tiPqwq9TBukNhLZXjPre+khoaTIbGsg9+zfVuHD0rz81EALDAJEDkWbCUKrIjAqxkW7nS2l9Q069kpGuxR0NneWUXjIam6UKcOsebLpsp7OKCKktzU4gaFY9/pRlKdy23V9k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andrei Cherechesu
	<andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Thread-Topic: [PATCH v1 2/2] arch/arm: time: Add support for parsing
 interrupts by names
Thread-Index: AQHZUN0sbGmRWBiDtEmQnPFLsz5lVK7vc/8AgABafACAAkqcgA==
Date: Thu, 9 Mar 2023 08:02:04 +0000
Message-ID: <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9265:EE_|VI1EUR03FT007:EE_|AS8PR08MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: ba05dd73-4cc2-4281-198d-08db20749764
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3VZWVkrKctIGFpp/RzwJjFNfmbskwv9AMgon8IMMh39cCedFP6mpaHRZJ/xQ6MhmyHKeyXmgb5kQfL1yQMd+PwiVbcfgS3Es5UzP6p6iWBeLt+OBrMPAHX8CXL03FWIab0rJ9cmzh+23I6pNlYdt9B2X+/ciNuzBf06rZY9jaHWESjRVpN3msLzDq8dnUsFK3F19O+o9AtE5phBYRvS0Uo3raO5Yebr6aNB47lqf1NsaD4mXIHVk8VuUR0yek3h8eEu6uzzBIf5F3OGU1l7vKafZyPAsW3v/Zk7XeZWwl/xdelZ8jpqiKBWvNj67mki2K8vKKPcSb/6soJDjDYKxjHOgqQvNZf73CK105e/rtistrk01JZnsGxOIa/o4SUOpuedr+Rxdj7yBPnbuV5Via/i2tj4U3i/iq//AZlYyNzh+I92gRigTSgLBB3V/LbYQmDIk4iL0t5XptDe0ijmUX4sbyQvmdR+KNdSk+0k7mI9oO1KfC1Vu6MYviFoV45wOihokIH4kBdyT41cw1Du8SBLf99539D0xxWxK8eYY1F10iOi36wLm0EgOt51xGT2RiPzv3jFXRpxXsj8Smm5OqbU2hI+RCo6UeI0+meHRmon4zfk0HQsL5V3N0WENCEEjpGqIIKFaJ5qLBNmsPMKNrKguQW6+vs9zfNyX9u9ia1z9JHHleInVYDCNeqbQypA++0l44H3g8+NwlJ1/nBO3n7tgse0+SzXEwRqPoRnhE1s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199018)(478600001)(64756008)(33656002)(86362001)(6916009)(71200400001)(66476007)(8676002)(54906003)(8936002)(91956017)(36756003)(66946007)(5660300002)(41300700001)(4326008)(53546011)(38070700005)(76116006)(6486002)(2616005)(122000001)(6512007)(6506007)(66446008)(186003)(2906002)(66556008)(316002)(83380400001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B43EFFCC768E246ACC506EA4519B8FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9265
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e8e68f3f-5a80-4941-5c02-08db20749209
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6ZUdnIN4N2yeMRj3bUt99YfJArgZ5J/DKJHfINZ88+WzztT52dUpgENg/DmXU5FL5XqTuL72hk69XfkZn4eJlLynwGZFHvLqPYpbouMZSpmByyl+ESCzrk/E3v9v6R7icQiAEnLn2N6yEc9PzEotbv6uXHhHmJ12vsAi18Hb5DYEqIST+SJhqqqcgwY94EWVpt5OVu+KjAKVyAhUJRLrbVQhJZjk84wUo/z9tyI3Ttxwt+M02Ca8PZtUfIWEh5dzeXRhnbkc04vvzCJolcg7u06pGcSk2XW1b24cmaBXADVYJwA21dWUN00//WsYGqFcoO1vv0lVXB2HyvE/u7AJldakWdFiqw9rbnEVpT/aDt0HNZQ3m4AONIZE8H0jwERZ1Vf266KIWGLES7y4R3DiXxHYtRfZXpbW+orRLpIwFKguXWhplgEgW6C/cCGwCvmFrTcAv0O8/qv10DSirOGc+XY3kSGKhQEkbUlLEYoAdx8CiHlfOYYTI2DUhtIlkLxmpKm9mYeJZzBauOGx/COlRT+/L43tve2+l7ywe7apx453mWrjHxGEyDgWdV0ZGQHVQq31DwiqmlFn1eiGvK5tNnkc/q/yYwDSTnVqM34PxC/4MERK6iSsBYPoRMqdOuYbceydgKCUTKTH+kKUBJQuSIMcYTfj3WZRXqyE1GBafIPuE6bvkmcGrLT0cB5m2roU7h15OaocaAdDCL/CFIDHIw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(5660300002)(6862004)(8936002)(2906002)(41300700001)(70206006)(83380400001)(8676002)(4326008)(316002)(81166007)(53546011)(47076005)(6506007)(54906003)(478600001)(40460700003)(6512007)(6486002)(33656002)(40480700001)(336012)(186003)(2616005)(86362001)(70586007)(82310400005)(356005)(26005)(36756003)(82740400003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 08:02:13.0178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba05dd73-4cc2-4281-198d-08db20749764
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6149

Hi Stefano,

> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss=
.nxp.com> wrote:
>>>=20
>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>=20
>>> Added support for parsing the ARM generic timer interrupts DT
>>> node by the "interrupt-names" property, if it is available.
>>>=20
>>> If not available, the usual parsing based on the expected
>>> IRQ order is performed.
>>>=20
>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>> though it's currently not in use. If the "hyp-virt" PPI is
>>> not found, the hypervisor won't panic.
>>>=20
>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>> ---
>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm=
/time.h
>>> index 4b401c1110..49ad8c1a6d 100644
>>> --- a/xen/arch/arm/include/asm/time.h
>>> +++ b/xen/arch/arm/include/asm/time.h
>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>    TIMER_PHYS_NONSECURE_PPI =3D 1,
>>>    TIMER_VIRT_PPI =3D 2,
>>>    TIMER_HYP_PPI =3D 3,
>>> -    MAX_TIMER_PPI =3D 4,
>>> +    TIMER_HYP_VIRT_PPI =3D 4,
>>> +    MAX_TIMER_PPI =3D 5,
>>> };
>>>=20
>>> /*
>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>> index 433d7be909..794da646d6 100644
>>> --- a/xen/arch/arm/time.c
>>> +++ b/xen/arch/arm/time.c
>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>>>=20
>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>=20
>>> +static const char *timer_irq_names[MAX_TIMER_PPI] =3D {
>>> +    [TIMER_PHYS_SECURE_PPI] =3D "sec-phys",
>>> +    [TIMER_PHYS_NONSECURE_PPI] =3D "phys",
>>> +    [TIMER_VIRT_PPI] =3D "virt",
>>> +    [TIMER_HYP_PPI] =3D "hyp-phys",
>>> +    [TIMER_HYP_VIRT_PPI] =3D "hyp-virt",
>>> +};
>>> +
>>=20
>> I would need some reference or a pointer to some doc to check those.
>>=20
>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>> {
>>>    ASSERT(ppi >=3D TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>>> {
>>>    int res;
>>>    unsigned int i;
>>> +    bool has_names;
>>> +
>>> +    has_names =3D dt_property_read_bool(timer, "interrupt-names");
>>>=20
>>>    /* Retrieve all IRQs for the timer */
>>>    for ( i =3D TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>    {
>>> -        res =3D platform_get_irq(timer, i);
>>> -
>>> -        if ( res < 0 )
>>> +        if ( has_names )
>>> +            res =3D platform_get_irq_byname(timer, timer_irq_names[i])=
;
>>> +        else
>>> +            res =3D platform_get_irq(timer, i);
>>> +
>>> +        if ( res > 0 )
>>=20
>> The behaviour of the code is changed here compared to the current
>> version as res =3D 0 will now generate a panic.
>>=20
>> Some device tree might not specify an interrupt number and just put
>> 0 and Xen will now panic on those systems.
>> As I have no idea if such systems exists and the behaviour is modified
>> you should justify this and mention it in the commit message or keep
>> the old behaviour and let 0 go through without a panic.
>>=20
>> @stefano, julien any idea here ? should just keep the old behaviour ?
>=20
> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 because
> 0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0 an
> error.

Problem here is that a DTB might not specify all interrupts and just put
0 for the one not used (or not available for example if you have no secure
world).

So I think we need to keep the current behaviour, might be ok to put a=20
debug print.
What I would think is feasible would be to panic for interrupt numbers we
need only.

Cheers
Bertrand



