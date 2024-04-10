Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2389EB61
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 09:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702927.1098604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruS0k-0006pM-6w; Wed, 10 Apr 2024 07:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702927.1098604; Wed, 10 Apr 2024 07:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruS0k-0006n0-2P; Wed, 10 Apr 2024 07:04:46 +0000
Received: by outflank-mailman (input) for mailman id 702927;
 Wed, 10 Apr 2024 07:04:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oh3E=LP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ruS0i-0006mu-O1
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 07:04:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ad54ecf-f708-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 09:04:42 +0200 (CEST)
Received: from AM8P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::8)
 by PA4PR08MB6016.eurprd08.prod.outlook.com (2603:10a6:102:e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Wed, 10 Apr
 2024 07:04:33 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::ac) by AM8P251CA0003.outlook.office365.com
 (2603:10a6:20b:21b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Wed, 10 Apr 2024 07:04:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 07:04:33 +0000
Received: ("Tessian outbound 9d16f63426bd:v300");
 Wed, 10 Apr 2024 07:04:32 +0000
Received: from 11334a8494bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84EEA4A8-22D0-4774-93EB-83607F3AB649.1; 
 Wed, 10 Apr 2024 07:04:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11334a8494bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 07:04:25 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB3PR08MB9897.eurprd08.prod.outlook.com (2603:10a6:10:436::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 07:04:22 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 07:04:22 +0000
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
X-Inumbo-ID: 9ad54ecf-f708-11ee-b907-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PVWKp2i+CpvHKbJc1A36qnW0HXGEmVJDIsHiVNsXAXKMIRBkp28CADj292Y+anDYjQAELbMhLe2RgOCWvxd5F8XPBt6fBeoEu62+KgApFmbMfHNZL8Dk5JH9nI/JPx7tIJ/WCYhZ0wTwBGPC181k0xRSibo3XS54FIrzJ+i6HUnAfW2QqwsR3mtGgQBLLox98E2gQ+xYSxfc88SaTdTLeRcinRIfgXTU4A3rJwA6XIpyXnytEs2+glCbkJi3qXCjy0a1C7P1vCQycjnoG7cgr+q2flnxSVU+a8bz/IWfys/ozEYjAhwE4WW3xMKYwf4YewO7QN833+aRM+ghzLbrwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYc5+cJMbOtVGL7/jJFXnS9bVn/ilE+xcryFhm5I3rU=;
 b=cvPO1sgJjalSUNz/PD66DRIMfqOxcxo4seA1YEKLBuGhHm6RjLmul/XgsTCfkGuANs2MiU1QHDlbaKyWUrd9REmzeniUI9IhMlXED92WSKuLgJyg4eGzCykRE7+WW82ZTA74PwfmfVp0bx1IfOyzxPtBhOUpGS17+HUypfM0ZPt8uED98WTdgzrPrscHQPUwHdZlcDLC81DvRpbmYzSKsikO8VYr8BsfJQDqWVhhT1v3PaLjCjL4X+ec0cvo8kCN0NoE6eL9G0tZgk8jKyQjoswC3fC8p+3pAdkMiavTs4ERUlsGIR+2ZG6MKaJK7FIm/5OjLShUCbWfRR1XDGHVxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYc5+cJMbOtVGL7/jJFXnS9bVn/ilE+xcryFhm5I3rU=;
 b=Smj7McD3RQXJXnk1rc3NyMXnrJpRDdJa8iXEQ1CGOpY/iV4KcHhspObrK7N3KbXXwIbLauVM20a4Bvw3jWnEXrwHz9bvXFb1ZOgHpWbncvZX8I+1kyeWebPlmrrRebPyBcXVVWKRX2/ilrO5HHuarOs5nNSH3UOiu+r1dYefUmA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1574c74e64d4dab8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5s8jbv1N47Vc2kvITyf5bZeKpuXP1hPjaVJ+AfBGXqK+LnoIx9XpzJgksObrtLcf24bXuARCpVu6qg7iVqkE7XtTrQm/3ydStLo2bzPnN6WNKaz7HQ8EJVFxNuPvbctA2SOzgIWXQDbGBadczYbYHygjbYD2GGVKPuLLrx8wH5QPonb5k0efHKLl+Piuwmqh81fJ5wYxFUR9vj9mDdqI+NNnWMoSN6Zux668CLYiVYzziT4nuqNgeO8H8OVyT9PRgkLYJiZD6GJg5gkvylAMNHs+4eQ6vIQgz0gJpHCUcavfki7nXhY5ISL5fj0W++Vr94Cdn1y8EnLfvQnwpW2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYc5+cJMbOtVGL7/jJFXnS9bVn/ilE+xcryFhm5I3rU=;
 b=lcJXGeM11tDA906V5oT119Ynsbohn2aZi4hD/7bg3VQyFIN9aRk5okUOnDB6nekdiyxpq3Ylk+db6UHyLgwAMeeGL/4crdDScSbFITdjp40wZUnVxWQfQhy41HrF7vh7KswwnP0kYMPubixhd/EeM/D3SNepJCP+80eq/FyF6g/1ChS1RzQXis4YQjDma3PIof/WdwRzEehTCDVtn+nP55JisF/3T5h51IYzCVI5h3YyeLPQwCqtlcy+X3exsvktLuyrUA5l47c96K2Mxo7fMj0V4ouk5wnGEfSrVXPC/9qKbzD/A04i5ZDLCAcsJ3ofbFbmbg7OnkQ17tPAEiEmjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYc5+cJMbOtVGL7/jJFXnS9bVn/ilE+xcryFhm5I3rU=;
 b=Smj7McD3RQXJXnk1rc3NyMXnrJpRDdJa8iXEQ1CGOpY/iV4KcHhspObrK7N3KbXXwIbLauVM20a4Bvw3jWnEXrwHz9bvXFb1ZOgHpWbncvZX8I+1kyeWebPlmrrRebPyBcXVVWKRX2/ilrO5HHuarOs5nNSH3UOiu+r1dYefUmA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v1 1/5] xen/arm: ffa: refactor ffa_handle_call()
Thread-Topic: [XEN PATCH v1 1/5] xen/arm: ffa: refactor ffa_handle_call()
Thread-Index: AQHaipO7gx2fHTq0t0aNBoE/iQWW9bFhFW0A
Date: Wed, 10 Apr 2024 07:04:22 +0000
Message-ID: <52ACBB77-58F3-4337-85E1-7F5C2343BF53@arm.com>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-2-jens.wiklander@linaro.org>
In-Reply-To: <20240409153630.2026584-2-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB3PR08MB9897:EE_|AM4PEPF00027A62:EE_|PA4PR08MB6016:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 78MwY+JLyFzLrLpASY9hr4awEQn2e9a88eFf4D34C15wfdZZGmh3+Q8lfud41SGik9t2DUftlW3IXPR5QIQgyBpxZB1MzUf60/jiBy12tJdDHncdv88U+ACHK7/z3zRlHA0GLYISXOdO1LpVIMV6fH8d3Il7OBPV1eKs3AL1hcwNeOxOBMqWOct7YDeRTUowyacrfQlD4UR1iH6vS2+gI/RGkypa9GK+wWTJwLFJG/7BgbCiRhPmTfTkxcH/fHRRR7qlqspSMCqAvDreaHAmpbD7m8KLH3+aGtfHSme55ingR6L9zUyHZPXrq5AzsDfMGnNCOhX+8BOoO7AVmZAylxujwAimJ7PHwQhLCJ8/bJ+NnfMrRuRLc1DcjwygISXW2hBAEY/iM8Dkz1ijiE6c5MraSovr8tlOOGuyCrNm4FgDKlcBN1/qNvoBXpyKxfsrqHA01w2KPkCmuHnNLrDLuzzrSttNe6TK+OWlWzWiA9JB8Yu90qXDfWhCLSEO+qwjwxWGjox/rsASgHhn16tDc18MrczJbWmJryFCT4hnJWyOpLHzkDrvFwrS3MRJc/Dl9KwFOy++zgmjJiFeef4iQowJv6hjI6LCrCT0V3ORMjYNk2GUGmWKpiVWtGevbcahovXeS3Gwp4TuYWTlBjwg+BwlIlNS1QaXrmKwxRXEM5w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <128106857472AF4BBA86057F063E9CC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9897
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ccb10b-9ece-4a5b-5b66-08dc592c7971
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7fUJyS+yVPu+BWVQtMsia/f4gcw1WSlE4RIVxAfda0fUFPw2u0lS8auWiZOVWtvjqQKTEjewGHpjqUSDttczbm7+1A4hPHmbZAEEEQwRab+gldUxwq+KuYnw3VTDyq9yFtZ2t23ifw4Vcmiq9IUGcvTFXkLdnOH0IhDZyxgZsELrJTWvYbHinUl0ZtTL6iiQeYfy3EeeL9gNX3RrD6LkDxs29/zWiHMriRcSY3izqb8uogUy/OF1AUFfnSGTAxTPbJn39eepfbwmPpJXTl3gr7mGli4vAPp41PcMYP2wDXin7VGnhtjcv77QfJR7ZeUJENGM7J16eszQy2ekgGvUJnhGiL1HhYmgj1jkpbLPlbGNf2RTsszzx+T5QpHUhqegO3Yc3DLAMaNq8Ld3sapy7O8C5TC3zhJ3Pro51OQ6ZlStwuPW6dkBN3UqEa/I87ReV+0iWw972f3awtzLnTbNcamd/wLsqj3U+BcBB0Fxi2qGsKuk63XEpUK1KRq/EUPL7FMJTv08SWBJHwQquPO/MMVcqVVrRsRUSfxxCCd2DL2rsB6SfGQafC00Yv22bNEa/1T2Q4U2XcXCf0bUZGJ+O95VEMbRytBc2+YmeCZrwmX38Fxr6PCau8HfI4PS54wBnJ2kyHpQrFBRocMD65DvAvUBJ2cbjUwS39EJoqCgVZJMuDbNrljALsYGQGHnGboZDYo81KVRtE5C0wL/A5ATSkiFtwW9MH7HVoLIy0miRoHtz1TEijBwb8aLWAMyTiVk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 07:04:33.0204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ccb10b-9ece-4a5b-5b66-08dc592c7971
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6016

Hi Jens,

> On 9 Apr 2024, at 17:36, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Refactors the large switch block in ffa_handle_call() to use common code
> for the simple case where it's either an error code or success with no
> further parameters.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 30 ++++++++++--------------------
> 1 file changed, 10 insertions(+), 20 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 8665201e34a9..5209612963e1 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -273,18 +273,10 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>     case FFA_RXTX_MAP_64:
>         e =3D ffa_handle_rxtx_map(fid, get_user_reg(regs, 1),
> get_user_reg(regs, 2), get_user_reg(regs, 3));
> -        if ( e )
> -            ffa_set_regs_error(regs, e);
> -        else
> -            ffa_set_regs_success(regs, 0, 0);
> -        return true;
> +        break;
>     case FFA_RXTX_UNMAP:
>         e =3D ffa_handle_rxtx_unmap();
> -        if ( e )
> -            ffa_set_regs_error(regs, e);
> -        else
> -            ffa_set_regs_success(regs, 0, 0);
> -        return true;
> +        break;
>     case FFA_PARTITION_INFO_GET:
>         e =3D ffa_handle_partition_info_get(get_user_reg(regs, 1),
>                                           get_user_reg(regs, 2),
> @@ -299,11 +291,7 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>         return true;
>     case FFA_RX_RELEASE:
>         e =3D ffa_handle_rx_release();
> -        if ( e )
> -            ffa_set_regs_error(regs, e);
> -        else
> -            ffa_set_regs_success(regs, 0, 0);
> -        return true;
> +        break;
>     case FFA_MSG_SEND_DIRECT_REQ_32:
>     case FFA_MSG_SEND_DIRECT_REQ_64:
>         handle_msg_send_direct_req(regs, fid);
> @@ -316,17 +304,19 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>         e =3D ffa_handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs,=
 2),
>                                                      get_user_reg(regs, 1=
)),
>                                    get_user_reg(regs, 3));
> -        if ( e )
> -            ffa_set_regs_error(regs, e);
> -        else
> -            ffa_set_regs_success(regs, 0, 0);
> -        return true;
> +        break;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>         return true;
>     }
> +
> +    if ( e )
> +        ffa_set_regs_error(regs, e);
> +    else
> +        ffa_set_regs_success(regs, 0, 0);
> +    return true;
> }
>=20
> static int ffa_domain_init(struct domain *d)
> --=20
> 2.34.1
>=20


