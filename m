Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FDD4B4E57
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 12:27:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271456.465898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZW6-0001GH-Pu; Mon, 14 Feb 2022 11:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271456.465898; Mon, 14 Feb 2022 11:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZW6-0001E3-Lz; Mon, 14 Feb 2022 11:27:38 +0000
Received: by outflank-mailman (input) for mailman id 271456;
 Mon, 14 Feb 2022 11:27:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gtPN=S5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nJZW5-0001Dx-Ar
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 11:27:37 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe09::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bed3292-8d89-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 12:27:36 +0100 (CET)
Received: from AM6PR10CA0072.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::49)
 by DBBPR08MB5996.eurprd08.prod.outlook.com (2603:10a6:10:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 11:27:29 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::74) by AM6PR10CA0072.outlook.office365.com
 (2603:10a6:209:80::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 11:27:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 11:27:29 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Mon, 14 Feb 2022 11:27:29 +0000
Received: from fd1ac9cc958f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BCE1E87E-1E60-444E-8AF9-54CE6B1BDE0E.1; 
 Mon, 14 Feb 2022 11:27:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd1ac9cc958f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 11:27:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6273.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 11:27:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 11:27:21 +0000
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
X-Inumbo-ID: 1bed3292-8d89-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V37/ukN9UxE3o3Kp+xKf4cCwyMAtoZ+XtH9Ls9o4Js=;
 b=l6HfSFezaIjNkw+H85wRFble/cy2hzwrreMH3k1R44TNm6t6Sp0LBOWOKrTFqmeXthhonWXYGAAfhzc8X5PdxJcxXVAtAo2WcaEfHpvqedfPXhAxhLeG2PO8fzqWph/LuVtUm87WoCjFEuA4LDz8hza43qK3H+VgrpIN6jyW0hE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: db13a75bb7ff63ea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhtNLaO2x7uzyQxK61irfDuM4sdIS6P2spoGj3mPl0vJUu6Xp42dL02cDgOOMh3oZHBwCVLJufXJib1banrjRztuFgM2IG8J9cS+u8FuErcqp7I2mskAXTEGNojl9+zSy4KykJf1MtRkJ0dQ8g7/FvrUD8TTobJM+yZAJWvrAsJ7zC2FDvkJQ3hXHb5BnELWpfFQgGwTQVcyFyEm38w0qTOxikpkRWpmoV1QkCB9Qx4RrhFObxkSUuBgbKMHbS2Zl0SXQAz/g3cQ7a6UL1jHLgXQM7LKip8I5N2G54rHLNN2yRTqPo4qQHHrYCpJAiZr5sYH/nAfyrSQf0gkbkrGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V37/ukN9UxE3o3Kp+xKf4cCwyMAtoZ+XtH9Ls9o4Js=;
 b=arbiQEyiHDzDrjH5UotXYJmF7wc8ZQp4YC3mIhH096GH6U/8oiWSu4WgOia9OkSouj+LclnfeUqom7ZkzhE9mVzK951k/PXkI2ELttTNop2gSWcjpH5/iYOXVTBEi6imAFIJZrzyJDnzHDPapkMP2t8VJVSeDximrucA76SHGOPiCJ6gsmqqdohUIhZGHKDU13KCH1rYjkwJekket+0xOykZYsYtUmH6BUW2okoTTpBOjCJrrnwPXFhTwHKcg0LtgRbMikX5B0XOzRrtPhTY6VAeuadnv4G4M1Kq6zAObq4kka8MjD18Eo9IiublgQ6/vreaUBHlcRAgY//BZglRfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V37/ukN9UxE3o3Kp+xKf4cCwyMAtoZ+XtH9Ls9o4Js=;
 b=l6HfSFezaIjNkw+H85wRFble/cy2hzwrreMH3k1R44TNm6t6Sp0LBOWOKrTFqmeXthhonWXYGAAfhzc8X5PdxJcxXVAtAo2WcaEfHpvqedfPXhAxhLeG2PO8fzqWph/LuVtUm87WoCjFEuA4LDz8hza43qK3H+VgrpIN6jyW0hE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index:
 AQHYHRW24Dmb0qV8ZkqAv39Pf6/nVayODW6AgAAg+ICAAAmzAIABqiEAgAMLQQCAAAQDgA==
Date: Mon, 14 Feb 2022 11:27:21 +0000
Message-ID: <E78206B4-3793-498E-A580-F0561DF6D4AC@arm.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <cb1493f5d9b5c3437268054b4a8e345cb35c8708.1644341635.git.oleksii_moisieiev@epam.com>
 <F9811680-C6EC-4372-A451-5C1DA279E35E@arm.com>
 <20220211104403.GA2291814@EPUAKYIW015D>
 <A9FF3FBC-C29D-4A17-8737-EBABEF240BA2@arm.com>
 <c13f6312-3922-4504-3248-e2e4701b1a10@xen.org>
 <20220214111300.GA3615313@EPUAKYIW015D>
In-Reply-To: <20220214111300.GA3615313@EPUAKYIW015D>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 28da943d-6e7b-4470-53d7-08d9efacfc38
x-ms-traffictypediagnostic:
	AM9PR08MB6273:EE_|AM5EUR03FT039:EE_|DBBPR08MB5996:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB59960322FD4CFBE8AB36A8579D339@DBBPR08MB5996.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PSPpdEUETwv9uzeEDJ6rsRBRLCYuZXod1OWRV4hul/gvBaOdndgdDdJXY9Uupaz3UyJ/iNmI1XQqAQqA67stYfD9PUvsOTMzYDLmILvn6eBSW/vj/BFKRay75td7XX5RC0TblugKE3yGFw9HQNm6IwKxartepQBXNvFxpVRTw6cbIZEuXwXJSvQciSLrundwWBYJqul66pd8Jt3me9Me2NvinlLN+qG8AAkwBQsMvPa/YP79mwlSOw8z0orQ/psZgH28WJp+8LKC0A0iqx168kz0lGFzP5Ove+yytobXBRupbUXqv8nP/DxVxjLmK2rW9TSFOiMmH1NjWTXHYjsT7PWtiXpLiWTCuDztUDf2PDPc0BDgiISBt6zp+5rLUXa+RecJhv8FQKbn2hGujjzZYXPf64ag9OiEn7hfMh66u3sML7uuE6BnalK8Z8/YaNqKzCG8w675fKCMF5H2jr68LQ3u3ONGyx8u/mlMBmmeRDh+rrGsf/BCmkuJC5L2WXTfMg3tRlXONHO+wWNIRdnSRSvoW04hQEQWfuu0g0QAPf4BqkZxr5xUpOJhECJKFHYOMsVzIrLqY8AzA9iO4hyIo4vHa8VrQiM01uL8rbYfwCBp0vN6Z8O8nNGWyrcjXdphMqgRqLiiQwZ4ZDfFKR8RoL7RJLkkKvOko6Oqpc+rTOAXTidwcNBCnEMDFOatMkaDSi+FDPYQaFIyL2nD/DaiglnSUjIg56UtvCdp4//yxlOFxx1MgJghu6qBAaMrK0vbVSupblIR9RGuNw50gzZ0sGe2oeV+c6ceTbBus7/cmCTOKjqseY8cD63hbBs13OaH/4rA5A1NFpF1fvetqLXZOG7AyYIwkE44cPG2+ntw/e8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6506007)(508600001)(86362001)(6512007)(53546011)(2616005)(966005)(71200400001)(38100700002)(83380400001)(186003)(26005)(122000001)(66446008)(8676002)(8936002)(38070700005)(33656002)(5660300002)(316002)(4326008)(64756008)(76116006)(66946007)(36756003)(66556008)(6916009)(91956017)(54906003)(66476007)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B977726E290F5E4F8F2F4DC27E8EF9EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6273
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f7408e6-4967-472c-2f45-08d9efacf791
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JegdCA2vNObgT4vL/DtCZkUK8puf4ZMmccQlJaquiQ9AQrjWNXhGyAMg0UrnqFs1Abn/a8xWBCCJlPjtye2SAhCQSKtifTqv8CnIG4O6BvciKrzgI0qnKcbgzWcjkQxEB6iU+/bYVW51XA8/RBRHqkFj1k74Kp9z4lX3gC+iKtwR2gXA+95ZQK6LY4OaTkV2v4QVRSEnu7tFevM4mDG8yuXTznFlmObHtod+0Fv4uWSqt03HOio7TDx0+MzG/2zZUZbOgqOXPx7RXVBJX22s45P4P3fCdZW/SZUq3X46J9pw9Um4myw83LNPE+twNukHjd2dvVrHVzj/TZDtmlqj761jOTm4BrWud2sR9v8GgxNXp0RqolpAeW60whiMIq08PPzeYYFx3jr8yGOc4zZbeL2mIjLcnMVwDW5TmaB80w6SrjNgRlHdtbKi/ABDNLWXrDBnoF58Od/npPtjUTHp64GVh0ZXnGmyJetLuBYP5AwkAYPkH/yQiVR5if5AmXZ/YCBjAi3oGQZhjYPsFdPJnH8fKX+V4JEtewul5tC3n6gHVqvZnT9LPojLbS+hzAspaliaK7yDAm3PPAbn2FiAuNvbeMaZIYw36QkINvHTrsNUwr0RKbATLHjqerdrNbUR0ZBokavHI0XdCduIXNrTDJG/IBCqrvF2NWd2oHdcTjp4NTPTnzyAmJMLhFUd9X/cWiEfPWfEXG6MZhoi2i5uY+OF1yRlWHDzQZQCKHvr+rozNx2hOGU1FiboIblTQ3/QijUzz5RBqM17rVQGtkl2mMV2nOPVetWifXhSbu9BVyLFMSnIUvCwGZC0ln33IAGx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6512007)(40460700003)(316002)(107886003)(2616005)(54906003)(86362001)(47076005)(53546011)(6506007)(36860700001)(186003)(26005)(2906002)(33656002)(36756003)(83380400001)(966005)(82310400004)(81166007)(5660300002)(70206006)(6486002)(70586007)(336012)(356005)(8676002)(4326008)(6862004)(508600001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 11:27:29.3974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28da943d-6e7b-4470-53d7-08d9efacfc38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5996

Hi Oleksii,

> On 14 Feb 2022, at 11:13, Oleksii Moisieiev <Oleksii_Moisieiev@epam.com> =
wrote:
>=20
> Hi Julien,
>=20
> On Sat, Feb 12, 2022 at 12:43:56PM +0000, Julien Grall wrote:
>> Hi,
>>=20
>> On 11/02/2022 11:18, Bertrand Marquis wrote:
>>> Do you plan to add support for other boards ?
>>>=20
>>> Did you discuss more in general with the linux kernel guys to see if th=
is
>>> approach was agreed and will be adopted by other manufacturers ?
>>>=20
>>> All in all I think this is a good idea but I fear that all this will ac=
tually only
>>> be used by one board or one manufacturer and other might use a differen=
t
>>> strategy, I would like to unrisk this before merging this in Xen.
>>=20
>> In the past we merged code that would only benefits one vendor (i.e. EEM=
I).
>> That said, this was a vendor specific protocol. I believe the situation =
is
>> different here because the spec is meant to be generic.
>>=20
>>> @julien and Stefano: what is your view here ?
>>=20
>> I share the same concerns as you. I think we need to make sure all the
>> pieces we rely on (e.g. firmware, DT bindings) have been agreed before w=
e
>> can merge such code in Xen.
>>=20
>> The first step is to have all the pieces available in public so they can=
 be
>> reviewed and tested together.
>>=20
>> Oleksii, on a separate e-mail, you said you made change for ATF. How muc=
h of
>> those changes was related to support for Xen? If they are some, then I t=
hink
>> they should be upstreamed first.
>>=20
>=20
> Let me share changes, that were done to AT-F and Linux kernel
> device-tree in terms of the SCMI mediator POC.
> Changes to the Linux kernel:
> https://github.com/oleksiimoisieiev/arm-trusted-firmware/pull/4
> Based on renesas-rcar linux-bsp, branch v5.10/rcar-5.0.0.rc5
>=20
> Changes to AT-F:
> https://github.com/oleksiimoisieiev/linux-bsp/pull/3
> Based on renesas-rcar/arm-trusted-firmware branch rcar_gen3_v2.5.

You inverted the links but thanks this is really useful.

Did you push the ATF changes to mainstream ATF or discuss those with
the maintainers ?

The strategy overall is nice but we need to make sure this is accepted and
 merged by all parties (ATF and Linux) to make sure the support for this wi=
ll
not only be available in Xen and for one board.

I will try to get in touch with the SCMI linux driver maintainer at arm to =
get his view.

Regards
Bertrand

>=20
> All changes that were done are not Xen specific. Given AT-F changes are
> the implementation of the SCMI feature using SMC as transport. All
> changes were done accoding to the DEN0056C [0] and DEN0028D [1].
>=20
> We pass channel_id via SMC to the Firmware on r7 bits [15:0] (See Section
> 4.1 of [1]). Then Firmware converts channel_id to agent_id. Channel_id ca=
n't be
> equal to agent_id in our case, because, according to the 4.2.2.8 of [0]
> - agent_id 0 is reserved to identify platform itself.
>=20
>=20
> [0] https://developer.arm.com/documentation/den0056/latest
> [1] https://developer.arm.com/documentation/den0028/latest
>=20
> Best regards,
> Oleksii.


