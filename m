Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E201A428D3D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 14:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205956.361397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZucq-0001GM-Rj; Mon, 11 Oct 2021 12:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205956.361397; Mon, 11 Oct 2021 12:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZucq-0001EF-OP; Mon, 11 Oct 2021 12:41:52 +0000
Received: by outflank-mailman (input) for mailman id 205956;
 Mon, 11 Oct 2021 12:41:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZucp-0001E5-Do
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 12:41:51 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d82b6682-108f-4515-8de6-3dda174a9594;
 Mon, 11 Oct 2021 12:41:48 +0000 (UTC)
Received: from AS8PR04CA0161.eurprd04.prod.outlook.com (2603:10a6:20b:331::16)
 by VI1PR0801MB1663.eurprd08.prod.outlook.com (2603:10a6:800:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 12:41:45 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::4b) by AS8PR04CA0161.outlook.office365.com
 (2603:10a6:20b:331::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 12:41:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 12:41:44 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Mon, 11 Oct 2021 12:41:44 +0000
Received: from 8e8e42cdf8af.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E2B90D5-46DC-4EC3-B908-9D17522E5BC7.1; 
 Mon, 11 Oct 2021 12:41:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e8e42cdf8af.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 12:41:33 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 12:41:30 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:41:30 +0000
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
X-Inumbo-ID: d82b6682-108f-4515-8de6-3dda174a9594
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pas7wanzOWdLkJJRO2bX6dTrl+auxLuxjm9/mAWY2AI=;
 b=yqCc+gh+pGkhJSG0wrbJp9Ce8TzrM8FUYG4Nq4C5z8T/Axm97dBCems8n6Z/gwX2ouHnLVreVM5A39Ei5Q2CJom7t5LNCEnspDsXe2Ua4yRCSU/cqtLycO7/ntsRmYbxmSN2wvckGAeI9E7EmKohyj5vb1EVeMQvcWwHtLSwQRE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3ac9554b71b5cb3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHxNgy42B1TRja1J8CqhXOhXpBmtpf/x3AaFgxIqX0ASuP3rPSfl4gU4AbonuZ07hil0xMSxm6k5SLGMbKexLYnZjZJ7k1j1uNJA4JNk9aETmRjkSJQxrutbdJwYnwmP4pL+rlWAQMqUWHb4Ok+aXzNfTIto/hPgHlxi8GtJRcQkTtU0OoOBCE3Km1srvUUN/Jmo1iPM5pv6xgPP/C1L5UyEA1WOqDaJTtmpsS9ovzhJhXBRwXWb3+38O8hj3FX+MunQsz5oD/VTme9irLi+oiwBkywV3QKG+D9XnKD+U16J2gvxKx4V54CPzOLFzSEw+J6esoF5w4SbA0/moXmZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pas7wanzOWdLkJJRO2bX6dTrl+auxLuxjm9/mAWY2AI=;
 b=ix39XUzENaU5HRTdOX6Rjcch+64ScgzvaxlcooGBUrT7Tf2bNLLb/FEUCvHg1jvJsDzSeR6IEFKi/Qu+2adZ7EaxTCwlzcaqxlV7BIEzN+/0AaecvoRoiJTFQSvy4I1Akpi5yXEOHoi95lVmqoiMzsHJ6Jo6s3s+x8ra0qtw5Q2abDeiMGuSfiVz46xkO7p4/elW6e4/Heta8o/suP4ihootU7jq9mKkbwZ7UPRqcSa8sCpSWpD4rdV81KqHh8H+Zbf+FztIzrD3zYlDsDfpWOJPWyk9EV12mE5OQ+JJ8lkg45VxcaGAhkHV3cgaLW41i6aVAPilUwnTRAswoVMJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pas7wanzOWdLkJJRO2bX6dTrl+auxLuxjm9/mAWY2AI=;
 b=yqCc+gh+pGkhJSG0wrbJp9Ce8TzrM8FUYG4Nq4C5z8T/Axm97dBCems8n6Z/gwX2ouHnLVreVM5A39Ei5Q2CJom7t5LNCEnspDsXe2Ua4yRCSU/cqtLycO7/ntsRmYbxmSN2wvckGAeI9E7EmKohyj5vb1EVeMQvcWwHtLSwQRE=
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
Thread-Index: AQHXutl3YqS5dHXsYk6KpdKt4d14RavHjPqAgAY38oA=
Date: Mon, 11 Oct 2021 12:41:30 +0000
Message-ID: <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
In-Reply-To: <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0ce31bb4-4051-4f92-c37b-08d98cb47ba2
x-ms-traffictypediagnostic: DBAPR08MB5832:|VI1PR0801MB1663:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1663E3967D6BC8A85975DFE39DB59@VI1PR0801MB1663.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3aYRDzxnAvBX5LK31VO2yTHR9OjvfXxqGsOXx8qc52Ujd7uVKjl/eR4HVbJ1OvtFI3tJg4CyU/vVZuwP0pWDp4FD4f71+h2DXHnAMHNqolAxopUp8nA+BvfSWb6eSDolrLDSqNHDB4Q5yGroK70gmJ4wmPzxCgTTORxIAMpw+biTx97CFUZ6cECtvkucX3jeHS/q+Cfus9Q81wOl7E4XmEa4sRXG3AVMJ7V5zOYX+1rGndnNEfW41pQ1mqr3XecilA5LlZ6jAYgsuvHi2/Oy3j4YBqTFJEEQ9YqlrhgrO4kysdPaiB1SxkSNtmcazJ21DL7cyh5kbjT+uTWu0ewUjlUiOFMMa9PsYTkoRWxzLIJ0D5W19h8DvwRGtJAlm4SanydK4ziEZ7g1weBnJptUbpuRtZeIjdv0v90ewFuP0StgEm8N2yV6cmkeXHBR4T6WlanffrEA79TDKA+9i19NwEkT0/QRfrG+wXzrA+lmMVn9OuV7ih3dtq7bC5dhrsUlOwylK5dbVoNJQMw/X3M/CNpxql2n08EBJPU9rZYN/jiPwkzDP1jiB8rmmzWbS6P7brp2DIh2YBPZfSv+Txjz6QHr2/RbImFjt8wo6UI44H9gpww/Xq3GyAltSq/T0GPZBXX6z60cAa021zDpMsso9RMjD7ZzYlfB5YKVf65Lu1hY9bpiSiFbItc7hMIH+9JWmuewIbq2S0NBpj7ezU9WYkRVpjMy6lyW3yfAP/FRZBYKXkmh2RqhQOCEXjzkjtGTbR+Xrp9SJzUaBgUZwiHWMQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(66446008)(91956017)(64756008)(38100700002)(316002)(508600001)(4326008)(66556008)(66476007)(66946007)(122000001)(53546011)(6506007)(2906002)(186003)(7416002)(38070700005)(26005)(83380400001)(6916009)(5660300002)(36756003)(8936002)(71200400001)(2616005)(8676002)(86362001)(6486002)(6512007)(54906003)(33656002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FD5E6E889E2A7548942C2A042BB89A9F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fc49a065-6f41-4f76-b60f-08d98cb47343
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WDDeGKjDaUv7oWxup+NEW+sYBSJSqtey1MCyvHRtcaJVasb3IuFGoixWyEOGGCikqAhvz+C6Iz6eTJe/kLe0fU+vFCu3SYAYyWF/7g7A1gWheq6GVZZz+YQEU55hzFHRmQeKeqdVjISOR5IvD6U3sxdYmc6jcF3gnPNXfkKY6txJJaFQpUj9KY2D3wkxodbJqr1yXgu7vAAet4o6t5NdZlDZyZoj+e/fo2NzvaWlUSQw+OspGmafIk1Y1ghsuRv8si7ekJlFWoFmzL5v0TRPUPhDE94/iM3F5mIScgv+mRhv8kITAn2J6NH4GpUuA/uTPkn0mArNiWnaCtNcZ21oAqlIVDw7KYMNsAi/pX5Qd/tczXSs4vRaOArXF9za+m1UyZgvvpA9qiEVpLuTRA3ALNKIVOA6uI7ubXJCGItZd5LD8FlQBsMxmUYxs9StAU16N8Fwg/IfEub91rSci6IfU5BymHvyWVxYmslY6L8NsadjISAjtF3F5wK9nV493z0AmzWex/VLdKx1mdiyHr6cOAC5uEHrMQTI3POD1+0Q4THGb9sPsOA2AqQ2AMbrtt1SOrJmOpfMR1k0QwGo96XkGpDMNPfSbR5wDvrzD5FL7+8MeCQoatkaGaaQarsOfdH/sYHbSKuNOZU0xmkuWA9dItAJiVuMrDHoXm+oI4SrKPe2uJCXQVdrWFjAuZTFN+QYdSqCfuWjtSa+Pj9AT52DuOh8pZAIiB0v5pcgAbjOH8M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(8936002)(2906002)(47076005)(82310400003)(6512007)(33656002)(36756003)(316002)(6506007)(54906003)(86362001)(81166007)(336012)(53546011)(26005)(508600001)(6486002)(36860700001)(8676002)(5660300002)(2616005)(70586007)(83380400001)(356005)(70206006)(186003)(6862004)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 12:41:44.5203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce31bb4-4051-4f92-c37b-08d98cb47ba2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1663

Hi Jan,

As Rahul is on leave, I will answer you and make the changes needed.

> On 7 Oct 2021, at 14:43, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 06.10.2021 19:40, Rahul Singh wrote:
>> --- /dev/null
>> +++ b/xen/arch/arm/vpci.c
>> @@ -0,0 +1,102 @@
>> +/*
>> + * xen/arch/arm/vpci.c
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +#include <xen/sched.h>
>> +
>> +#include <asm/mmio.h>
>> +
>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>=20
> Nit: Stray blank (like you had in an earlier version for MMCFG_BDF()).
> Also isn't this effectively part of the public interface (along with
> MMCFG_BDF()), alongside GUEST_VPCI_ECAM_{BASE,SIZE}?

I will move that in the next version to xen/pci.h and rename it MMCFG_REG_O=
FFSET.
Would that be ok ?

>=20
>> +/* Do some sanity checks. */
>> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len=
)
>> +{
>> +    /* Check access size. */
>> +    if ( len > 8 )
>> +        return false;
>=20
> struct hsr_dabt's size field doesn't allow len to be above 8. I could
> see that you may want to sanity check things, but that's not helpful
> if done incompletely. Elsewhere you assume the value to be non-zero,
> and ...
>=20
>> +    /* Check that access is size aligned. */
>> +    if ( (reg & (len - 1)) )
>=20
> ... right here you assume the value to be a power of 2. While I'm not
> a maintainer, I'd still like to suggest consistency: Do all pertinent
> checks or none of them (relying on the caller).

I will remove the check for len > 8 as dabt.size cannot have a value
greater than 3.

But I will have to introduce a check for len > 4 on 32 bit systems (see aft=
er).

>=20
> Independent of this - is bare metal Arm enforcing this same
> alignment restriction (unconditionally)? Iirc on x86 we felt we'd
> better synthesize misaligned accesses.

Unaligned IO access could be synthesise also on arm to but I would
rather not make such a change now without testing it (and there is
also a question of it making sense).

So if it is ok with you I will keep that check and discuss it with Rahul
when he is back. I will add a comment in the code to make that clear.

>=20
>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>> +                          register_t *r, void *p)
>> +{
>> +    unsigned int reg;
>> +    pci_sbdf_t sbdf;
>> +    unsigned long data =3D ~0UL;
>=20
> What use is this initializer? The error path further down doesn't
> forward the value into *r, and subsequently the value gets fully
> overwritten.

Right I will remove it.

>=20
>> +    unsigned int size =3D 1U << info->dabt.size;
>> +
>> +    sbdf.sbdf =3D MMCFG_BDF(info->gpa);
>=20
> This implies segment to be zero. While probably fine for now, I
> wonder if this wouldn't warrant a comment.

I will add the following comment just before:
/* We ignore segment part and always handle segment 0 */

>=20
>> +    reg =3D REGISTER_OFFSET(info->gpa);
>> +
>> +    if ( !vpci_mmio_access_allowed(reg, size) )
>> +        return 0;
>> +
>> +    data =3D vpci_read(sbdf, reg, min(4u, size));
>> +    if ( size =3D=3D 8 )
>> +        data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>=20
> Throughout this series I haven't been able to spot where the HAS_VPCI
> Kconfig symbol would get selected. Hence I cannot tell whether all of
> this is Arm64-specific. Otherwise I wonder whether size 8 actually
> can occur on Arm32.

Dabt.size could be 3 even on ARM32 but we should not allow 64bit
access on mmio regions on arm32.

So I will surround this code with ifdef CONFIG_ARM_64 and add a test
for len > 4 to prevent this case on 32bit.

To be completely right we should disable this also for 32bit guests but
this change would be a bit more invasive.

>=20
>> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>> +                           register_t r, void *p)
>> +{
>> +    unsigned int reg;
>> +    pci_sbdf_t sbdf;
>> +    unsigned long data =3D r;
>=20
> A little like in the read function - what use is this local variable?
> Can't you use r directly?

We can and I will remove the data variable.

>=20
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -766,6 +766,24 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>     else
>>         iommu_enable_device(pdev);
>=20
> Please note the context above; ...
>=20
>> +#ifdef CONFIG_ARM
>> +    /*
>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci hand=
ler when
>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>> +     */
>> +    ret =3D vpci_add_handlers(pdev);
>> +    if ( ret )
>> +    {
>> +        printk(XENLOG_ERR "setup of vPCI failed: %d\n", ret);
>> +        pci_cleanup_msi(pdev);
>> +        ret =3D iommu_remove_device(pdev);
>> +        if ( pdev->domain )
>> +            list_del(&pdev->domain_list);
>> +        free_pdev(pseg, pdev);
>=20
> ... you unconditionally undo the if() part of the earlier conditional;
> is there any guarantee that the other path can't ever be taken, now
> and forever? If it can't be taken now (which I think is the case as
> long as Dom0 wouldn't report the same device twice), then at least some
> precaution wants taking. Maybe moving your addition into that if()
> could be an option.
>=20
> Furthermore I continue to wonder whether this ordering is indeed
> preferable over doing software setup before hardware arrangements. This
> would address the above issue as well as long as vpci_add_handlers() is
> idempotent. And it would likely simplify error cleanup.

I agree with you so I will move this code block before iommu part.

But digging deeper into this, I would have 2 questions:

- msi_cleanup was done there after a request from Stefano, but is not
done in case or iommu error, is there an issue to solve here ?
Same could also go for the free_pdev ?

- cleanup code was exactly the same as pci_remove_device code.
Should the question about the path also be checked there ?

Regards
Bertrand


>=20
> Jan
>=20
>=20


