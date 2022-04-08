Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3764F9443
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301440.514444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmvu-00005N-7x; Fri, 08 Apr 2022 11:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301440.514444; Fri, 08 Apr 2022 11:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmvu-0008Tg-3L; Fri, 08 Apr 2022 11:37:42 +0000
Received: by outflank-mailman (input) for mailman id 301440;
 Fri, 08 Apr 2022 11:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zQ4=US=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ncmvs-0008Ta-DO
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:37:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe08::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4af5b07c-b730-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 13:37:38 +0200 (CEST)
Received: from AM6PR0502CA0059.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::36) by AM0PR08MB4498.eurprd08.prod.outlook.com
 (2603:10a6:208:13c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Fri, 8 Apr
 2022 11:37:28 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::12) by AM6PR0502CA0059.outlook.office365.com
 (2603:10a6:20b:56::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25 via Frontend
 Transport; Fri, 8 Apr 2022 11:37:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 11:37:27 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Fri, 08 Apr 2022 11:37:26 +0000
Received: from 26f709ce624a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6956AB34-AE89-4F68-86E4-B4953F5B6912.1; 
 Fri, 08 Apr 2022 11:37:17 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 26f709ce624a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Apr 2022 11:37:17 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AS8PR08MB6022.eurprd08.prod.outlook.com (2603:10a6:20b:295::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Fri, 8 Apr
 2022 11:37:14 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 11:37:13 +0000
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
X-Inumbo-ID: 4af5b07c-b730-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrjB8naPO4x5SjcD2RVl8FjfX+vJZzCnoJ6YTmMHkjk=;
 b=RhxRzCoHfCujjrMPZ7dBSdghwbKNk0o6f+voaw43LMcwFG7IMEn2xWwovsrVE1JywF8tk2ibnysenee1EMPqpiec7PWFLERrNrkS/tQVlgo6OPGicEZhElQKGhkZBB1rUDJdRm7M4VXE4oIwwljVKbeZSbIS+xX0RMuJUk4ye/Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 956d90d0bbea9ed6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPOdEu7/e/b5bsMDeMiR0wGsAb8/7mx5fEp+4z34ZcJIKwSbdJuEoejfdrmU6iSYdKHHSecpJIqas1HVYovuGIcMsnX3NKI9Qzrhj+7vVxFKdWoROg4644idQx3pRRbLK+sE4R8Wd75hpb0NUhp8xYSEgK3sSJT4YJZ67dTX5OpyNDztZXIhkWo5p2GWkNSoBIFPNkacF5q01zPuIrUKVomJbHv0qqHcvBL+0d9CsZDcO0mh/QKykAo9xXHzCrPvonnF3AB35O9nvP3kPmFWGwYEnPf3vmptNaSDFLNhj03bKf38LRycq+BQIokNnpUKvBOg8PKMuHDQZrlZrXkuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrjB8naPO4x5SjcD2RVl8FjfX+vJZzCnoJ6YTmMHkjk=;
 b=GxMCQByEfaLUlX5dAcrCEiwCPSQI/PeClTruYLXbmeyGeEn/rje1cMhrENqD4+kiyiPy5rj/uSM+n8VKZiH0l7k/M+endRgEP2qzbIoDSoEzihd8dJG4gGxzrVVr4UJNFWCFelE3NbGGS+CsGYMAkvBrgswkdTYShJ8vBPZxPandMXKxKogdzQU6ibN9IYbfh18q1xFOLkS0njsWP7w5Gh7rWq/TB3JE3v9dhYHp+0HkRfQt9GBAcQVPY1tm9shJa9vL5u05n6gw/fainisPJ1Owd3DvlboBilpGGa2Z5WlhEFsWCZMbHHVcLkK19yKVMVqjoP+jmQCqPrjYG8oHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrjB8naPO4x5SjcD2RVl8FjfX+vJZzCnoJ6YTmMHkjk=;
 b=RhxRzCoHfCujjrMPZ7dBSdghwbKNk0o6f+voaw43LMcwFG7IMEn2xWwovsrVE1JywF8tk2ibnysenee1EMPqpiec7PWFLERrNrkS/tQVlgo6OPGicEZhElQKGhkZBB1rUDJdRm7M4VXE4oIwwljVKbeZSbIS+xX0RMuJUk4ye/Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYSyUg2T6WkJDiXECW3myZV3L//qzluEIAgAArbIA=
Date: Fri, 8 Apr 2022 11:37:13 +0000
Message-ID: <4F1CCE02-DC8C-478C-AFFC-A67290188ECB@arm.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
 <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com>
In-Reply-To: <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a7f404d2-e735-4b97-682b-08da19542871
x-ms-traffictypediagnostic:
	AS8PR08MB6022:EE_|VE1EUR03FT008:EE_|AM0PR08MB4498:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB44981261F735E87B3EC09155E4E99@AM0PR08MB4498.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D54Dna3aOqXECl4TA6KpKkRLupm3gVn+tVIlNgen27kjoTZ0RVgZvHe3Kd6wmfBF8hX/tr01zIky+60eHUthgLeYoE5OzbfF25PXKkATcuQTjXqlxSYdsvp0h/VAPszrEHWxVi8nLAF7ODXnc6io8QxWKKu/SJ+qCPJDc6HszTxtDZI6lJS4RKysIRJqlk597zJiq8+Z60z3OLw9VG3ZQY4/FIJpDN5ze59BlYpkXLu2hVrm8Khpxycj/TPJD8H+L7gy5UbTOqp44SOJ1PsO1u3mf6gpEYRBS9YLfQSniMcbz8j5kNFpKwqOpVNhRIwst33MESTV2zohB5X8k/OUri04hf/7qANVX5LhWyrNRvHZsnMc20bj9dz1B8IuQTS/s9Qs33KdF63JWsWHSpQSbR/Jq6rirgdEAp8lNFu6KfOA3Sf3icc5TjxsimsC34PMBUu4qOdmUe6U5JbnjezrfoNhObV36PLI27JvmOSD8+bLc+j2O9gHx3ogjnCWhYn7Lb4Fha3MG+lcKczSIRAJ04HYqQyXePu4feWS9vv2Q4otAjw5tWc9V50Nq5SqRy1bQFxoalKgspSn7ZK92wavcFx47tS9jk3J5rczqfYiZek/aHmHgYppmVEafjkLOYq6/RtVK5IpfQGOl8asppym7jNsqYVF801nQGDfHPaey35dQAecJbnNoxrEEQLOX7iIf14dCu2JlKFUCARk/uNhwhkLOGvFwSvZUvQakE92n0PzJTgRgSe7mWwLFwKMtbaE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(316002)(7416002)(66946007)(76116006)(83380400001)(36756003)(66446008)(33656002)(38070700005)(6916009)(8676002)(5660300002)(54906003)(71200400001)(2906002)(508600001)(86362001)(6486002)(4326008)(64756008)(8936002)(66556008)(66476007)(26005)(122000001)(2616005)(6512007)(53546011)(186003)(38100700002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C1083D84872D2948B465EF37A6148842@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6022
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f978769-1875-4b26-c7b3-08da19542084
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kdxUaW2Ikb0H3ZSdvOAqaSafh11bMpAo3oMeIr+rVwVbrFYMoI0vny/RjFmFnGqNT9CGqQPMfsnFuXdXEueryVumqL6NtooANc8uN/vuM+iiTW0WN89fnzhel+NTTzZjv2ZcKq9vccVCAln8UZfomxey9fQFXTCTEejYkWE1UcnTRTmpnEg3T4GvfW6qgP+DUshSY2Hn9OgX2N+ucdfcLHV40P4rw8PWqrnC06pT1JS1w/n9FptfcvcoLoY1N6L0ZLiyRWou5we5fYnbUuQ7xNqqY/cy0vHHFajSyRK3BbitjGvCkSN+qp9Iyvd7maYq/6XfkL22jwLahbbwQjPf4gGN4qzlkaNDvu0Ita7TbFsrPoBetYea7R7BplQr3o/Z/jx22LMhcpvpNcl+n6JMnDPG/K4Bp93GIFyrDlR632P1YRsoMLseSFtsEZ7galnT/bflhqMsvMjHi1i5FhYAYYc5T8gHEbIGgWvX0B/ce8cz+yuNwefXY/DlAQmOWG8HWi7rIywaH4qbyIAgiiyMxCiFlDkrXuskT2b90CfCdpsZr/CLrTjYUKquLeyXiCfAxOX/+sMYtFvY9sZYU+FUhgOJRy2lvllIpr6KwXRofk7vW/bcxzNOzH5PlDhznM1fgL/77qJTtrmiLQiokdhE7ZL27nLHt67OHYhLKpwxogUFEs5QwAdAbSBtR6HOfa6l
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(40460700003)(70586007)(33656002)(8676002)(336012)(2906002)(83380400001)(8936002)(6486002)(54906003)(82310400005)(36860700001)(6506007)(2616005)(53546011)(508600001)(356005)(70206006)(26005)(186003)(6862004)(5660300002)(4326008)(47076005)(36756003)(81166007)(316002)(86362001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 11:37:27.1720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f404d2-e735-4b97-682b-08da19542871
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4498



> On 8 Apr 2022, at 10:01, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 08.04.2022 10:45, Luca Fancellu wrote:
>> ---
>> docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
>> xen/arch/arm/include/asm/smp.h         |   3 +
>> xen/common/Kconfig                     |   7 +
>> xen/common/Makefile                    |   1 +
>> xen/common/boot_cpupools.c             | 207 +++++++++++++++++++++++++
>> xen/common/sched/cpupool.c             |  12 +-
>> xen/include/xen/sched.h                |  14 ++
>> 7 files changed, 383 insertions(+), 1 deletion(-)
>> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>> create mode 100644 xen/common/boot_cpupools.c
>=20
> Under whose maintainership is the new file to fall? Without an
> addition to ./MAINTAINERS and without the file being placed in
> xen/common/sched/, it'll be REST maintainers, which I think would
> better be avoided. Would it perhaps make sense to have this as
> xen/common/sched/boot.c, allowing other boot-only code to
> potentially be moved there over time? This would then also avoid
> me asking about the underscore in the file name: Underscores are
> a somewhat artificial thing for use in places where dashes can't
> be used. Yet in the file system dashes are fine, and dashes are
> (slightly) easier to type.
>=20

Ok I can put the new file under xen/common/sched/ as boot.c, should this ne=
w
file be under this section?

CPU POOLS
M:  Juergen Gross <jgross@suse.com>
M:  Dario Faggioli <dfaggioli@suse.com>
S:  Supported
F:  xen/common/sched/cpupool.c
+ F:  xen/common/sched/boot.c


> Jan
>=20


