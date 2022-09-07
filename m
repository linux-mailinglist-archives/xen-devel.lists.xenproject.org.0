Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE25AFEFD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400936.642577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqSK-00025Y-HU; Wed, 07 Sep 2022 08:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400936.642577; Wed, 07 Sep 2022 08:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqSK-000231-ET; Wed, 07 Sep 2022 08:30:44 +0000
Received: by outflank-mailman (input) for mailman id 400936;
 Wed, 07 Sep 2022 08:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVqSJ-00022v-03
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:30:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20060.outbound.protection.outlook.com [40.107.2.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bf340e5-2e87-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 10:30:42 +0200 (CEST)
Received: from AS8PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:20b:311::17)
 by PAXPR08MB7367.eurprd08.prod.outlook.com (2603:10a6:102:229::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 08:30:35 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::7c) by AS8PR05CA0012.outlook.office365.com
 (2603:10a6:20b:311::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 08:30:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 08:30:35 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Wed, 07 Sep 2022 08:30:35 +0000
Received: from f1124cd3026c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA4FC308-3C8E-4F9A-9E14-8E6BEA09C9DC.1; 
 Wed, 07 Sep 2022 08:30:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1124cd3026c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 08:30:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5366.eurprd08.prod.outlook.com (2603:10a6:20b:10b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 08:30:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 08:30:27 +0000
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
X-Inumbo-ID: 5bf340e5-2e87-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OplswqilE8h2zyC8B7WTwpLFrtTRbMPEtqQrFf82xBKybvqNad90iYr7+R//v3FS5VAGWFbs+CV8o5xUW1aBKanaxug5nkz+nMAUp07BjKPUyDYVZTgz8dQL9w+Vh7CYXqx/vgUvzkyfAFUjJoAoCJIGEtA0f7rlRJ1OwsEPJd7p2Zl1fgTDHfVLp1ixzrKHLwHBAdsNLLGEykPC7n510v49ufBL1Ydw64bzfv1lfp2yaWhLPyZtTVrYjcX0LPR+aePRzeGKj0x4quMOoperHKkggiWN/JeBz7Gp0uEl1BTsGO2ahOyVYq2UY8dvDcGvNMAcMQshY3QRJf2BOlfOsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLaeFlk/kicynYXZyl3aqVFLxJM3MTSAbQJJsjYoN5U=;
 b=IFdvpX2qrIgWMwTPHfeg8h21p8li/8BTyDPh8UGj5ycNiNgxe7aZ+y03f9UtBjlj4IV3L/8yGiQZ+6rHGk0tGOXfLcVJFz7H6xJyeB6X+jwGLpDVz1M+8KEq0ohI9S1UGQGXGsq1wNDOarXJBvaePw0i07JKFiINFZJOpXFinrMfLvqKaHe6OrlaEGEtwrLQ8Vnaq1l2MBpEisSl14oApA053ZG5wOdFLQfuUIXKM4gfo+Ex9JQ/0MiDQkN0gxUTzJN0m2aNrtKvWWjxLWzPXcOKTAT/JbGGaTxFO8D/Qfe79ajRivsksWf9vqbcqc7GnSF9/Zt1cLuVeAV4psCfpA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLaeFlk/kicynYXZyl3aqVFLxJM3MTSAbQJJsjYoN5U=;
 b=Ehb21sO2krP4e8kLhSvE6i73FK2jOjKl5OVudVwdHfme1GvXI+5RKHJGqitaatMBN0kUrg9HaOTHmoWZ4KtvAEjiz1x75luowj4pMAV7q9DYUZ3qmL/WfxlMLik7xjnFdS16C3jfegj+vVOl9h0v4kIYy/Rl0uG5cReV9FIkkPU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0810f347a890ac39
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp7FDeWMYf6LupGyVBRa2KxGWDHlnb0jgAGVahA34kX27Fho23ZYMfTBx/PyqB6GoO3XBXMzeHiwoAclAr6hK76UzGYX8b9gy3iZZGzKm9ufVahbR5vvslQHRZURoeP2k8/iViRa20cVJZKBFG91ffMFTvM9x00MmVUZ2TeOWBWabT0+8A0DP6c7H7ioX6oDq5RLX6huv05TCgY3kQGtyzFvG1K2ddRvhM8KdE/IjtSz0gBmWBVr2yqztc9fhGTdtP0o4M+AX8SUb4MSxHoh8Evsf9tTgQ5Sdq8CoER/QsNEP05TihYbwSK+dSHSu9pAa5935RuWp1yjM5xTlYHR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLaeFlk/kicynYXZyl3aqVFLxJM3MTSAbQJJsjYoN5U=;
 b=aXj/++6cPWSVyTUwvknPBJww0SRYHs6CaxqaWX/AfroFdfOc5C6JdNJR6GDpBipE2XD/DLPchvA7LFhJ5s8HhWp0k9KKNBU5EcuY25b9eroCzH98py0gSOAOIrI1DB6rRBxahaLv+eqhGz2tt2KpGAsT4KV2vepScv+rA9HtwfTzAULuGIkEbemot7gZMaCKkalIRYEC1vqyXw0HWAD9PHl6uxfF+bYGtwFF1fR6+Lm8dcUZMTX2yRUk9kkTntAxWwOy0TCk/7qFlN/DtMBAoBLnjdyssfty4ll0M1tPouz8QQfqeK4a7AMsmqjdfWRdVwhPiZ6eyVklZ5yBxbBIDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLaeFlk/kicynYXZyl3aqVFLxJM3MTSAbQJJsjYoN5U=;
 b=Ehb21sO2krP4e8kLhSvE6i73FK2jOjKl5OVudVwdHfme1GvXI+5RKHJGqitaatMBN0kUrg9HaOTHmoWZ4KtvAEjiz1x75luowj4pMAV7q9DYUZ3qmL/WfxlMLik7xjnFdS16C3jfegj+vVOl9h0v4kIYy/Rl0uG5cReV9FIkkPU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "leo.yan@linaro.org" <leo.yan@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Topic: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Index: AQHYweQzyVikzADCFE2Bfo+zYT5rgq3ToyoAgAABNgA=
Date: Wed, 7 Sep 2022 08:30:27 +0000
Message-ID: <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
In-Reply-To: <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4100d5ed-791a-4228-8d1d-08da90ab3c90
x-ms-traffictypediagnostic:
	AM7PR08MB5366:EE_|AM7EUR03FT050:EE_|PAXPR08MB7367:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hKvQWjrtTbXvtz4w4Osbq+GtuFvKuwzyiJuKMtjgZhGhIVrjQEGv1a/CriS0lfNb6GZ06R5doHhqhTik+prii2cTBYUhOQAivKP2Nq88YLdbki5ijJkXadl5f6VW6qEBlhdzzgCxZckXiZ7hV9rlKSVsW+TP6mdl3OZ80Fgh7N9bW9HvykAVjOnh5j55Vd2Knj1/UmUpN9isycWmr57LYwUPfkYGI5SSWRMInaDNP2fzbYpEy/YDejCPviSNB3lZB4dG8DUaTCi2DaOcSsbyMIOViUUcTPhMoBMPoZh8vWKi+RJCQktOsnNhyiq8Oyey5Lzp/51EidLkQZCfOjfILYeWKbvt32WqAYUlAfeNlMP9s7dufNBuu2LnVHm1T+FytfVmVtp3Nq5TDTCCcHQnt0Wl8csHbmHW3B32P/mtM4oNvtUbHuFKZPYRY+f1GqJtoNQ5Mn/TJiEZrrfw6cIcw+vcLr2iK5orBsxNs16CoXpY3BvZEmOKYFVt2biMNMYeO6ZBUpbqzFwHI0oOdxOGFNLXGs+YYmqnLpynl8WEX0lmgo9fsIkjxx4iCcRaHGfDYI0Rb8bnGwqpmUc+RqalU9R//IvYOV+SamAVunXSDPUcaBQGMv3n5JSfb2g5Bqw6ltVKHp/G8siKkpJ3RqBEGxZjXFFt+A8wsK6nlnqGmSWhJ1YNqeQTjLDxJY1H+1Z8Aw9+CjK+2m7G68+Kj0Uj0s63j3Jd6QiuBuM5t4jWy7v0OIZk3Dx4tRsIcAS4ntVW2c+YWBjo1gvmfG22rmM5esu6xoZw+29+hxbFo/5SSio=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(86362001)(91956017)(76116006)(66946007)(66446008)(66476007)(66556008)(4326008)(8676002)(64756008)(38070700005)(6916009)(54906003)(316002)(6506007)(53546011)(83380400001)(26005)(186003)(2616005)(41300700001)(71200400001)(6486002)(122000001)(6512007)(478600001)(38100700002)(5660300002)(2906002)(36756003)(8936002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5A8A137514AFC549A776848BBCC3D70D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5366
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eedc3d8c-369b-487b-08fe-08da90ab377b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FdVTnWI7yQVWPyuxGj3soZdSja6+9ikCBWVCTSyxWdBU4Shmpdi4MOok2SYFtXBt7qjz+hm+uKzhSHHuEcFwUfC4+DwgVn0VzoOtpEHfmkMVO1e3rswcEIEcLvM/DSOiaiqxHfuJ8371E7UEnxcWuXPBPSUU6YVthjFX7K5EQVMW7PM5WLDFm559K4AOeh9ahklnxbTzgsZ/uBE+ikAGq/U8XJ3p9j7AMrs6vPyBbZXozLovRbNI4aFstmRJ6Zi57YvhnAxiA9sEIQuAkdM9mqB4/FZTy3m2oQ0RSHUFRDocoJNf681s2TDnrhU3gzTV1PP55YB/mfaS740g+QfVkkvPwHy8MXwPEbhHmVMWeM4bwE7eGBnFGB3LS8mEnar9yA6CeaSClqtnzugrSta47mt2Iw2Z8g+P9mMtjdAsypg1fwZB4yGaIEQIfHlgHvxcoeaXb/aA3dpybIIZMKtwoSkLhP7FrS0akOy684r481QHHsE4NUzeaiunKu1qb5cLp3Z4CFG64lXDERjdgDNoQ436hZeOqWHVy47QHKs0fPnMPo/CBPy3yq58VOngYiUmKTbQr1pAft0l6sQhDEVUPbEMi1VHsgsn5egDwqTmd6vxbv6IR0fBZZAAowIYrtfEm4QwtqzXHF4JBnIVzwMHnxeyxCiqzv/MXbMI4c/5GLwslgJR+T9sXh3AbCUSxGkJzJqMTR7lTpEMpGpPc+NHCwOIr9owOYOxQgk8Eh2z07WDYqEv5jcGEaAwp3e4S9F0R8QOoUHU523LBLv/UPLiWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966006)(36840700001)(40470700004)(336012)(83380400001)(70206006)(186003)(40480700001)(4326008)(478600001)(2616005)(47076005)(70586007)(8676002)(82310400005)(6512007)(6506007)(41300700001)(33656002)(36756003)(53546011)(26005)(6486002)(40460700003)(81166007)(356005)(54906003)(86362001)(5660300002)(2906002)(36860700001)(6862004)(8936002)(82740400003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 08:30:35.5635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4100d5ed-791a-4228-8d1d-08da90ab3c90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7367

Hi Julien,

> On 7 Sep 2022, at 09:26, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Leo,
>=20
> On 06/09/2022 12:31, Leo Yan wrote:
>> On Arm64 Linux kernel prints log for Xen version number:
>>   [    0.000000] Xen XEN_VERSION.XEN_SUBVERSION support found
>> Because the header file "xen/compile.h" is missed, XEN_VERSION and
>> XEN_SUBVERSION are not defined, thus compiler directly uses the
>> string "XEN_VERSION" and "XEN_SUBVERSION" in the compatible string.
>> This patch includes the header "xen/compile.h" which defines macros for
>> XEN_VERSION and XEN_SUBVERSION, thus Xen can pass the version number via
>> hypervisor node.
>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>=20
> AFAICT, the problem was introduced when we split the ACPI code from arch/=
domain_build.c. So I would add the following tag:
>=20
> Fixes: 5d797ee199b3 ("xen/arm: split domain_build.c")
>=20
> Now, this means we shipped Xen for ~4 years with the wrong compatible. Th=
e compatible is meant to indicate the Xen version. However, I don't think t=
his is used for anything other than printing the version on the console.
>=20
> Also, the problem occurs only when using ACPI. This is still in tech prev=
iew, so I think we don't need to document the issue in the documentation (w=
e can easily break ABI).
>=20
>> ---
>>  xen/arch/arm/acpi/domain_build.c | 1 +
>>  1 file changed, 1 insertion(+)
>> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain=
_build.c
>> index bbdc90f92c..2649e11fd4 100644
>> --- a/xen/arch/arm/acpi/domain_build.c
>> +++ b/xen/arch/arm/acpi/domain_build.c
>> @@ -9,6 +9,7 @@
>>   * GNU General Public License for more details.
>>   */
>>  +#include <xen/compile.h>
>=20
> So this is fixing the immediate problem. Given the subtlety of the bug, I=
 think it would be good to also harden the code at the same time.

I think we should commit the patch as is and harden the code in a subsequen=
t patch.

>=20
> I can see two way to do that:
>  1) Dropping the use of __stringify
>  2) Check if XEN_VERSION and XEN_SUBVERSION are defined
>=20
> The latter is probably lightweight. This could be added right next to acp=
i_make_hypervisor_node() for clarify.
>=20
> Something like:
>=20
> #ifndef XEN_VERSION
> # error "XEN_VERSION is not defined"
> #endif
>=20
> #ifndef XEN_SUBVERSION
> # error "XEN_SUBVERSION is not defined"
> #endif
>=20
> Could you have a look?

There are actually several places in the code where we use the stringify sy=
stem.
Would it make sense to actually have a string version provided in compile.h=
 and use it instead ?

Otherwise if we start adding those kinds of checks, we will have to add the=
m in at least 3 places in xen code.

Cheers
Bertrand

>=20
>>  #include <xen/mm.h>
>>  #include <xen/sched.h>
>>  #include <xen/acpi.h>
>=20
> Cheers,
>=20
> --=20
> Julien Grall


