Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC726E6490
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522829.812446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokmW-0002Bt-NS; Tue, 18 Apr 2023 12:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522829.812446; Tue, 18 Apr 2023 12:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokmW-00029P-K7; Tue, 18 Apr 2023 12:50:00 +0000
Received: by outflank-mailman (input) for mailman id 522829;
 Tue, 18 Apr 2023 12:49:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pokmV-00029D-DB
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:49:59 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86a59318-dde7-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 14:49:58 +0200 (CEST)
Received: from DB3PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:8::47) by
 AM9PR08MB6065.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 12:49:51 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::f2) by DB3PR08CA0034.outlook.office365.com
 (2603:10a6:8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Tue, 18 Apr 2023 12:49:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 12:49:51 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Tue, 18 Apr 2023 12:49:51 +0000
Received: from dfbf5f12ac50.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81C4CF4B-3866-4927-964E-D0487FE82FD7.1; 
 Tue, 18 Apr 2023 12:49:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfbf5f12ac50.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 12:49:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:49:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 12:49:36 +0000
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
X-Inumbo-ID: 86a59318-dde7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhKNfkA7X9/PI1wjLsH1O+OSaDiuEY666L8i7LUNEKA=;
 b=FK/udrJFLdmWwnIZLxSyiINCiC2mNaRM9GPM34mW2cUbhPXIov6m7EDmDR0Ypa9yRg14m3bGuXNWKlR8Yw907IBVG0XxW3tBfxOzB5ON8Wu6aefc0p6XKv4PTRft8D4wKkqKUsMVZhQeFQdfsd2sa5lWimOZoI8FxWf+HfIDKTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a8e24a07a4f6c602
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny/UYCJIu6oEfVSc+SOme31Vp+7WStPzzbTqasH1P9FU6ewbjdIrZBs7j5GCaVJZMCe2ZVpL5nZOYRZDCQZZ/blxUydLaTJQhncd2zNh6UD7W77nLSZcel0FBWNYLkSZFwhUguD0h+BJlUeEC9RHNKyBwZiQ372a0QZQOaJsF2UhKY80d2sOWwfqsTGR9AgbSpIYtoBmFVdaMP8B2VXjHI+FIS83YsHSTpM1vfgpCOBx8nTvgdbDt4NPcUCVcJIfHTQTnxsLBYGkrSbsJT1l+bXJlVt9xU6gBub6fQRpUAom/elCRcsknwv+rY0W3PnbzT6R2EQBFi0HOwy12Yg8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhKNfkA7X9/PI1wjLsH1O+OSaDiuEY666L8i7LUNEKA=;
 b=ev9VzoAWbC0tV9JmQNYTCWijSOwqsKo5lP0yjTLBf2Poe2QqmcuWLpn+elGPyUT+QMV9ovdg8b12Y/38aTJqOIo2sVECBTHFJO/dsJrFNq9XTFgbmycIf5PU/RXVduC+j38cODyDlUL6ZnfrHnuxTO90jBQn8fgzFLGN5C87Bv/ixrKvoBv5QyPwptQlFTb52CYpxHWg+2b6A57NPlWwV/2J25xryZIHL5AGfZgQZclX78Wisz960Y35kCrodxz9UDDbvlGgn2PYQjbF6CyhwKwDlUM4zmfvWv03rv6UPAwU6xml4ASszHTBL6Rz2Jkb+6DhYArPFNqVlz5pIhbSeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhKNfkA7X9/PI1wjLsH1O+OSaDiuEY666L8i7LUNEKA=;
 b=FK/udrJFLdmWwnIZLxSyiINCiC2mNaRM9GPM34mW2cUbhPXIov6m7EDmDR0Ypa9yRg14m3bGuXNWKlR8Yw907IBVG0XxW3tBfxOzB5ON8Wu6aefc0p6XKv4PTRft8D4wKkqKUsMVZhQeFQdfsd2sa5lWimOZoI8FxWf+HfIDKTM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 08/12] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Thread-Topic: [PATCH v5 08/12] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Thread-Index: AQHZbSQst7ttECjUJEKfLWpPDMYlwq8xDiEA
Date: Tue, 18 Apr 2023 12:49:36 +0000
Message-ID: <EDF6FF5F-2825-4001-BE7E-7361932936C1@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-9-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-9-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB8203:EE_|DBAEUR03FT005:EE_|AM9PR08MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: ab939950-5b6b-4cc0-9856-08db400b66be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O3s1mWV0cksmpnBpg+JXYMCnbQz2e9urghmkzJzSpjVz+7tFOhynRSgIZRknr+OKbjNEmsaJjDFo/6lGoU7Np4WwpNRXyJTdSGQyLnZMNTZBc6sr2IZF9fdceDX6PKS8nxvhww5c7jWtk2OGlekiPgBh+OmxRJ++RvSgsMtG/+FOs71+lHQn87ltY4QF7Bax98ekIZTXbXO/3GhGDGfV45ifqXqgFxSCQJW9DeBJ28L8cV2ziGTkmvMT7RttnDc6hH6ZVKhEyuqHtVNKEx2lcOjcX8JGP1quqwP+IkphYeCTktnG8B9uLkFpDAVSb9uqw09YX+UUifgcDDIeSjF1XfmbYP/eb9LwymiX7Tk1xXT2eQ7H+AjofPXggqgUWyn8hYEnRK8H8ycS+Vw/G/EfwkcUhKckmmywhCqv3zAJQG9H9kVFpobBcmqCPzxjDPbFDbzHlaTg8vo4J9Z5eihgaTvk0llr72NHNG2idcv39bYY6lVq05tYQDZndA/A5k0jjyKMrV5HgXfsy8B/LoqToOsfGW9s4DBhoNLBuzzi2ngv8RAsRA05XNGA3d3aWSl+45KvZhSueMJ/BvumR9wo7581Y1REAhbtn9Anfnlz1y4DBMGoRvEa3AVBtznbhhbiQ6MEdHEEBjHhRN/K4GXkIQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(37006003)(478600001)(71200400001)(38100700002)(8936002)(6862004)(8676002)(316002)(41300700001)(91956017)(4326008)(6636002)(76116006)(66446008)(66556008)(66946007)(54906003)(122000001)(66476007)(186003)(2906002)(53546011)(38070700005)(6512007)(64756008)(6506007)(86362001)(36756003)(33656002)(2616005)(5660300002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <822E84A6CCF5B6408AF04DE5EBFF6AE7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd82ef41-3208-497c-3b61-08db400b5e01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WGBISpLsk0B5+QoRSIpQmBtEuQqQH3dbSBeeUeq4fAWN1Doc+cDGi8yIfTUzYMWaOpEsCbDQwvRJO1SJyw2LeXHjS8oENU4JOXg99MhViRXuUscXPz+INisyzUCM/ox3pchow7WN2M7jzsHjLcMVBzCZg229iHVfxMxSAs8Wn2KKT1QJF0ju82BWafA3QyMszi0C9nQsOYJFl2Ve/2iHoc0OuNTVv/II1YttaprWcIZfn3kM7OJbtm+r1RUPJnvLmP6DMZgZ67XLDYliC/Bbj83apF+jR/FvqVBV+BF6fc0PsAHHU7+RKWqAiQ1cc3zIxUWq73LyJo5uJ0qcvizky1wYea7FAhQpL304Eyd9gr7gAdlIhuyFxmw+LER+SWZva82BKE0e5OwjggsD91vL6rJhzgyJps8aTG6NoY/N8+SPzY0b4WNbyrKulQK5Ow1UvROEWKQOgmwDxbVguvMY+C6frbIhT90YOP3mx3f4BKKoP0inp+Ua9LHgs0T6oWeGyeI0D2ZuFslDYg0erIXFypiAZZR+/ZjATR3dIjkkVZPtX9WXGe1bOzivk7LN0TZGccUildAb0r+dM4f//1lvFS7Mc8Qh6uGacyC5+dQMDq4lehCN30RP26Ihxi9WmL2/hVLtD15EmgJNKDYKUEO97Y0Q47/KEdTTuruJf0AncZdyH8JUKM4ti0GvPXM8Epih2iZkXt0kE9pVUsWIrV4cBg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(41300700001)(40460700003)(82740400003)(36756003)(70586007)(5660300002)(6862004)(2906002)(40480700001)(8676002)(86362001)(33656002)(8936002)(70206006)(82310400005)(4326008)(356005)(81166007)(6512007)(2616005)(336012)(54906003)(6506007)(47076005)(26005)(37006003)(478600001)(6636002)(53546011)(186003)(6486002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 12:49:51.5485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab939950-5b6b-4cc0-9856-08db400b66be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6065

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> When the arm platform supports SVE, advertise the feature in the
> field arch_capabilities in struct xen_sysctl_physinfo by encoding
> the SVE vector length in it.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from v4:
> - Write arch_capabilities from arch_do_physinfo instead of using
>   stub functions (Jan)
> Changes from v3:
> - domainconfig_encode_vl is now named sve_encode_vl
> Changes from v2:
> - Remove XEN_SYSCTL_PHYSCAP_ARM_SVE_SHFT, use MASK_INSR and
>   protect with ifdef XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK (Jan)
> - Use the helper function sve_arch_cap_physinfo to encode
>   the VL into physinfo arch_capabilities field.
> Changes from v1:
> - Use only arch_capabilities and some defines to encode SVE VL
>   (Bertrand, Stefano, Jan)
> Changes from RFC:
> - new patch
> ---
> xen/arch/arm/sysctl.c       | 4 ++++
> xen/include/public/sysctl.h | 4 ++++
> 2 files changed, 8 insertions(+)
>=20
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index b0a78a8b10d0..e9a0661146e4 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -11,11 +11,15 @@
> #include <xen/lib.h>
> #include <xen/errno.h>
> #include <xen/hypercall.h>
> +#include <asm/arm64/sve.h>
> #include <public/sysctl.h>
>=20
> void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
> {
>     pi->capabilities |=3D XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap=
;
> +
> +    pi->arch_capabilities |=3D MASK_INSR(sve_encode_vl(get_sys_vl_len())=
,
> +                                       XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
> }
>=20
> long arch_do_sysctl(struct xen_sysctl *sysctl,
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 2b24d6bfd00e..9d06e92d0f6a 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -94,6 +94,10 @@ struct xen_sysctl_tbuf_op {
> /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
> #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
>=20
> +#if defined(__arm__) || defined(__aarch64__)
> +#define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
> +#endif
> +
> struct xen_sysctl_physinfo {
>     uint32_t threads_per_core;
>     uint32_t cores_per_socket;
> --=20
> 2.34.1
>=20


