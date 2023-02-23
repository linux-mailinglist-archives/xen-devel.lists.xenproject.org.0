Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762636A0C67
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 16:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500492.771902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVD5r-0007Rf-Kx; Thu, 23 Feb 2023 15:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500492.771902; Thu, 23 Feb 2023 15:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVD5r-0007Pw-He; Thu, 23 Feb 2023 15:01:11 +0000
Received: by outflank-mailman (input) for mailman id 500492;
 Thu, 23 Feb 2023 15:01:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVD5p-0007Pq-De
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 15:01:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e49c793f-b38a-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 16:01:04 +0100 (CET)
Received: from AM5PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:206:1::34)
 by DU0PR08MB8113.eurprd08.prod.outlook.com (2603:10a6:10:3e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 15:00:57 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::a4) by AM5PR04CA0021.outlook.office365.com
 (2603:10a6:206:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21 via Frontend
 Transport; Thu, 23 Feb 2023 15:00:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.23 via Frontend Transport; Thu, 23 Feb 2023 15:00:57 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Thu, 23 Feb 2023 15:00:57 +0000
Received: from acffc3a63db9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B95AE28-EBA5-433A-8563-2911F26960DE.1; 
 Thu, 23 Feb 2023 15:00:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id acffc3a63db9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 15:00:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 15:00:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 15:00:46 +0000
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
X-Inumbo-ID: e49c793f-b38a-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IpBqcgejw9x7ifkpK3kItj67yxlqVCROMvqUOnxhe0=;
 b=WjPAgwk23CFOp4b14g+GLgw4RLB4eVwfSfoL5FZvPwOYFntZNd2mH34Gi117CyL4hd7JVVgPFLmCllEbpbUaSfwzd8Q5t4hGoUHtUa0B3heyHQD6/ygiOCu2Qi8Kb6IBK9RppkkyIC2sOkJtQeTmU8iQVVeCc1xm891NRMwE/2g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59b3696accfe1876
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dU/idPi8DgNbgLhFmibwKy606A62nVtH9BUAw/wyDXfoew531M4QaOHT81AzShdKQKYjEChKU7UMBJ2QntOHMFCdzVJiBjgc1QYfrlyMbmmrvuFDa7UJcyu3OHfO2eK9x6M+1spPu2S6la89ZPlm62RvO9B31w7RcKqUU5E5f0QkyNwqpBRN171UMYjoDUxsJEUJu8i6btdzFP2eFT626jyUWND9uatgVIHBDg7fzYRqstaVHAj3APEHr6eEqCBh1GVduxENajc+3TWosmiKDBSEI7dpa12heVGIzUcPhMXRlJwo5jxXVvuZ+WrJhwcdkc7XwBeT3PlKZ3SZwUullg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IpBqcgejw9x7ifkpK3kItj67yxlqVCROMvqUOnxhe0=;
 b=hro57uupwKCw5eoZlYpdCkReb1pv4/o+h2Zn23EUipexCLwbtpEtAxf3UenG+7GZgrBGpqNgzqP1hIpGYgJEeWFl9inSZee8/5JJoEN6XCeoTBowDFE1ykvmtloGRe16FvfPzgDYt68ASxc2uzgUwn2OF/ifLwQkrQCXsF0VjpgHDkvpNJOoWCLZhq173t+5btYUcK6D/OnP6A/4m6unCa+q7hlmxzr7VEXBvotFW9B5Z0royqZ3wBFpfjkUTidF0rXvzvUWn6MUYkLHUG5+YgcV+NXrxLQkeK4EKanYbEDUw7cf8QixVP83Erz2dCEAQvkxijGcGFhNpaiLOIRTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IpBqcgejw9x7ifkpK3kItj67yxlqVCROMvqUOnxhe0=;
 b=WjPAgwk23CFOp4b14g+GLgw4RLB4eVwfSfoL5FZvPwOYFntZNd2mH34Gi117CyL4hd7JVVgPFLmCllEbpbUaSfwzd8Q5t4hGoUHtUa0B3heyHQD6/ygiOCu2Qi8Kb6IBK9RppkkyIC2sOkJtQeTmU8iQVVeCc1xm891NRMwE/2g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [XEN PATCH v7 03/20] tools: add Arm FF-A mediator
Thread-Topic: [XEN PATCH v7 03/20] tools: add Arm FF-A mediator
Thread-Index: AQHZRtMZ0ovXi3hHTkWyIcljJ4xOm67coYOA
Date: Thu, 23 Feb 2023 15:00:45 +0000
Message-ID: <5F594716-3F59-40E2-8FD8-74036E8D834C@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <ede0da127fe74526e6b401e6b44d1407fe28cb70.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <ede0da127fe74526e6b401e6b44d1407fe28cb70.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6697:EE_|AM7EUR03FT050:EE_|DU0PR08MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: b1bd3443-2e2b-44d8-3778-08db15aec4e1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C8ix+LD1zUOyXgVQROqUL5h5uFcYyC9biiuu+UrfFJ2d25dD7KixMKIN6DNPbbmrLIuaF3923jQFYwFpuNiSuG2MAcX4BM/FVa1GcoRS/P8JkEbFDtqx5hXBcN8IKwiiMNQWS408iowfrKtbppitH60T4CWaSOP8exDLFhR69ka/tCQoMunbxuZ+VCCLWPj8IQtHfCz75rT+i94FieCy8pgLIY4lggrbZ3Y6+csFTb24o+gN/K9sOVfIk/ehpwoDv07P8CSxE/lL8LqCIFS29sNK9YeCMy0a8sApd1mxTJDek4WJFnXr2JkNfn1NJj/Jy56dFDpoV4c1+KW9BiWFqnV/PY1TS5NbGuav/cJf9HZvHcbqgQZ27GngK4uwnxligucvRivPOO3G8QbnZd+YIw/xuxUcUU4FPqEYDD3q/7pPWWVy8mSboQ0T0/pbaLTydoadazP6LoN+jHxRA8r13vmmqHRkDDojiAgrVn64MDPaoiLk2h9MOQ4Xi6dI80cSwm/JT0q42BqbrVMYN2RIRX/eWTAd9WPLqzu3FzhdjMqdF4pXIMvGIrx7Hcoc8B/flCq4Jd/p1ZvzopHnTuRVI2ysUytba5gsbo1DGO62O5eaVHcm61rytApbU5X9kRX4S7Ldt3Qc11my71F6oJu++5Uzk02nMG+2Bm61pYzkAivlxV4wCYhtRMOvmZIXVfk6DbBT+8rWXDVVhnHEOiwKVEqFZTEG33PJHc7em4XDaqU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199018)(38070700005)(83380400001)(38100700002)(122000001)(86362001)(33656002)(36756003)(2906002)(8936002)(41300700001)(5660300002)(26005)(186003)(53546011)(6506007)(2616005)(6512007)(54906003)(4326008)(8676002)(316002)(64756008)(66476007)(91956017)(66446008)(66946007)(76116006)(478600001)(6486002)(66556008)(71200400001)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D94EF2B3583E7E45B31C2F39333ADAB5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6697
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	293a16b6-2c9c-4477-1c81-08db15aebe12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oBRADV58qq1/YFlSvsdBBia9mkPROEezKXtzgoXk4ut8bpNleHtRMxGhYE8FM1zZU3tRfv7277/Tc/MhCM+Sgr65/pGRSY2FbkjzANc6k5PyCmdu/VZ+AF0vl5kSmqMHhIS7sKEc97qMPlDXl7OHRby6YT4NikOZVMco8lRdynDUAN+owfBAxXNsZ0N3CVVtkaDp7fKQctzgWITRjR36/tH8XfI1uYDy7omIfzKF6e98jWhQpfgjyAU9wRsnh7KeR1Gq23wxSt5TZgYfJm8AFMS+QpO+hrYjrw+C+Zx7SDpnnEP4RdnB0Oc2pWT4YT0KgvVZ9u9U7khL1v6x3IvPrkw5LITRojSRpSNyYYyvo0J3iWmpFZ+g6MmaoZhgtC7VM2UOgRqWEpp3oah0tpNp1rVcwfRy8n+RNEaHtb3huO3e0rgNCWnGvu7O+b5v5npsHpkY6J4p0NIAt5SQG2vZ4MxO2EAdwddTsvxUfViS3lJZQPpDWro9cDRXyixYIKNVRByrwod3X9OJtoSNMRY8Wc12cN+O3mOr7JPcqgmkzV+AsiHRMnzQEkcVPIFavdnXLPqfjFW9t0V33lsa7ptxivFtanVCBtEy9Ow8RETlc4y6OKFQxfETQ1n+W8YtH89zalG6S7QLnLaQfWmF5nSsS4DUeSjqdwoU3ku2sQKS2FwcsXGywZ9dEwEL4Rci3dxa+uOAl7PpaJ+UuZ5WcQcwMA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199018)(40470700004)(46966006)(36840700001)(86362001)(33656002)(2906002)(356005)(36756003)(5660300002)(41300700001)(8936002)(83380400001)(81166007)(6862004)(82740400003)(70586007)(8676002)(54906003)(6486002)(70206006)(107886003)(26005)(40480700001)(2616005)(6512007)(82310400005)(36860700001)(53546011)(478600001)(336012)(4326008)(316002)(40460700003)(6506007)(186003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 15:00:57.4175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bd3443-2e2b-44d8-3778-08db15aec4e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8113

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
> guest is trusted to use FF-A.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> tools/libs/light/libxl_arm.c     | 3 +++
> tools/libs/light/libxl_types.idl | 3 ++-
> 2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index ddc7b2a15975..601890dda1ce 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -205,6 +205,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>     case LIBXL_TEE_TYPE_OPTEE:
>         config->arch.tee_type =3D XEN_DOMCTL_CONFIG_TEE_OPTEE;
>         break;
> +    case LIBXL_TEE_TYPE_FFA:
> +        config->arch.tee_type =3D XEN_DOMCTL_CONFIG_TEE_FFA;
> +        break;
>     default:
>         LOG(ERROR, "Unknown TEE type %d",
>             d_config->b_info.tee);
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 0cfad8508dbd..64fb570bc19a 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -494,7 +494,8 @@ libxl_gic_version =3D Enumeration("gic_version", [
>=20
> libxl_tee_type =3D Enumeration("tee_type", [
>     (0, "none"),
> -    (1, "optee")
> +    (1, "optee"),
> +    (2, "ffa")
>     ], init_val =3D "LIBXL_TEE_TYPE_NONE")
>=20
> libxl_rdm_reserve =3D Struct("rdm_reserve", [
> --=20
> 2.34.1
>=20


