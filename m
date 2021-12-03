Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9A467B10
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 17:12:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237827.412475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtBAQ-0007ej-24; Fri, 03 Dec 2021 16:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237827.412475; Fri, 03 Dec 2021 16:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtBAP-0007cs-UA; Fri, 03 Dec 2021 16:12:09 +0000
Received: by outflank-mailman (input) for mailman id 237827;
 Fri, 03 Dec 2021 16:12:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOtX=QU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mtBAO-0007cV-LD
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 16:12:08 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe06::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c26daed1-5453-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 17:12:07 +0100 (CET)
Received: from AM6P192CA0013.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::26)
 by AM5PR0802MB2433.eurprd08.prod.outlook.com (2603:10a6:203:9f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 16:12:04 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::65) by AM6P192CA0013.outlook.office365.com
 (2603:10a6:209:83::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 16:12:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Fri, 3 Dec 2021 16:12:04 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Fri, 03 Dec 2021 16:12:03 +0000
Received: from a11e18501705.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D91C490B-C7A6-43E4-B14C-56C23BBBF470.1; 
 Fri, 03 Dec 2021 16:11:47 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a11e18501705.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Dec 2021 16:11:47 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5802.eurprd08.prod.outlook.com (2603:10a6:102:8a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 16:11:45 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb%6]) with mapi id 15.20.4690.034; Fri, 3 Dec 2021
 16:11:45 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0030.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Fri, 3 Dec 2021 16:11:45 +0000
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
X-Inumbo-ID: c26daed1-5453-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCRiyhMnjTaYecQ/DEDtokAnrGVsW8nWixQd2afqiQ0=;
 b=AWADUkJxY6h6eWVgyDxudmNSChQ1DSOS6JVQOCu8/CxCwpeJhA5dETtto2vRyfkRfGxt04X9YD7AQJY2cRGHZMuUQjgv6KbWKA8/83Kc6NfDjqafAIjF7eKaKmngE+uPmHvvNvcf2M/YZTMUJFy5GqNbEhDcdVsGhcg6Ig5FqnQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 819b9da4436ebf44
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjFhRPYCBs3HW//WGPCjgLhg5GpSA+dxT0npvJ7PkwxlS9v/1xHU2qbQJqD9Mco8eTSkLL4gJXSeWdgEiUbGbctxTzOe7KC1mWvKKYwSVUPZUrMf6Fc8//TKV88csRlEhUoUdBFf0vJvY6mPlzF2e2+fFtl444tTmSOu/WeR/RczmtqBB31EuUoatfXW3MalFWNeh/XYvqasAAC/jtyxbxgoin+mMkCjkn+COt4nHlkfRU5C1gvmXaR+AZZU/SzZf6YIfYnEDzJYuV5Z5HxxzpvLGlbdNyenk1jN6znFZXmPm+aHVwf5kepqsnst+frzoOOBIgbwfwu4HrVl9Iyyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCRiyhMnjTaYecQ/DEDtokAnrGVsW8nWixQd2afqiQ0=;
 b=CpDCh6dZS54IHno4NQwUTX5dDaRiSBY9aCr4+gc2bv4mS3VRA624NLsN8wij8r27owrLL9cQ0BoDg1GknH2Avp5WlOL8Wez2FVTAnYPVx1c91RDfRFK4SY9HvZ3JePIPUsZAbtgBl+bXIcFCk4DFFe+dsScHgISe0SFA96vlLlcp0Y4Rrnja9MyrYynEWvb+PrtWDDwK+f4ht8krkgcBFeNyT5Kd3Qfv73X7hzEnlORtOdZq4BvkQOCHLJ53HdF4xZ2fywV3HVSi5K8BkUUK8YWGFQJW753qGm4a8S0P9UAS4x+re/T3S50GuMIQtvs6KyJkFnELEdhl3suiViQFQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCRiyhMnjTaYecQ/DEDtokAnrGVsW8nWixQd2afqiQ0=;
 b=AWADUkJxY6h6eWVgyDxudmNSChQ1DSOS6JVQOCu8/CxCwpeJhA5dETtto2vRyfkRfGxt04X9YD7AQJY2cRGHZMuUQjgv6KbWKA8/83Kc6NfDjqafAIjF7eKaKmngE+uPmHvvNvcf2M/YZTMUJFy5GqNbEhDcdVsGhcg6Ig5FqnQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 3/3] EFI: drop copy-in from QueryVariableInfo()'s OUT-only
 variable bouncing
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <edde87a3-beb3-c109-65ef-36e74df28e7a@suse.com>
Date: Fri, 3 Dec 2021 16:11:44 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CDB88FAF-B16A-41F1-88E3-D35EDBEB5027@arm.com>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <edde87a3-beb3-c109-65ef-36e74df28e7a@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::18) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab61dd88-658c-4399-ead0-08d9b677a565
X-MS-TrafficTypeDiagnostic: PR3PR08MB5802:|AM5PR0802MB2433:
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB24337AE88461FEA4B3317873E46A9@AM5PR0802MB2433.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 L52W75vWF0sBSPtyEgGKLNyyY6tBrHr2gTBAXY4GL0X8kqYO13ByOUSApuh8iuFF/DOS8ypW+ZF/Wt3qEEzCslWV5k8/DuXLoAB2smmMsmYj/qrgtoSY3sf3HatelE5PmRVzeT9bFhFl4MP2NwLm5ULOXU+lPw4oAgOu/Wh7Qx5EtneB4TPwL/jrBxuFbx7OXtzmUhl3TKka75ZCoM9PPTCHSXiLt7mpbLX8VA+QRjX9X0Pk/l7lijA91jj8XPQWJ+imaEIc8c8UVuo3GHHlH6NrjHeSIE7DGNL9f0tagmzuZyIajxkE8gPpEj6OLVk0QSh8jnk0mH675gScs3Z8XiG07VQstASy+lhC1R/f8kMH1/vVOSvMOpaLefVT1nyiDnMbz8Af6WeF5VreAso0hTka9zo4lf7JPnqdKTBNU3p3H3w7FEU7xa7TfHdpMGKXeGi4OON3HNX4SAu+Y5fFqoCXHOtZ25s/8tB0kjWe9HZPAlCpgIfzhefe9dS5TifeNUzvvgRagROdd69ED8qvEY1/aJyt+su20rzt8WL0qJ6xV8Vx4ix+IBbMwj3mON2oH3f+IXRGhOVj5a8DPOoswuR5ESMpDjvmuu5bh5Y3Vss2Y2WqExzvOC9K6+5B4kAeEPKCdzB+v3YcaOyED64WCTYu//jIea+Jt3gji78BslSiNCuH0PDuzV/wiDaGxGQThqnbjUJVzj4qjbH/jOE1fd0C3Bk0uN7wreG8AdMaW5Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(53546011)(2906002)(508600001)(6506007)(52116002)(26005)(6916009)(8936002)(956004)(316002)(5660300002)(2616005)(186003)(4326008)(44832011)(6486002)(66556008)(8676002)(66946007)(38350700002)(33656002)(66476007)(38100700002)(83380400001)(54906003)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5802
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a931acaa-e7cf-46b8-bbb2-08d9b6779a24
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pq5m0AwiQ39Kh7eip+j0RSuvH1KU3qPyZvNghrxsCFcSL3CjHRgNDQ6egX7fNanFqE6zcjinAuapU0qrVd4cm06QbMxgdLMhjXjCFPK95vwXpznIz/I0PtMpsqoi50tRrq51zhUvT5fA9CTIgV1G8inq4mrvOOVHiLaLcMlS3HBTBDEl3xmMksNaJH4v3NALWpAUiyDjHdOwC/AGyS8HqA+tZOQzM2+bRqEe6rKyDVU2MMj1rHHX5Gjam3zrk53xSNHuGd9n0djdq8F8aW/THvNjp5viEZzFcMF5AMUmw54+eJrmUES5SDDkpMnFe2mx4HFtAGiC5O4bv76eIM8nszA/BEKHEAC0SnHV3wTRpc0XTOAOzmGUXBLIBs1s5dggCUfrZ46Se2d3/j25j7+akjfh0RsFLaiYSRf34Jv3F7BOfT7DxEhuiF9UaqtON+O4bekgKZyMYhe0buy96DDUGeNA1uEEjk91Q2P8WyxJdRBj4QjTXW5ZxiS8bSL1v/+97jnzwt1yk0ZWwzJJttxi5w+gDUAz1Oo/iuBS6Jpom49tVUP125kDoTu30IdK4xmZMTFk2sioKcL68GwDRhSkfO+U3CxA9eyI/zV/AqapZruC3IvJE7QJxYW1ug3RkJfMv8RcKu/gM+KysY+ltmDgpQy14vivm205QU9qqKkfp5X8hX/oY0Awxp6Bmqg65rCfRSJHauXmzeAjZzz/UwZ08Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6512007)(107886003)(6486002)(33656002)(186003)(70586007)(44832011)(8676002)(83380400001)(86362001)(36756003)(6506007)(956004)(53546011)(316002)(26005)(82310400004)(8936002)(4326008)(336012)(81166007)(2906002)(5660300002)(508600001)(54906003)(6862004)(70206006)(36860700001)(47076005)(356005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 16:12:04.0825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab61dd88-658c-4399-ead0-08d9b677a565
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2433



> On 3 Dec 2021, at 10:58, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> While be12fcca8b78 ("efi: fix alignment of function parameters in compat
> mode") intentionally bounced them both ways to avoid any functional
> change so close to the release of 4.16, the bouncing-in shouldn't really
> be needed. In exchange the local variables need to gain initializers to
> avoid copying back prior stack contents.
>=20

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -608,7 +608,15 @@ int efi_runtime_call(struct xenpf_efi_ru
>=20
>     case XEN_EFI_query_variable_info:
>     {
> -        uint64_t max_store_size, remain_store_size, max_size;
> +        /*
> +         * Put OUT variables on the stack to make them 8 byte aligned wh=
en
> +         * called from the compat handler, as their placement in
> +         * compat_pf_efi_runtime_call will make them 4 byte aligned inst=
ead
> +         * and compilers may validly complain.  This is done regardless =
of
> +         * whether called from the compat handler or not, as it's not wo=
rth
> +         * the extra logic to differentiate.
> +         */
> +        uint64_t max_store_size =3D 0, remain_store_size =3D 0, max_size=
 =3D 0;
>=20
>         if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
>             return -EINVAL;
> @@ -642,21 +650,6 @@ int efi_runtime_call(struct xenpf_efi_ru
>         if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
>             return -EOPNOTSUPP;
>=20
> -        /*
> -         * Bounce the variables onto the stack to make them 8 byte align=
ed when
> -         * called from the compat handler, as their placement in
> -         * compat_pf_efi_runtime_call will make them 4 byte aligned inst=
ead and
> -         * and compilers may validly complain.
> -         *
> -         * Note that while the function parameters are OUT only, copy th=
e
> -         * values here anyway just in case. This is done regardless of w=
hether
> -         * called from the compat handler or not, as it's not worth the =
extra
> -         * logic to differentiate.
> -         */
> -        max_store_size =3D op->u.query_variable_info.max_store_size;
> -        remain_store_size =3D op->u.query_variable_info.remain_store_siz=
e;
> -        max_size =3D op->u.query_variable_info.max_size;
> -
>         state =3D efi_rs_enter();
>         if ( !state.cr3 )
>             return -EOPNOTSUPP;
>=20
>=20


