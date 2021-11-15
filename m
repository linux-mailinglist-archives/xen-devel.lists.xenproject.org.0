Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B462450263
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:24:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225749.389903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZ9n-0008Sr-B5; Mon, 15 Nov 2021 10:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225749.389903; Mon, 15 Nov 2021 10:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZ9n-0008QJ-6L; Mon, 15 Nov 2021 10:24:11 +0000
Received: by outflank-mailman (input) for mailman id 225749;
 Mon, 15 Nov 2021 10:24:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z40d=QC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mmZ9l-0008QD-9R
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:24:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a7b89ae-45fe-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 11:24:08 +0100 (CET)
Received: from AM7PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:110::29)
 by DB8PR08MB4956.eurprd08.prod.outlook.com (2603:10a6:10:e0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 10:24:06 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::15) by AM7PR04CA0019.outlook.office365.com
 (2603:10a6:20b:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Mon, 15 Nov 2021 10:24:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Mon, 15 Nov 2021 10:24:05 +0000
Received: ("Tessian outbound 9292a5a778a6:v109");
 Mon, 15 Nov 2021 10:24:04 +0000
Received: from b4dc7ab40c1a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7A10F89-4733-44C0-A580-798BE74C17EC.1; 
 Mon, 15 Nov 2021 10:23:48 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4dc7ab40c1a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Nov 2021 10:23:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5462.eurprd08.prod.outlook.com (2603:10a6:20b:10b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.22; Mon, 15 Nov
 2021 10:23:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:23:47 +0000
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
X-Inumbo-ID: 2a7b89ae-45fe-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg7zFFlTSh9cfxBzNVu6uYIAkzK7iko8jMNfsXGwjj0=;
 b=7I3pASq54eQGcfvCDta28f/FuxaC+DmTCpiNHTlmSd9LVeQK5ZH8pJWwzVaqodj6reIOJlq2wJExPJicUT23vLIQt19GI84aiNdlXs4IX7xiaquU2FsiWdJ4JSukJpr5eiOfcJ7ckkTkYyObs43hW+LYsFHc/tW9TWIa8FLeb28=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e88b308cbaa272de
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C46zhMWIPPlafbzkNmlgaS8PjAe1I6mP5YrtKlnh6/TUQqr1zcsG2kSzoRThhzNS7/YFa/FPnE+BBL8hDDZd63mIkpv/uOtn0YpGoDb+Vm2D6OmXVE2pb5ZGOL8vrCR6IzLfcXSK2zu68GfbOk8X86W3qsN2Y7WZWbeCMuxgBsOAz1bTSrsxmWtDNSdgDNSIjVvV6Z5yfeCj1GxOCPQlcAvxirC0zW5hCUYfIwyoC02xtESL9rA9u5/4RE1M6hqd/PRy/kwBTZ4HXd+j+TTGwloZPRYJZjr2MJwrXg7hjkSLxOemH6NdUJsgaZIsz604cr19ivTr+VTJjfUSJoOa4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wg7zFFlTSh9cfxBzNVu6uYIAkzK7iko8jMNfsXGwjj0=;
 b=AGyceUFtqTtDWysZqIHWtP2t9S3uopJYPAyN1CC2HODmJOGg5z/UgYFdj72jSSUbzmB0ZQ6bM1zyiOIKHzQTMvrRZPi3WBtn3EUDbnKSot+F1fwldzvK1t3OrGHoSFiR3GySqjXCUmrPP6t+UNF2e6GEId1Ep1AHeIyGZOCgzcLWUu3Wig7JrQUkFHD/NN6SC6KRn0KTlAgHZx5Rd0mz4Z3q3MzrTCJ++4BqtoOTMoESMTqyKzvYdOhm00Zkuv0HEd66o0Hr9TYDr7EeSgtj0lkyJjhmbFEZn2qAsH2k6vN8A5NpnUfTQVlhKoHIrZmlGHdoPmtHiTms1FfgUItEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg7zFFlTSh9cfxBzNVu6uYIAkzK7iko8jMNfsXGwjj0=;
 b=7I3pASq54eQGcfvCDta28f/FuxaC+DmTCpiNHTlmSd9LVeQK5ZH8pJWwzVaqodj6reIOJlq2wJExPJicUT23vLIQt19GI84aiNdlXs4IX7xiaquU2FsiWdJ4JSukJpr5eiOfcJ7ckkTkYyObs43hW+LYsFHc/tW9TWIa8FLeb28=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Thread-Topic: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Thread-Index: AQHX1yW51DCh4Kb6WkC+olJaqOqcEawEZHMAgAACF4CAAADoAA==
Date: Mon, 15 Nov 2021 10:23:47 +0000
Message-ID: <C3FB48C2-F619-48A2-9268-F0938405133C@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com>
 <a1b2aa1b-7d8a-4ab6-cde5-25581ee9841c@suse.com>
In-Reply-To: <a1b2aa1b-7d8a-4ab6-cde5-25581ee9841c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e1247a15-83ff-4bac-1979-08d9a8220d27
x-ms-traffictypediagnostic: AM7PR08MB5462:|DB8PR08MB4956:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4956B9F874DDD74A75BA0D7C9D989@DB8PR08MB4956.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xjYHN7xA9LTUn5Bsr0upnIwI9PrwM5dTiHkKlYHie610y7JjQoHp+6g6szHhHQyTEqIuQkYWcmkpf2PRUDLgtdea4C9zUOau56iCpFRi+mX5M/eTmdsmamPf7LJEWcOsw9u5MioP3m7J1voyXW10og2x+7I54xoVLYNeTdMCrwn3dxuBxkcsWOhn3tg2Iy4eqzhfGNLd5Y2v1+hC5Tq4kHNnRciz97fTgbKqdReZjdxM2JsCE6QgiszODC1xVCeKwoGAJNornAD23MAOEeqUYIVq0xF/3PvzUhpqSTsND3kg5wdOh/ac7vAh/QaWI8QFQ/v48tEqe6wHkQNOavpxUOAE8ovV/Hl3Z/arXfHdYvrT/b5qLYrY+CCQOVojdwP+LUP9iYdyhw0Q2iQbcG844Rroj4INCL0pIhRyneA7BM+GkUk45N+88lViaS0MGjnUQqh2xhAguiyjTdBg/yG6qJxv5xcHSthsPU0GOYqhasuF/y5Uwr3J4+DOZwRy9BPIEUPze7O1GcyZCkjAJoMgzMrJFPGMaMJtABL+ddrV2ak8BgGpP0B6TtrM8oYktJaKLhnXLcr8vdt4DujuYqQcd+jT6Eb+Yy2y4mcAA1Vw8sQ9aN5XRVCzZmZ/25L30m6Az95VogSOgrQaaaxuM7tFHf92s035F+Yyv2RULA5dOC2dfowsc1JwBoMtGcM32vkyl7yLHDqciic+IghfPpzM2UrsNI1iqc/2UX271pCh6slTGCmJg28n2CU0OF7npvTB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(6486002)(53546011)(2906002)(5660300002)(86362001)(54906003)(508600001)(38070700005)(33656002)(26005)(2616005)(36756003)(186003)(6512007)(71200400001)(38100700002)(122000001)(76116006)(91956017)(66476007)(8936002)(6916009)(66946007)(66446008)(64756008)(66556008)(8676002)(4326008)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FB132AA242A844489907BE13C13D13EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5462
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b47ab43a-08b7-4463-ed4e-08d9a8220277
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o6JFawRgqU28jiKcCFgI7eu8Hka9aAsKd7DDnvF94pyI5GIZhZXxaBcqY6JMIZEzoJETUTzvN6+fiEKi4EHlIRAUVXWjT30oxckBJBy5NB/ZDhPNbYOR2Q715/LyMcs2DZWzTmQmVQ+hKmrXMOMaOxsKjADHtJXfo7cpY/sfDez01MuDOWj7hkpteIJfBGYYvA2y4xwnfQB/jf/uhiE9bKJf2OibLjjyS/As19c/VK6SUNoGrtIGvHkoERqE2B3kpO1yR3cmXhg/0W9+zAE7SC6WSDlBO4ZqutQ1JEhz3Pogi2kvDvLXgNDM+CMAvZjT1nz/neJJbC0iYP1aaceaf8/FaYQlHcDOafCN2x/wGJn0iVZKyGY5FHWDOUMLdfmDOnmA1V9k60aV2HACB4Z9Kqb6N2qGScBZVtRSTUaTsg3GlPYDoj5AC3OSYYJHaT8G6iWJ6uhONalGEWL3jWZERl9O/JKU/rXB2aapFLZH7RJTIII/9dlGfhBuYfy28/SDtXC9PT+YYA/5WGT/39ksEauvDWqoOykCo9NOI9omAp2e3+8i5Ws2qM+Cm05csHbNGcxfGrOj2fBYI/f084aTID054RPiXlcJk89HVBqE4VxaZKLac9HuBCFggDPfJYcuSoKZhBqcI+JIRxQKYpWvmREtXCStEfgxEzCmsoV3WwpzAw+IlysGKQy/igx/x/S0ty8Uyt2FDrbMwxWxe2XXxg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6486002)(356005)(2616005)(6862004)(8676002)(107886003)(336012)(8936002)(186003)(81166007)(26005)(47076005)(508600001)(53546011)(86362001)(316002)(6512007)(36860700001)(6506007)(2906002)(82310400003)(70586007)(33656002)(70206006)(5660300002)(36756003)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:24:05.2126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1247a15-83ff-4bac-1979-08d9a8220d27
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4956

Hi Jan,

> On 15 Nov 2021, at 10:20, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 15.11.2021 11:13, Bertrand Marquis wrote:
>>> On 11 Nov 2021, at 17:57, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1234,15 +1234,18 @@ int vcpu_unpause_by_systemcontroller(struct vcp=
u *v)
>>>    return 0;
>>> }
>>>=20
>>> -static void do_domain_pause(struct domain *d,
>>> -                            void (*sleep_fn)(struct vcpu *v))
>>> +static void _domain_pause(struct domain *d, bool sync /* or nosync */)
>>=20
>> Here you use comments inside the function definition.
>> I think this is something that should be avoided and in this specific ca=
se a
>> boolean sync is clear enough not to need to explain that false is nosing=
.
>=20
> While I agree the comment here isn't overly useful, I think ...
>=20
>>> @@ -1250,12 +1253,12 @@ static void do_domain_pause(struct domain *d,
>>> void domain_pause(struct domain *d)
>>> {
>>>    ASSERT(d !=3D current->domain);
>>> -    do_domain_pause(d, vcpu_sleep_sync);
>>> +    _domain_pause(d, true /* sync */);
>> Same here.
>=20
> ... comments like this one are pretty useful to disambiguate the plain
> "true" or "false" (without the reader needing to go look at the function
> declaration or definition).

I agree with that but the comment here is useful, it could be added before
the call instead of inside it.

Bertrand

>=20
> Jan
>=20


