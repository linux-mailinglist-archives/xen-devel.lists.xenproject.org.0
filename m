Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2ED600A5B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 11:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424242.671522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMJR-0006nx-NB; Mon, 17 Oct 2022 09:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424242.671522; Mon, 17 Oct 2022 09:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMJR-0006m1-JK; Mon, 17 Oct 2022 09:21:33 +0000
Received: by outflank-mailman (input) for mailman id 424242;
 Mon, 17 Oct 2022 09:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CpyK=2S=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1okMJP-0006lv-Dl
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 09:21:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 157cfc30-4dfd-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 11:21:30 +0200 (CEST)
Received: from DU2PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:10:232::32)
 by VI1PR08MB5374.eurprd08.prod.outlook.com (2603:10a6:803:12f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 09:21:28 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::86) by DU2PR04CA0087.outlook.office365.com
 (2603:10a6:10:232::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Mon, 17 Oct 2022 09:21:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 09:21:28 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Mon, 17 Oct 2022 09:21:28 +0000
Received: from a04aa8ddf531.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CE9B491-1720-4928-855E-40E45C269205.1; 
 Mon, 17 Oct 2022 09:21:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a04aa8ddf531.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 09:21:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5379.eurprd08.prod.outlook.com (2603:10a6:208:182::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:21:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 09:21:20 +0000
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
X-Inumbo-ID: 157cfc30-4dfd-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Zbzp3Hfs6Ob2IGa5htWrDOzeOYWkJtDZlPcDBUPcfCr6jkVtFfYHv8lL500mc8qmfABQf8/f8UWtb23T3K6YrAJI6DyeYzzedn5nau8nPkfdwq19u1lZvNAUdnxrdwg43MXI5Yzk/FUMVEs9edVAv2Mu5dZyXxCCTXlC3dAoLgSSrMKV+CRWAimyg6YXcwbTDCYIZYbsiyg02UClTPoXG9ejJBFJRzE4yP4mqjOq8HL/NywXIerI4TWgQw92b4KZtyxPyWMmq1qxyhbIP4toZOqBVF0XB3tRUp3ugTeydBpbEHdl8/t2AwlwP9vmbuJ18zqlDUhpjGeijYOzebqlbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJRFfvC9WKJ61OarQi9PJR/eubBtRm/bRs9ihoNyWl0=;
 b=LadueYw4PbVhs/zQyZ6MuzPCz310zgKXErfNGPQIU9C4GIWADNyMVe3PvZ1JFHAHDkobAfDnpvU2GyWthD6a4xg6nPuUV/gd1qKaRo7AM9NLpYAXEoogBUhxKqgDGNGtLZREkbZkjKP9k2mI2CuOR/h90xmjX/9uXtLJTzRIJ7LvapulSwHHGlc4/Fta1TIfFVU8S4IzCSWkeWc1uIIa+qSuqezG7AleXAXTg+un2pIr0hlnmxSLq9CPSsVcxLgM4FpHgLsgbrrPcKDIuMpXod4gOAVKNUtI7oJxCqfwSzvUFqQhLQP2D6dUPvyzEDGn1JNg05UjK0uSiiu6+q1bsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJRFfvC9WKJ61OarQi9PJR/eubBtRm/bRs9ihoNyWl0=;
 b=6mK21ldBUi/sXfRzxCruVgxV4UzxcYdINfZAgLpWcmbOnTmQtOGQ4GGGt5POPhzzff7j60WUz/hq4t/pdZSF6rc+rikGkcUPUj91XyhnSS/Vf+iJpvF8ON2DEB0HDkM2kTAOc0phzS5oo7aqRNx5O0itl6YYv0EhFkAcOrPIya0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a9d3e1fc4a09ef6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVRZ8SRCK/UH7JBSmR+qmDv8syWuqYRJKk5b8++sM9D/tUB+nI8CN8umm7dAL33vJFI25q5owtAYrxwQh02tgCRfQnfcKCESFcdgxcScnmZYbrapuWg/ZUeHZBJzB0s6huh+2kZRzYCK75gETwdThxECOqMQzs7GPb0h15oOfH3PSWTrO3dqMBuLfZm7eCbI+68igxluK3wem+UxzupHoLtiop6bjiy4Pa/aKwiKW15lT9B5gBZUN5TUsDjie0AvKL8vdgrEts2KwP1Uh6qSYMgGG2agxuTXAydXFUTvIefk6Ryofow70JGAlHakNg7BCpV9qW1eGtEn7Fonhs+9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJRFfvC9WKJ61OarQi9PJR/eubBtRm/bRs9ihoNyWl0=;
 b=R7SVsa+FzigXuzmWar0tqzCK3mSFrFNe9UnbaCokG6QXN1OSMaa+P5R9FUU2DtfSJTE7y0m4oZihvrU/rnEPr10IUUwH2TnWCf0d97zRgbSBOH/Cl67+OMvjwRxMPyuZ3G3w5Rg3oYoBB/G3hBxOshM965rNtTg2kzItJl8O6bXp6igMXwAzbBJP53CO9YOsTvu+rEOPq0P4fzA3l1C3UsXV0nYu2rTLqLqXZxs68q4icMTJo/3qdZK31qqANuhy87yNeqQtRowdJ6g+7E5z+4COfW4k02EjAOeWEl0w4zATqKbuMvoCKSTHVri0BwXCJkq9QgOj2EM9tbEiwbTTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJRFfvC9WKJ61OarQi9PJR/eubBtRm/bRs9ihoNyWl0=;
 b=6mK21ldBUi/sXfRzxCruVgxV4UzxcYdINfZAgLpWcmbOnTmQtOGQ4GGGt5POPhzzff7j60WUz/hq4t/pdZSF6rc+rikGkcUPUj91XyhnSS/Vf+iJpvF8ON2DEB0HDkM2kTAOc0phzS5oo7aqRNx5O0itl6YYv0EhFkAcOrPIya0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 0/3] Yocto Gitlab CI
Thread-Topic: [PATCH v2 0/3] Yocto Gitlab CI
Thread-Index: AQHY3hEMDLhOM5SRDUy6m8XkPQoc/64OWrqAgAP8xgA=
Date: Mon, 17 Oct 2022 09:21:20 +0000
Message-ID: <7DE7B34C-F6BD-42D9-83A3-AAA3A6A35B62@arm.com>
References: <cover.1665561024.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM0PR08MB5379:EE_|DBAEUR03FT060:EE_|VI1PR08MB5374:EE_
X-MS-Office365-Filtering-Correlation-Id: a69d175b-657f-4e1b-6d20-08dab020f891
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CS8HQLhhc6e59ZZxKh8CoRfMHX7a2N7XwgxT++tSWxVCvGM6P+IK52aaT49gJcl25Po9Ip7/YDv3hVHeoaw5olfPH7EKIY0C3TxzrNQbdRdyIbafqJTL7bk3l2CYoYUmLP/wSRKdRs3otO1YYG2DivAgMOcpgxG+trvDIQulKff/TmP/kdYJRScLCn7ZIcp1KiUElwJSOrlECxDCcJyy7s3tp10fPXO76b7reRCGY6Sax60xUTrMzv3ar0a4e/oXBVycZOJZzvfgmp00b0JIA99MsIxxqCs997h5VsY9d0dd2eZR0ksawvHLQFcPy4hEzelGy9UTAB99jeY3Mv7Kqce06RsX1qFnhmOMBpnvz7L/NKQdJQAH76WZRGM/UfWaiWKQ0pArb6IphBhX6yf/D8cFUKYw3rQNGHD7UO7eHpcKY8TZ0bcqwchxosbDCUm69KP+vE0I6bUe0p5WawQOmL+LY3N4YMR79eJoWD5rtfa81gTKP1EMczHnDlZGSFWmdx5XhuxFNGS69IyIFZAT1EbPPPWr7Bl42yApPvtZRrCS0BYmSfUPmzs/WcFzxB6JEehgM8r1mlj5BVgG2QTAymFPPkAK8xOuG3JDP558DlOz2Br33w9i5BO+8ZuVl+lIbzJNjlbsIF8yXHP6Z+4KzCUBM/YoPC3AcoB+beOgziNqJdKOx3EaRGYA5UAOOzNsBO5XlcSJ5F6yfOhSZUbMDzCas2KtISV31uN/WCjNZ8BDys7Naf0VVbTxW6SP85HKKVkiNxC3jWfqCub7rXFUMY5eR/fTbIVj8X+71iSJP2Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(2616005)(186003)(38070700005)(86362001)(122000001)(5660300002)(38100700002)(2906002)(41300700001)(8936002)(4326008)(8676002)(64756008)(26005)(478600001)(6512007)(6506007)(53546011)(316002)(91956017)(66446008)(66476007)(66556008)(66946007)(76116006)(6486002)(6916009)(54906003)(71200400001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8C1F4522F23201479A95B537A44D3169@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5379
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	549e736e-9880-4eae-e51a-08dab020f41b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f3Dw2lins8qIjXFlteHMsXMbyr3VJzfezwvI/e7/Jp+n0Gn8lpl1z25GKc22ds+6auRyOCLlJzcjCgCyPHBUFPPpWw6OtWc69zRBgBASDMV0F+ksMra5onf3e8u+pP2SYK6/hkAK32KeT1aabstNwAdoIcLawBfH957bov8RZaeuWFB9JABa82ncetl30oV0bU6QbOxCMUAaIrwLQM/HxoiweC1SSDVN3HGFVKZBo864CuBhMunRRRj5dyjAlNGy/1JsJPyge+qv88cdXyEhfHsh8US2vwhvJSCfmevTYoUWzBudoNMPl/otAvX0ryc9b4OTF56gvMpN26KiINv2uUORNzLdSxpjtcOQO2A9mi09rE01wk5CIEOX51eHOkpYbMZ7Bm5AEzVQp81RTEUjwqdHVZywnSKLjbLHqKiWmTGVPey9FAltH58ErB9w5jirOQiQOd5RX4V6ZEbJGEJHb69EiR1bDfNGzbevT5/b47uCp0e1S6gcYxrokWTqSyyTJu/Zf94OP7zykn1xZ8rQGnwlD19KbmzFqm+1SWHpv42QwZIIlKXbUWmisIil/uCuHY58odRNbRFmL0XlNBMx/TqP0mOXIVRD5Bgvcdavy/G/6cd/RRjbeREfHXrdjMIBfAGdSEIRHG5+Kny+GNp11DsZKiMlaM6dzXhVpqvru4PXV4PHmshv3UPpccnf8TxLgcvmb+LavPsK7vRXCO43yICT6GaHwcWlGDWUIw3sM9W34CVjAIZhxH7V7SYlSf6L
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(46966006)(36840700001)(478600001)(54906003)(6486002)(6512007)(26005)(8676002)(4326008)(107886003)(70206006)(70586007)(41300700001)(53546011)(6862004)(8936002)(2616005)(5660300002)(6506007)(82740400003)(82310400005)(316002)(47076005)(186003)(2906002)(336012)(36756003)(356005)(40480700001)(81166007)(33656002)(86362001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:21:28.2068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a69d175b-657f-4e1b-6d20-08dab020f891
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5374

Hi Stefano,

> On 14 Oct 2022, at 21:27, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 12 Oct 2022, Bertrand Marquis wrote:
>> This patch series is a first attempt to check if we could use Yocto in
>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>=20
>> The first patch is creating a container with all elements required to
>> build Yocto, a checkout of the yocto layers required and an helper
>> script to build and run xen on qemu with yocto.
>>=20
>> The second patch is creating containers with a first build of yocto done
>> so that susbsequent build with those containers would only rebuild what
>> was changed and take the rest from the cache.
>>=20
>> The third patch is adding a way to easily clean locally created
>> containers.
>>=20
>> This is is mainly for discussion and sharing as there are still some
>> issues/problem to solve:
>> - building the qemu* containers can take several hours depending on the
>>  network bandwith and computing power of the machine where those are
>>  created
>> - produced containers containing the cache have a size between 8 and
>>  12GB depending on the architecture. We might need to store the build
>>  cache somewhere else to reduce the size. If we choose to have one
>>  single image, the needed size is around 20GB and we need up to 40GB
>>  during the build, which is why I splitted them.
>> - during the build and run, we use a bit more then 20GB of disk which is
>>  over the allowed size in gitlab
>>=20
>> Once all problems passed, this can be used to build and run dom0 on qemu
>> with a modified Xen on the 3 archs in less than 10 minutes.
>=20
> The build still doesn't work for me. I found the reason:
>=20
>  create archive failed: cpio: write failed - Cannot allocate memory
>=20
> It is a "silly" out of memory error. I tried to solve the problem by
> adding:
>=20
>  export RPM_BUILD_NCPUS=3D8
>=20
> at the beginning of build-yocto.sh but it didn't work. I realize that
> this error might be considered a workstation configuration error at my
> end but I cannot find a way past it. Any suggestions?


Can you give me more details on when this is happening ? Ie the full logs.

Can you try to apply the following:
--- a/automation/build/yocto/build-yocto.sh
+++ b/automation/build/yocto/build-yocto.sh
@@ -107,6 +107,9 @@ IMAGE_INSTALL:append:pn-xen-image-minimal =3D " ssh-pre=
gen-hostkeys"
 # Save some disk space
 INHERIT +=3D "rm_work"

+# Reduce number of jobs
+BB_NUMBER_THREADS=3D2
+
 EOF

     if [ "${do_localsrc}" =3D "y" ]; then

This should reduce the number of parallel jobs during Yocto build.

Cheers
Bertrand


