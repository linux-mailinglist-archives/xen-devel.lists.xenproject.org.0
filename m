Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38741B2AD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 17:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198074.351396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEmD-0002oE-Nc; Tue, 28 Sep 2021 15:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198074.351396; Tue, 28 Sep 2021 15:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEmD-0002lg-K7; Tue, 28 Sep 2021 15:12:13 +0000
Received: by outflank-mailman (input) for mailman id 198074;
 Tue, 28 Sep 2021 15:12:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUli=OS=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mVEmC-0002l2-57
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 15:12:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bae79525-66e4-4c5f-b46f-c60b7c70617b;
 Tue, 28 Sep 2021 15:12:09 +0000 (UTC)
Received: from AS8PR04CA0111.eurprd04.prod.outlook.com (2603:10a6:20b:31e::26)
 by PA4PR08MB5919.eurprd08.prod.outlook.com (2603:10a6:102:e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 15:12:00 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::4d) by AS8PR04CA0111.outlook.office365.com
 (2603:10a6:20b:31e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Tue, 28 Sep 2021 15:11:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 15:11:59 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Tue, 28 Sep 2021 15:11:57 +0000
Received: from 7935e80e6af2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7C3994A-438D-489C-87FA-1DAAE49CD76B.1; 
 Tue, 28 Sep 2021 15:11:46 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7935e80e6af2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Sep 2021 15:11:46 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6174.eurprd08.prod.outlook.com (2603:10a6:102:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 15:11:42 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 15:11:42 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0055.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:153::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Tue, 28 Sep 2021 15:11:41 +0000
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
X-Inumbo-ID: bae79525-66e4-4c5f-b46f-c60b7c70617b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsYrC3/DJRwMFnLrXNHdwi3JPyH45hO+HXgH9FQ6r8Q=;
 b=TyRbDERXsFCpF55ctNsIEO4VnDx4+n5OdZeOppUkXbyGexissv+nLGfk5TasAmoWvCmHwYBOUdZnNTqRwacuoCSC/utYMwru7pPjuLRxsL4+jL9iXYuHULf+2Kb26i73znN6MyeXqGfN1RtsK9bblMJGp6dgUa8wSgRDw2/2Xl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5070607af8961cdc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUowX1yFkmqfoJJo0iD+8wODDFQ2/a0QOD0O0AAxNu9ixYygfEn98kMuZf8UhjXntRqGxBXOeNR4MQiwhTc7+woIklC5uxEu3vcRrzKo+u02mV27bEr8JYQgY+aLx48bi22yJg0dKsIeChp6KHeM3rRFy4+m6oKWSoXDfLUv0b7X5eyyV0n52kUBKhQmnBwHxevqI3UqgsZQIV7rSPM9nr1wykhBQ+UQeUztu1dDl8fTjaFzyI+u3VNGe5bfAZlGgUx0v7RXjIZfDXb+RTrgKzl/PZ+AFWpxBhHwaxEv4jCzBOSwCRLsV5xsxTXSdUsm87fzZVPKimf7pIDGFxTiig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZsYrC3/DJRwMFnLrXNHdwi3JPyH45hO+HXgH9FQ6r8Q=;
 b=NP9+/QSzZYeCEBqR/j+y1+9ujYo9C5ZaY0kLSWBZyr6aJTUQMBxnFEyxwDd6MTEONl89RgVsUuRKuAnRHge11ZOoU2aHXpC4VjwdKomL7aNU4pT1jpMppDMSDPttv01+SPefxKeVs3eItb8cn6lP4raj/E72FvWcApFNcmlqMp9/Er7SIVGQ4uKYtdC3TUbgTKk1GVrLcHFh7fJv66KQFLcCt+ZkJQ+lilRhYav18mADFOBxqDFCIN7n+wYL8y6LvHL2zhHJ5VuMUIE0nGGktkAFxRzf4MQmSGSWmXRFrPcQk70qy6TWuD9fTEfTEuWJqo1UAeCj25b3Kgt5h5hOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsYrC3/DJRwMFnLrXNHdwi3JPyH45hO+HXgH9FQ6r8Q=;
 b=TyRbDERXsFCpF55ctNsIEO4VnDx4+n5OdZeOppUkXbyGexissv+nLGfk5TasAmoWvCmHwYBOUdZnNTqRwacuoCSC/utYMwru7pPjuLRxsL4+jL9iXYuHULf+2Kb26i73znN6MyeXqGfN1RtsK9bblMJGp6dgUa8wSgRDw2/2Xl8=
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [XEN PATCH v5] xen: rework `checkpolicy` detection when using
 "randconfig"
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210928150451.786582-1-anthony.perard@citrix.com>
Date: Tue, 28 Sep 2021 16:11:35 +0100
Cc: xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <018FB4C2-2995-4295-A53A-87485AA45FF7@arm.com>
References: <20210928150451.786582-1-anthony.perard@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::6) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d0c3bfd-036b-48c5-8296-08d98292516c
X-MS-TrafficTypeDiagnostic: PA4PR08MB6174:|PA4PR08MB5919:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB59191EA746AA437EDA4F4E0DE4A89@PA4PR08MB5919.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2wUkLL1dIjrJ1esWcOF6IWQMoFbcas7DoLdcMLhJG5+Hh7XcOG5aCV24dQkCGZwJWSc4tWlbC4XRQCEdDSG+AuWu6IUdgNBEFHyhwZWa8sRnq+elxAGo31QqEtkHli8zJPqnJf0rY7RVqVwqMjdd5qEozl4ekhE+6yIXQ81GJAefnKja4b/k/l0QRMu2jpfI412wEaFBFNnpJMqLSCWaffFim0D+XA2Dz0B/QOrR0MYsIYWsiOZ8ovQtzySKzT2WdxFBB5rk86s+tYS823XuTgXA9NSZr6+EtZzaMV79JWdVudJKIpn28e4M9r/XaligUbPJS9ECGvLCn9BaxZr9BIulp6p4X53z/obkeO6xG2i7rR90fcAiVcZoKvGBofk/fRLGHgSkUSMberfAhw2/keqQJN3n4ykU6c0jSRN+tPzpDATrHlsn80d7Ptd0o7b9jqoHJbG/quo6i2MfkW7Zj/Mq/nf4iPUWE5z1DYLSigMbgkrwkvHhYL3qugMNyO7oDbWQI3pwC1D2FL+xqdZmBR4+TN+SjdgAIMP3V9ZRF5FuVz48BtqCEUkfDWRtY3lzY0j4pNJAeHMYG2EqRH1+j3U2u313hudkHi7gPcxSpif007k8e5PriErQMcR5g3rmSAPZaldi8N7TDBbvBlLpM5E/QCe+B2Hu+/2DS/n8a3Qai95cJDF3lVN2NjBrWDVKiJAKi8BdCc4d6LeCv2B+JwtjCcx6sp1Vp3FW7nV5G/T8qrYbp/vAvcR+R3iDyxZSXSQxqP5H5thF+gQv2jlHaQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(4326008)(36756003)(8936002)(38100700002)(66476007)(8676002)(66556008)(38350700002)(86362001)(83380400001)(508600001)(5660300002)(6916009)(956004)(2616005)(6486002)(6512007)(186003)(6506007)(2906002)(54906003)(26005)(44832011)(53546011)(33656002)(52116002)(6666004)(316002)(81973001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6174
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40c3f6ae-73d2-4532-8227-08d982924701
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WeLAy8RDUPk6yktWmTH25YOJ/9ektkk3oiixY1i/fZgXBCzAXY8cR5yyYYiWPNI1Jw6Ayav58M4LIIDBfmCEWIgNybgJtH8WKhOHt57m4X2rsucbg6zV3q+eAmRQEHvrlYqUGnJkjpRaV4yyVx9MybmbvBH6odIkbDOqyuX8DCEl9ACOOGcZxGLjKy+dgCs1fGAobYE/huEXI0bcNj2tdPfteD9pek5uvgbweVfVShB3txBpCd0vUr6s9XeHrpLOwnEKKkC7073rTcgZaeqD2TEqst0FBgXckk0mTtL/xzSdchUO7SkfWmlTaetml/aCMnIYNmKm37GghrvK01fyOmcnN91E4imc4IDBbNGYwd44R2sAkZHGvCcwg9sx9zIEHZRIus6/cdYV6g256Wm88ArftkbhIxTnz/WOEga8gbmBBGPwL4RsRr2LWEzxuvI6kXVa6rv46ZmeyF3NnfZRJGyDbAlWA5Bk2TMKqoy2NkCAzNu9MFrXlCcn4/Q4YA6oRDLfRFF0iQE9RzS7br9IlWg6KEgM3h9RSleo7rOs4Y67GofDU8QhqTFE9phc0Whvz58GzUOsBkuGXccRaiL03NLuBJ7Z3DWP4D/QOmwAx55GKRYlYa6tUV7UDYLchvTaTEGJTuVkelVQrL7hDmUuiluklikgva5QiqAAjcfK6py4sdXQ14MVO3vIde7POifJ7gV8Y9LzKGuiwc0X7agXxjHF6NoGyDPOowakYQDtPLo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(8936002)(6506007)(6512007)(44832011)(4326008)(336012)(356005)(508600001)(2906002)(81166007)(54906003)(82310400003)(86362001)(33656002)(8676002)(956004)(26005)(316002)(186003)(6666004)(83380400001)(6486002)(47076005)(53546011)(70586007)(36860700001)(2616005)(6862004)(5660300002)(70206006)(81973001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 15:11:59.1928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0c3bfd-036b-48c5-8296-08d98292516c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5919



> On 28 Sep 2021, at 16:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> This will help prevent the CI loop from having build failures when
> `checkpolicy` isn't available when doing "randconfig" jobs.
>=20
> To prevent "randconfig" from selecting XSM_FLASK_POLICY when
> `checkpolicy` isn't available, we will actually override the config
> output with the use of KCONFIG_ALLCONFIG.
>=20
> Doing this way still allow a user/developer to set XSM_FLASK_POLICY
> even when "checkpolicy" isn't available. It also prevent the build
> system from reset the config when "checkpolicy" isn't available
> anymore. And XSM_FLASK_POLICY is still selected automatically when
> `checkpolicy` is available.
> But this also work well for "randconfig", as it will not select
> XSM_FLASK_POLICY when "checkpolicy" is missing.
>=20
> This patch allows to easily add more override which depends on the
> environment.
>=20
> Also, move the check out of Config.mk and into xen/ build system.
> Nothing in tools/ is using that information as it's done by
> ./configure.
>=20
> We named the new file ".allconfig.tmp" as ".*.tmp" are already ignored
> via .gitignore.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> v5:
> - remove changes to common/Kconfig in order to avoid change in
>  behavior for "default y if m" in future Kconfig update as the current
>  behavior doesn't seems to be explicitly documented.
>=20
> v4:
> - keep XEN_ prefix for HAS_CHECKPOLICY
> - rework .allconfig.tmp file generation, so it is easier to read.
> - remove .allconfig.tmp on clean, .*.tmp files aren't all cleaned yet,
>  maybe for another time.
> - add information about file name choice and Kconfig change in patch
>  description.
>=20
> v3:
> - use KCONFIG_ALLCONFIG
> - don't override XSM_FLASK_POLICY value unless we do randconfig.
> - no more changes to the current behavior of kconfig, only to
>  randconfig.
>=20
> v2 was "[XEN PATCH v2] xen: allow XSM_FLASK_POLICY only if checkpolicy bi=
nary is available"
> ---
> Config.mk    |  6 ------
> xen/Makefile | 20 +++++++++++++++++---
> 2 files changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/Config.mk b/Config.mk
> index e85bf186547f..d5490e35d03d 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -137,12 +137,6 @@ export XEN_HAS_BUILD_ID=3Dy
> build_id_linker :=3D --build-id=3Dsha1
> endif
>=20
> -ifndef XEN_HAS_CHECKPOLICY
> -    CHECKPOLICY ?=3D checkpolicy
> -    XEN_HAS_CHECKPOLICY :=3D $(shell $(CHECKPOLICY) -h 2>&1 | grep -q xe=
n && echo y || echo n)
> -    export XEN_HAS_CHECKPOLICY
> -endif
> -
> define buildmakevars2shellvars
>     export PREFIX=3D"$(prefix)";                                         =
   \
>     export XEN_SCRIPT_DIR=3D"$(XEN_SCRIPT_DIR)";                         =
   \
> diff --git a/xen/Makefile b/xen/Makefile
> index f47423dacd9a..7c2ffce0fc77 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -17,6 +17,8 @@ export XEN_BUILD_HOST	?=3D $(shell hostname)
> PYTHON_INTERPRETER	:=3D $(word 1,$(shell which python3 python python2 2>/=
dev/null) python)
> export PYTHON		?=3D $(PYTHON_INTERPRETER)
>=20
> +export CHECKPOLICY	?=3D checkpolicy
> +
> export BASEDIR :=3D $(CURDIR)
> export XEN_ROOT :=3D $(BASEDIR)/..
>=20
> @@ -178,6 +180,8 @@ CFLAGS +=3D $(CLANG_FLAGS)
> export CLANG_FLAGS
> endif
>=20
> +export XEN_HAS_CHECKPOLICY :=3D $(call success,$(CHECKPOLICY) -h 2>&1 | =
grep -q xen)
> +
> export root-make-done :=3D y
> endif # root-make-done
>=20
> @@ -189,14 +193,24 @@ ifeq ($(config-build),y)
> # *config targets only - make sure prerequisites are updated, and descend
> # in tools/kconfig to make the *config target
>=20
> +# Create a file for KCONFIG_ALLCONFIG which depends on the environment.
> +# This will be use by kconfig targets allyesconfig/allmodconfig/allnocon=
fig/randconfig
> +filechk_kconfig_allconfig =3D \
> +    $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo 'CONFIG_XSM_FLASK_=
POLICY=3Dn';) \
> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
> +    :
> +
> +.allconfig.tmp: FORCE
> +	set -e; { $(call filechk_kconfig_allconfig); } > $@
> +
> config: FORCE
> 	$(MAKE) $(kconfig) $@
>=20
> # Config.mk tries to include .config file, don't try to remake it
> %/.config: ;
>=20
> -%config: FORCE
> -	$(MAKE) $(kconfig) $@
> +%config: .allconfig.tmp FORCE
> +	$(MAKE) $(kconfig) KCONFIG_ALLCONFIG=3D$< $@
>=20
> else # !config-build
>=20
> @@ -368,7 +382,7 @@ _clean: delete-unfresh-files
> 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} =
\;
> 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map=
 $(TARGET)-syms $(TARGET)-syms.map *~ core
> 	rm -f asm-offsets.s include/asm-*/asm-offsets.h
> -	rm -f .banner
> +	rm -f .banner .allconfig.tmp
>=20
> .PHONY: _distclean
> _distclean: clean
> --=20
> Anthony PERARD
>=20
>=20


