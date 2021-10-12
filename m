Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C622842AB2D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 19:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207587.363462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maLvd-0007ZG-Lm; Tue, 12 Oct 2021 17:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207587.363462; Tue, 12 Oct 2021 17:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maLvd-0007We-Ic; Tue, 12 Oct 2021 17:51:05 +0000
Received: by outflank-mailman (input) for mailman id 207587;
 Tue, 12 Oct 2021 17:51:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maLvb-0007WY-JJ
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 17:51:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8cc1dfd-39c6-4ded-b6ac-e54e634bfe28;
 Tue, 12 Oct 2021 17:51:01 +0000 (UTC)
Received: from AM6PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:20b:f0::47)
 by DB6PR08MB2840.eurprd08.prod.outlook.com (2603:10a6:6:1d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 17:50:59 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::19) by AM6PR04CA0070.outlook.office365.com
 (2603:10a6:20b:f0::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Tue, 12 Oct 2021 17:50:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:50:58 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Tue, 12 Oct 2021 17:50:58 +0000
Received: from bae1d77b7cc4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3DB1B3CD-C2B0-4EBF-BA65-21781853F670.1; 
 Tue, 12 Oct 2021 17:50:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bae1d77b7cc4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 17:50:52 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB5050.eurprd08.prod.outlook.com (2603:10a6:10:e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 17:50:50 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 17:50:50 +0000
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
X-Inumbo-ID: d8cc1dfd-39c6-4ded-b6ac-e54e634bfe28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTEBRcsMW//GFyUzf19PhZO+G+xGbKzglhWcA6XKiDo=;
 b=kMuFbV2NMRttS17qE4KcmBixKESw5QKwTTL3oa8L0vGY+VgjWpQm9lJC+CsZ2hiohOtkFMcJ4s7vOWv7OhQNNFBHoG1SSKY7uIZBRojoi5JyALh6k4zWQO1bGX69JtFxwrQGRV6xJJ+ozSIG/NX9FcOFNcg7wOXJBGzRxBABddQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc805b360c3f225b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxwFx2AxeCy/uXutu+m3D5v98EitDEPLVdf5Xekp3TWjWgvIGUh3Y5Am3T2C7ABjH4V/qHk9rRW+sK6sHsfhENLg7ocxjNx7qmuNqSXsB0AKWwrgHEMCtkuvc2zMvWN40Og5y7DckeCcasXgYouqJEzjxVPixCGld2wVLcIRTMBHMblSWvhGJHel4dRKGW++QXDLvi+wz9jPfvJByUO0Bi74YsG5cUAvOf6LL8UsXKNFfuRoHRlDNUB2L88H35w6rU1Dnqom68T71Ivl6JdVnq53+b8snWUCvtsitZ4ep1253Y3gEaHURudFL2bdylSe7KXFSidG3/tLIvzoj5E5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTEBRcsMW//GFyUzf19PhZO+G+xGbKzglhWcA6XKiDo=;
 b=mMvkMcocUK3oC302diekuy752nchdxXaSjAqgoP8icmhhUYVURE3pFH3cs/XeP6vMjO354vNrlMB+PS/njiAlwZ9G3XlCeLhzAbArWz90ZVuUMT4vUwBHfOI6z868eO7pRapU1VfZZc9kIiqsfpvWFoL0wg+5h1XdgFy9wNQIWJh5kH+x/p65PnvKrL5zKepnH27y5txAnPmBW4DWdEhi/bhq+x0dyv2U/KROjYEWL7Z9SK/vs0WJgeVQwLaPm4rZLxPPJ+7V9xkstqo3xyh0CpWp7mqLTCi70XRaosv1nRbiIZp4WPZ68rZ8TOaQQVekuOK/4r7uZP/tHCD7TaSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTEBRcsMW//GFyUzf19PhZO+G+xGbKzglhWcA6XKiDo=;
 b=kMuFbV2NMRttS17qE4KcmBixKESw5QKwTTL3oa8L0vGY+VgjWpQm9lJC+CsZ2hiohOtkFMcJ4s7vOWv7OhQNNFBHoG1SSKY7uIZBRojoi5JyALh6k4zWQO1bGX69JtFxwrQGRV6xJJ+ozSIG/NX9FcOFNcg7wOXJBGzRxBABddQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>, Andre
 Przywara <Andre.Przywara@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index:
 AQHXutl3YqS5dHXsYk6KpdKt4d14RavHjPqAgAY38oCAAbo3AIAAEwAAgAACbACAABkfgA==
Date: Tue, 12 Oct 2021 17:50:50 +0000
Message-ID: <DA041522-CF7C-4C87-8031-55AF0B2D2517@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <2b0670e9-b442-047c-9479-daa97d6329f6@xen.org>
 <16C05F67-E3C8-44BE-9382-BF0EAA69AF5C@arm.com>
 <3b8ffd7d-cfc8-34c5-b0ad-aa23942dbe10@xen.org>
In-Reply-To: <3b8ffd7d-cfc8-34c5-b0ad-aa23942dbe10@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a6ec1d87-a755-4b44-3aa0-08d98da8d952
x-ms-traffictypediagnostic: DB8PR08MB5050:|DB6PR08MB2840:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB2840810889F3E9A6A5DFE20D9DB69@DB6PR08MB2840.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w5hf8mIQoFqoi+VbRKJt0FmAQwowD3fMPmnF0WnO16wiRkZzHg5jBBuj3Cwh2ocKbcwKlyc0Pn5Q0R6nSOcBJawNWvrvFcefVWVXuMNeks0dhX5gTMY1VUQhjLJz2i1A6ALVQ4xBtFG8Im5klbb06nu3/9UKxz3nVQXA9XyijYJpG24NWN6SW0Uy/oA+aEMx7jFzKNShptgaMdy2fb24C9r6v5JPXINwu7FzYbFIagKLfLt2Q+BX23gYpfw3J4KHExjUNGY74uGmJzFuo8EusLzpbJH41Rz1+SOIRsti1DsIO5YyDH7QBY9FYP2f9ffWWqAxVsixUN74bhQW+cLt7kcwfm8Qu6ZyJnK9e3/8HnFn76HEzwISMCcK2tQTRace0Xx8QijYTwsmUrsajs7bDRTdr25U153+3FgkGQffVH8+XbUN9fpvTenBZecq7froybsfsdlqyqwblg8aVgHS3HXnWhycZ5bb7UoTN8RHsEKO8xiVKL6Mt+f5Gc3rSVa767KkRHWoXLSamvbpAXz4cIoNG8c6qsWePp/GcOiulGgx7Iyp93xK0tg+uJCw24MWrLvTv3nbNgbzIRvqR+xi1yItFT71GwgHXvJKNdF8rtIBlGgI9XZRieZktN+O3pNC8CvLQSGHQkVdGcqBcHkbUyL3PGEGVCAjSn6JkpnfeoJDPNNVGTkfv7m7SrILjRlYa6+LY/98/vfS7/+3e2fJklR2OkiWwHUY/eBTkPDXmL3eX8Cs58ZIlwc31Z84gtsg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(8676002)(33656002)(6506007)(53546011)(7416002)(8936002)(38100700002)(54906003)(316002)(122000001)(4326008)(5660300002)(86362001)(508600001)(71200400001)(186003)(6916009)(2906002)(2616005)(64756008)(36756003)(91956017)(83380400001)(76116006)(66556008)(66446008)(38070700005)(66946007)(26005)(66476007)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DB39016D9825964CB4D271853C7EA9E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5050
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec65eade-fc62-4760-aa10-08d98da8d431
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W65y517FlMgDwKEof9l3u3Y0F8Z2ztFZ1Y9UbAr+EKcRjgwoY3q1jrF2zj7bwIfsddFiaFm6a57wQqhTyAnnvMOzPRHf5DiCo2Rtxnq7xhnhjImyiSQzwExEanoaSZaLdUWrlYx/xB0gMUBw5gfkQ7WetmjrpjnBE14uzwW3/BvJ7vnEQHzgpwgw+kcv6kBK6wsXq8xI8AB7tayKRVThZD8SEJYk51wCXui0xHXFjZG+JXNqTLf+/Nn0Z2CizcOnJdnspukiM96BfehzCA8gm1jpmMq/XgXeYbb2J4K2Sg/Q9b0iqDQjR19vdum16OjMOy3Xkn2hUOaszY6/DV1QrXIgJ9iXB3hp7z9d2s9tCaTmoLeTzqSfmXMokqVpYh5XFg8Vt3jWl84w7BEqOBDQoYWp3hoLHEb0/OyqTs109BsdSv+lsRnwT2BmQBsuV3Fqa+1V5tqaI2xvgru+SvARq+M8Rl5HHt9cLPZlOmkNzqd/XmK7Hn4Wc2PYt9xBkwiVdtOtZz6lduiYNuEGV7StJj0fYTWB3V1G4Dq+g26BMXNv8xrJmbE3wAC0poyVstpVskq3XFP+wmspF4my4cr3u5IRAdEDEkCHy3kt+gH8lUJXkHIo6tZEvKRJlAPSoTvapkezaX2iMNRRKjyePwYxZeMQjjI9OH7fTS/ibMHfbpCkn/DZjOy/Kw5LnL2jZ0GqQUYsttZGkCXWazqgUUJeAw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(2906002)(8936002)(356005)(81166007)(82310400003)(86362001)(70586007)(36756003)(336012)(53546011)(6506007)(70206006)(47076005)(5660300002)(6512007)(508600001)(33656002)(8676002)(6862004)(6486002)(2616005)(316002)(54906003)(36860700001)(26005)(83380400001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:50:58.9053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ec1d87-a755-4b44-3aa0-08d98da8d952
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2840

Hi Julien,

> On 12 Oct 2021, at 17:20, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 12/10/2021 17:12, Bertrand Marquis wrote:
>> Hi Julien,
>>> On 12 Oct 2021, at 16:04, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> On 11/10/2021 13:41, Bertrand Marquis wrote:
>>>> Hi Jan,
>>>=20
>>> Hi Bertrand,
>>>=20
>>>> As Rahul is on leave, I will answer you and make the changes needed.
>>>>> On 7 Oct 2021, at 14:43, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> Independent of this - is bare metal Arm enforcing this same
>>>>> alignment restriction (unconditionally)? Iirc on x86 we felt we'd
>>>>> better synthesize misaligned accesses.
>>>> Unaligned IO access could be synthesise also on arm to but I would
>>>> rather not make such a change now without testing it (and there is
>>>> also a question of it making sense).
>>>=20
>>> Yes it makes sense. I actually have an item in my TODO list to forbid u=
naligned access because they should not happen on any device we currently e=
mulate.
>>>=20
>>> Although, I am not aware of any issue other than the guest would shoot =
itself in the foot if this happens.
>>>=20
>>>> So if it is ok with you I will keep that check and discuss it with Rah=
ul
>>>> when he is back. I will add a comment in the code to make that clear.
>>>=20
>>> I am OK with it.
>>>=20
>>> [...]
>>>=20
>>>>> Throughout this series I haven't been able to spot where the HAS_VPCI
>>>>> Kconfig symbol would get selected. Hence I cannot tell whether all of
>>>>> this is Arm64-specific. Otherwise I wonder whether size 8 actually
>>>>> can occur on Arm32.
>>>> Dabt.size could be 3 even on ARM32 but we should not allow 64bit
>>>> access on mmio regions on arm32.
>>>=20
>>> Hmmm... Looking at the Armv7 and Armv8 spec, ldrd/strd (64-bit read) wo=
uld not present a valid ISV. So I think it is not be possible to have dabt.=
size =3D 3 for 32-bit domain. But I agree we probably want to harden the co=
de.
>>>=20
>>>> So I will surround this code with ifdef CONFIG_ARM_64 and add a test
>>>> for len > 4 to prevent this case on 32bit.
>>>> To be completely right we should disable this also for 32bit guests bu=
t
>>>> this change would be a bit more invasive.
>>>=20
>>> I think the following should be sufficient:
>>>=20
>>> if ( is_domain_32bit_domain() && len > 4 )
>>>  return ...;
>> With the last request from Roger to use the function implemented in arch=
/x86/hw/io.c, the function will move to vpci.h so using is_32bit_domain wil=
l not be possible without ifdefery CONFIG_ARM.
>> Also I have no access to the domain there.
>> So the best I can do for now would be something like:
>> #ifdef CONFIG_ARM_32
>> If (len =3D=3D 8)
>>     return false
>> #endif
>> A 32bit guest on 64bit xen would not be checked.
>> Would that be ok for now ?
>=20
> I think the #ifdef is a bit pointless. My preference would be to not add =
the #ifdef but instead add...
>=20
>> I could add a comment in the code to warn about the limitation.
>=20
> .. a comment for now as this is only an hardening problem.

Agree I will do that.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


