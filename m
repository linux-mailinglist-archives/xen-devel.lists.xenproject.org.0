Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344BB4292A7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206178.361687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwft-0003Wr-QC; Mon, 11 Oct 2021 14:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206178.361687; Mon, 11 Oct 2021 14:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwft-0003Tt-MV; Mon, 11 Oct 2021 14:53:09 +0000
Received: by outflank-mailman (input) for mailman id 206178;
 Mon, 11 Oct 2021 14:53:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZwfs-0003Tn-2P
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:53:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::628])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95d248dd-650a-4448-8fd3-1d7e6c480a12;
 Mon, 11 Oct 2021 14:53:06 +0000 (UTC)
Received: from DB6P18901CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::16)
 by VI1PR08MB2655.eurprd08.prod.outlook.com (2603:10a6:802:19::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 14:53:01 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::b6) by DB6P18901CA0006.outlook.office365.com
 (2603:10a6:4:16::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Mon, 11 Oct 2021 14:53:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 14:53:01 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Mon, 11 Oct 2021 14:53:01 +0000
Received: from 7af65fd9def0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F34DA820-13D1-4DE6-A588-385B035A1005.1; 
 Mon, 11 Oct 2021 14:52:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7af65fd9def0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 14:52:54 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB9PR08MB6619.eurprd08.prod.outlook.com (2603:10a6:10:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 14:52:43 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:52:43 +0000
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
X-Inumbo-ID: 95d248dd-650a-4448-8fd3-1d7e6c480a12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y74SquOHz/DWzW2xWtEThLFaMhM1aL7AMX89BqsoXA8=;
 b=o3/iyHWaI+zbSU4fyeOy5nAD0mzDHim8J71CZHtc5iCcOTrlwqhCFzTWejem/gB/5zw0qr7Mj08lPS/jaGKXWzW1lTFHCmBT569tNDP+ECvItJqM/+ZrvTnay0IEPzApMpsFKZTU04FQnKgPZabopbbnmtaPGe+dljIUQPkLsB4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dfeb16296a440d2f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFxBTpx5bFVqnwnGVBOJC7vnWvIuMQW63OhZSWHf2SerISb5eX5U66x8jNjNTObVSlEr1pKcNPzV1ZpPns5TSew7zqLhFP9vCzXxsc07WKQLH9TsE9ru2AMyVTYFtgChtpptC8B0gE84GIaTRFPvUxElWYrYbDdWpH94ESHbpy3vS8PjeK/bueQOtCdioNC/dClPRyptK25DlCATXfwkcgWocuWvhrsTQQjMcWY+z34y5mpF3A4F5iz5/pTWKCnVjCeDhrAIwNKBqhQ6f1w/gvbGbDmSSBMrl6tDePrhq2STeOrrkxZPc9ghqPStTlV07/g27i07zpABpMSJqYaD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y74SquOHz/DWzW2xWtEThLFaMhM1aL7AMX89BqsoXA8=;
 b=QgbeZ2xiZlpNGH+VQ+kUALvZU46WnPPO9CXnhxea/40pcSW6O/aoBAu9muObj8V4RV1neoQN8ez8r/K75T5DUzUgf476SLsPABCQbCJ9hW57RNrKlmz+scMfJ6VlP1zyjOpJ++3yhKdm3PuexeVzU1R/TXoeLzCSqFI5MWsxzsFpH39Hhkm0CcrSzgKCVzG8bA85o5PqTygetGawlPBMWr611Wix6UbiKi5pZDjDESlp8XLHGR9OQMhnBvTLBLAHEXTP1p8gW+OgfrDNXPMyXGQHxhhUfr4E7qoMiKrAA1IyyqYgaYCMXz3mHRq3eDa/KmwMWbtF/1C06iOLUJMh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y74SquOHz/DWzW2xWtEThLFaMhM1aL7AMX89BqsoXA8=;
 b=o3/iyHWaI+zbSU4fyeOy5nAD0mzDHim8J71CZHtc5iCcOTrlwqhCFzTWejem/gB/5zw0qr7Mj08lPS/jaGKXWzW1lTFHCmBT569tNDP+ECvItJqM/+ZrvTnay0IEPzApMpsFKZTU04FQnKgPZabopbbnmtaPGe+dljIUQPkLsB4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
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
 AQHXutl3YqS5dHXsYk6KpdKt4d14RavHjPqAgAY38oCAAAe6AIAAByIAgAAKAoCAAAvMAA==
Date: Mon, 11 Oct 2021 14:52:43 +0000
Message-ID: <CC5D73DE-74EB-476A-965E-4467A0010439@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
 <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com>
 <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com>
In-Reply-To: <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b7e1d204-5a9a-489a-b715-08d98cc6d2b7
x-ms-traffictypediagnostic: DB9PR08MB6619:|VI1PR08MB2655:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB2655254FA3B29D4113F0F7E09DB59@VI1PR08MB2655.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OnTvuWZMxJGUdH3FiOV7b0NKFp+c2gCCoW0bOoQKVBQgsoW6Xq4DjChBcxtjEMPN41D/sejjDMAtHM8DzWPctCHlJPO7I9EPcjc/x1qqOwy6pDv6UNuJyUe0nvYpbKKEXnptJ7EppjOvjrntRj/Pg779XP8TMuftWdWdbWTLpzgf86f+05yMd4MX8fxCsNh6cO1+K0z3zcuwLS+yemerdJX2vj4AnzP/Hz3Ur4yvI5A2J9BDdDIdQeA1NdTQPg2o+jWn+ZC3fIDNb8R2nGFNmN+oRIpxSkPXLtGTX70iD9yrViBrN3jSHog9WefqnH/PMheDxxEXXcuTAAZmDRjct8CWnLKAyUDGnHy/m+UqrfCeu2pynGq/PkmrY8Xd7v3p05Pe9ZmVm0jFBYNLmb6FkRKigehs9rSRTKsER4tMIlgsKgrAampjjWOBdU0OJJ4AIRiptWRABBOtZoEBJuSLo04YQ9sTcyvkRhzjjWL6sBhr2csgNeXikezveyeOIMeS17cbVnIiJJA3XPbDmqWBTKiOCH72QILHwiBgAWZuXnjiZ7LyJOOIEg3EZbwULPNDnvvM746bizaHRgBYo1w3i4Eluxc3uY7Dud0rjgOszNKi+/CMIekPipYXDKoO/r4xKL0ARLqYpGrqt98ndqC0lVyaTwl7S0KsIN2FsEAHCFONRwYy1zC0lh+R7oc7Ml27vTgrGTtiPZWjmIKxjW4+mP3XbDtH+VCIDDMQYZFWD47v+YvKL5lkUIUhuayTcLH40zFlRY3ytMy/hX+FLTqeAA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(6506007)(8676002)(316002)(4326008)(53546011)(66556008)(26005)(83380400001)(36756003)(54906003)(6916009)(66476007)(8936002)(7416002)(38100700002)(186003)(122000001)(508600001)(5660300002)(6486002)(2616005)(2906002)(66446008)(33656002)(38070700005)(66946007)(64756008)(76116006)(71200400001)(91956017)(86362001)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E4070945BFD28448B4D481C62C31F0FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6619
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0c81747-f01f-49ab-935e-08d98cc6c7b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t7LhZ7nyesssSfqAibWx5mGemwa294bqLVuEjubl/+9U1YCeu8zSxdT70YXeuzqZ1U1JxS6b4KBNYO+hYudX9Z756gRvj9HhtY81QbRfrlyxK1IMuL2VlLz3pbyg3n4z9OKPAd1BY8XsCfPuOTe34dgaH2Il1QG846mDbpYUYugnR/0BJuxedpTDpkJdP6P8o9kX1YwTb7VSQ1o7e+SclbKmK0gpArJTxRXId+bVAKWZXI6GlFyWsD5js49UAI6SJQRxI8TWGVO8TqyHVmimU5HFJG73Zpix5WrZD6nGXZxgku6fCFmptMnIDZskIcs/25td6pvXvz1i8Jxwd+mepHOxHSdP67ytsQdn6dC5vHq3IUzcNasF7aer1vJxZtisVw9KvMKlcCB3t9/i34GP9oCVX+v/zIQu8NADlda8zh9712SbyAukm1HtTntsOz4zw2reMV6rQ6+iKBKguxK9KbwJF8tVoFBlp4EkzU8Ymv+N2kxNgB17oeZ/jrN99EW1QB1LzicfcYWwxTD4IvDHfBQV/JgUyikJjrDRBdOZXUhJhGlbzvPAz6U8VNwWuUa9etUTJoy3op2K3rlsu7sEU5wSg4iuxl0LhiHJBTufozViXvAkb7NJHoTjD7a4OktaXrgUH06q3s7sKpa1btk8un/NwkNriIP2UjxXrJ0K53vS2pK8hlJq00+MgPPY6Hv55l8G4i4QJwYv7yCuPTpkUvePpnepuFLj6Oi374iLRlI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(2906002)(26005)(8676002)(54906003)(47076005)(316002)(186003)(5660300002)(33656002)(356005)(6486002)(6862004)(6512007)(86362001)(36756003)(8936002)(4326008)(81166007)(83380400001)(36860700001)(70586007)(70206006)(6506007)(336012)(508600001)(2616005)(53546011)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:53:01.6164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e1d204-5a9a-489a-b715-08d98cc6d2b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2655

Hi Jan,

> On 11 Oct 2021, at 15:10, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 11.10.2021 15:34, Bertrand Marquis wrote:
>>> On 11 Oct 2021, at 14:09, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 11.10.2021 14:41, Bertrand Marquis wrote:
>>>>> On 7 Oct 2021, at 14:43, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 06.10.2021 19:40, Rahul Singh wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/xen/arch/arm/vpci.c
>>>>>> @@ -0,0 +1,102 @@
>>>>>> +/*
>>>>>> + * xen/arch/arm/vpci.c
>>>>>> + *
>>>>>> + * This program is free software; you can redistribute it and/or mo=
dify
>>>>>> + * it under the terms of the GNU General Public License as publishe=
d by
>>>>>> + * the Free Software Foundation; either version 2 of the License, o=
r
>>>>>> + * (at your option) any later version.
>>>>>> + *
>>>>>> + * This program is distributed in the hope that it will be useful,
>>>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>>> + * GNU General Public License for more details.
>>>>>> + */
>>>>>> +#include <xen/sched.h>
>>>>>> +
>>>>>> +#include <asm/mmio.h>
>>>>>> +
>>>>>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>>>>>=20
>>>>> Nit: Stray blank (like you had in an earlier version for MMCFG_BDF())=
.
>>>>> Also isn't this effectively part of the public interface (along with
>>>>> MMCFG_BDF()), alongside GUEST_VPCI_ECAM_{BASE,SIZE}?
>>>>=20
>>>> I will move that in the next version to xen/pci.h and rename itMMCFG_R=
EG_OFFSET.
>>>> Would that be ok ?
>>>=20
>>> That would be okay and make sense when put next to MMCFG_BDF(), but
>>> it would not address my comment: That still wouldn't be the public
>>> interface. Otoh you only mimic hardware behavior, so perhaps the
>>> splitting of the address isn't as relevant to put there as would be
>>> GUEST_VPCI_ECAM_{BASE,SIZE}.
>>=20
>> Ok now I get what you wanted.
>>=20
>> You would actually like both MMCFG_BDF and MMCFG_REG_OFFSET to
>> be moved to arch-arm.h.
>>=20
>> Then I am not quite sure to follow why.
>> Those are not macros coming out of a way we have to define this but from
>> how it works in standard PCI.
>> The base and size are needed to know where the PCI bus will be.
>>=20
>> So why should those be needed in public headers ?
>=20
> Well, see my "Otoh ..." in the earlier reply. Keeping the two
> address splitting macros out of there is okay.

Ok.

>=20
>>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>>> @@ -766,6 +766,24 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>>>   else
>>>>>>       iommu_enable_device(pdev);
>>>>>=20
>>>>> Please note the context above; ...
>>>>>=20
>>>>>> +#ifdef CONFIG_ARM
>>>>>> +    /*
>>>>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci =
handler when
>>>>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>>>>> +     */
>>>>>> +    ret =3D vpci_add_handlers(pdev);
>>>>>> +    if ( ret )
>>>>>> +    {
>>>>>> +        printk(XENLOG_ERR "setup of vPCI failed: %d\n", ret);
>>>>>> +        pci_cleanup_msi(pdev);
>>>>>> +        ret =3D iommu_remove_device(pdev);
>>>>>> +        if ( pdev->domain )
>>>>>> +            list_del(&pdev->domain_list);
>>>>>> +        free_pdev(pseg, pdev);
>>>>>=20
>>>>> ... you unconditionally undo the if() part of the earlier conditional=
;
>>>>> is there any guarantee that the other path can't ever be taken, now
>>>>> and forever? If it can't be taken now (which I think is the case as
>>>>> long as Dom0 wouldn't report the same device twice), then at least so=
me
>>>>> precaution wants taking. Maybe moving your addition into that if()
>>>>> could be an option.
>>>>>=20
>>>>> Furthermore I continue to wonder whether this ordering is indeed
>>>>> preferable over doing software setup before hardware arrangements. Th=
is
>>>>> would address the above issue as well as long as vpci_add_handlers() =
is
>>>>> idempotent. And it would likely simplify error cleanup.
>>>>=20
>>>> I agree with you so I will move this code block before iommu part.
>>>>=20
>>>> But digging deeper into this, I would have 2 questions:
>>>>=20
>>>> - msi_cleanup was done there after a request from Stefano, but is not
>>>> done in case or iommu error, is there an issue to solve here ?
>>>=20
>>> Maybe, but I'm not sure. This very much depends on what a domain
>>> could in principle do with a partly set-up device. Plus let's
>>> not forget that we're talking of only Dom0 here (for now at least,
>>> i.e. not considering the dom0less case).
>>>=20
>>> But I'd also like to further defer to Stefano.
>>=20
>> Ok, I must admit I do not really see at that stage why doing an MSI clea=
nup
>> could be needed so I will wait for Stefano to know if I need to keep thi=
s when
>> moving the block up (at the end it is theoretical right now as this is e=
mpty).
>>=20
>>>=20
>>>> Same could also go for the free_pdev ?
>>>=20
>>> I think it's wrong to free_pdev() here. We want to internally keep
>>> record of the device, even if the device ends up unusable. The only
>>> place where free_pdev() ought to be called is imo pci_remove_device().
>>=20
>> Ok.
>>=20
>>>=20
>>>> - cleanup code was exactly the same as pci_remove_device code.
>>>> Should the question about the path also be checked there ?
>>>=20
>>> I'm sorry, but I'm afraid I don't see what "the path" refers to
>>> here. You can't mean the conditional in pci_add_device() selecting
>>> between iommu_add_device() and iommu_enable_device(), as "remove"
>>> can only mean "remove", never "disable".
>>=20
>> I will try to explain: when we just enable we do not add an entry in the=
 list but
>> we still remove an entry from the list every time (as the condition beco=
mes
>> always true because pdev->domain is at the end always set)
>=20
> Well, that anomaly is what I did point out in my review remarks to
> Rahul. We shouldn't remove an entry from the list if we didn't add
> one. But quite likely, if we don't free the pdev, we shouldn't be
> removing the list entry in either case.

This problem will not exist anymore when I will move the code up but I will=
 add to adapt the error case in iommu to also remove the vpci handlers.
To be coherent I will do the same in the pci_remove_device code.

I will do all those in the v6 of the serie.

Thanks a lot for the answers.

Cheers
Bertrand

>=20
> Jan
>=20


