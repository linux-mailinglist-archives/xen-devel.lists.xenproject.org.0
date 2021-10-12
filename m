Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDCD42A925
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 18:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207511.363374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKOJ-0002U5-Fh; Tue, 12 Oct 2021 16:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207511.363374; Tue, 12 Oct 2021 16:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKOJ-0002SJ-CQ; Tue, 12 Oct 2021 16:12:35 +0000
Received: by outflank-mailman (input) for mailman id 207511;
 Tue, 12 Oct 2021 16:12:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maKOH-0002SD-LY
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:12:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::601])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 189a4c74-de30-4bac-9aa8-c204b4d1bd85;
 Tue, 12 Oct 2021 16:12:31 +0000 (UTC)
Received: from AS9PR06CA0095.eurprd06.prod.outlook.com (2603:10a6:20b:465::28)
 by AM0PR08MB3363.eurprd08.prod.outlook.com (2603:10a6:208:e1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 16:12:29 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::5f) by AS9PR06CA0095.outlook.office365.com
 (2603:10a6:20b:465::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 12 Oct 2021 16:12:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 16:12:29 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Tue, 12 Oct 2021 16:12:28 +0000
Received: from 2640eb854b00.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3868C9F7-C7B1-43F6-863C-FB37F11902DF.1; 
 Tue, 12 Oct 2021 16:12:17 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2640eb854b00.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 16:12:17 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB3658.eurprd08.prod.outlook.com (2603:10a6:10:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 16:12:16 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 16:12:16 +0000
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
X-Inumbo-ID: 189a4c74-de30-4bac-9aa8-c204b4d1bd85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71MFZnlzbv/YzYcN5M7r8f/Ot4fDlYY3vNHI4mHN9As=;
 b=tpo0b7kufBnovtxyGIrr5Hy+r9l/Z+gz97YT5WRmzTKOcoTvl5MzmvKeLglJUpAuVWvig4cXznRaljU3TAjdFHVi4mUzz+3TIJSVe6tUf1+kjIW9+MPRHpUEYDCxnAPWJUOcwfTjR72bhCNaxdYc6K3T0JUNBxPbLy9GXLFPHTE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a73d9d7a40ffff8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEb3CAVt8tlrhoqZVn9HNLjQfaLfEiNsSpvucRwMhpajoNA8WoKvGOuH+h1N/tz/FbzDv/FULjIVYHOUUjJkgy3b22T4BpR6B7SnU4JmC1+5y3fB1v9mc6+01rsXDpGZBuvFleloLlGptFTJtfuSRU2oocUO7vCV8aQlIbJ1Jfe4grnLctWh5T4ro0R5CA+t3O79Fh/gB+SzV8IVt7Vgv9OTUeCJhVfwD04l5Ww7g6DeVRZ9LSn5uZUj5XzrTzTCIYvEwvInFWv+tgy3yWR5BcwMp//NI2bYfbIaljGw83/4+sWGiqiAAgoP6FYwMNHe5ebyNsYaRHnghiudDF7pVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71MFZnlzbv/YzYcN5M7r8f/Ot4fDlYY3vNHI4mHN9As=;
 b=mDTC9qK1WYcL0NnwU8YV6HtY92zTvd79Iv+hb429tZHI+GaJGhbRN9Fb0xaTZlUYQHeovjpm+otcSqSZYhpBq0CfHXrBBA1sP1TyubFRMuLA/LlF209r36c6Jkt0O62LMX37eIhYVGvi4Ylw8YwOnV/wO+h+WXifJEbEjirk+O3o9rc5aTgC3PilWvKUHoCsi5p+jx10o8GhqFXTSVBvdYHIW/luPMgYqwNM94bnq5/KiHx/+7CBj8vLLvq1x/UGZgrudoPt+29k3F9dkkGyX/BDZK3hrODzNMXxEInec/Qc5urVkYUJxNXhst76nX2zvBbHU9n24C2ysh3PrqbqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71MFZnlzbv/YzYcN5M7r8f/Ot4fDlYY3vNHI4mHN9As=;
 b=tpo0b7kufBnovtxyGIrr5Hy+r9l/Z+gz97YT5WRmzTKOcoTvl5MzmvKeLglJUpAuVWvig4cXznRaljU3TAjdFHVi4mUzz+3TIJSVe6tUf1+kjIW9+MPRHpUEYDCxnAPWJUOcwfTjR72bhCNaxdYc6K3T0JUNBxPbLy9GXLFPHTE=
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
Thread-Index: AQHXutl3YqS5dHXsYk6KpdKt4d14RavHjPqAgAY38oCAAbo3AIAAEwAA
Date: Tue, 12 Oct 2021 16:12:16 +0000
Message-ID: <16C05F67-E3C8-44BE-9382-BF0EAA69AF5C@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <2b0670e9-b442-047c-9479-daa97d6329f6@xen.org>
In-Reply-To: <2b0670e9-b442-047c-9479-daa97d6329f6@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9d83c649-aa82-4d77-693b-08d98d9b16fd
x-ms-traffictypediagnostic: DB7PR08MB3658:|AM0PR08MB3363:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3363CF34B537F5421F68AE969DB69@AM0PR08MB3363.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F26IE9kbP1fdBuws9ogJcPF3w86KTgaR9pOWuZ5ckI7AgIey2TGyVJDOi2khayyazG9vDG4E744UzgRUD/+lkwH+2ylrJCkLzPddr9snCrvshwV6GAUaZsMIDkXpHgn6qkc/WqPSwplpQnfw9fDFbF945NJ3FE4aGAe/xd+7rK/CQ37FtpKzt6KCvagRND3odLDvDHZlLQHco4NhwC+ykojtU9LSwM6fsHbfZE+xjT2SCPKaBNYFoYprhWILWLFlbqBcPy/DOrPI9pLtqy5XlqhS7JQbuJGXZH0koWZZpwZeoxRjvGUs+yjXGvdr21HnqdvsAqxCrj+YS76X/Spzme3uL8Qawa3MdoD/3vTOSbE5auBuVDU8uJ0mz3YV5LKpP5QXLqprEmggVOi2oFzG+J/Wb7AiYlE+G382sNArwnORdcErqVMy0sDOLFDlfMnvk9Kvwm6Onf9V4BUyVa2yoTcC8M56OsiUIWlc8RtSafnC2w24X2gBwPh8R/6zq4kkpGOH+nbaHBgGxMX/IRLUw8GPqlDLc+5cs7Qt1RrZykseuEQwoKfPaNHrjEajHjVv7gj9SO09iZyEcamjPTGt6uzui30dLVzzGDC/GNBTSv0+U+KMMgNx2XXpDTGtRAKcNiBZrOePidPqxhvY741dvEDGcnUV3gXTJXhPIVzvW31kuBfZf81+EmhisI4bUeaG1nP/R3oaufzIvqrhQDFk8+Z5iCxFdxpm2Av+eqnwxXv3w6TtH27oVbYHZ4UWKxbE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(83380400001)(86362001)(26005)(8936002)(6506007)(66946007)(38070700005)(53546011)(76116006)(5660300002)(8676002)(186003)(122000001)(91956017)(38100700002)(6486002)(36756003)(2906002)(33656002)(66556008)(64756008)(66446008)(6916009)(6512007)(54906003)(508600001)(66476007)(2616005)(71200400001)(4326008)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0BDF9B265ABF3A498B73A9AAB89588E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3658
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	499c1d51-6a2d-4b49-39a2-08d98d9b0f1a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uo4TVPlqhO0tV4D0T7YHEk4/WEw72eCpiEYuoYYtR2FxfGlPrc9ozHezXkloMGuYVOf/P3CQ0sT87wPUQbc+wVdqcJN8cx45qDKoVQqXvJd5Zo3QXKGrhzkwjJXNS/YMBv8lQrqnUIaLDgMSVFXCS1MuOgtUaI1kExR4qIZeb82Xx46ym5uakY8yx7nDO/2ECPjx1iqjKiGSfkAp6pJL14tC0iuBjV3opz4O/e87986jFjTz6ukUsqWVfvNpCUr4Twvro6EWBQkjQv/8IBoAKPSNJqBOO5ihSN4z/GDy+jDjrmMr5wX9IOzSQnBp0zsXVGDQqwFPeQPTnotUrNeX8EJ6hBRR8NjbWCx3lc5SnDdKh8QQV+Qx8NMqV7/TYAnZ4I1T6s0hZn6F5Bm7pHIKSYxYwatRFlmLUUlon7BhhkFoRKWyK1Tkn1ts9N0b956+JElnwglmosmRxzmBcBl7et7lu8w9z5NUxAoF7HxwHHQtz8vZOPLF9Z15EpYqseH0gh2OoVbocBvMgoY5/AJzZohqr+t0+s/J9OcSvYP8Bp23BnhkGTGo3Q7eHlhsk3cb+LUswwSrWMSkGJ/p0iEOu98Ah1gUPUA0uNsJsxCZ7ZxHlIho4mGvHoHEEJlDtDP8uopzSSzzUgbc1ulLDup+vF6aWKnQsFqaamSzwMXXsdlRfqB6SFzLEjlSqpPF7pSg89HtcOJbpHhhBT0OiYm9lA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(33656002)(336012)(83380400001)(316002)(8936002)(81166007)(6486002)(26005)(186003)(54906003)(86362001)(6506007)(53546011)(47076005)(356005)(36860700001)(6512007)(2906002)(70586007)(508600001)(6862004)(70206006)(2616005)(4326008)(8676002)(36756003)(82310400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 16:12:29.3649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d83c649-aa82-4d77-693b-08d98d9b16fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3363

Hi Julien,

> On 12 Oct 2021, at 16:04, Julien Grall <julien@xen.org> wrote:
>=20
> On 11/10/2021 13:41, Bertrand Marquis wrote:
>> Hi Jan,
>=20
> Hi Bertrand,
>=20
>> As Rahul is on leave, I will answer you and make the changes needed.
>>> On 7 Oct 2021, at 14:43, Jan Beulich <jbeulich@suse.com> wrote:
>>> Independent of this - is bare metal Arm enforcing this same
>>> alignment restriction (unconditionally)? Iirc on x86 we felt we'd
>>> better synthesize misaligned accesses.
>> Unaligned IO access could be synthesise also on arm to but I would
>> rather not make such a change now without testing it (and there is
>> also a question of it making sense).
>=20
> Yes it makes sense. I actually have an item in my TODO list to forbid una=
ligned access because they should not happen on any device we currently emu=
late.
>=20
> Although, I am not aware of any issue other than the guest would shoot it=
self in the foot if this happens.
>=20
>> So if it is ok with you I will keep that check and discuss it with Rahul
>> when he is back. I will add a comment in the code to make that clear.
>=20
> I am OK with it.
>=20
> [...]
>=20
>>> Throughout this series I haven't been able to spot where the HAS_VPCI
>>> Kconfig symbol would get selected. Hence I cannot tell whether all of
>>> this is Arm64-specific. Otherwise I wonder whether size 8 actually
>>> can occur on Arm32.
>> Dabt.size could be 3 even on ARM32 but we should not allow 64bit
>> access on mmio regions on arm32.
>=20
> Hmmm... Looking at the Armv7 and Armv8 spec, ldrd/strd (64-bit read) woul=
d not present a valid ISV. So I think it is not be possible to have dabt.si=
ze =3D 3 for 32-bit domain. But I agree we probably want to harden the code=
.
>=20
>> So I will surround this code with ifdef CONFIG_ARM_64 and add a test
>> for len > 4 to prevent this case on 32bit.
>> To be completely right we should disable this also for 32bit guests but
>> this change would be a bit more invasive.
>=20
> I think the following should be sufficient:
>=20
> if ( is_domain_32bit_domain() && len > 4 )
>  return ...;

With the last request from Roger to use the function implemented in arch/x8=
6/hw/io.c, the function will move to vpci.h so using is_32bit_domain will n=
ot be possible without ifdefery CONFIG_ARM.
Also I have no access to the domain there.

So the best I can do for now would be something like:
#ifdef CONFIG_ARM_32
If (len =3D=3D 8)
    return false
#endif

A 32bit guest on 64bit xen would not be checked.

Would that be ok for now ?

I could add a comment in the code to warn about the limitation.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


