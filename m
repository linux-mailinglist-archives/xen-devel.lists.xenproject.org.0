Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50970F156
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538886.839229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1k9R-0006i3-9t; Wed, 24 May 2023 08:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538886.839229; Wed, 24 May 2023 08:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1k9R-0006fE-5p; Wed, 24 May 2023 08:47:21 +0000
Received: by outflank-mailman (input) for mailman id 538886;
 Wed, 24 May 2023 08:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1k9P-0006f0-NY
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:47:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9707593c-fa0f-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 10:47:18 +0200 (CEST)
Received: from AM6PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:20b:6e::37)
 by AM8PR08MB6353.eurprd08.prod.outlook.com (2603:10a6:20b:361::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 08:47:15 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::af) by AM6PR02CA0024.outlook.office365.com
 (2603:10a6:20b:6e::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Wed, 24 May 2023 08:47:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 08:47:15 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 24 May 2023 08:47:15 +0000
Received: from c82e35752628.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21BF890F-99AD-4FA9-93E7-7CCD90646768.1; 
 Wed, 24 May 2023 08:47:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c82e35752628.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 08:47:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8238.eurprd08.prod.outlook.com (2603:10a6:150:5e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 08:47:05 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 08:47:05 +0000
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
X-Inumbo-ID: 9707593c-fa0f-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVsR5TmnHCfQt8kl97a300y8QrrIdnnvlz6fJ5xoabU=;
 b=UlBUl1VhYtuC5S/yUGD9se1Wua352Sj7E6O4UhiaTt+pLalph3EN0GBGxIj4+iLTsysQYCvrci3P9ZH3OtxGr1RzxKPlTJD3vIVGPtHmj9ogB5hQK1/uhJIWiGZsLGLNAw3ffaxU08YOtr1v6m9e/RYNby5iKKm4xlOBPd0MrPY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8de4c10e4b07d30d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJTb9qy4CqzceTX9b6Wr2tJjaIPlUfimsnpLFPQkcHpbD29bxnFENFpoos7XYWPpbJrfHFKqF5SMi07Ui6x4LFOZHFolTpBR4W22jZK6RmEy2jmAx20qIGvCzsL9GCxZ234+A+9ybB45BBAO2gjYwEqX6xqRgjSNTQ0MVcwh8Fhw4NfD5c/vU4I3nb4uejr838r/2n72B312LLi9YSOSTGQSoje/gXZYK2U4cYv7qRnWyXE/i8zkgyx+x06hsbt92aesHsFyUdsEEi/k5LiQoylR0w2JF+RsL5Ol7jm/TErP+CM9opWLPqff6C4JrIjQ6299Smny6yB0TUBTlouFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVsR5TmnHCfQt8kl97a300y8QrrIdnnvlz6fJ5xoabU=;
 b=Upt8kvHKszK//dKEcbrGnXVi2Xukp/oHKCkGOCgQIz76TMDIOZ6WiFtKWDdJnl6ZEp/t4d55mV+mHxlyBqIQ7zXsPw/JvL30krB7nAFf+iYEnGd+b9dp/Q5EzVz9ZGbjGpH6pb1cx2rvOEpKDV9EchLzL6knI+jFfR5XtYiXe/VhRWNia9MgEhtN+kgm2Y415o2eHqm9HTC7pIEVXR52/D15p9lyY+XmnXjgqqJOq/YyP1lehLSw014wZdG8T+xQhXAm6XRyj3WsJEU7bIYOjiCLlI8Xp2uP79WfADZEjqmsYaq+1WzLFTlGywqifz5q8Z3Aya3wcQ30mkC/KlXzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVsR5TmnHCfQt8kl97a300y8QrrIdnnvlz6fJ5xoabU=;
 b=UlBUl1VhYtuC5S/yUGD9se1Wua352Sj7E6O4UhiaTt+pLalph3EN0GBGxIj4+iLTsysQYCvrci3P9ZH3OtxGr1RzxKPlTJD3vIVGPtHmj9ogB5hQK1/uhJIWiGZsLGLNAw3ffaxU08YOtr1v6m9e/RYNby5iKKm4xlOBPd0MrPY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 10/15] build: rename $(AFLAGS) to $(XEN_AFLAGS)
Thread-Topic: [XEN PATCH 10/15] build: rename $(AFLAGS) to $(XEN_AFLAGS)
Thread-Index: AQHZjZZTzywyLasu2UeN6RTgzfRGn69pGKwAgAAEuwA=
Date: Wed, 24 May 2023 08:47:05 +0000
Message-ID: <BA29A878-86E4-4B5F-A344-C920C3D82076@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-11-anthony.perard@citrix.com>
 <17CC7699-2B73-499B-946B-E423F7C9620E@arm.com>
In-Reply-To: <17CC7699-2B73-499B-946B-E423F7C9620E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8238:EE_|AM7EUR03FT046:EE_|AM8PR08MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: de3d3f70-0ebd-4770-826b-08db5c337973
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9WdAoY5D3CIqsoWR7Au8obk/OwVS5s/gXccvvsiD87i/2KreoON4eXBx1CnS9s/glejp2pkmjdtDG+umiFqvD4eLoztGTZcnrgYof/6JUR7KSsYP7lCmyIUCa4YwdDmIOaI+mKxSy5RY+EULUMUHzrk/mRvicwClHbdAHqjQOO2EdylyqvvBSD9V23TNe7xemVCKaQUBfoNpVx35AkBNXdrk71C9rGAUlws0l9gcYMdsv5f9VngxrDWjBnhVNPyMJE0U0Ft+OUIfXvcjQoxJlIRvG9y28w24/m6rxR+ItMPec/YI8ZGqU1GXMZF9y3S0fRd8FzYW0EsTpeaQYTFB5lumOEW+xEDrc8hfukkzezuyrT3/q3THdGPYAtlhfsWyt5zknvyuqNIis9GoBmPRgJEUWmTpN+Uof5l1QzYrSJCd+y5vc8uJ8bGX0CGLLLzBYawXSYW8gmxFlzBJaqbMvSPznZVnKfJnEWV6tCt0sRFLHffgXSprfTk3XjXhWxpriNxZu6JlIP+RwLpFlRBOY97y8RVjefK2prz+zeGvWOPL6Se+TK+RuTzjsS5G1QXnkx70iOAbzi4BS5mL9L/XJQa5VYP/LYED5vRlAY9M1RQiotUKH2F6A/qcQafDh5EIENCZ4eYh8PwUXFQtVEn64g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(41300700001)(6486002)(54906003)(478600001)(316002)(91956017)(66556008)(6916009)(66446008)(4326008)(66476007)(71200400001)(66946007)(64756008)(76116006)(86362001)(5660300002)(38070700005)(8676002)(8936002)(38100700002)(6506007)(26005)(6512007)(186003)(122000001)(33656002)(53546011)(4744005)(2906002)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D3B77C872D9B8C49B7729E963FFF2318@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8238
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85c4a4dd-9526-414f-fc08-08db5c337368
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aE5MDas2CkWgZqVlsUg1/j5qvnCzgognfj/kUcyUTPiuW2+egtJjwrnNvFPtgrX2kXez2v5QkwDqh6Urzzy3msep9CHdxJptJX16wP0XAd6XbHbpLcV0RmQeZOZYEgwaNZPn8eMAnnfXKS9xQfO5o9A8lR43mz1sKqGvFTJdUgK8dtNs9oxNM2QuQNf6g1PM/8BBXADdn4UaflAYDKpStxIx7Zzc/HNq32lqhoXtvyJ1zNrCqHAfqey1hamOVvSVvWHb8wPNXol8slWzDqRdIujPMHWe7qs9c4LpuaR6IRYeUtMcQgqdgVleApnR8s43k9hRlu+p73F16cCe3xO2L1dc4E7FbkgZm0RqxiK6ROn+2wJXqGpdYR9xRqpjQ+4f3l22mZiUeU++7wggOoh6ArjWrVwGLhDH9faa2P+O+6Ie5iZ7OD0FIHJWrumwTUyOZ6dSp2Ny3yS4O8fT+u3kDY/EnJJ0tDYaoBWGDc7ibVM4E1dvpRmsJuS+Z7kZNIW3Nen0DY4dqyvpLWTs5Lzke5gmjpe5W0Fmk7QCzTM5HLPewHInKC04+5X9dfXKnwpSRH/YZ3jJCrhLCkGu7xYZ3H9wMQO3nfVpyPXhLbRHIBQoGIsdcbJ1Y+4hj+2V/LW2W8XDDVXRBHs33HKQ/zntUi1AS1MJRiaZwMu22+zdNs33VDxgcJy/nSL7w+yWJutd4cXJ9ZyhtQg+IYFx9utE7+4ja6LyuzrUC+Y6XgPQh4uM7YLZ1g8ZXpPkXVqF9HiM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(54906003)(2906002)(4744005)(82310400005)(36860700001)(5660300002)(47076005)(6862004)(8936002)(8676002)(70586007)(40460700003)(41300700001)(478600001)(4326008)(316002)(36756003)(70206006)(33656002)(6486002)(40480700001)(336012)(53546011)(6506007)(6512007)(26005)(81166007)(86362001)(2616005)(107886003)(186003)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:47:15.3132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de3d3f70-0ebd-4770-826b-08db5c337973
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6353



> On 24 May 2023, at 09:29, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
>=20
>=20
>> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wro=
te:
>>=20
>> We don't want the AFLAGS from the environment, they are usually meant
>> to build user space application and not for the hypervisor.
>>=20
>> Config.mk doesn't provied any $(AFLAGS) so we can start a fresh

NIT: there is a typo s/provied/provide/

>> $(XEN_AFLAGS).
>>=20
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> ---
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
>=20
>=20


