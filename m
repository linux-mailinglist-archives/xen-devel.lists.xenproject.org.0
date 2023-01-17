Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0900166E317
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 17:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479601.743548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoV1-0003Ov-Iq; Tue, 17 Jan 2023 16:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479601.743548; Tue, 17 Jan 2023 16:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoV1-0003M2-Fb; Tue, 17 Jan 2023 16:07:47 +0000
Received: by outflank-mailman (input) for mailman id 479601;
 Tue, 17 Jan 2023 16:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKDY=5O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pHoUz-0003Lw-M4
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 16:07:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12ec1e5e-9681-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 17:07:43 +0100 (CET)
Received: from DB6P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::21) by
 DB9PR08MB9513.eurprd08.prod.outlook.com (2603:10a6:10:459::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.19; Tue, 17 Jan 2023 16:07:34 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::b4) by DB6P191CA0011.outlook.office365.com
 (2603:10a6:6:28::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 16:07:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 16:07:33 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Tue, 17 Jan 2023 16:07:33 +0000
Received: from 3dc1911535da.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D60DC58-C687-4A40-B0F3-051765C9143C.1; 
 Tue, 17 Jan 2023 16:07:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3dc1911535da.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Jan 2023 16:07:27 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8567.eurprd08.prod.outlook.com (2603:10a6:20b:566::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 16:07:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 16:07:24 +0000
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
X-Inumbo-ID: 12ec1e5e-9681-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z69IK5eg1Yp044CEQuWKET+1p83MKuIf4gLfd4BkkmE=;
 b=g4aku8fUV8bak64QziFQmVqFb0CF7EFHo4P7gKv/zz3ymaRsZhIj3boTGvCBC2PHVi4yo0AwcRO/gi6oTlBhmIaxcKLYOCIGmgeHYBjg/hkrl0oMVTtDp4pkp/Zt0ZXybHewQrcvWlRCkFEFvtpoS5bK9o4N1WydwOAkCi/a8BE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1cdf1ece433958c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+A8/gVUjsRV7JpbHQce16/2jBGSyYNL0wfP+XQORnhsyU6f6kqJm8PckazRqxGbeRbXy7hHLsGQa0sWUutFd8bKExPZrfiA5c3EYvjjXIGGoW5/US/xpEL2QQ1TfY9YwhRz8XJZ8p0wmiGQETp6qcVEvlqOBm2RBAO2bnLbp+F+iU/Pi8oLAzA6VMFL23czdKFlnz7oUa0r6tgHnQey2wEf3fzqBYG+Zw+yhadH0LROK2xBDEwMtBDO6hmg2uDfx5kmRSOLJMXqcHwx1lf+G+s+H09kzVIPFNqO23S8STH8gNsXxhqFmUe54J7yiGQUSyPZdW7mZmBxc7lGtBt6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z69IK5eg1Yp044CEQuWKET+1p83MKuIf4gLfd4BkkmE=;
 b=bx+8VA8RRi6xPnrLgKu+BwkqIO4mEG+qL9CT5vDd88Ta6RSa3e8bldnTw7lTaXV/JP77nBn1qzvuKh7oksK6UKnrjyYuxvHLxZIX4gW2WqoIIaSn5kFKwEbBgI/hZM/zWaPf13UiWPb9H7CTJxlfWdUs6dTJtStCX4vyecxmY81/T/hyErVXX+7XEDYSHBOfkS8f3J/cCZzIxix1ThBDDXNLVO3XyiUlFHgOYsE5/co4If/+bbgcJUxorynQnbzWAoypmZWdLP6RuphOJsqDyZyykiz3LhJ5hLza6B0Xu/QyjMc+Vmr834o2TlreBy7SO/Ku8iugKYQZUiLLtjIQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z69IK5eg1Yp044CEQuWKET+1p83MKuIf4gLfd4BkkmE=;
 b=g4aku8fUV8bak64QziFQmVqFb0CF7EFHo4P7gKv/zz3ymaRsZhIj3boTGvCBC2PHVi4yo0AwcRO/gi6oTlBhmIaxcKLYOCIGmgeHYBjg/hkrl0oMVTtDp4pkp/Zt0ZXybHewQrcvWlRCkFEFvtpoS5bK9o4N1WydwOAkCi/a8BE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Topic: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Index: AQHZKdYEuIagcBo/xkCEsH1joQzNJq6ix9mA
Date: Tue, 17 Jan 2023 16:07:24 +0000
Message-ID: <399DE18D-39B4-4BC6-940F-09864D4BEEE5@arm.com>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
 <20230116181048.30704-2-anthony.perard@citrix.com>
In-Reply-To: <20230116181048.30704-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8567:EE_|DBAEUR03FT057:EE_|DB9PR08MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1fc631-4e04-483e-983a-08daf8a4f192
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7YXPiyXblIceN/TsSHgadoHUv3TaV9YWpROvYnztyrRm1UftKT/ZNoW5dSfk6Nqy0+rq0Hzbl6Lyl5c4rHBFc+1EIbOonFabG0o6FLA5qHIY+1ATT6u0Qm03CxgNjgBTmBi2n3NKeCwByTgSr+9TXl8TlbOGs+qSzMcdtF89N/5YQRMicrMVM1baExTG9gwpOuTsmFBjckyuROANvS1gUQd7lQjd/cXR5TUtCtfJYcurAUQZPI1t/hfac2K2jYS7hNqCLMbrfaCRGlD3GzsWw/8ny0vpTgbwLrDctwGpqSOrW3br9jCwgfish1AYHZ9hT4Z4pTPtplyDVLWeCZOq1+Y/FbBWe3P3XtthqhuvWmhwtPsDQgqjsndoUpp68Fa4nQ9sm5mxsF82F1j4gtrYXvBGa33/XUvV/qV31sRFsFb3fC83taHo2UIJ39X1F4RDZSuTT0G/7ZOGWDVivW/jD3dGV0QQrtMP7bCnr0/kmD+x7cWdIvbotKRCPp/XewZYgMjbz38VP6mZGqcNsFL77xGgdOGzug+f68efiAaB7N1fkUMIS0SHljt+3UtGYQHRXRhh/+Y2Y4xp1Y5wPFopmBAK+D87dA3UUNJv52ffctGvhPMKLqcExnvDwzSQO4G34idqiCdd8r6/YrMQxjTL+xoZc/rcKsX12O0kQPXR4PPbmV89AocNJoQu1qWjgUBHhcUWE1Gf8WOUfsGwFQqp+0lAhYzhMdzI5ixpEpNf6QU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(6506007)(2906002)(86362001)(66476007)(66946007)(66446008)(66556008)(76116006)(91956017)(64756008)(4326008)(8676002)(6916009)(53546011)(316002)(41300700001)(6512007)(186003)(6486002)(26005)(478600001)(122000001)(54906003)(71200400001)(2616005)(38100700002)(36756003)(5660300002)(8936002)(33656002)(38070700005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A302A9D804D7644B4642217B507FA82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8567
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9c6af2d-9bde-4d14-c4cc-08daf8a4ebed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ohnY6WHx1esPiOmCCwFtrN9reZModMJw7BjEneJRku3O7sMWXJ1iURaAY8FyYAs2idKDA/zNqRMFwy4vsgP/Ie+M0WzYZGuphvpZjlm6ARfzNW+nkPM0OmcxlAHgpz3570AAGJes41w7WtV07n9BS4eRlNlIGUO4rybXj/z/yDahX/bFn+ujRz/erOny+CwVTrwQ0uX/7sYbC9skT1/yG0mHT0FOoLYLcDJeBdeq9hE/ArlhHDSSNl+h5Wv0CM/xm0Qxtb8qhWP3vkw16Vjb8067S2lyqa9IiES5zpBb2lQRr4ymdCArD0vfZoC27kQbeFC2WShLSRAuMxSs2gDFslXN/WCQNxM7Y1Q8ktqmjY1+befd78jS83iYFgAEGF+37XDIMyxXmTQLxmp7Npsuiv0nUc9tU8NTlSjQvuPuq6XxGhY+5s9Ab+b4o/22ooHRNbGhrkUb1Hk3uPDo3jx/JykCjga0Mpv96EUJYTBkvbbo64QuyGm5MVaPdM7v8/OEux6z9BBEwxZ3laT+MmQuloXdM76G/3YPWjX94ndeTPP2kUJd8tZI5GtVT/nH7GLuw+jQhSBlkzB9Cv0sCPhCCymR151FsnX9cRep7KE/9dJmLSzrAHAK/pycsIs4P78+NN+xphW+G4aYEQx8RrBFA4nTKyt06F/rH4ML8c5n18CixGe58lsC1+wzBxhc1lZFWFKOC/upZRHNlnmySsMntw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(41300700001)(2616005)(47076005)(70206006)(316002)(4326008)(8676002)(83380400001)(54906003)(86362001)(33656002)(82740400003)(81166007)(356005)(5660300002)(8936002)(336012)(70586007)(6862004)(40460700003)(40480700001)(2906002)(36860700001)(26005)(478600001)(6512007)(6506007)(186003)(53546011)(82310400005)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 16:07:33.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1fc631-4e04-483e-983a-08daf8a4f192
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9513



> On 16 Jan 2023, at 18:10, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> The get-fields.sh which generate all the include/compat/.xlat/*.h
> headers is quite slow. It takes for example nearly 3 seconds to
> generate platform.h on a recent machine, or 2.3 seconds for memory.h.
>=20
> Rewriting the mix of shell/sed/python into a single python script make
> the generation of those file a lot faster.
>=20
> No functional change, the headers generated are identical.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>=20
> Notes:
>    To test the header generation, I've submit a branch to gitlab ci,
>    where all the headers where generated, and for each one both the shell
>    script and the python script where run and the result of both
>    compared.
>=20
>    v3:
>        convert to python script instead of perl
>        - this should allow more developper do be able to review/edit it.
>        - it avoid adding a dependency on perl for the hypervisor build.
>=20
>        It can be twice as slow than the perl version, but overall, when d=
oing
>        a build with make, there isn't much difference between the perl an=
d
>        python script.
>        We might be able to speed the python script up by precompiling the
>        many regex, but it's probably not worth it. (python already have a
>        cache of compiled regex, but I think it's small, maybe 10 or so)
>=20
>    v2:
>    - Add .pl extension to the perl script
>    - remove "-w" from the shebang as it is duplicate of "use warning;"
>    - Add a note in the commit message that the "headers generated are ide=
ntical".
>=20
> xen/include/Makefile            |   6 +-
> xen/tools/compat-xlat-header.py | 468 ++++++++++++++++++++++++++++
> xen/tools/get-fields.sh         | 528 --------------------------------
> 3 files changed, 470 insertions(+), 532 deletions(-)
> create mode 100644 xen/tools/compat-xlat-header.py
> delete mode 100644 xen/tools/get-fields.sh
>=20
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index 65be310eca..b950423efe 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -60,9 +60,7 @@ cmd_compat_c =3D \
>=20
> quiet_cmd_xlat_headers =3D GEN     $@
> cmd_xlat_headers =3D \
> -    while read what name; do \
> -        $(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $=
< || exit $$?; \
> -    done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<=
)).lst >$@.new; \
> +    $(PYTHON) $(srctree)/tools/compat-xlat-header.py $< $(patsubst $(obj=
)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst > $@.new; \
>     mv -f $@.new $@
>=20
> targets +=3D $(headers-y)
> @@ -80,7 +78,7 @@ $(obj)/compat/%.c: $(src)/public/%.h $(srcdir)/xlat.lst=
 $(srctree)/tools/compat-
> $(call if_changed,compat_c)
>=20
> targets +=3D $(patsubst compat/%, compat/.xlat/%, $(headers-y))
> -$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(s=
rctree)/tools/get-fields.sh FORCE
> +$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(s=
rctree)/tools/compat-xlat-header.py FORCE
> $(call if_changed,xlat_headers)
>=20
> quiet_cmd_xlat_lst =3D GEN     $@
> diff --git a/xen/tools/compat-xlat-header.py b/xen/tools/compat-xlat-head=
er.py
> new file mode 100644
> index 0000000000..c1b361ac56
> --- /dev/null
> +++ b/xen/tools/compat-xlat-header.py
> @@ -0,0 +1,468 @@
> +#!/usr/bin/env python

Would it make sense to start with python3 since it is a new script?


