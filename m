Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C07825C1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587396.918763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0Xz-0005Uk-D9; Mon, 21 Aug 2023 08:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587396.918763; Mon, 21 Aug 2023 08:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0Xz-0005Sy-9t; Mon, 21 Aug 2023 08:46:03 +0000
Received: by outflank-mailman (input) for mailman id 587396;
 Mon, 21 Aug 2023 08:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79xF=EG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qY0Xx-0005Sq-LW
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:46:01 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26acd1e4-3fff-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 10:45:59 +0200 (CEST)
Received: from DU2PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:10:3b::22)
 by DB9PR08MB6427.eurprd08.prod.outlook.com (2603:10a6:10:25a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 08:45:57 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::d4) by DU2PR04CA0017.outlook.office365.com
 (2603:10a6:10:3b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 08:45:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.11 via Frontend Transport; Mon, 21 Aug 2023 08:45:57 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Mon, 21 Aug 2023 08:45:57 +0000
Received: from d620f8d2057d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A2C9B06-8F99-4674-8371-C77341BFF9CA.1; 
 Mon, 21 Aug 2023 08:45:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d620f8d2057d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Aug 2023 08:45:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9465.eurprd08.prod.outlook.com (2603:10a6:10:457::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 08:45:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 08:45:43 +0000
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
X-Inumbo-ID: 26acd1e4-3fff-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxS0xvry7hUaSbAyNLF2l5TwkUBYgSTilfARSSiU95Q=;
 b=mmacEz9PIDlW39IuOmRj7Le/U2r0p4NysWCiCTP2KMb0sZRg5z0hI8yErSuofCj/o1DCMkO0XgA5838YvdB00R3uUx29uFR5HvKBO0HR02w8g9AaxICjLJutwzHZNUsM7s5XY3gDjRz+CSMpuFlI0Ux6ki6wM+WFzev8zbO0gOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69690af5d5c686d6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLbdVzaqsTXAe3QDU9Gew//cpdB8vLS3kX2ZMtjwNfr3fNauwSZFTtR0dB6u5DvW7zOhqFJaLrFP+W+WdwYDqNTlryF3MIfYcsrSVMYYCw5AUufVe5tsDFlJf0GHbxPhGqLJeLKBS1rEtiUsH9bBLy7zhtuw9UtCxEnt7mF2jFS6CFvufw3bCyp5Winn//s35/IDT+PH3weGSE69e4glwB6bL5/IGLBYA7EvLPEvwGd9nOlycgXAWvfWBCetloZHvXox0/xCg1rHguodIpBAhM7PoV7oxP4eeXrmbwuRhm+6PHvs29aL6KL0xKk9tmlCrI5wqGRovwC3CtgNF0Q7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxS0xvry7hUaSbAyNLF2l5TwkUBYgSTilfARSSiU95Q=;
 b=WpPVVm1/2NTs6ucgxsQK9Zzn2xpzZU+IKhN8o8yDqhrg0Ss2aJiPZHOgxPQgbkVS5u9F9aoeRPAV7xO+kySgQ0vcENkbDE+z8CgIajbOaTW0ptQZGkcGXC+v5B0uMAJlGOacTTwP6QwAbm5OBlL5n7u5Xc/jSoaAZPv9ODIa8XcN5TdnYd1mKzgE0by1G5WtXwR3gbULKp8mo6z7z+XLpzyPrHFDVh9N9hd6ndqVLXfrNLOfrYnN+kQvEPsrDG2vPlqCKpkkkW5v67w9VKl5lAlxuPtdw2Lr65NsAGx6y8fSSYJ/+U02sAKJbmeovyNB9xEeDxOemACG3OZdSsRZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxS0xvry7hUaSbAyNLF2l5TwkUBYgSTilfARSSiU95Q=;
 b=mmacEz9PIDlW39IuOmRj7Le/U2r0p4NysWCiCTP2KMb0sZRg5z0hI8yErSuofCj/o1DCMkO0XgA5838YvdB00R3uUx29uFR5HvKBO0HR02w8g9AaxICjLJutwzHZNUsM7s5XY3gDjRz+CSMpuFlI0Ux6ki6wM+WFzev8zbO0gOs=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v5 02/13] xen/arm: Introduce CONFIG_MMU Kconfig option
Thread-Topic: [PATCH v5 02/13] xen/arm: Introduce CONFIG_MMU Kconfig option
Thread-Index: AQHZzmd4NwPJsprWs0O6+0xd1gAzE6/0ekEAgAAAoAA=
Date: Mon, 21 Aug 2023 08:45:43 +0000
Message-ID: <5E6BC5CA-04C6-412F-91E0-77DBBB65878A@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-3-Henry.Wang@arm.com>
 <71c23767-44fc-44d2-9bfd-0a0d0bdc69c1@xen.org>
In-Reply-To: <71c23767-44fc-44d2-9bfd-0a0d0bdc69c1@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9465:EE_|DBAEUR03FT018:EE_|DB9PR08MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 7762e10f-cfcf-4821-f886-08dba22309a7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gBSVNm1pYttC/u9qkWkCwtXrgp8jEfsxBG/d8nyVOZN8kfEiDdNtKq1N3ROCfJywT21CAfl0JAh8R+oc99L8aiWvmGXl2BpLJppBnqoRsY/lIdSHxOnxmCsSKDDOssYXrlp0ITFxjzs09inPnveWpx9y7CyHxSGHwzRIRni0PZxxGIWPmkD3Zip5x3flXgmCDr7DIbFIjaiCo3HCFyF5Mq10HuVnZ5Vy+yKh7SNtRjqFoMZzxyxRElPOFc/mJNOhBZSNFqHOHZus6jy6c0Q7tAkzoqDVe2oCLODJkvzMS/zP4ZPaYOOQfbYD2qdWILngpPNWFWhf/FYmTzq354pb7vfb5UDcViWfgunGxeEBd2BezTfA0AvZQfeqxYjj1YxQAi3X7ce0bLIyHs3UCCLJ3cap8am1qkGwp2ECJSlFtIxBWlDRWH0GJgBl9TJSYe1CCbWKDdXc8+Yn78lpHI62VTtzOtORuIIpbpYf9eO5tdylz3gElHXqc3/iR5BH9WSySg2JzIXDKvIwvy4OGBx9dB3ZR40ia29603+6UfFvAucIC5Ng4UZUD92Pg0bIBmtw1+6b1ldRQ1Qvz5Ffaj/bV8bQaSxaHQiHA5AdOyX+KahGGAPLUsZk1iIjFlodg0tEgiLYfnwxR/oHCMFpHdIG4g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(2906002)(83380400001)(53546011)(38100700002)(38070700005)(6506007)(6486002)(5660300002)(33656002)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(64756008)(6916009)(54906003)(66446008)(66556008)(76116006)(66476007)(91956017)(478600001)(122000001)(71200400001)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3FBF9A800D3B514FA0C246628EC34AEE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14975c18-f8b9-4e48-0d3e-08dba2230186
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xk+xX1GaqpQh+72JIEv9Da9KSsVHzkI+IsToevE5oIxLJhcWpTxDWV+6RdrOrVMZ62pRNSreMO0UHwSex/4yKJ5orQD/P2ubHPIPZVWbJRchaA9a5+MEPUuTliXqE+hN7nytyGmW8IsKNPmseZaxzrihlev9xTSSt9McCaxbi/MvOwqzmWOhFDKw+RQxw+/Bm7XSyZBryThvATGVf7xB5Q90eoHmIJHWgBVfngujD/l928+0dxB5lKj6FO/OxEafUG+0ZgOEROzFS0pC6CSoFS/ltSYzVcHk2jxK26+g+KTNT/+5IuHzNkVxz6oprDe3NcQpIU32grg+CkM9bxWI5Ot/cnIuuOYMb0mpn3JvE3HBxFhVtorCOx0RlTCeyQIN7sMHMu8ZdqQNH4+3LM2rRYCeDZVX0mr1s3+VRWDL/bl4mxKIKLYoe+t/RJm/g7y1QXJMI1SnplMufvqIE8nGmurtD03oNCWa7j43FI6f41O/rsq4xuEfgyB7RE6QjTtiIRSkjcIL/uu2P7d2Et0LJbzZ7yunAkmO89bIO/GOvtdGLOowAuSZfF9xnCSHGn/l00m3Juv/3prMin9hs7a2jgMbG63fgHfYFQlOYP4aiN5ZKL4vGDfJNU+LuN2TavzgTJoS2uxwFHSP8bN+MdQxDjlbpd17UGhbAmaT6a9dtfmQ6kp/64laGYZVbplUBGdfZ/A1sHqv1qnGqku0GR9iCtEBjjycJvZ4gY+6oQHwJ6s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(83380400001)(53546011)(40480700001)(6506007)(6486002)(5660300002)(336012)(33656002)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(6862004)(107886003)(4326008)(70206006)(316002)(6512007)(54906003)(70586007)(478600001)(82740400003)(356005)(81166007)(40460700003)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 08:45:57.2615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7762e10f-cfcf-4821-f886-08dba22309a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6427

Hi Julien,

> On Aug 21, 2023, at 16:43, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 14/08/2023 05:25, Henry Wang wrote:
>> There are two types of memory system architectures available for
>> Arm-based systems, namely the Virtual Memory System Architecture (VMSA)
>> and the Protected Memory System Architecture (PMSA). According to
>> ARM DDI 0487G.a, A VMSA provides a Memory Management Unit (MMU) that
>> controls address translation, access permissions, and memory attribute
>> determination and checking, for memory accesses made by the PE. And
>> refer to ARM DDI 0600A.c, the PMSA supports a unified memory protection
>> scheme where an Memory Protection Unit (MPU) manages instruction and
>> data access. Currently, Xen only suuports VMSA.
>=20
> Typo: s/suuports/supports/

Oops, sorry about this, will fix in v6.

>=20
>> Introduce a Kconfig option CONFIG_MMU, which is currently default
>> set to y and unselectable because currently only VMSA is supported.
>=20
> NIT: It would be worth to explicit mention that this will be used in foll=
ow-up patches. So one will wonder what's the goal of introducing an unused =
config.
>=20
> Or it could have been merged in the first patch splitting the MMU code so=
 we don't introduce a config without any use.

Sure, I will think about this and fix in v6.

>=20
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks!

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall



