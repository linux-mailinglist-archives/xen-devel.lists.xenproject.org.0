Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B000D75CA18
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 16:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567591.886852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMrDF-0004WL-5F; Fri, 21 Jul 2023 14:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567591.886852; Fri, 21 Jul 2023 14:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMrDF-0004Th-0w; Fri, 21 Jul 2023 14:34:33 +0000
Received: by outflank-mailman (input) for mailman id 567591;
 Fri, 21 Jul 2023 14:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=So7w=DH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qMrDE-0004Tb-9D
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 14:34:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b44a4483-27d3-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 16:34:31 +0200 (CEST)
Received: from DUZPR01CA0196.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::23) by AS8PR08MB7861.eurprd08.prod.outlook.com
 (2603:10a6:20b:52c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 14:34:24 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::65) by DUZPR01CA0196.outlook.office365.com
 (2603:10a6:10:4b6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25 via Frontend
 Transport; Fri, 21 Jul 2023 14:34:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 14:34:23 +0000
Received: ("Tessian outbound 95df046a2e2c:v145");
 Fri, 21 Jul 2023 14:34:23 +0000
Received: from 719f1c104e83.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81537DE2-14F5-450A-A827-6C7C8359A46F.1; 
 Fri, 21 Jul 2023 14:34:17 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 719f1c104e83.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 14:34:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8131.eurprd08.prod.outlook.com (2603:10a6:150:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 14:34:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 14:34:15 +0000
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
X-Inumbo-ID: b44a4483-27d3-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZCMC/vszV1gc2aSIVmW1r2fT1riDnMdaiaIthroaFA=;
 b=k9Cyrd/HoBjU0yVoPMS4x7UG3Veb3dTr5l9jLAhTFqUrcd61VbTQza7sCwr/a55XEIh1CwUkTj8yAYPWDCuU/GwoUOcvmsIRkHNwHC0DFFEZ8NoiVZOHdUUt3udj8wMN5JpH3DqhSrUyw+LX2p5J+r35QxgZuJTfUO8E29nyIkg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a0b060e0ac7052b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXJeofWsZQL0Zqk9PaITS34vAakyyb18WEIh5l4Aq50srB8XnEdFhif2nnw7f8ywiSJlzOfshXIm8Nf4vSU4eSjcjE1FhD5ytzxPR+RhfbuWgd7R8crxlHQbkAvzhoGV6zKVKwiI0UJM88rwXiMs7QAeQywwm+2JKtFU90TFg/IC8/ATbiIfC5dLqFSkJRjPScB/1opX/8Gv1QZ0Fr3u0M3GzIBG6+1sCKM/oaT439mNfxfSQBTvm1EdSLVytH3QomVYhx6qsGI1bJDzU5ytyGnZTTiCxQ318pyFXkC23JyJapRG/rJNFvmhgGBnXrIARDMutbzKU7kG9WJbKL4vLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZCMC/vszV1gc2aSIVmW1r2fT1riDnMdaiaIthroaFA=;
 b=Zf1+Bg0qoH5evzqY8/u2MlWAFsSvcCXvQmmuvpz4rLXBwBpETgCMllW8UUo7JBBS7l0mLvdg2GzL4HPM28HJEJ1Ocq2Ew6L1PAfszQmOxTwKcxRD7XA84KlALsA132ebLtJft4fGfPeQUOWhFXUozHkQEUqajj7JleSRJbLsAuKGi76HTbNq2OYqHXHRSrUBRx91RY0YXq9moVgWT7nSkOyN/OEuBgtoyGiSwQE706DFG+zZnN6tcgxG8QMWbdHUajW9gBBHDUOQYM9tbel+H95VQLZYvqfBt2Q+ZHMeVSqf9iToLVDvXA0gmicLHK9M0trBiq2FokqnX5n4EnslyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZCMC/vszV1gc2aSIVmW1r2fT1riDnMdaiaIthroaFA=;
 b=k9Cyrd/HoBjU0yVoPMS4x7UG3Veb3dTr5l9jLAhTFqUrcd61VbTQza7sCwr/a55XEIh1CwUkTj8yAYPWDCuU/GwoUOcvmsIRkHNwHC0DFFEZ8NoiVZOHdUUt3udj8wMN5JpH3DqhSrUyw+LX2p5J+r35QxgZuJTfUO8E29nyIkg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Topic: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Index:
 AQHZu6nFJdPelAC9nE2wzAZF/5qPkK/D6iMAgAACsoCAABzbgIAAHFKAgAALbgCAABCjAIAABLWAgAACsAA=
Date: Fri, 21 Jul 2023 14:34:15 +0000
Message-ID: <60BC1EAE-ACE2-4D28-9323-51E03D405B35@arm.com>
References:
 <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
 <cb7b53bc-2440-8619-61ce-39c967b56eb7@suse.com>
 <DFD07AA0-E7E2-400B-8961-A646E5531DF7@arm.com>
 <6b24847c-5cd2-877a-bc72-16bb732e0ca2@suse.com>
 <C63A942A-AC5D-46CD-81B3-50B6376860E7@arm.com>
 <47ab1431-6a0b-6e74-92ec-8495c6bf8fbd@suse.com>
 <8ABBDFFB-AE3C-4A8F-8AAA-F0C5EB99C2C3@arm.com>
 <fc1bffbe-c5ce-ba05-ad01-22bb1ff983b7@suse.com>
In-Reply-To: <fc1bffbe-c5ce-ba05-ad01-22bb1ff983b7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB8131:EE_|DBAEUR03FT048:EE_|AS8PR08MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: aaba00b6-60b1-4081-0508-08db89f793f5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YvPZfCI83leAL7ky0Y063KVNDWSgvlCuTkYPjIA+u7tyeHvmcQz4BVtBlBCX5goaAlUqiNy7v7Iatk+wfhsg+hUhN/F/zxk4EJZwQekzdial3HOn5J8PJWxxuHRJmH4VIXw/0HjT9iHpXwbgIhjaqNRtH5qRqJd5VroUNweIYxSWsxwELVMxGZjlY7AvqKeBd4bWX6OXBj6hTIczPahyRHRDRjmTG9hH0PijFXBUhaFV0xVDLlKlfSHNy4yQx5fkceZT2K3hyzIE22eO2GOQnA5YSQm5JqJqmd2cOXHPGfJq28uy970iQVNFbrK2ahuJj1po6SC4i1YSxnRjsHMvNe1r/RUUTX/lIdbjUQ6un5At4zU1M6QjbP82DM/PEh774N7pvn3Mxl1kuf0vsDpLnaJ1AKoA7uoCLoCQ/PC1djzvWWK5tDnY8tx12leTyFVDPUUPekV7Q22lE5QbXoFMK1+ZQOpXT7D0rqz93lpzeI4Na2ruAVjQxdDWwmKkkFRn2lW7ceXASnyajlCj0YYqTMsNaPHHggp3/L53Npk4vxh4fT6lFtxPeOFWlOrVyz/K35Ybwld2lUiH++mYMjUTJ9FvdMdsEVKoMuSOGCHQrdr3o/BarVTQO+k8+iChTZc7YMQAoAvN+TWN+RD94FyLr14xEAhmJJG5pgy4zo4tCvc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199021)(91956017)(53546011)(4326008)(6916009)(6486002)(6506007)(26005)(66446008)(66946007)(64756008)(478600001)(76116006)(66476007)(54906003)(66556008)(36756003)(86362001)(33656002)(71200400001)(186003)(83380400001)(2616005)(41300700001)(5660300002)(6512007)(8676002)(8936002)(2906002)(38070700005)(38100700002)(316002)(122000001)(76704002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4056CB18F8BF434E899C8AAF3DC7E0BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8131
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	420169f8-4b44-48e6-6516-08db89f78efd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HSk/k5Tk/+5/6SIHpmpJsvx1e26SnbuStWxdTGt3a9al8iO9DRBRNwPv69RjuncLwUXhY1ffm9vFHX114+p+oZ5D4/cwj0bwuX37JaiMP6feAw3OX5/aF0GKJeVioMfnJUVEVxQsBEBWSUKGtRBSTbJQi6AeaPkLXjbPd0KZvu2R47alz4rsYBUK3DI5kBfa/IcR5cxH24xL89N2EKO3EAtUTZu768ngJDsL5fgw5jnBz9VWV04NX/TL4PNdDyBbpAnNYXT5iWOM2vK5izqDd770rs0xwrTCfaR8l5JVSIZ3vXjG6TebG4c+EWOUdFdUWAbHzZijxG3q4I7Q3L2iXxLKtQkNESWqAphas1CDz5o8K2y230Th4wtmoxA2EWqcLQ6wrXlT4Fqf+m5BACckgcW28K8aUk0/hBHMn7mBuo3IyYoWCKSjWa6Wx1lsNAxu13GpVLed0aOMnzf9K3lOw7woMzrb79WSqmOS6+ABdifAto1wTK45snuu6RvHmcNB9NwNfmXuwe2YBGl740tY94MPWTJpsn14IEiO67k158z2MhVDlFVrzrTG6qGuKXTNLikRrKHbT2fGWZqaBktqOTzc7vuaBH63Hv3UYF3czbODMPYfpnMfp0vhkZjbmT4cCaTMglmb+66iUnTElChgYxX4DwEMZvwQGjTuslkTxMXCm9z3yJKnTZQH0SJcJO/GyUVPfQuUqyE7C6P7+gK8Xe7737pmsijepnJSf/pSr/YUA48VnN34OUZrsqdIy7RFC4Zm7verQV43KQ755mjqLQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(6512007)(40480700001)(81166007)(356005)(83380400001)(6506007)(47076005)(53546011)(82740400003)(186003)(2616005)(336012)(26005)(36860700001)(2906002)(33656002)(8676002)(40460700003)(8936002)(6862004)(5660300002)(36756003)(6486002)(478600001)(4326008)(41300700001)(316002)(70206006)(54906003)(70586007)(86362001)(76704002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 14:34:23.5136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaba00b6-60b1-4081-0508-08db89f793f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7861

Hi Jan,

> On 21 Jul 2023, at 16:24, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 21.07.2023 16:07, Bertrand Marquis wrote:
>>> On 21 Jul 2023, at 15:08, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 21.07.2023 14:27, Bertrand Marquis wrote:
>>>> So what should i keep or remove here ?
>>>=20
>>> My understanding so far was that "visibility" merely hides all prompts
>>> underneath (but then I use the command line version of the tool, not
>>> menuconfig), so it largely is shorthand for adding "if" to all enclosed
>>> prompts. Therefore I think all the "if UNSUPPORTED" are redundant and
>>> could be dropped. But then I'm also working from the understanding that
>>> "depends on" would behave somewhat differently ...
>>=20
>> If that is ok with you I would rather keep them so that making one of th=
em
>> SUPPORTED one day will not end up in wrongly making the other one
>> supported to. The visible if i added was more to "beautify" a bit when
>> unsupported is not selected so that we do not have an empty menu.
>=20
> You're the maintainer, so you judge what is best. If I was maintainer, th=
e
> primary thing I would ask for is that there be no redundancy. IOW here
> either no "if"s or no "visibility".

In this case i do think that the "if UNSUPPORTED" per entry is important
so that it clear per config entry which ones are unsupported.

So if other arm maintainers agree with your point, i would remove the
"visibility" and keep an empty menu.
But my vote is to keep both.

@julien and Stefano: Any view on that ?

Cheers
Bertrand

>=20
> Jan


