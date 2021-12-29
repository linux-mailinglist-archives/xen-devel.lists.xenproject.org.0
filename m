Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383134815AC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 18:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252370.433391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2cYN-0001zr-45; Wed, 29 Dec 2021 17:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252370.433391; Wed, 29 Dec 2021 17:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2cYN-0001xt-0n; Wed, 29 Dec 2021 17:15:55 +0000
Received: by outflank-mailman (input) for mailman id 252370;
 Wed, 29 Dec 2021 17:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsxB=RO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1n2cYL-0001xl-JY
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 17:15:53 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe05::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7edfcec-68ca-11ec-bb0b-79c175774b5d;
 Wed, 29 Dec 2021 18:15:51 +0100 (CET)
Received: from AS9PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:20b:488::26)
 by DB7PR08MB3020.eurprd08.prod.outlook.com (2603:10a6:5:1d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Wed, 29 Dec
 2021 17:15:46 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::c0) by AS9PR05CA0028.outlook.office365.com
 (2603:10a6:20b:488::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Wed, 29 Dec 2021 17:15:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14 via Frontend Transport; Wed, 29 Dec 2021 17:15:45 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Wed, 29 Dec 2021 17:15:45 +0000
Received: from 4720f6a14644.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2AD511D6-0175-4273-B776-837F44E95C20.1; 
 Wed, 29 Dec 2021 17:15:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4720f6a14644.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Dec 2021 17:15:39 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by VI1PR0802MB2336.eurprd08.prod.outlook.com
 (2603:10a6:800:9c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Wed, 29 Dec
 2021 17:15:34 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4%3]) with mapi id 15.20.4823.024; Wed, 29 Dec 2021
 17:15:34 +0000
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
X-Inumbo-ID: f7edfcec-68ca-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF5kjH+vMSs7Po8QNVvxtHRgsXl82Xb5byTtYYQCYA8=;
 b=hLHYSAHpDgh9UADiGOCHR9ROrglTQ2luIhyWOdYQfDAe6x39Qj3TBQk6o/EWjS+qwW9Psb5mojPze2dESbRVlFP8gdN8ViQYp5PlQ0lr4ipMuUZ+NtH1FYAMXu6p3HIQs6vFKkRg2WmnUNEtA3yM5ZpSA0bPtzjhhsgqCr//mxc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f630f895ac8c22ab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtzA8rQSaqFfnKtKVknjEwwrnQg7wc87Vm5tJYAwmPxYR87gq1pbpI/YdlimCNs/X6SYZP/GPOeAw/PSaEbB77I3ZK8bk+oDJpD94MvoaLnUpZZcwhbQv0Q3UEksCEc9a0dJgM8vYTbC02VhkS9+MzeVA3tByv9FDGm9D0sYbcelhQzhz+E8PZRgEFVT+yyvi8t5XTrsNCmW2RJfQy7LBln+pvUx4uINtiQRgcgyX11zAc5Xd7omuC727OXXO15JCMVRTN4xdSbrBWo+5ITfhzdDqU4lWWBqnJXI0vkK6ctQocEGU6yNdrRjJGZvXQ4FTAHpa9n/6fiTY28eOL/zeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF5kjH+vMSs7Po8QNVvxtHRgsXl82Xb5byTtYYQCYA8=;
 b=AzcOuPbTn7oy62lhg2ukcQ+FUAJX8PZOwipBkz7gS0A2aaEFoVyyGUjkxMGgujGrWTF3BvZVPQy+K9kChoBngu9rtS8U/CzIiaDOS1QnPBBT3MRNg1ETd3Dy6mmoQ6mwgySq4Fb3ziaoiyBeXa8EFFkWOe/feF/DAhf2xqmu7FCdXYIuoAWJCKD4Es6m9ObVCvRGg/iTiqMS9xK3+9Tq8g1UK58Quklyd1x972dO8Vcp1nVxR65PAh76GWhTv8j7xI+k/MX+PI0elYQJoqOsl6c0IwT7xzYJitTOBPDCt0ycmS1PXteR1JvKVaTxksjG25ZKmPu+P4w5MYlhhN0Udg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF5kjH+vMSs7Po8QNVvxtHRgsXl82Xb5byTtYYQCYA8=;
 b=hLHYSAHpDgh9UADiGOCHR9ROrglTQ2luIhyWOdYQfDAe6x39Qj3TBQk6o/EWjS+qwW9Psb5mojPze2dESbRVlFP8gdN8ViQYp5PlQ0lr4ipMuUZ+NtH1FYAMXu6p3HIQs6vFKkRg2WmnUNEtA3yM5ZpSA0bPtzjhhsgqCr//mxc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 1/5] tools/libxl: Mark pointer args of many functions
 constant
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <80dd561339dbe54f1ed2c2302ace389e87d445fe.1640590794.git.ehem+xen@m5p.com>
Date: Wed, 29 Dec 2021 17:15:25 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E320F70F-6BE7-43E9-822D-F175862D0005@arm.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
 <80dd561339dbe54f1ed2c2302ace389e87d445fe.1640590794.git.ehem+xen@m5p.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 33bc3186-e232-42d1-dca4-08d9caeeda1e
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2336:EE_|VE1EUR03FT029:EE_|DB7PR08MB3020:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3020B818270548B260AAA1C4E4449@DB7PR08MB3020.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 42u7uaJNRb4DS3S2LcykdVJ5cbISbS38zA7wbnvjzlxOvciTgJEzk7q0NeXcFIBNKp2HQ3x4z3c/bNf3D9wzk1uS9lCpejInxGdCqc+OKmiWI1GoziZ1qxeUDnNUk3i30+iR2UVbKtSN7KUgOS7wxvbfI06rWH+jC1XwqUB2eVsi2O1zur23TWb0VPuFSx9KV3hiWEgsH91WjsulGstKqSoGsOQiqSa7E2BNB+FFBqiEiKIw5navEY3dEPMdEHktxp7a/0a2GzCqp3/yzkQLq7Qcpr3cccbFouEf1Pp6gxre6QnV+qRVvzUFtpBJmvwVy0ALaFngCSBlRREyRW9ZbZsxZKON0M9BPkh8aHemWCwKV31D2/3koL7d17rCal186pSMBzDGUZDvqQaC03xplKZTFzZbBdmWZ44x3kCKhExWvTzVW1n9uciW8X4y3nz1YijuOM4lzSVvspN6AOfhMVapgZogeS+WDSGS874ghx0mr0u8M8S+lSCMVtYEF8sebkYXajwViuojnS2aHAk7Im+WZniYMBsl8orSxCQUtRzeoInPRjoyioaddrSzNKXSZZmhVawADoqkYYJxRbu8BAjxPJifZQfGR+Mvyme4lmB2mamyFqjGr+uxJacWKD0pZ0/XG8JzgXstW0kHdZ6Tl/YWmPWMRPkJXVpxjXuCFkf69tSAFIwMb+XeOmBSSGXB1K3p4af62sVOjUmXwP2uTzmbSh+2UeMVWwI+bDFFK7E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(36756003)(6506007)(53546011)(66476007)(54906003)(5660300002)(186003)(66946007)(44832011)(66556008)(26005)(2616005)(33656002)(38350700002)(38100700002)(86362001)(316002)(8676002)(6512007)(83380400001)(52116002)(8936002)(6666004)(2906002)(30864003)(4326008)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d4df48a6-8ed1-424c-7ca1-08d9caeed329
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YfVFQzpsPfyyN9gWZRmllpbxtS1kcFPPBPRtYRQ5IfuP2iD/O59sHbDM6xSsDhKkFU98v5P2oUy1e5hqOTqIhswB9YlHNUVZz/WL/wK/I/MGXsbSDKeivyYxGWpY7Q44kbbA02HqsGnj7NYjA0sNWGJVB0odQBV3mXMZtaaM5cRgAeys8Ci0ab1sVPBhcBtOe0SlvouxguzN4qF9OekungKobSpBzsl2UQ0UhIeT4Fu6HxQKIic63UvAqtm5bcPW4+dt+iLd+lghzxzdf+YbMDGfH/YrcvSjqGzgSRo5++tq9wpkaQUyghmBnbtYeNaihKM4HwsXQKGdS8yw/CRIZ7V0ugQmOyxgs1nr1YbVzQLlwlMF/eG4greGB6DUWLGcTCDjzI18qkmsuboWAUdSXghkLGnMejrhG//hPJtwJSf43yc7tXzDh0HKUFwxYdVgH07xncJrx/trHKqhrCOiCDiUCv8V7ygrYoozqYn/aBtBrfXOlyDxUnE307iRu6Y0RX0s46ugiIpXHz0q+gBaotYDBMvtCcswlIE8SW6xcsgS6JR5Ros10e6BjtT4EtdsPmKwaVdfKsqOruTfoN7V5QRTfHY4Q/rCQfafU5kAPElw+5EDck4Zi4lkzu3TB2dVwinf3PUYPtKi7KLw7IGvFRS6QkGhW7iONd9ORca2OAWBxT152epVOFAh1wZzJPPmmHhp7YYVZK3iywzQU84jTg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(53546011)(26005)(107886003)(6506007)(8936002)(70206006)(316002)(54906003)(336012)(4326008)(6512007)(6862004)(186003)(81166007)(36756003)(83380400001)(82310400004)(47076005)(2616005)(44832011)(86362001)(6486002)(2906002)(30864003)(8676002)(70586007)(36860700001)(6666004)(33656002)(5660300002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 17:15:45.8681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bc3186-e232-42d1-dca4-08d9caeeda1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3020



> On 18 Dec 2020, at 21:37, Elliott Mitchell <ehem+xen@m5p.com> wrote:
>=20
> Anything *_is_empty(), *_is_default(), or *_gen_json() is going to be
> examining the pointed to thing, not modifying it.  This potentially
> results in higher-performance output.  This also allows spreading
> constants further, allowing more checking and security.

Looks ok to me
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

>=20
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> tools/include/libxl_json.h        | 22 ++++++++++++----------
> tools/libs/light/gentypes.py      |  8 ++++----
> tools/libs/light/libxl_cpuid.c    |  2 +-
> tools/libs/light/libxl_internal.c |  4 ++--
> tools/libs/light/libxl_internal.h | 18 +++++++++---------
> tools/libs/light/libxl_json.c     | 18 ++++++++++--------
> tools/libs/light/libxl_nocpuid.c  |  4 ++--
> 7 files changed, 40 insertions(+), 36 deletions(-)
>=20
> diff --git a/tools/include/libxl_json.h b/tools/include/libxl_json.h
> index 260783bfde..63f0e58fe1 100644
> --- a/tools/include/libxl_json.h
> +++ b/tools/include/libxl_json.h
> @@ -23,17 +23,19 @@
> #endif
>=20
> yajl_gen_status libxl__uint64_gen_json(yajl_gen hand, uint64_t val);
> -yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, libxl_defbool *p);
> -yajl_gen_status libxl_uuid_gen_json(yajl_gen hand, libxl_uuid *p);
> -yajl_gen_status libxl_mac_gen_json(yajl_gen hand, libxl_mac *p);
> -yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand, libxl_bitmap *p);
> +yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, const libxl_defboo=
l *p);
> +yajl_gen_status libxl_uuid_gen_json(yajl_gen hand, const libxl_uuid *p);
> +yajl_gen_status libxl_mac_gen_json(yajl_gen hand, const libxl_mac *p);
> +yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand, const libxl_bitmap =
*p);
> yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
> -                                                 libxl_cpuid_policy_list=
 *p);
> -yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, libxl_string_l=
ist *p);
> +                                                 const libxl_cpuid_polic=
y_list *p);
> +yajl_gen_status libxl_string_list_gen_json(yajl_gen hand,
> +                                           const libxl_string_list *p);
> yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
> -                                              libxl_key_value_list *p);
> -yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand, libxl_hwcap *p);
> -yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_ge=
nid *p);
> +                                              const libxl_key_value_list=
 *p);
> +yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand, const libxl_hwcap *p=
);
> +yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand,
> +                                           const libxl_ms_vm_genid *p);
>=20
> #include <_libxl_types_json.h>
>=20
> @@ -91,6 +93,6 @@ static inline yajl_gen libxl_yajl_gen_alloc(const yajl_=
alloc_funcs *allocFuncs)
> #endif /* !HAVE_YAJL_V2 */
>=20
> yajl_gen_status libxl_domain_config_gen_json(yajl_gen hand,
> -                                             libxl_domain_config *p);
> +                                             const libxl_domain_config *=
p);
>=20
> #endif /* LIBXL_JSON_H */
> diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
> index 9a45e45acc..7e02a5366f 100644
> --- a/tools/libs/light/gentypes.py
> +++ b/tools/libs/light/gentypes.py
> @@ -632,7 +632,7 @@ if __name__ =3D=3D '__main__':
>                                                ty.make_arg("p"),
>                                                ku.keyvar.type.make_arg(ku=
.keyvar.name)))
>         if ty.json_gen_fn is not None:
> -            f.write("%schar *%s_to_json(libxl_ctx *ctx, %s);\n" % (ty.hi=
dden(), ty.typename, ty.make_arg("p")))
> +            f.write("%schar *%s_to_json(libxl_ctx *ctx, const %s);\n" % =
(ty.hidden(), ty.typename, ty.make_arg("p")))
>         if ty.json_parse_fn is not None:
>             f.write("%sint %s_from_json(libxl_ctx *ctx, %s, const char *s=
);\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=3Didl.PASS_BY_RE=
FERENCE)))
>         if isinstance(ty, idl.Enumeration):
> @@ -662,7 +662,7 @@ if __name__ =3D=3D '__main__':
> """ % (header_json_define, header_json_define, " ".join(sys.argv)))
>=20
>     for ty in [ty for ty in types if ty.json_gen_fn is not None]:
> -        f.write("%syajl_gen_status %s_gen_json(yajl_gen hand, %s);\n" % =
(ty.hidden(), ty.typename, ty.make_arg("p", passby=3Didl.PASS_BY_REFERENCE)=
))
> +        f.write("%syajl_gen_status %s_gen_json(yajl_gen hand, const %s);=
\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=3Didl.PASS_BY_REFE=
RENCE)))
>=20
>     f.write("\n")
>     f.write("""#endif /* %s */\n""" % header_json_define)
> @@ -766,13 +766,13 @@ if __name__ =3D=3D '__main__':
>         f.write("\n")
>=20
>     for ty in [t for t in types if t.json_gen_fn is not None]:
> -        f.write("yajl_gen_status %s_gen_json(yajl_gen hand, %s)\n" % (ty=
.typename, ty.make_arg("p", passby=3Didl.PASS_BY_REFERENCE)))
> +        f.write("yajl_gen_status %s_gen_json(yajl_gen hand, const %s)\n"=
 % (ty.typename, ty.make_arg("p", passby=3Didl.PASS_BY_REFERENCE)))
>         f.write("{\n")
>         f.write(libxl_C_type_gen_json(ty, "p"))
>         f.write("}\n")
>         f.write("\n")
>=20
> -        f.write("char *%s_to_json(libxl_ctx *ctx, %s)\n" % (ty.typename,=
 ty.make_arg("p")))
> +        f.write("char *%s_to_json(libxl_ctx *ctx, const %s)\n" % (ty.typ=
ename, ty.make_arg("p")))
>         f.write("{\n")
>         f.write(libxl_C_type_to_json(ty, "p"))
>         f.write("}\n")
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpui=
d.c
> index e1acf6648d..b076d7f4a3 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -14,7 +14,7 @@
>=20
> #include "libxl_internal.h"
>=20
> -int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
> +int libxl__cpuid_policy_is_empty(const libxl_cpuid_policy_list *pl)
> {
>     return !libxl_cpuid_policy_list_length(pl);
> }
> diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_i=
nternal.c
> index 86556b6113..da2dbd67ad 100644
> --- a/tools/libs/light/libxl_internal.c
> +++ b/tools/libs/light/libxl_internal.c
> @@ -333,7 +333,7 @@ _hidden int libxl__parse_mac(const char *s, libxl_mac=
 mac)
>     return 0;
> }
>=20
> -_hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b)
> +_hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b)
> {
>     int i;
>=20
> @@ -345,7 +345,7 @@ _hidden int libxl__compare_macs(libxl_mac *a, libxl_m=
ac *b)
>     return 0;
> }
>=20
> -_hidden int libxl__mac_is_default(libxl_mac *mac)
> +_hidden int libxl__mac_is_default(const libxl_mac *mac)
> {
>     return (!(*mac)[0] && !(*mac)[1] && !(*mac)[2] &&
>             !(*mac)[3] && !(*mac)[4] && !(*mac)[5]);
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_i=
nternal.h
> index 37d5c27756..117a98acab 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -2080,9 +2080,9 @@ struct libxl__xen_console_reader {
> /* parse the string @s as a sequence of 6 colon separated bytes in to @ma=
c */
> _hidden int libxl__parse_mac(const char *s, libxl_mac mac);
> /* compare mac address @a and @b. 0 if the same, -ve if a<b and +ve if a>=
b */
> -_hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b);
> +_hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b);
> /* return true if mac address is all zero (the default value) */
> -_hidden int libxl__mac_is_default(libxl_mac *mac);
> +_hidden int libxl__mac_is_default(const libxl_mac *mac);
> /* init a recursive mutex */
> _hidden int libxl__init_recursive_mutex(libxl_ctx *ctx, pthread_mutex_t *=
lock);
>=20
> @@ -4580,7 +4580,7 @@ _hidden int libxl__ms_vm_genid_set(libxl__gc *gc, u=
int32_t domid,
> #define LIBXL__DEFBOOL_STR_DEFAULT "<default>"
> #define LIBXL__DEFBOOL_STR_FALSE   "False"
> #define LIBXL__DEFBOOL_STR_TRUE    "True"
> -static inline int libxl__defbool_is_default(libxl_defbool *db)
> +static inline int libxl__defbool_is_default(const libxl_defbool *db)
> {
>     return !db->val;
> }
> @@ -4675,22 +4675,22 @@ int libxl__random_bytes(libxl__gc *gc, uint8_t *b=
uf, size_t len);
> #include "_libxl_types_internal_private.h"
>=20
> /* This always return false, there's no "default value" for hw cap */
> -static inline int libxl__hwcap_is_default(libxl_hwcap *hwcap)
> +static inline int libxl__hwcap_is_default(const libxl_hwcap *hwcap)
> {
>     return 0;
> }
>=20
> -static inline int libxl__string_list_is_empty(libxl_string_list *psl)
> +static inline int libxl__string_list_is_empty(const libxl_string_list *p=
sl)
> {
>     return !libxl_string_list_length(psl);
> }
>=20
> -static inline int libxl__key_value_list_is_empty(libxl_key_value_list *p=
kvl)
> +static inline int libxl__key_value_list_is_empty(const libxl_key_value_l=
ist *pkvl)
> {
>     return !libxl_key_value_list_length(pkvl);
> }
>=20
> -int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl);
> +int libxl__cpuid_policy_is_empty(const libxl_cpuid_policy_list *pl);
>=20
> /* Portability note: a proper flock(2) implementation is required */
> typedef struct {
> @@ -4821,12 +4821,12 @@ void* libxl__device_list(libxl__gc *gc, const lib=
xl__device_type *dt,
> void libxl__device_list_free(const libxl__device_type *dt,
>                              void *list, int num);
>=20
> -static inline bool libxl__timer_mode_is_default(libxl_timer_mode *tm)
> +static inline bool libxl__timer_mode_is_default(const libxl_timer_mode *=
tm)
> {
>     return *tm =3D=3D LIBXL_TIMER_MODE_DEFAULT;
> }
>=20
> -static inline bool libxl__string_is_default(char **s)
> +static inline bool libxl__string_is_default(char *const *s)
> {
>     return *s =3D=3D NULL;
> }
> diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.=
c
> index 9b8ef2cab9..88e81f9905 100644
> --- a/tools/libs/light/libxl_json.c
> +++ b/tools/libs/light/libxl_json.c
> @@ -95,7 +95,7 @@ yajl_gen_status libxl__yajl_gen_enum(yajl_gen hand, con=
st char *str)
>  * YAJL generators for builtin libxl types.
>  */
> yajl_gen_status libxl_defbool_gen_json(yajl_gen hand,
> -                                       libxl_defbool *db)
> +                                       const libxl_defbool *db)
> {
>     return libxl__yajl_gen_asciiz(hand, libxl_defbool_to_string(*db));
> }
> @@ -137,7 +137,7 @@ int libxl__bool_parse_json(libxl__gc *gc, const libxl=
__json_object *o,
> }
>=20
> yajl_gen_status libxl_uuid_gen_json(yajl_gen hand,
> -                                    libxl_uuid *uuid)
> +                                    const libxl_uuid *uuid)
> {
>     char buf[LIBXL_UUID_FMTLEN+1];
>     snprintf(buf, sizeof(buf), LIBXL_UUID_FMT, LIBXL_UUID_BYTES((*uuid)))=
;
> @@ -154,7 +154,7 @@ int libxl__uuid_parse_json(libxl__gc *gc, const libxl=
__json_object *o,
> }
>=20
> yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand,
> -                                      libxl_bitmap *bitmap)
> +                                      const libxl_bitmap *bitmap)
> {
>     yajl_gen_status s;
>     int i;
> @@ -208,7 +208,7 @@ int libxl__bitmap_parse_json(libxl__gc *gc, const lib=
xl__json_object *o,
> }
>=20
> yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
> -                                              libxl_key_value_list *pkvl=
)
> +                                              const libxl_key_value_list=
 *pkvl)
> {
>     libxl_key_value_list kvl =3D *pkvl;
>     yajl_gen_status s;
> @@ -269,7 +269,8 @@ int libxl__key_value_list_parse_json(libxl__gc *gc, c=
onst libxl__json_object *o,
>     return 0;
> }
>=20
> -yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, libxl_string_l=
ist *pl)
> +yajl_gen_status libxl_string_list_gen_json(yajl_gen hand,
> +                                           const libxl_string_list *pl)
> {
>     libxl_string_list l =3D *pl;
>     yajl_gen_status s;
> @@ -322,7 +323,7 @@ int libxl__string_list_parse_json(libxl__gc *gc, cons=
t libxl__json_object *o,
>     return 0;
> }
>=20
> -yajl_gen_status libxl_mac_gen_json(yajl_gen hand, libxl_mac *mac)
> +yajl_gen_status libxl_mac_gen_json(yajl_gen hand, const libxl_mac *mac)
> {
>     char buf[LIBXL_MAC_FMTLEN+1];
>     snprintf(buf, sizeof(buf), LIBXL_MAC_FMT, LIBXL_MAC_BYTES((*mac)));
> @@ -339,7 +340,7 @@ int libxl__mac_parse_json(libxl__gc *gc, const libxl_=
_json_object *o,
> }
>=20
> yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand,
> -                                     libxl_hwcap *p)
> +                                     const libxl_hwcap *p)
> {
>     yajl_gen_status s;
>     int i;
> @@ -377,7 +378,8 @@ int libxl__hwcap_parse_json(libxl__gc *gc, const libx=
l__json_object *o,
>     return 0;
> }
>=20
> -yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_ge=
nid *p)
> +yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand,
> +                                           const libxl_ms_vm_genid *p)
> {
>     yajl_gen_status s;
>     int i;
> diff --git a/tools/libs/light/libxl_nocpuid.c b/tools/libs/light/libxl_no=
cpuid.c
> index 0630959e76..f40a004e95 100644
> --- a/tools/libs/light/libxl_nocpuid.c
> +++ b/tools/libs/light/libxl_nocpuid.c
> @@ -14,7 +14,7 @@
>=20
> #include "libxl_internal.h"
>=20
> -int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
> +int libxl__cpuid_policy_is_empty(const libxl_cpuid_policy_list *pl)
> {
>     return 1;
> }
> @@ -41,7 +41,7 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,=
 bool restore,
> }
>=20
> yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
> -                                libxl_cpuid_policy_list *pcpuid)
> +                                const libxl_cpuid_policy_list *pcpuid)
> {
>     return 0;
> }
> --=20
> 2.30.2
>=20
>=20


