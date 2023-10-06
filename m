Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2806A7BB9ED
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613654.954334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolPI-0000hS-CR; Fri, 06 Oct 2023 14:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613654.954334; Fri, 06 Oct 2023 14:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolPI-0000f9-8Z; Fri, 06 Oct 2023 14:02:20 +0000
Received: by outflank-mailman (input) for mailman id 613654;
 Fri, 06 Oct 2023 14:02:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qolPG-0000EG-Mf
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:02:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe02::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4ed4c1a-6450-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 16:02:16 +0200 (CEST)
Received: from AM5PR0301CA0015.eurprd03.prod.outlook.com
 (2603:10a6:206:14::28) by AS2PR08MB8997.eurprd08.prod.outlook.com
 (2603:10a6:20b:5f9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 14:02:09 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::d4) by AM5PR0301CA0015.outlook.office365.com
 (2603:10a6:206:14::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Fri, 6 Oct 2023 14:02:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.29 via Frontend Transport; Fri, 6 Oct 2023 14:02:09 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Fri, 06 Oct 2023 14:02:08 +0000
Received: from 3829bc7b53eb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E2D302FE-1407-4DA7-8AD7-064B293E4F2C.1; 
 Fri, 06 Oct 2023 14:02:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3829bc7b53eb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 14:02:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6046.eurprd08.prod.outlook.com (2603:10a6:102:e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 14:01:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 14:01:59 +0000
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
X-Inumbo-ID: f4ed4c1a-6450-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFpcY2eOiSAkd1LC7JVS31B9R0FGGJUsrTImZaX50TQ=;
 b=OutiOiv/qR8lquOCubXu6XmQHWQnNIwKBq+BKRqomgcSJt03MO0YJJvSEaUPPtvX474SzkvlqILq8MsDue5IVI7UmDQ86EMK5NbCcS0Wi8GxpXUWndJMaJC22UD0db2PzotBsFaBPIO7QM9PdpW82t6zBJ4DYCevQlqZfeudVII=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5acf354ae037334a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzXaiKYmDq3SCv5miwMtFfCoORQxVOUWHaufDpnbjKsYzrjei6Pfo17inxMsfdDV5Yg70zmlpwyZ4zXZL0NUo6zq0eg25JyYm6/NnHOuKwL+HLqFkVZl5CTqc0TXoytUI7G+Gq+vAYTmHt9cqhTuKmlnzjCqew59j8obRw1DxgIY3Xaymd4YIDSkYvz/eOJvwzTefc1KwZslytRncvB20r458e5ZedmcXmaSanvWQiQDav5aUyK+g43VzlGzBj3GffNZ5BYZVi+PaYdqREJkK279WCildBp1bjeszuYsbQOR/CEUlTCubDQYZ0fSZ56gOlQt1JFzgwZ2c5EBijY8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFpcY2eOiSAkd1LC7JVS31B9R0FGGJUsrTImZaX50TQ=;
 b=FSy8mR36mN2611765yNZ6w0cW4JvLSFAUueTy9cNVeSIedNmssuOdZaUFGtnidsCQZy82OlP4MY/cJeeCMrZB2QGJFUhQyVwka5r4m7qg8an3bz51PJTSrqRd4QwYl2AYh+vjQfWPwRd5ttWnO2X8W7JWK4jZeYkzwiHiZOuX/nde0Y8TE3fGBqsfadgSUFSMmKlwhA0qHXTnd6c3lIr67x02d3Mtl7zqCRDFBtj3/qlO0JgiQp7nWW1iKGCmHGbhCMAIde+a07EfmQSV8dkP94XfWhuxU6xQ4dEm/+K1LfM7bT0KC6cTuPejlBsyKPUS5CFdFht4ASBr1mccJdKmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFpcY2eOiSAkd1LC7JVS31B9R0FGGJUsrTImZaX50TQ=;
 b=OutiOiv/qR8lquOCubXu6XmQHWQnNIwKBq+BKRqomgcSJt03MO0YJJvSEaUPPtvX474SzkvlqILq8MsDue5IVI7UmDQ86EMK5NbCcS0Wi8GxpXUWndJMaJC22UD0db2PzotBsFaBPIO7QM9PdpW82t6zBJ4DYCevQlqZfeudVII=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] get_maintainer: Add THE REST for sections with
 reviewers only
Thread-Topic: [XEN PATCH] get_maintainer: Add THE REST for sections with
 reviewers only
Thread-Index: AQHZ+FyiaBVN8FQsE0aCzepjg4+08LA8ypOA
Date: Fri, 6 Oct 2023 14:01:59 +0000
Message-ID: <D94A9ED5-8612-4ACE-ADC9-8C37ACB0198C@arm.com>
References: <20231006135406.52750-1-anthony.perard@citrix.com>
In-Reply-To: <20231006135406.52750-1-anthony.perard@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6046:EE_|AM7EUR03FT005:EE_|AS2PR08MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 5490d683-b9d8-4a61-8d81-08dbc674d4dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y1lzC2twZuyD6xWIZftuUulBUZobrQOJjoihPSX0JGJi6uv7zoiyMSlbWFZgGOn9HouDUhQLAGedjSs4EzCyS6EzatHDP62i497GRjlm+P8loYnWlUGe8DBCFjlfOCl06/ifsamMFGoWYTt5YHLnYx+rergKSfGBd7CYio+iY5YQ1YsJdQaEtc6cBUl52+EWuG/YtdxgRw2X0ujwHqT2iv+DMqmltm/rpvXt+U0+4LpELTMN/N25kmyhEFVYC5+MGPUeEWuxTfptFmYMaEQv2rjtdZdMUR6SfkmP0VN51UZOwGxa6bFcV26zA+zlPn7c5c2mYEa6S4i/+TsZiJpSDqf/PsYDMkIEKQTW8y94VQLhQig0TQq0raLqodCt5WadxZ0mcXZ3zgdVoMIf4qtgcEXWkM65zMPqLfaywba97jEOnXhWoo2KA/NTEiSjrYJ29sh6lABjz/sGuihXOHk6NZn5CDVc60tYRw45ppyYfDKxd3WYgYBrrmA0/Esdv11dcajuHxCXAEC2+7tEtBfGAFnAT/nOti74BAUiLVC80Eh1NO7xK1RC7JDAjhqXcxDI9dR4HnfqsgCCxJAc3/CYqCbVeE6kp5EAEzyHqRX+SC2H/AmAPIhXiIK2ur7IclOqgnoLCfROGdqn3O+XgsKz2w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(4326008)(8676002)(8936002)(316002)(6916009)(5660300002)(41300700001)(2616005)(478600001)(26005)(6486002)(122000001)(6512007)(76116006)(83380400001)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(91956017)(2906002)(86362001)(33656002)(53546011)(71200400001)(38100700002)(38070700005)(6506007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F9055DB1937E554592303CFE589115A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6046
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e093d863-a333-4233-b23e-08dbc674cf1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FiH+CFch/82wHuuB39pfH5Eq0AFOVpjHRHfyPkkvLAii1+ItPurPKpnx6kHuM+5BTGtrlcu+NQ3QcPjNvejYM2VNeCEOFn+VEtrCXqO6uWXzh7vRP51XMBIiN2M7te4J5TaW29Ot+FwAcAAmvkXOZFy/LBIl2jteyEdoCIxJdD9CeFm/PuFqJ/rwYoBKs/W6G3kSWPm51+MgnSFuyGykI2L27Zabt91V0WiArc8fmsHTTM9XXSaDU3+Ps+kWLnx7b009xXu7HuBr+5LYrVRxbtd8yp4NC/Zsni4/7VKnkVcgF7CpTmVKrf/oAgvUqPtV/DtgYy/xvdER8mxtPHLFkQ/x0kq3XhGkoNnMS+zu8Oz9JoffLELsWTiqyD22qw5TadA7gul3kvbZfFPmQIjmUN0rJ4l+KQDwD+V+k9sopUEGKgdH+UA0vxhY2UWdgfOrg2OY/bMq/LS9Y0hPpyI5YV/MrITNSIULpsHk9QVten63AgI26hLyphTX7Jy1zAhg44t4ZX/CkLv93OHXolkw4naGXpxzzUpXgM0G4uK1g4N5Y+yjgnQSL0RcfQmFjh+vLRUJVLabJJ2+E9gW+u+BMFbYIYxOXrcx53ULKPwJN9LcWiiiv76hvdTeDznDfyTG7rQ72XmVArvJX/ainWKds5bwNO9eswCKb4xf9JmWFqv1rXinx2xD45GQHtjSH7CMqYxO8IXbIk3MN5a7n/rWdCtSw//5xezZU28DbBoBPhvZR1vCmm9XBvx8qFuQnLUx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(53546011)(6506007)(478600001)(6486002)(6512007)(36860700001)(86362001)(82740400003)(33656002)(81166007)(356005)(2906002)(83380400001)(336012)(26005)(47076005)(2616005)(36756003)(70586007)(8936002)(5660300002)(54906003)(8676002)(4326008)(41300700001)(6862004)(70206006)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 14:02:09.2071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5490d683-b9d8-4a61-8d81-08dbc674d4dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8997

Hi Anthony,

> On Oct 6, 2023, at 21:54, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Sometime, a contributer would like to be CCed on part of the changes,
> and it could happen that we end-up with a section that doesn't have
> any maintainer, but a Ack from a maintainer would still be needed.
>=20
> Rework get_maintainer so if there's no maintainers beside THE REST, it
> doesn't drop THE REST emails.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
>=20
> Notes:
>    Soon, the RISCV section might be the first (I think) section without
>    maintainer and without been nested in another section other than THE
>    REST.
>=20
>    Tests by checking that the following comnands returns the expected ema=
ils.
>    ./scripts/get_maintainer.pl -f tools/libs/Makefile
>    ./scripts/get_maintainer.pl -f xen/arch/riscv/Makefile
>    ./scripts/get_maintainer.pl -f xen/arch/arm/Makefile
>=20
>    An extra '--sections' argument list all sections, including THE REST.
>=20
> scripts/get_maintainer.pl | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index cf629cdf3c..533d0df72a 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -732,8 +732,15 @@ sub get_maintainers {
>         my @email_new;
>         my $do_replace =3D 0;
>         foreach my $email (@email_to) {
> -            if ($email->[1] ne 'supporter:THE REST') {
> +            # Replace @email_to list with a list which drop "THE REST" i=
f
> +            # there's a role other than "reviewer", that is if there's a
> +            # maintainer/supporter in a section other than THE REST.
> +            if ($email->[1] ne 'supporter:THE REST' and $email->[1] ne '=
reviewer') {
>                 $do_replace =3D 1;
> +            }
> +            # Prepare a new list without "THE REST", to be used if $do_r=
eplace
> +            # is true.
> +            if ($email->[1] ne 'supporter:THE REST') {
>                 push @email_new, $email;
>             }
>         }
> --=20
> Anthony PERARD
>=20


