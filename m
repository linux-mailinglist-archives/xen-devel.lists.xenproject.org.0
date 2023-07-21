Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1347E75C259
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 11:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567423.886448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMm2M-0001UU-Sj; Fri, 21 Jul 2023 09:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567423.886448; Fri, 21 Jul 2023 09:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMm2M-0001Ru-Pi; Fri, 21 Jul 2023 09:02:58 +0000
Received: by outflank-mailman (input) for mailman id 567423;
 Fri, 21 Jul 2023 09:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=So7w=DH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qMm2L-0001Ro-NP
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 09:02:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 613776e3-27a5-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 11:02:55 +0200 (CEST)
Received: from AM0PR04CA0143.eurprd04.prod.outlook.com (2603:10a6:208:55::48)
 by PA4PR08MB6000.eurprd08.prod.outlook.com (2603:10a6:102:ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 09:02:52 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:55:cafe::54) by AM0PR04CA0143.outlook.office365.com
 (2603:10a6:208:55::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 09:02:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.34 via Frontend Transport; Fri, 21 Jul 2023 09:02:52 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Fri, 21 Jul 2023 09:02:52 +0000
Received: from 7912ab30982e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4002C3EE-2F67-4AE8-BD1E-E7AF024CCD39.1; 
 Fri, 21 Jul 2023 09:02:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7912ab30982e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 09:02:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB8166.eurprd08.prod.outlook.com (2603:10a6:20b:58d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 09:02:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 09:02:42 +0000
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
X-Inumbo-ID: 613776e3-27a5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyCimDxyDREnBe55TyJyqlo4Ls8VeRuPawGlJiu3bBc=;
 b=Hzyug/iwwFr3C5X1MdTCl6Rb3AhRIVeX2JBCgIEmyDW1UTk0X4hE5OI+FwiyYJ6UXti6U5cZffb3jaJw/seP4uAv9wfLvv1HEj3VW18VNLbfkKBIDIpSWnY/nS6Oisg9d6FCPf/GQcrFgtnn+jWRE6Ex2vY65MxLqvW7L9wTCRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d19a790824a4b42
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E048ia2B7cRrF3kj67kW/ix7aR+pghBAUDsDzNx4bzZu5znFzZXrrbuUt46jL5jLHrWZdS2iLG/0toIfThy0nUqHYJdtJvWhfYcqMPKcjnBW4h/DkjDRZ8x8IoqSIT0O/2lA/xyYrxu0jBFodtPO2Rhql6LEF6Z8G8mkC9Mt6iKOxQ86zGSZuUWKAJ8/eoas4ju/nrUAEk09UMP6TckK19Z4jlhaeac/2Q0uSTHtwwQcauCvqwrS/FmXlujnlzi8yPopLFDG6YSQHz4FqPtDgL9QqxG8JkcTZiWSpKCcfLbqGlt5piN2t2WaAzkpAIbywivueArAOB8rmKex4FLIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyCimDxyDREnBe55TyJyqlo4Ls8VeRuPawGlJiu3bBc=;
 b=fM8o22dhgdnpTlu4vyfpBbrmu6XQvKF+wbratX2YkhMF9GNgUMRi44tyS5E+kUojtGLaiRm6U6rGA/wh8lwmARB41uEoNFl9BK/kPBcnSKigfgPU1ng4LmvyY5Ugzjn7NyXRp7Qm0HqoZtRVq9Zh+ziId/BXPtURtIbsgrAelQ8OSIgAc4AcJQR8uu1SDKohE3n13ZTzDaJfd/eJ2AHHlI6IC4QBqvuz+EZgnt3oDMlUo/9JvaI1KFp2M/u/YHCHq3KlJZQJ8TyU6B/HeoWxuGPFgG793ggUxNPVUcGFv0LjVydt4YmQMJCuq9MIY9L628AZxlzlrseb5AzyytDgpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyCimDxyDREnBe55TyJyqlo4Ls8VeRuPawGlJiu3bBc=;
 b=Hzyug/iwwFr3C5X1MdTCl6Rb3AhRIVeX2JBCgIEmyDW1UTk0X4hE5OI+FwiyYJ6UXti6U5cZffb3jaJw/seP4uAv9wfLvv1HEj3VW18VNLbfkKBIDIpSWnY/nS6Oisg9d6FCPf/GQcrFgtnn+jWRE6Ex2vY65MxLqvW7L9wTCRw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Topic: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Index: AQHZu6nFJdPelAC9nE2wzAZF/5qPkK/D6iMAgAACsoA=
Date: Fri, 21 Jul 2023 09:02:41 +0000
Message-ID: <DFD07AA0-E7E2-400B-8961-A646E5531DF7@arm.com>
References:
 <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
 <cb7b53bc-2440-8619-61ce-39c967b56eb7@suse.com>
In-Reply-To: <cb7b53bc-2440-8619-61ce-39c967b56eb7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB8166:EE_|AM7EUR03FT012:EE_|PA4PR08MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: b03ae131-67e9-45c0-06c7-08db89c9440d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 i84EmMZzl4C6NqQEsRUSU5P/xLn052m1I1FN+pobHXQXovY2NdvTfMQwjwYjL0NmoPRwsLbAJPCasFo2D0ZAwvYBC98yLm9/SuQpycSFvMkn6hH/doI3CpArLHCZMzkjYqiMHjIAFP6OY0y90X71FMlX5EIuVcSrmD2u0iWVCBZgcgwhKFjK2iQ3evCM7U4ofCpMEwbjoLenBviQYs0dHC290vXkiwJ8adNUU/a0D1+kIhfyfhpiQBIZL3Yyf4FOtxmxelcaCFa8LehcXuU0eLBBy48MrJNKQuFkjl06N1vTLXst0d6sCgdSHlOQZL7oJA/jw/sGLNfjRrjZf6xTJsi+COoYL6nIgXCuPJZamNJU+dd+bkaTu/fCRZayRS0gCyYHI0k8TOKkQgeKfIkSBPr/7+35OpeAQDFVzcprvcXA1RgjIGcKZpEQiz+4tZ/1K81vMACQNv1qonlyRn01CKe5FfD0ByBbO4pPESEwOuU3WURRDsGqwt3KTtv8yNhqic5MO2dqGeWjJsWfLBQAWLUkEQkuKaDFjW0v/7lDftkwwcFZyGBoFXTkXcNTA/pQCfHa50OeaXNL2tzK7FO2UHPbwNPx+zPF6axO6jnHb2En9Pe8YddlkpkPloUWn9uZgrQJrUIqk6KwyqUSFR4PzQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(53546011)(8936002)(8676002)(6506007)(5660300002)(186003)(41300700001)(122000001)(33656002)(86362001)(38070700005)(38100700002)(83380400001)(71200400001)(54906003)(6512007)(6486002)(66556008)(66476007)(91956017)(76116006)(66446008)(66946007)(6916009)(64756008)(316002)(4326008)(2906002)(478600001)(36756003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D41F10EAF5B5744FAE01066CFC6AFD0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8166
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b714349-0534-4fed-e726-08db89c93d87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	websTrnBpuWDD9+QYGRJJA2bgj25rraUDuTAILEaIzDidavaMMeudkMO8Ud8td4BaUCj/U3+EiUsKzHrkfA3jbVNbm/ROuvGr7i+G1RdBbMaCEBxsovkagFwICbm3xYFVczifj3RLkXW/xNjjILIsYmkZwlNW0WlVrnHZXNhQADupaVw7oX+FW30XFj/SFPG8LtseYkwrspvuRcgkxFKA5qa3JwAHzFt2A8YGDp0YA+LA47e0uCkJv2FJ8TC+MVPcFf1jNis1xj5Oy+CD54+1NPEn1WyJcSQEsVBst3gzIdwAN5Tvgfs4KDwOimtgCahHFFS0RA8cJu2ukhnPggYDbqjiDaNthQ0dPna6cS8OcLLHHKfI8LS5qaXoBZ/3SQuHH571dHQd7qpe1+mO2uZtwKWxmQfr7f5zzqS6vUlMDB1ZMLcGC+N2Isa1nH4Enayhjs9Ds5teuZGxbIW6T5c39LlI5r8KQAl9zWpqGc5ywD/lrIoAkPwz1SbsCMrPwdJG1gSWDpuizJP1gIdVIRI5lMQCZVn1C/PDaSEM6og0BCH/yJzSmyU0qDtb/oeXuY/wzHF6Qg9ADDGD9bcJfz34t6SGWT/Z8krnrQOgKRO3f9XR3DV6XT4LtueeOwafTguSzu0TC4CiQUArbiRUAwPOekjlW6CeF2/P7KP6CV/vZ1wuBgSpuoBe1Fzjt+5BecnTKVILkKrFZD/0xoDNHfZcsgKteGt7OVDcFaoGNjnndgclFpmhTUN0uJNNHcLE/YZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(6486002)(54906003)(478600001)(2616005)(36860700001)(86362001)(33656002)(36756003)(83380400001)(40480700001)(47076005)(40460700003)(2906002)(186003)(6506007)(336012)(53546011)(26005)(6512007)(356005)(82740400003)(81166007)(41300700001)(4326008)(70586007)(8936002)(70206006)(5660300002)(8676002)(316002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 09:02:52.5568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b03ae131-67e9-45c0-06c7-08db89c9440d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6000

Hi Jan,

> On 21 Jul 2023, at 10:52, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 21.07.2023 10:02, Bertrand Marquis wrote:
>> --- a/xen/arch/arm/tee/Kconfig
>> +++ b/xen/arch/arm/tee/Kconfig
>> @@ -1,7 +1,17 @@
>> +menu "TEE mediators"
>> + visible if UNSUPPORTED
>=20
> With this ...
>=20
>> +config TEE
>> + bool
>> + default n
>> + help
>> +  This option enables generic TEE mediators support. It allows guests
>> +  to access real TEE via one of TEE mediators implemented in XEN.
>> +
>> config OPTEE
>> - bool "Enable OP-TEE mediator"
>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>=20
> ... you shouldn't need the "if" here, and ...
>=20
>> default n
>> - depends on TEE
>> + select TEE
>> help
>>  Enable the OP-TEE mediator. It allows guests to access
>>  OP-TEE running on your platform. This requires
>> @@ -13,9 +23,13 @@ config FFA
>> bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>=20
> ... you could drop the one here. I think.

visible if is only for the GUI/ncurse display but the if is required
to make sure that a .config file cannot set CONFIG_TEE or
CONFIG_FFA if. UNSUPPORTED is not selected.

Bertrand


