Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCE5AFEA2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400902.642530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqAa-00062X-1j; Wed, 07 Sep 2022 08:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400902.642530; Wed, 07 Sep 2022 08:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqAZ-000601-UP; Wed, 07 Sep 2022 08:12:23 +0000
Received: by outflank-mailman (input) for mailman id 400902;
 Wed, 07 Sep 2022 08:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVqAY-0005zv-VR
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:12:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbea583f-2e84-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 10:12:21 +0200 (CEST)
Received: from AS9PR06CA0273.eurprd06.prod.outlook.com (2603:10a6:20b:45a::13)
 by AM8PR08MB6563.eurprd08.prod.outlook.com (2603:10a6:20b:315::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 08:12:14 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::f) by AS9PR06CA0273.outlook.office365.com
 (2603:10a6:20b:45a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Wed, 7 Sep 2022 08:12:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Wed, 7 Sep 2022 08:12:13 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 07 Sep 2022 08:12:13 +0000
Received: from e4e4ba9b2f29.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D3A2FFC-3648-4B0A-B9AA-BDD80B8AD204.1; 
 Wed, 07 Sep 2022 08:12:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4e4ba9b2f29.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 08:12:03 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS2PR08MB9200.eurprd08.prod.outlook.com (2603:10a6:20b:59f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 08:12:01 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 08:12:01 +0000
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
X-Inumbo-ID: cbea583f-2e84-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Eby+4Hp1JFq7DxqTCrehLhuQ0huEYv0eHU5qtw5fHNapPbhLxD/j6mwjeZKkwQj+xnKwovvEDBiskYX4eaDel6bcB2idDszm63iVmfXfL2hK82CkMZaANKlm9ZNy/po5psE/Dkwqq0hojSxPpq3hszGQjYBZHQdvI71bs0ztorpckzedtBTY/HM8JXAGrFJ1CzPfoBaTcfhmYSG6pqO+FZf4TvJoonSCFvckh3veQnzUgyPrUh8nvus8tElVgbvRxeBdHHeYl9I2Dz9f3iHlJqkdsLyPIF0TzT072+00bJHd35YxHNnJs3N3O1y+1KQnY52SlT1nGPhnmPG0B4/fNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zN3M3oye3PQVSKA1Cv6n60rXXNpSR1XlSdPnXzHG6Ao=;
 b=a8gT03YaN8ylc8yarGM2kwg5rBouLH73xU3q8PNtKd3bzXB3JaGfvUIwOx2ibKfEe3+5voSAYlZ+JnwhfYNNJZwpZu3I9GDmokUjErBCxkH+/xzV1o4Y0C0n3AH0vgqSf4o5MQupf2c3Of0vsF9nixau+R4H7c4ZYdduEKfIlJGop/CI0CYZ+S/CgeehHMSrq86brVu8rPRVzDJ7AZB32f1W9B5HL90LpnmzjVZQ1cZ+S7ZphTgzLbqKFOnFGWZn8pTiKFZ5aTM7X4CvPfz3lGQc92NvHvsTlh6otEj+W0vMQ6sRL4rxNdfVcCQitxWPi+PDlomGcbZ46mG4CuVU1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN3M3oye3PQVSKA1Cv6n60rXXNpSR1XlSdPnXzHG6Ao=;
 b=D+DZ9s68nzfjQ1qUdjJVfFC11rjTOKlihqN54zWma0o913ef65GAUeju2AQkAPQF7/Nh6+3ZySDDSK8KI6ZTSCNZdY8YTgzaDN5cFojZcTeZBNFsQW5vPW25FvqoTorJ20B21ZwgeAqkfWPWBpdgYIW2E5FJ0aMPhr5BBC3MrZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b92b8caebd4e866
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEIczkK3QYFu0Nl2f3Lk+Kqq3cfvMNyOOHIzOBTz3a8qbFqqj+etgSJYDQzmaP2ZOnh4SNKxWIOQsKvi0waFhhBF+KCI4kOckfUkazcET5UD3BbwnoSAxsfZwIkJqBPxQstgIgW+B5KjIxjMk/9SVBnlnEaFrFmK8C/1nv1jo5ewBtWJeeG7DwI4AUv8TPqLJXi0VY3H8kg49jH+A0LFkLZqrnoao2quuAgjvbL0MV/wYPfBS6Dp0JLmM66yLMdYRbdyp6ynHg+SetP2O5mdYT1McbXAOW7beaYt4sN1KJBhMUOpAT2GhQWge1wARH/jCg8gvAFpb501M+OLFafOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zN3M3oye3PQVSKA1Cv6n60rXXNpSR1XlSdPnXzHG6Ao=;
 b=haEGYez9eyZLFyIODD2jgToxXpVQY/ndvdmv2ULRd6qT062sUy7pcZ/AUihQZm1JrfvleM+PrOUd1fbp5XH934aHRPwLXnwUpXK3KhQMkHnP9RcLG5Abnh8Tq9io5YiHUDd4CwC+6VK9JANuVR5lUiPoyekM0wrpE8xMjQHv5e05n1PrfWBMrsIjT4R+3V8ep85goovUNC1ZgjPdd0ziY01OTo5XzKo5gXGTQVaxk+X9M7m+oJbsjAurlUFqTxsqbeEmXAiYxFNjGsTkmhBqLyjGnrYlygegf78jQvxtI0Tfr4Bvukvdkucc3aacEC792YRGQDSb/MkyNjoQAw7MTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN3M3oye3PQVSKA1Cv6n60rXXNpSR1XlSdPnXzHG6Ao=;
 b=D+DZ9s68nzfjQ1qUdjJVfFC11rjTOKlihqN54zWma0o913ef65GAUeju2AQkAPQF7/Nh6+3ZySDDSK8KI6ZTSCNZdY8YTgzaDN5cFojZcTeZBNFsQW5vPW25FvqoTorJ20B21ZwgeAqkfWPWBpdgYIW2E5FJ0aMPhr5BBC3MrZM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 7/7] xen/arm: introduce xen-evtchn dom0less property
Thread-Topic: [PATCH v4 7/7] xen/arm: introduce xen-evtchn dom0less property
Thread-Index: AQHYwfa20pSXFn7Dg0K43MnT8B+Nhq3S+mGAgACkswA=
Date: Wed, 7 Sep 2022 08:12:01 +0000
Message-ID: <C1DB66B3-1B6A-4FFC-A3CF-15794EEBCD4D@arm.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
 <055660c342c85cd97d6e3a5551c84e62f49dece6.1662462034.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209061514150.157835@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209061514150.157835@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e56b68c1-485a-44b7-48b6-08da90a8abf1
x-ms-traffictypediagnostic:
	AS2PR08MB9200:EE_|AM7EUR03FT023:EE_|AM8PR08MB6563:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zo4T6JXee9lPkj0HMp74o+3ZS9pzHFigDtmzHB57MprHszBH5b1P8GbmJZyttC+AvzWznjn42lSXS2veHB+F3OIqLrWsW5vklNw85hZj/jGQx7XBX+ToSUpIkHfxz9hc40+WOQVSJif3kl/3OLu83Lvu8I+K+r2a1wx52hRsKFx5jEoFZr/sdMXMsvC67uLHgZxns6DBMHcVCq/+k0bHHJ2JHy3a8EFktAZDcfTTQF2qUh+qyTzUw3uFy8CuTMwSkoAaHEF+LeJ0fk2Bqehy4JDKfbstN/pPlXsbu3EzJMUeRYCCVzVU6vN7WRFwEIZH3cTtFUGbKZ9skv7DVr+ut1HxL7FuG7pRJt9oF4erIuGNX3glohyfmGgcsI2JU9GaG9n0sziHmhmd7ol6N/agJ3Sq4VFSCtY2+lBtjoS8mtaZ5XzJKlQyfsdNtCXI689BQcjeEctWYwwbdw5+pxdBFxW1rlRLp7TKvSp824AI/ncFTFAyACoT0d/yWKtnsKJ3Y4A+eKbRthALqM8ni2OklKQURLwgMvYauYrA+vTUCrYEwqBkwj8Dt1GUNag+h/1C3FRBZkuL1YYSaPkL5lEPJoEWkSh5E9N794WW0zsxOftHabwqUgUVf3mBjEuWEZs93FGldCYQ8O8AnCknQGtIxnQBnabeRR9YUH348PPHyaSjeSurfu1bxO+tlDrgichriVKofGJTjqoRDv7GsnjpRWDHs/cHWqkgOFVJtQDsxhpnlfaDTPkYKVzhLFm10SuDe0kuXnD5dq7FbE48rCrslkWQapjZC3YncejHHiV/0vZ0Pij20pl6Y9w0N7l+XR8S
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(122000001)(8936002)(33656002)(2906002)(5660300002)(66446008)(36756003)(8676002)(91956017)(64756008)(66476007)(66946007)(66556008)(38100700002)(76116006)(83380400001)(4326008)(316002)(6916009)(54906003)(86362001)(186003)(6506007)(2616005)(38070700005)(71200400001)(26005)(41300700001)(53546011)(478600001)(6512007)(6486002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0DAD74EF2912BD479F9F9ACC154659F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9200
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52a8dbef-18a9-481b-b88d-08da90a8a45b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OvLqKwVauZGQCDY14eWDXlEd5i4Wa4+/fvzjiMNGR264SdH4Cte7eGewNh3ByQ4s6Z6SCWYI2C2bo6uBZtcTQ0XtpfLhDaElMjWmwGXIDQYzxKdjHEcW/uJgin0QF3q2ufVme9ZpNFTM4qMPv21IkS5e4VMbIF0fE34vBldKR91NBBroxVplmfhPYcFHSas9NNrjML2MrLDd1mIcDzecaNVCJXjUf7hWKV3PsTo7pSP9GES1+0xS2l+2pCimzte6sUx9qCF2Y6Zhmc049wmj2YOuKKKbyro5QH14lvepZN2nw1Ka6Rn45dThA/d4sd2S54odAE7UmCjB2+VUHaGsHL0CCzxmsByvzkayM/vw5WwBSEuXZo3RonbtpS4XkuVU5Uf9Rx2akWu+YSk2d6hPUQV+YIXDBYNYJJn0qjSxZp1WrZTl03jwHt6cgvUbLMganToc6AGSpa2GZHRh4y11S+LAC43hxhsS5AlZGcXg52Dxy43KzYkXmV5AEgqlXSUC0krd8WIaJdr25sJ1I6hWeo8deCNMf5jHlqvo+Q+1PShuDFp+MSytSw5vXOdFmurGzPi0FPFkm6SiCgyflelGweoVubHlPuHPbjVWZHhZuQQrng98ukkYupASwNrXqmMY+91NMeQDVqD+HCl/vyGNycngqc35sbJQSmRWm8MYPUAKQBCE7zD6owGKVCJC5BmsqacLfQj6vd7zbJBN1KafXt7s8SkyNZKYnPh/pzxGUfNGW5pB128figXIXygKfQeaaddGPtNDd9MvADnDSZw2IFJURKaESy0IzN6Ro21Sa4g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(40470700004)(356005)(81166007)(36860700001)(82740400003)(40460700003)(316002)(70206006)(8676002)(70586007)(4326008)(54906003)(82310400005)(2906002)(6862004)(2616005)(8936002)(5660300002)(186003)(336012)(40480700001)(83380400001)(47076005)(478600001)(6486002)(6506007)(6512007)(26005)(53546011)(86362001)(36756003)(41300700001)(107886003)(33656002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 08:12:13.9343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e56b68c1-485a-44b7-48b6-08da90a8abf1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6563

Hi Stefano,

> On 6 Sep 2022, at 11:22 pm, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Tue, 6 Sep 2022, Rahul Singh wrote:
>> Introduce a new sub-node under /chosen node to establish static event
>> channel communication between domains on dom0less systems.
>>=20
>> An event channel will be created beforehand to allow the domains to
>> send notifications to each other.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v4:
>> - move documentation to common place for evtchn node in booting.txt
>> - Add comment why we use dt_device_static_evtchn_created()
>> - check if dt_get_parent() returns NULL
>> - fold process_static_evtchn_node() in alloc_static_evtchn()
>> Changes in v3:
>> - use device-tree used_by to find the domain id of the evtchn node.
>> - add new static_evtchn_create variable in struct dt_device_node to
>>   hold the information if evtchn is already created.
>> - fix minor comments
>> Changes in v2:
>> - no change
>> ---
>> docs/misc/arm/device-tree/booting.txt |  98 +++++++++++++++++
>=20
> I have just reviewed the binding, only three minor comments below.
> Everything looks good.

Thanks for reviewing the code.
>=20
>=20
>> xen/arch/arm/domain_build.c           | 147 ++++++++++++++++++++++++++
>> xen/arch/arm/include/asm/setup.h      |   1 +
>> xen/arch/arm/setup.c                  |   2 +
>> xen/include/xen/device_tree.h         |  16 +++
>> 5 files changed, 264 insertions(+)
>>=20
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 1b0dca1454..c8329b73e5 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -382,3 +382,101 @@ device-tree:
>>=20
>> This will reserve a 512MB region starting at the host physical address
>> 0x30000000 to be exclusively used by DomU1.
>> +
>> +Static Event Channel
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +The event channel communication will be established statically between =
two
>> +domains (dom0 and domU also). Event channel connection information betw=
een
>> +domains will be passed to Xen via the device tree node. The event chann=
el
>> +will be created and established in Xen before the domain started. The d=
omain
>> +doesn???t need to do any operation to establish a connection. Domain on=
ly
>=20
> doesn't
>=20
> better to use ASCII if possible

Ack.
>=20
>=20
>> +needs hypercall EVTCHNOP_send(local port) to send notifications to the
>> +remote guest.
>> +
>> +There is no need to describe the static event channel info in the domU =
device
>> +tree. Static event channels are only useful in fully static configurati=
ons,
>> +and in those configurations, the domU device tree dynamically generated=
 by Xen
>> +is not needed.
>> +
>> +To enable the event-channel interface for domU guests include the
>> +"xen,enhanced =3D "no-xenstore"" property in the domU Xen device tree n=
ode.
>=20
> double ""

Ack.=20
>=20
>=20
>> +
>> +Under the "xen,domain" compatible node for domU, there needs to be sub-=
nodes
>> +with compatible "xen,evtchn" that describe the event channel connection
>> +between two domUs. For dom0, there needs to be sub-nodes with compatibl=
e
>> +"xen,evtchn" under the chosen node.
>> +
>> +The static event channel node has the following properties:
>> +
>> +- compatible
>> +
>> +    "xen,evtchn"
>> +
>> +- xen,evtchn
>> +
>> +    The property is tuples of two numbers
>> +    (local-evtchn link-to-foreign-evtchn) where:
>> +
>> +    local-evtchn is an integer value that will be used to allocate loca=
l port
>> +    for a domain to send and receive event notifications to/from the re=
mote
>> +    domain. Maximum supported value is 2^17 for FIFO ABI and 4096 for 2=
L ABI.
>> +    It is recommended to use low event channel IDs.
>> +
>> +    link-to-foreign-evtchn is a single phandle to a remote evtchn to wh=
ich
>> +    local-evtchn will be connected.
>> +
>> +Example
>> +=3D=3D=3D=3D=3D=3D=3D
>> +
>> +chosen {
>> +
>> +    /* one sub-node per local event channel */
>=20
> It would be good to say that this is for dom0 in the comment, e.g.:
>=20
> /* this is for Dom0 */

Ack.

Regards,
Rahul


