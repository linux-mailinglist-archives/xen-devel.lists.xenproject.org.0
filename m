Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81D2F2E22
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 12:39:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65631.116317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzI0u-0006zM-5n; Tue, 12 Jan 2021 11:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65631.116317; Tue, 12 Jan 2021 11:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzI0u-0006yw-26; Tue, 12 Jan 2021 11:39:04 +0000
Received: by outflank-mailman (input) for mailman id 65631;
 Tue, 12 Jan 2021 11:39:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMwe=GP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzI0s-0006wv-44
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 11:39:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c97e04b0-fc46-44e3-a60b-d649f8cc0117;
 Tue, 12 Jan 2021 11:39:01 +0000 (UTC)
Received: from AM5PR0201CA0015.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::25) by VI1PR08MB3247.eurprd08.prod.outlook.com
 (2603:10a6:803:3d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 11:38:59 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::2f) by AM5PR0201CA0015.outlook.office365.com
 (2603:10a6:203:3d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 11:38:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 11:38:59 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Tue, 12 Jan 2021 11:38:59 +0000
Received: from 0d0ef62b8412.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 32F4670B-7525-430C-90BA-5CCDA5EFE4F4.1; 
 Tue, 12 Jan 2021 11:38:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d0ef62b8412.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 11:38:53 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4271.eurprd08.prod.outlook.com (2603:10a6:803:fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:38:52 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 11:38:52 +0000
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
X-Inumbo-ID: c97e04b0-fc46-44e3-a60b-d649f8cc0117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoZxgW472f6/pQHqq4yaW+/cizy4YLITAWYPP7qVNa8=;
 b=F/HYKkSGiH7hmPKeqUmpDe5VL/TDnZ+DWLEoMi9GAfM0lhDU9yATcxXPcrtQM8MtDlS4Kd9+i/u3M28FU0Q4fPwSYPz4wSPy2lv8stU3aVID2+WcqkrzSdq+/c+y7lxoNEshV93BurFdBDvvph8wl5zsdK16sZC8Z6LuQy2KF/U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a49066a2394386f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/6xx2yCF42ou0Jg2rEUP5egGq2UBujaM9FKvlPWC39vTJdZcOWLgZk5Zqnnjtgf7xgdMNa2IT5WSC2XxYf5q3BHDO5neu7FNqx2f5iY4vvRZAmnp9ATLFl5vthtXXVeREeVKiSx6U7Sa/Hpjl7uu78WXSRlx2abuU/qeEAkZGrO/C/cFulOXL8jgnilw7zKg7GwiXwXBSSP00rM/UOKeheu7+fsEK9/kl2Ei4LasYstB5E67q5oGUy/n/wUtI2oqZilYuD14kZCn+eYLcYTkxW8MOfrk+iydbcNoQFzx8UTRoNIwO5ELQcxrXZRGoftFc6AUeDB/Pp34qQjqgoE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoZxgW472f6/pQHqq4yaW+/cizy4YLITAWYPP7qVNa8=;
 b=VcIE1Ege4LPV4HKgpiIHPb4bBoEk+ZTNvQG0Pl8z5iYmd41OdPbt0EvnPDe9DMySSPgAmKoqfBoJNinGPTPKQJEGz8yaATc0lnKmzyG43kJBAmnNAN7QeZo68gB7hNYfx+uZfhUv844AAiajo9Bq6UakC4VxnseI/sqXwgKDEun4BoxiYp/dtyatMqvaTYABYNpxzFfDg/l7dYb7gsNfzPcpnKxxAqat9X2vxGQN6xkNNjgYgXByluERE6Wvezx7nij4LexKPE9CzQzxFo86ITHRsS5oobcZeziNLsp4CSToxgTEjSAFle6GD5DFIgyog/kFsknB9OG9D/m/iu51GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoZxgW472f6/pQHqq4yaW+/cizy4YLITAWYPP7qVNa8=;
 b=F/HYKkSGiH7hmPKeqUmpDe5VL/TDnZ+DWLEoMi9GAfM0lhDU9yATcxXPcrtQM8MtDlS4Kd9+i/u3M28FU0Q4fPwSYPz4wSPy2lv8stU3aVID2+WcqkrzSdq+/c+y7lxoNEshV93BurFdBDvvph8wl5zsdK16sZC8Z6LuQy2KF/U=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v4 06/11] xen/device-tree: Add dt_property_match_string
 helper
Thread-Topic: [PATCH v4 06/11] xen/device-tree: Add dt_property_match_string
 helper
Thread-Index: AQHW5c2nYMNMmoO8sUeHj5NB8HJo8qoj42UA
Date: Tue, 12 Jan 2021 11:38:52 +0000
Message-ID: <353B8077-3A27-4794-914F-D461BEC6B0D5@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <0df414d5496574269c58415f7bff8f069efce94d.1610115608.git.rahul.singh@arm.com>
In-Reply-To:
 <0df414d5496574269c58415f7bff8f069efce94d.1610115608.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb80fc73-2f6d-45d8-0b22-08d8b6eea6f8
x-ms-traffictypediagnostic: VI1PR08MB4271:|VI1PR08MB3247:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3247F3BC71A49FB32EDAD0339DAA0@VI1PR08MB3247.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wJc5f1/JcNr7KhqbS9d9jcbXD+cz8DgIYtxsB7KogzxtW9Lp8ZRN/nw6clTsbe4dOtUVqtUXvyFoUHj8LYNxkrL5vGHJAAaEDZUfi5Hlr8IUhvQs0/Z1ANA/4IZY3awAsZHdoiGioLOSvq9mpwXxtiIPIjUlFrRCTcnFXq8h+6gexdPu3gmzKokegszt1JDXkliWnB+6+eFrYs5IxGzk4WLJOBEfvGja1BqzdhsmRzmnmOdOd5uj8aAtv2jDw7yiGu4Twif19iXeStP1U6Z1D99XPgUZFGvCYnYO536AbsB8MZ0sH6b4ANqON6qF9F3JAD8d6M4ODbAbYVBTflBc3aFTsZL54bWMQv+LSb++3MAIQakyy/99dLiWYkASqVymCyWFH/izrNw8jAPLW+KVu+OFCG0ZnOoLSIq66K//G7j0feCasSoR6qs+qzeFFeA8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(2616005)(64756008)(8676002)(8936002)(76116006)(2906002)(66556008)(66476007)(91956017)(37006003)(66446008)(54906003)(6506007)(6512007)(66946007)(55236004)(71200400001)(86362001)(6486002)(316002)(6862004)(5660300002)(4326008)(6636002)(478600001)(53546011)(26005)(186003)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?ka9HgReg84Z/JbOiznvDc5anDiuCKF4hOfHRVpdO3m46NZc4JSPguDCfYUxH?=
 =?us-ascii?Q?XMW1FZfxyD2RTFfilPAurGXTao1ALc7vsoVZld4Z244wREmZqiAbEh/Hs7ot?=
 =?us-ascii?Q?MjSpleeuCy6UuwU53Y0hauSf8pB+r4lxEMfO8iDfzUeDShf6OJP6hFOkd1gc?=
 =?us-ascii?Q?udZcuI4JnFqbgN559UNNzvSZNmYsqnScOWXL7w7DUhvdMZ+TePJehrRs1oAS?=
 =?us-ascii?Q?1h/MFeEUSblEvslc9inU+MueBwLPo1topIZABK1t8UDJtScV11gwOy1pBIln?=
 =?us-ascii?Q?ji5dtXVZeDRULUiPqQw7Xpa9gvyj9ZgU+A/x5dSvHNXge3wAysP6q/rLPAfi?=
 =?us-ascii?Q?aEnA0l/4nhInEtduYAkftaUs1TObcwNBkFDLSY5zMVsC/IOWxaXDTPhIsobB?=
 =?us-ascii?Q?Fp2Q00TA6t3f8ObZP3NcxiNrWVDX3jOaKc16LGvQAcmE2rmf7nzwqcLheTXx?=
 =?us-ascii?Q?r8zy35iTe97B5UDTY9bde503XO1QoqKr7kybxPhnsaw+hoakWfmvJV/OwSBm?=
 =?us-ascii?Q?A0dQ+H4p+CLLsqa3ALOdFb/F23R2r2ePkjGUX3eo9P2R8zfYaQ3xNzVuErJ2?=
 =?us-ascii?Q?XEkkAfxVMIwJzIHunVzK4TP8Cf/L1o8XAdE9zTWBp7LKNXaPPC3HheYeYL2P?=
 =?us-ascii?Q?TyCPqSRwamV2utJjYbEo9I8f+W48tli1SQ9M28PdeNjSLYEBp5ijHLK0hFSF?=
 =?us-ascii?Q?PdlEgEnxQpI/8Gu8vwzFhZx9HN3xqdZfxMUjheHCfkFzjIffVapcNrWFVHhM?=
 =?us-ascii?Q?4AyaYQys+bF4BiCf2hUmlAhjQ/8VWl8ntE4hKOOJ3XrieTdjMmGSzGIDILr/?=
 =?us-ascii?Q?hPmXUQL4DAA19uUmRwAZSgbZ+9Odka0mgT+0ZlsGD7P6TstTvUEQUMjRW7C5?=
 =?us-ascii?Q?SV+NgvS5jkYF9Ez4ZKrRVyOSpA7JvAi9pHSTDKNvfZh/5OCAi6cMRkbeBm/3?=
 =?us-ascii?Q?LW1fBO6ihOvi+JO74+YX84WK0LckcZ2tLaPptVZ883Icu4qyzuJqDk3RlAjG?=
 =?us-ascii?Q?0xpJ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E2F6A8F2FA23364889E9A7D8E6621207@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4271
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f211d62a-c1e1-4e10-dcd4-08d8b6eea2fd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7mbySKS679WT/REktzja4mar00iEZC+JUvP6xTSCZxck8+OPyWOlLDkCggwr0u2KK+CNqZ42vqlI9gKoNBTJNnh4Z7S24FPS3bgZsBASeRyFAbHNys+DT4rl7h7Q5Yf1dV9nsfNmKsbKP0NsMnZ5T0n6uuwLiUetb3akZW2/dGz0LGqawa0VoyZWCGJalRVCoEQI5uRZdw+mYfHWIdraghhfghgDbw5qsaUzCSUnCrlEm1nv3I1xaapEBamceEuJaj0YpGHzzEvJ3I6xkf203sNBawhUWFOdzsTZYnj2te/6fSgPscm+BfJpjZ4XtOsc+7SuGgKJAvuBAr2pJ0w6o8qZqhDSSOxWEw7aFQYGFAkubAC1Au2k5ge8jZUgkRsfiZNrIUPCVey5mv35G2d1MDoHa7pijz30k7KavB/ATr2bbP22j6PezwKUQLJn2lN4iFN3tKlNI3tgxIAU51XW8hcY+AdjgSCFgwQRpDj+WfIwVLF0WoWAqKdmXq1LQj/A
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966006)(37006003)(4326008)(86362001)(8936002)(82740400003)(6636002)(6512007)(82310400003)(36756003)(33656002)(5660300002)(336012)(70586007)(6486002)(356005)(54906003)(2616005)(70206006)(2906002)(34020700004)(55236004)(6862004)(26005)(186003)(53546011)(478600001)(8676002)(81166007)(6506007)(47076005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 11:38:59.2070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb80fc73-2f6d-45d8-0b22-08d8b6eea6f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3247

Hi,

> On 8 Jan 2021, at 14:46, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Import the Linux helper of_property_match_string. This function searches
> a string list property and returns the index of a specific string value.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in V3:
> - This patch is introduce in this verison.
> Changes in V4: Rebase
> ---
> xen/common/device_tree.c      | 27 +++++++++++++++++++++++++++
> xen/include/xen/device_tree.h | 12 ++++++++++++
> 2 files changed, 39 insertions(+)
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index e107c6f89f..18825e333e 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -208,6 +208,33 @@ int dt_property_read_string(const struct dt_device_n=
ode *np,
>     return 0;
> }
>=20
> +int dt_property_match_string(const struct dt_device_node *np,
> +                             const char *propname, const char *string)
> +{
> +    const struct dt_property *dtprop =3D dt_find_property(np, propname, =
NULL);
> +    size_t l;
> +    int i;
> +    const char *p, *end;
> +
> +    if ( !dtprop )
> +        return -EINVAL;
> +    if ( !dtprop->value )
> +        return -ENODATA;
> +
> +    p =3D dtprop->value;
> +    end =3D p + dtprop->length;
> +
> +    for ( i =3D 0; p < end; i++, p +=3D l )
> +    {
> +        l =3D strnlen(p, end - p) + 1;
> +        if ( p + l > end )
> +            return -EILSEQ;
> +        if ( strcmp(string, p) =3D=3D 0 )
> +            return i; /* Found it; return index */
> +    }
> +    return -ENODATA;
> +}
> +
> bool_t dt_device_is_compatible(const struct dt_device_node *device,
>                                const char *compat)
> {
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index f2ad22b79c..b02696be94 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -400,6 +400,18 @@ static inline bool_t dt_property_read_bool(const str=
uct dt_device_node *np,
> int dt_property_read_string(const struct dt_device_node *np,
>                             const char *propname, const char **out_string=
);
>=20
> +/**
> + * dt_property_match_string() - Find string in a list and return index
> + * @np: pointer to node containing string list property
> + * @propname: string list property name
> + * @string: pointer to string to search for in string list
> + *
> + * This function searches a string list property and returns the index
> + * of a specific string value.
> + */
> +int dt_property_match_string(const struct dt_device_node *np,
> +                             const char *propname, const char *string);
> +
> /**
>  * Checks if the given "compat" string matches one of the strings in
>  * the device's "compatible" property
> --=20
> 2.17.1
>=20


