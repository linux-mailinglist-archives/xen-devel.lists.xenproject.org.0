Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147EA87BFAE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 16:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693318.1081240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkmld-0007HJ-1w; Thu, 14 Mar 2024 15:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693318.1081240; Thu, 14 Mar 2024 15:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkmlc-0007Ej-V4; Thu, 14 Mar 2024 15:13:12 +0000
Received: by outflank-mailman (input) for mailman id 693318;
 Thu, 14 Mar 2024 15:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8w/W=KU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rkmlb-0007D6-9Q
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 15:13:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d768fdb-e215-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 16:13:08 +0100 (CET)
Received: from DU6P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::28)
 by DB3PR08MB9898.eurprd08.prod.outlook.com (2603:10a6:10:434::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 15:13:00 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::a1) by DU6P191CA0017.outlook.office365.com
 (2603:10a6:10:540::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Thu, 14 Mar 2024 15:13:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 15:12:59 +0000
Received: ("Tessian outbound 5180408f3322:v276");
 Thu, 14 Mar 2024 15:12:59 +0000
Received: from fe822e5a61bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 335EC9A3-6871-40C4-9CF0-C925D1683FFB.1; 
 Thu, 14 Mar 2024 15:12:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe822e5a61bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Mar 2024 15:12:52 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS4PR08MB7477.eurprd08.prod.outlook.com (2603:10a6:20b:4e4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Thu, 14 Mar
 2024 15:12:49 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7386.020; Thu, 14 Mar 2024
 15:12:49 +0000
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
X-Inumbo-ID: 5d768fdb-e215-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AsgHN+U5n0+iQdKHkRihwnp2lOQRamQ8cvU783PlTGsMsbu+XUjH3N1GDGfs5PjNNT1pmOTInhNajGf+LEctTiz3oLFOsdsVlONpXJWeJS0HyfJL9wbAP8ykjsWzF4MwKLoxJlDh5PlWJzvJdgrFQVJ0QaYID/yFw83kGQoF06ZwngTxZSMUjW+gmUfozJjPmsQZDs9ercAGF6EVeV8OYoaFLf98ihZYPk/q1JxfcQgAM/4Vj+NmM4OTcCay2gYaXe4v7J7hIEC5zBojTous8h3L+SFebtPxp3Ue9q26k01mmhbmfn1rGo0rG+FRCucM308plALxIQkbIPgn8m+ARA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4F9q04AcUhjcEca3Qf+BmiZXzSicBAcKJFgph0eUFQ=;
 b=l2uuFi/KwewOUZ/KczJcA0ZjKNt+tQUUthfb42qEeaVoKDYb+mUn8qB9pOaaD5+csYn1rsa1yMYF24NdNSXjbRpeSNxGz42UuG4ZBDvQMfhkk1XdEXGqGCkAEw0QV8GhbjwA4/la7MaTrIUkkXwcjHmAMeGifbB7wuL4i3gHerl2MGd+l43So6fELqdmEQLQvIp1Yfk4VV1Kiqj1zz6P6tz/nYupmoyi44nc8IHi1fClvGfVMV8lXQuPV2WglDx/UVMAXGtx/Fena20wFKSVb70lIYg1CwMEsWR/U2AxHQrfPMGrU65w8zhNHLUrwTejpnpUtvQuxvYN/V/6fZxUlw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4F9q04AcUhjcEca3Qf+BmiZXzSicBAcKJFgph0eUFQ=;
 b=H1soPOPONDV7Zd8SupyzgYNCnAlR8siUqwbS0Admkyf6Q2N08wG8oUR6xgJ+lV/wtsEIQzMsE4FZWu26ho2HK/dOTIzPzzGX2sYZHvjfdXcLQ9j7YLvxFKKsOqRCMh+lgidKAkvWE+qbNlrnc9Rcsd9ArIUEY+X8rxR6dqlc+U8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e365bc79c29dd4b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=id6WeEzTVUbBnd5E2SQ7T4tP1fh3rX7K3MZ/uO5kNYoDwL9IMP289d5xB13umbpOuyqS7uFLMGnN+JbfhWGmvrPtnDD4B7Oylwzg0qm/pUBt5JNsP084YYBCH7kKHQ+AryylID0SKNngPit4d5KY7cSQlaNneoAyXs17VcyCKtDLzN8aHsWDQynLB9mG+ajoFXIhBXLa5d1Nu6DPwP6TE7toKGdYu0dwhO8XeH7RCjkhznrViUSJ6+gC7tj+QA3J0+VcAnG1xUEvdERyDgcM/GSAWtkqTr/iJu3Fy3kN5rhU1paO7GZRN8uzb8X1qtDSZ0BUI94o+GdBUGQY4140VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4F9q04AcUhjcEca3Qf+BmiZXzSicBAcKJFgph0eUFQ=;
 b=WKNAp9/z6DF2RK84byZW9Fk0HBncgSzryf3DL5Q/2X8hcScgVPKhrATbgIXacOKKSlx0XCfxnQ5iVnpAK2X+2mRSwSpLf/BAL25WHNOLi+vPXRie8jCiRpdCAlCOO04pygNHft1DeJSamii+dkpOU0geSP7cDuIwoWf2wIyNBOq7zWOR9Njm683TW882VJEnaYx/C4M+wcmUhVeePEYtZ+Xn8TeLZ+0PW9oe9uJPLCx2lvfbac+E+pmEA++CN9qc67cBqR98/E7XG14a6BCNaJu4bw8Nl0QdyR4mCo2ScNcCT/JzOJMqJuKWb5FzI+YE+joNU6zoNpZTdrEP41jHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4F9q04AcUhjcEca3Qf+BmiZXzSicBAcKJFgph0eUFQ=;
 b=H1soPOPONDV7Zd8SupyzgYNCnAlR8siUqwbS0Admkyf6Q2N08wG8oUR6xgJ+lV/wtsEIQzMsE4FZWu26ho2HK/dOTIzPzzGX2sYZHvjfdXcLQ9j7YLvxFKKsOqRCMh+lgidKAkvWE+qbNlrnc9Rcsd9ArIUEY+X8rxR6dqlc+U8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] docs/misra: add Rule 16.4
Thread-Topic: [PATCH] docs/misra: add Rule 16.4
Thread-Index: AQHadN1oSVYbGKIFE0GfGxIx2bdb6LE1S9QAgAEAKICAAQ5kgA==
Date: Thu, 14 Mar 2024 15:12:49 +0000
Message-ID: <EB5C4283-DEB1-4D58-86C0-6885713E44F4@arm.com>
References:
 <alpine.DEB.2.22.394.2403121725370.853156@ubuntu-linux-20-04-desktop>
 <136e4667-8c6d-45ec-b652-b6b690a16f34@suse.com>
 <alpine.DEB.2.22.394.2403131554100.853156@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2403131554100.853156@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS4PR08MB7477:EE_|DB5PEPF00014B97:EE_|DB3PR08MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 3576ed36-4648-4661-a4a4-08dc44393c58
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PIkNpgt8/osUNpUCvZKZnLV8XWAKGfdeBG1qQaq0M2zqTQvvSAh4JdYk9GYOtX0FRLnlnMXjoWPfCAy2vt/WkAyiDZg0v14fM49M3YqbzTZ/0hYoMz48tluQTci7GsEPAwqCv1lM9eR42TchSllmJXN+YwreRMXxajf7GpKrEsVCYSNVPURBiGsMFkCsBfU3muLVn+9FD4o0ti17cG3BUrKEJBWnzsVXWh0eBpWjduO1ph/oDW2J87wC7lGkUUUHNdcOM0n+/tf9+z0q9eOYBGlCCszLaiL5U5HvSNbbdyUZmAztECT0/3lskTEayd312VFI0OGBcnXc3VbK1p2K8YluaotczMuPgp4vZs92SBygrPEDEIRgudm+j+/RYxgfBzM7WgFdKRVQOjShALxZnn3DSh3zX6ax4hwj897/q9b/LJ3qpCyMEynWQl/2FISF7/majIwTcsmGiV2QkYAEWNBURbUg4v7uX6FZnH86yKAANOHYoJN0b5kLnQArBD1dhMqlowvHMLzRIKvKCc7+SpwpBu6focG30vpenaklWTS7uRJ7l670UO5wa0kuR7y2IQq6b8naTonfAE0r9HeaOn572OfcBC8Dwn3abJddvy9YhuiM7F5yS52xrqd8NJSuiPdvEbqMFKsmQamabRvB+GeHpZP8uT5W7oisRrzmiBs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9FD390162A57F34B87C65D199B3F6155@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7477
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e59f6bb7-ff78-4478-b453-08dc4439368f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/gVraXxA58yK+dV2JZiaCdc/uFycTHUgvDJXTl/zi2tA7H33LOVJgDrmc4KirBCMidQ5smi0+83DGZYJAoJxJywrhtbRtIGXzboq9LiN//LS6EoU+MNkFlX4follb1KsePdJmUtrOiR3fmeC+/qyWyDF3ZcdFmKzh1B3OmxuFKOcVWR9qQlvaa8WUHRFZSFiwNMsJU4qIMYUEhz2l3hpm0tAg11DtKqrnz8XKTeSRbHx8E4xplJnQEJaS5+XTAHNz+BXYlr4qg0+glgdp3iNQYVm8jBln6Jxbz5afU7u1DgRtdCfAaJrLIvyBf7WVbltw2zGoAky+ocqQPrzkAh81COTiRbX5dpHh17rbsHF1ah1WaMsmMpVFOLRoDYoHsnXWfPxsVOOvJcEODtfvxDGWPiVz7N8K/ISP7Llz8ncyTHwU5c/M7Fe2l997ctRgZe4wltMAEPxCLVDsnKT2hZcnYw6P28qktUq0+zNWaEq8MhXkXitWWBPjnHppDs9immRQg46PhowZtJKCynr2VVWKkuVPoiwYXL4KLAt9bg97ZqGTLnc4eq2qPlNyjtQ/DM1bjQJE452Jr8Ny5KzEsNvrCPq933gc4UO4+BHfb+qwpDMmn4BDfSL6TcLvTvhba97OUiS0pqXSkntNUoRnmqbeHFCT+ppDd56399Qp+zlllkh6E2E4/UnVxkIP4CTkAekIC+ksrWYWdIepBllaQwp2g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 15:12:59.6034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3576ed36-4648-4661-a4a4-08dc44393c58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9898

Hi Stefano,

> On 14 Mar 2024, at 00:04, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 13 Mar 2024, Jan Beulich wrote:
>> On 13.03.2024 01:28, Stefano Stabellini wrote:
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -478,6 +478,30 @@ maintainers if you want to suggest a change.
>>>      - In addition to break, also other unconditional flow control stat=
ements
>>>        such as continue, return, goto are allowed.
>>>=20
>>> +   * - `Rule 16.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Examp=
le-Suite/-/blob/master/R_16_04.c>`_
>>> +     - Required
>>> +     - Every switch statement shall have a default label
>>> +     - Switch statements with enums as controlling expression don't ne=
ed
>>> +       a default label as gcc -Wall enables -Wswitch which warns (and
>>> +       breaks the build)
>>=20
>> I think this could do with mentioning -Werror.
>=20
> No problem
>=20
>=20
>>> if one of the enum labels is missing from the
>>> +       switch.
>>> +
>>> +       Switch statements with integer types as controlling expression
>>> +       should have a default label:
>>> +
>>> +       - if the switch is expected to handle all possible cases
>>> +         explicitly, then a default label shall be added to handle
>>> +         unexpected error conditions, using BUG(), ASSERT(), WARN(),
>>> +         domain_crash(), or other appropriate methods;
>>> +
>>> +       - if the switch is expected to handle a subset of all
>>> +         possible cases, then a default label shall be added with an
>>> +         in-code comment as follows::
>>> +
>>> +             /* only handle a subset of the possible cases */
>>> +             default:
>>> +                 break;
>>=20
>> Unless it being made crystal clear that mechanically reproducing this
>> comment isn't going to do, I'm going to have a hard time picking
>> between actively vetoing or just accepting if someone else acks this.
>> At the very least, though, the suggested (or, as requested, example)
>> comment should match ./CODING_STYLE. And it may need placing
>> differently if I understood correctly what Misra / Eclair demand
>> (between default: and break; rather than ahead of both).
>>=20
>> The only place I'd accept a pre-cooked comment is to cover the
>> "notifier pattern".
>=20
> Hi Jan,=20
>=20
> During the MISRA C call we discussed two distinct situations:
>=20
> 1) when the default is not supposed to happen (it could be an BUG_ON)
> 2) when we only handle a subset of cases on purpose
>=20
> For 2), it is useful to have a comment to clarify that we are dealing
> with 2) instead of 1). It is not a pre-cooked comment. The comment
> should be reviewed and checked that it is actually true that for this
> specific switch the default is expected and we should do nothing.
>=20
> However, the comment is indeed pre-cooked in the sense that we don't
> need to have several different variations of them to explain why we only
> handle a subset of cases.
>=20
> The majority of people on the call agreed with this (or so I understood).

In fact i do agree with Jan here somehow: we must not have a default commen=
t
in the rules.rst.
It might be that a comment will look like that but I think it would be a mi=
stake to
have a default one that people can just copy and paste without thinking.
I would suggest to put something like the following instead:
When a default is empty, a comment shall be added to state it with a reason
and when possible a more detailed explanation.

Regards
Bertrand




