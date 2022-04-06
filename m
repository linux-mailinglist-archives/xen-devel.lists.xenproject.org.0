Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE24F6194
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:35:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299931.511276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6k6-0006St-FI; Wed, 06 Apr 2022 14:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299931.511276; Wed, 06 Apr 2022 14:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6k6-0006QF-C3; Wed, 06 Apr 2022 14:34:42 +0000
Received: by outflank-mailman (input) for mailman id 299931;
 Wed, 06 Apr 2022 14:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnga=UQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nc6k5-0006Q9-0B
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:34:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b072ae8f-b5b6-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 16:34:39 +0200 (CEST)
Received: from AS9PR04CA0051.eurprd04.prod.outlook.com (2603:10a6:20b:46a::25)
 by DBBPR08MB5913.eurprd08.prod.outlook.com (2603:10a6:10:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 14:34:29 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::28) by AS9PR04CA0051.outlook.office365.com
 (2603:10a6:20b:46a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Wed, 6 Apr 2022 14:34:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Wed, 6 Apr 2022 14:34:28 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 06 Apr 2022 14:34:28 +0000
Received: from 75c73aa3cbc7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1610D7B9-BAA6-4905-A6BD-C39307F12F79.1; 
 Wed, 06 Apr 2022 14:34:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 75c73aa3cbc7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Apr 2022 14:34:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4552.eurprd08.prod.outlook.com (2603:10a6:20b:74::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 14:34:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6%4]) with mapi id 15.20.5144.019; Wed, 6 Apr 2022
 14:34:19 +0000
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
X-Inumbo-ID: b072ae8f-b5b6-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkEt8Hq2s5G1yKfv6nnn+BAJnkQ/ANrkC9KsdGfg4BI=;
 b=rD7z0uRuQKqpofh8YW1K+fjl0A2BABgZmdkHaakzrj/EFvWYvwQUaCeeGF7IiF+0QikdJV59nY38feNyFMWL8tSzPFc0dC4/nuVdIBUDVAehDJMqswFs3RinefCgGP8jWQWUYjv5Ae+dLKghWedzpGWtZqiIa8iYSb/YJtFumvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37c053ebd1e1f6c5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms6+Nv7QobBCiRjzcD47Cm4JUoHoIN+V7+cTCZHJpB40ZtOtUhnAhex71E7ZKQvy8Pi/uZGdAVBcwPOWyvRuv0WCz9mrqeaBviGmhkZM7jat8mMXNezFttz81VhlGbM6d6P4x6eyjROByKOP7MoFVjkJhVY5uBIQj4Ww1Hqh7jRHW8Si4KInWV8e/PJtAkrfqjS4eUsMcpl1JjqJDEFGshB8rxsygbmS3i7s956qBpddlUhWHVwlHj4PF4qOCqNZ4oQ8yZGu6NbPFuA2bsL2H8RB5JIBLj2eES4D3aR8+DM/cqSeH8gN589wiU1b9P31rQ/tlx15eEtn8I27UMjbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkEt8Hq2s5G1yKfv6nnn+BAJnkQ/ANrkC9KsdGfg4BI=;
 b=mTsiLD70eXW7tWkkcXFfcNgUiyhcnp9eZNXnfmRNY4091QPCVwCMhJKT1yPTWG7MPxBWVRbb5TTizBd8vOLNIkq98Ae9VqgaTXJ1p9DieqJ4eLlVwICr4a1+OTEt02z9mX+LBubS+xmuBh13TEnDEMTLiich4wmf3tWSzcoHPQGkanaeP+nv1KqQfhfl9ljG0Vfd3ymmHG7WaPR0Q4OAnK0aZlPTaAKv44dleyDF2vzVa4k5pzruBz4Db6ECbHAe8F6bY+96SsEPsSSUOjObeN2XuU2z7zOoBCm3h8S8Ur+TGA1/hIYj68sLSPz6SGIWm/hGlJOmiFAQQqrN2LyhwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkEt8Hq2s5G1yKfv6nnn+BAJnkQ/ANrkC9KsdGfg4BI=;
 b=rD7z0uRuQKqpofh8YW1K+fjl0A2BABgZmdkHaakzrj/EFvWYvwQUaCeeGF7IiF+0QikdJV59nY38feNyFMWL8tSzPFc0dC4/nuVdIBUDVAehDJMqswFs3RinefCgGP8jWQWUYjv5Ae+dLKghWedzpGWtZqiIa8iYSb/YJtFumvc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Thread-Topic: [PATCH v4 3/8] x86/EFI: retrieve EDID
Thread-Index: AQHYROQkwx+joMfjCkSw++1xXxejZKzi/QIA
Date: Wed, 6 Apr 2022 14:34:19 +0000
Message-ID: <903E8C67-ADBA-4C96-A748-0AB57B0DDDF8@arm.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
In-Reply-To: <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d91c699e-7396-47ac-5025-08da17da8ea8
x-ms-traffictypediagnostic:
	AM6PR08MB4552:EE_|VE1EUR03FT031:EE_|DBBPR08MB5913:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB59133A5FCF87A4F26472379F9DE79@DBBPR08MB5913.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9gV0zAfHXhywXYraIcDz8kp1qhhUKwMgGlP42D67TxcriPlSDjc4DBXiHckFfkAGt+oD3bJdibAVMsUC6BkOFbnJzgxIUQ+zEqYYbwCTF5hKFH1xb1yuSwPu/99hkMoVwmuaUAeTkxdlrmNbB6LzNIrxGJBMZ9zH3g5I0ATOixSvSlHTMJFpf2yXJHPNSOK0bTfpeeNA/vQuch2rZh0rh9PmKRfsdaa0ShFvVlLo8cDGPPB42X4HK8uvU8Mr1uRE+YdwJgicebSW9LSCrmsYZyT3oTLqD9kmwOPVc/617vL5IaEdtYPhLrfG1/j54qJr0JTAxzaIP1ruq02rt2kz0bb4NHepPfZd68min8C0iA6XDvRzdS3zsJatKJYGiluMOgR1BUkOCg6TwzzIn8HCi7cFHA7Ydh21C4I5rBQ4dlwYd2So6+6EYQ9TsXC0HZGBRvKJDueABH6ayb8cSiK2uVy+dGAZvcpLcQx1mtX7TZbYMGyVI8UM9WMYUWgJZ8QYh0my66QNtkvgvGcQV5y8z/un+oyF0/OXzippC0D79QaWVoP/b6sozK3eaoiPTZVqUPTBiCTAA9tuJJFebEMPcx97NsC/ntIkDjtP7HklyYXhbbFrldVsCSpS1z39NXfI4uL/BdnTDKFTsQfI8Notkok38793/vKDchumncckPijias9Jo2Uruc5J4fSaQVGuzH9YbwEsxRc5yyph5yQDt1SDVftgw1pwJwUU4ySl7ut0FZoAYFJ/CbVKG1g/zFoF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4744005)(53546011)(5660300002)(8936002)(186003)(122000001)(2906002)(2616005)(4326008)(8676002)(36756003)(33656002)(26005)(66446008)(6512007)(316002)(6506007)(71200400001)(508600001)(66556008)(64756008)(66476007)(91956017)(38100700002)(86362001)(66946007)(76116006)(6916009)(54906003)(6486002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <58A8F6333BC6544F92B0A8A85881CB05@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4552
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1e537dcf-c915-4c0c-5999-08da17da8909
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ry4yOwF7l149jo6fRGK6rnMfErTWebf87axEmo1x7Gj+jNB5UTfnBCuTSaj9pO8VicNes/R+D5q9C72ac5yLskMB/lvZ+A7CjiyNNCVEK/9g69r9An/x0HuKvFLYDKif5xs60Dhfb4HQful1o8fbotqOVKrYie5SthMycPfQjfLxNwzXoNXbBk7xja3ulbznzalsk6JXpdK5F3f23umk9gc415/besFlRySb2rbj+MOk4JGkI2IDeGplECOMIhusWPH2gQbOMiBDhKvF3qTmjvG1DGnj6CkmbfRVJzrd5YRi8s2Y6bMUzFSg20RSGPn2ZtBTelsnlD2JFfE8IzkI/NK/I98psccFJGBa5tO6a74yz3qPPTJCxcHnDYnP4EY7TIWTvJjoOzt1c/LuJaGOPkwZx45Q6gph2A0jHVGc7ejuY/fOxacQ6QSTXi7FOzBs8Pv6uFAQwQDy6+zWG7rKKOsKvbmsaek3GvoiFhm+fGKGKizgjyfRJVrpDekri6UCVFD5kxWe2RWJzz08Mh3s33NGECRA1ia1PM5QA3rhcIbaXIFnDcZX4cz2uWfaoubcEuymYmDVUZyVUjB0ki2KW9GsXxVHeaSU7Tb9tsvQMuF52Fd5rh/5RU0mdmgBQ+Xlv6aOcTtRSr6mS7ozLbZeXLRU+HKC8GtyeifSqyoy33H1jw8g+Lk3v0HwTbfVViGt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(316002)(36860700001)(107886003)(33656002)(6862004)(2906002)(6486002)(26005)(4326008)(8676002)(54906003)(81166007)(70586007)(5660300002)(47076005)(8936002)(2616005)(70206006)(336012)(36756003)(6506007)(186003)(4744005)(82310400005)(53546011)(40460700003)(356005)(508600001)(86362001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:34:28.8957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d91c699e-7396-47ac-5025-08da17da8ea8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5913

Hi Jan,

> On 31 Mar 2022, at 10:45, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> When booting directly from EFI, obtaining this information from EFI is
> the only possible way. And even when booting with a boot loader
> interposed, it's more clean not to use legacy BIOS calls for this
> purpose. (The downside being that there are no "capabilities" that we
> can retrieve the EFI way.)
>=20
> To achieve this we need to propagate the handle used to obtain the
> EFI_GRAPHICS_OUTPUT_PROTOCOL instance for further obtaining an
> EFI_EDID_*_PROTOCOL instance, which has been part of the spec since 2.5.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm

Cheers
Bertrand


