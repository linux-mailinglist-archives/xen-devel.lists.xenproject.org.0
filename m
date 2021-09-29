Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B641BFFD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198697.352327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU7o-0001lX-Bw; Wed, 29 Sep 2021 07:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198697.352327; Wed, 29 Sep 2021 07:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU7o-0001ij-7w; Wed, 29 Sep 2021 07:35:32 +0000
Received: by outflank-mailman (input) for mailman id 198697;
 Wed, 29 Sep 2021 07:35:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU7n-0001iA-Bf
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:35:31 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45b23c9b-1dd7-426d-845b-f7dcf8a97595;
 Wed, 29 Sep 2021 07:35:30 +0000 (UTC)
Received: from DU2PR04CA0215.eurprd04.prod.outlook.com (2603:10a6:10:2b1::10)
 by AM9PR08MB5937.eurprd08.prod.outlook.com (2603:10a6:20b:285::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 07:35:28 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::94) by DU2PR04CA0215.outlook.office365.com
 (2603:10a6:10:2b1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 07:35:28 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:35:28 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Wed, 29 Sep 2021 07:35:18 +0000
Received: from 4784a93395da.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F90C5D43-6A0B-495A-AC5E-CFC6458AE053.1; 
 Wed, 29 Sep 2021 07:35:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4784a93395da.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:35:06 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6271.eurprd08.prod.outlook.com (2603:10a6:102:eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 07:35:05 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:35:05 +0000
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
X-Inumbo-ID: 45b23c9b-1dd7-426d-845b-f7dcf8a97595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FdtwCajRj+TzN7SdJwtQacsfMcLW+OGcADYIRdUN4Q=;
 b=8RpiBFYGxi5Ch1DWzO39HBp5vt8bygwLRlJPefWxIoIxDZOglNnsUTBv0OO7jElhwg8EiLyuZhi/dZ0p+OIk7JOH3hQpXneNMlnqScYYpI0vpL3zOa2N10vzgaN6p0ZnUH1H04m5J+g1F2vPJ5bIbIeaRe8lcVT11wTBVKyAR/o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8afd9cf5120f7d4e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwzNeteHmBkOzcQwoH0Md1EXw3chh3GtSR9CK4JTzJctVRJRlBrmaPgy903NwcrElYIiZvOf+0EuUJtmtSGi6JA7xEbCkchokjRcGsKi2TI3PmMNy1wCwjASmc+DQYfUN2A3NkB3MbubUiiw3Ra0Ba0EM4ZL++2+ykk4u2gLxHR/lLN2OiPXy3NtMF469s+hEbWuMxCRhzlh1UrWXDXEh0F8BMdd3TZB7G1t2fPrTR4JcBMeAV0xd/KzVMOVYAL/OiVSSUBLeRmEIfLjrVXbPkZKyBp94+KyCZ3kakpzpI6ruhJg3ozuTqoTqqUzBQcByaVv5dcBmtYT50jFmapPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1FdtwCajRj+TzN7SdJwtQacsfMcLW+OGcADYIRdUN4Q=;
 b=B59M2IFrfBt5/mWxmT1LtwiYoRwTFqUM5IR+ZdJ7jCIKls3LdNhPKW3oo+8W3v7a0Ng8b4yDMhRfLpyQFl7jyHw2jCRQgVSIiP29zTita8igoyKCuI3oxqnsWjlBbT+esyy/AFQ1PwfzLPFxt/0YuqGFKLNprqecOI6ZdFfdllPH228kFNmeq0Jg8CuLUPl94q7aeHDKscdQNgc3DHukXsjR5ClWCQ82Q+JlsuHb3mGvkQvEultla6rfTI6vJFb/AEKnKVZbPOUWelA+wiZSj9TzsjIzQmh9iqK/TJQLXD2BT9NOszhGUib4WwTkw5Syow+oE+hBNUIZUBzB4+lWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FdtwCajRj+TzN7SdJwtQacsfMcLW+OGcADYIRdUN4Q=;
 b=8RpiBFYGxi5Ch1DWzO39HBp5vt8bygwLRlJPefWxIoIxDZOglNnsUTBv0OO7jElhwg8EiLyuZhi/dZ0p+OIk7JOH3hQpXneNMlnqScYYpI0vpL3zOa2N10vzgaN6p0ZnUH1H04m5J+g1F2vPJ5bIbIeaRe8lcVT11wTBVKyAR/o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 07/17] xen/device-tree: Add dt_property_read_u32_array
 helper
Thread-Topic: [PATCH v3 07/17] xen/device-tree: Add dt_property_read_u32_array
 helper
Thread-Index: AQHXtJWv7GtV+W3zUUON47opBlrdw6u6n90A
Date: Wed, 29 Sep 2021 07:35:04 +0000
Message-ID: <D6B739AB-788C-471A-84B3-73F9539FFA58@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <89788e202bc91e2bc7f9c3c33eb91ab7478381ee.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <89788e202bc91e2bc7f9c3c33eb91ab7478381ee.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 79485988-0776-4f2f-d041-08d9831bb594
x-ms-traffictypediagnostic: PA4PR08MB6271:|AM9PR08MB5937:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB59377F5A2559D3464CF61A6A9DA99@AM9PR08MB5937.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GXcdvl/L2JtfASiI/M/jCm9wHPaYBxysBtF8raqjVXTU31RNNKA4MkYsGf1g1RoAc34s+qrWzyecyotJOub9Mfdar7B+RZLgiZRzgZ6BbQyBSEiCBaosLHg9uGLy3+NUe3MlvTdHdbM2BM6XDQyJTbDJOCTxybet973LiGDxkh78f+QfrSHzMRrDqtddy974wvT1GlH8RVv9UlRQiI4NrV1mp+WItoI8TJOmYYOrKNiPvs7/Le/olNAu8mDEDCa81qT+z9j7/876jGJJUEiw6HSv5y0rme5/sFSyKfcZ1ncOij1Juq+Gq1rYLwq3aG2B1uyRrLCbmNBemKQKBKbrQ+nCVYQvrWK+TU7w3T7tyIczzRdspHhmgnUdIjoeNsEn6LYLzZzrnznGl18QlEE1nb7JVmAc5BReQlJwifIfFCfFrHVR2DUpfGoa/bucvvq/MMkzPi4wdd26RWQKdbxEq1T+8/beu7YrE/WfvXgirlHqh5oFDHmbczX9sCQylJOBQGg+6MIfGdjzOfnr3frTB1P8SoPNOK1zCq0/7DEm86QDOtZAaOk3FQkhgqW4cgj/DXCtSVZcmCeiyYnVtkSPjG/xNPx7mnNgP0ZN/VD6gCwAfGgqPUyhiQUK42A89zon+8zvOrzPzseQhdIYsBa+tMnpZx5FoiIinM7DOLC1I3vzkN0cD2tjHmr2JLbKo8YLzUyQe3DMBIadFzWbGUO5hVs6wk7Ls7bbF6rFlaAB0XGyN782F6fNVb/XCtwLO5T7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(33656002)(53546011)(54906003)(2906002)(37006003)(71200400001)(316002)(6506007)(38070700005)(86362001)(122000001)(38100700002)(64756008)(66476007)(66556008)(8676002)(66446008)(66946007)(76116006)(91956017)(6486002)(6512007)(8936002)(6862004)(4326008)(36756003)(508600001)(83380400001)(6636002)(2616005)(5660300002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F0560E49C64E842873C8E71410DCBE3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6271
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b5654c5-ccce-41c9-082b-08d9831ba7c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yf3NVzUwHcACspdM+LTQvsKekacJ+hUmdcWvD4O3P9JjnR+1CWSHHCyolrNdedh2DZw+n9gr0Qmr0CIL1aS/T2y3H781r8Vt5KDxEVDUCQuklmbK3YqVP5fIRzhJ2eLAbipETMBM9XXR+ggIfLXo+LIasLePtvZu0QApb5TFvpYej1/5NQ9NgWpi5HjwzhD3pHBILeL3t9HExUWqLH0KN8z/nvY/47QhDaB0XVXycgalg4n8/4K8iyW8Gr7G12uaC7oNgx0Whv8dPAO1iFGcYp2hz2fvIM6/FYsIdfcKGuSwNSrjkobtP+Wplip4jeMORt7EwaY09ykQqNy7ozlyokjnywl1kJbC5Vg1sqx6i40o5v9nWyRIdP5C5f7num/HcEbDxGqaQfwtJzQclJiTFbxLQO1TTF/0ALYziCiAJcGvyr4347FER8lO8KUxvfXjqKaShFQ5ZG8+AcpZh0GLYsNoKdFvlvCVF+bJDVa9EtXUbDOxDECP87uy2ASlDgvIPN5paWxXf7K94xv5ETef2gF9nV0fWJt/SJPoluPChRrz/5AT9WbXwu9s3iGXhiwjCm3z26Ue2D+p4IT9FI9YO/zlX/ozZoyVMxfL1tdEUhr8YRhGYTdZJS1h6TFYCcNwv28uNDxSS9CJXZgQmgohfNIaVkBFTx3u0WFnsYyIuzJ4czGIWPE8V18nDjQ8FSGAIGwi4H0QrhHlnioqg2d80w==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(508600001)(26005)(186003)(2616005)(8936002)(6862004)(6506007)(54906003)(36756003)(53546011)(86362001)(6636002)(82310400003)(316002)(5660300002)(6486002)(37006003)(2906002)(33656002)(81166007)(70206006)(70586007)(83380400001)(336012)(36860700001)(356005)(4326008)(8676002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:35:28.2080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79485988-0776-4f2f-d041-08d9831bb594
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5937

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> Based Linux commit a67e9472da423ec47a3586920b526ebaedf25fc3
>=20
> Import the Linux helper of_property_read_u32_array. This function find
> and read an array of 32 bit integers from a property.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - Modify commit message to include upstream Linux commit-id not stable
>  Linux commit-id
> Change in v2: Patch introduced in v2
> ---
> xen/include/xen/device_tree.h | 30 ++++++++++++++++++++++++++++++
> 1 file changed, 30 insertions(+)
>=20
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index 1693fb8e8c..3ffe3eb3d2 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -392,6 +392,36 @@ int dt_property_read_variable_u32_array(const struct=
 dt_device_node *np,
>                                         const char *propname, u32 *out_va=
lues,
>                                         size_t sz_min, size_t sz_max);
>=20
> +/**
> + * dt_property_read_u32_array - Find and read an array of 32 bit integer=
s
> + * from a property.
> + *
> + * @np:     device node from which the property value is to be read.
> + * @propname:   name of the property to be searched.
> + * @out_values: pointer to return value, modified only if return value i=
s 0.
> + * @sz:     number of array elements to read
> + *
> + * Search for a property in a device node and read 32-bit value(s) from
> + * it.
> + *
> + * Return: 0 on success, -EINVAL if the property does not exist,
> + * -ENODATA if property does not have a value, and -EOVERFLOW if the
> + * property data isn't large enough.
> + *
> + * The out_values is modified only if a valid u32 value can be decoded.
> + */
> +static inline int dt_property_read_u32_array(const struct dt_device_node=
 *np,
> +                                             const char *propname,
> +                                             u32 *out_values, size_t sz)
> +{
> +    int ret =3D dt_property_read_variable_u32_array(np, propname, out_va=
lues,
> +                              sz, 0);
> +    if ( ret >=3D 0 )
> +        return 0;
> +    else
> +        return ret;
> +}
> +
> /**
>  * dt_property_read_bool - Check if a property exists
>  * @np: node to get the value
> --=20
> 2.17.1
>=20


