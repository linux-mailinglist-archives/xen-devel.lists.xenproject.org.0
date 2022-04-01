Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1384EE980
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 10:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297266.506320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naCHo-0000cI-UH; Fri, 01 Apr 2022 08:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297266.506320; Fri, 01 Apr 2022 08:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naCHo-0000Zd-R7; Fri, 01 Apr 2022 08:05:36 +0000
Received: by outflank-mailman (input) for mailman id 297266;
 Fri, 01 Apr 2022 08:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQ+P=UL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1naCHn-0000ZX-0X
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 08:05:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8091a800-b192-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 10:05:33 +0200 (CEST)
Received: from DU2PR04CA0245.eurprd04.prod.outlook.com (2603:10a6:10:28e::10)
 by AS1PR08MB7513.eurprd08.prod.outlook.com (2603:10a6:20b:480::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Fri, 1 Apr
 2022 08:05:30 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::6f) by DU2PR04CA0245.outlook.office365.com
 (2603:10a6:10:28e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26 via Frontend
 Transport; Fri, 1 Apr 2022 08:05:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Fri, 1 Apr 2022 08:05:30 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Fri, 01 Apr 2022 08:05:30 +0000
Received: from d5134fc149b7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A5E4EBA-4671-48D8-96B0-769CEFB5ECFD.1; 
 Fri, 01 Apr 2022 08:05:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5134fc149b7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Apr 2022 08:05:24 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by VI1PR0802MB2254.eurprd08.prod.outlook.com (2603:10a6:800:9c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 08:05:14 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a%5]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 08:05:13 +0000
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
X-Inumbo-ID: 8091a800-b192-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRN4do4qBu6wBjqe8E+nmbXoCO6sd2CBSRuXawIVIyE=;
 b=LEheabHq6Egs8056/knoKqQjp2QEnNj7vp/owk+oJ1lQD8/5rgLtu4Ee2AGZPZmqpf1Anjk2ks+45va9dhUgewVXGbRtl+uvysicwFr1BBixU24fNd/NbHSEuUQQpHwfTQJeGYETPtBFdPssEAh7swIuT0Dc4kwb2rrX1sfzqKM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuzDJ/lM/VkiiPYkc86/utxHKZUq67xyf2d75wUT9LD1RyJjnWN5KI4Lupg0cNOzLL2KtS7TTr4iRvQllzG1NBKE9N9r6brCkE3PxSi6IlgAsADafcb9qsDKbVySQ2Y+MYvbriMn86BtQ5CreFTcYqn6OQaQxxAztteD7GuJ99TqM8ra2NTc5AV77TrYTXTmttx7Rp3VYwr0nGBwcTOKh4lNzAMATY8GvFdfWHJXk/f+hThlX3AfxELczJgacyS2c+jXn+9MZZeuVdLpZ4PvLgK2bplcVb62QeybPYCZX6iscAOnMZqfghQw9pBAcsawCH3AlfasRDwDOKLUiy273Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRN4do4qBu6wBjqe8E+nmbXoCO6sd2CBSRuXawIVIyE=;
 b=dr3PmMLtTS/4dOkJLZQdSpgMHfTY0R2FAMkVIIutYjZemr6N6IhGGFIaUcXOjuVAs/ony25Kt+Qi8agwRgPUcU6qC06t6eUG9ufQyZg3oiHAaMck2GjbSnQsqQd5Hr/JIy4C8DZCPZ1+yNTfvV0Db3BLBIecJMSMj41NTaRw5QISbULJ6Uk7N9wf9hBalRn90JhwVbsY8ku9CyPiI0BubB5ghxJ6qNlO0pyWc8T7onPzBbvkyRObZukCrmIKy8YiG4D22xT/G8lmvvXHeh8DqE1iGLyS/bzd192aCvlrMbdoaRBIzdBB9LHC39xniwugJyzrgxvOpRdypyLSE9sxFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRN4do4qBu6wBjqe8E+nmbXoCO6sd2CBSRuXawIVIyE=;
 b=LEheabHq6Egs8056/knoKqQjp2QEnNj7vp/owk+oJ1lQD8/5rgLtu4Ee2AGZPZmqpf1Anjk2ks+45va9dhUgewVXGbRtl+uvysicwFr1BBixU24fNd/NbHSEuUQQpHwfTQJeGYETPtBFdPssEAh7swIuT0Dc4kwb2rrX1sfzqKM=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jgross@suse.com" <jgross@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: RE: [PATCH v4 1/9] xen/dt: dt_property_read_string should return
 -ENODATA on !length
Thread-Topic: [PATCH v4 1/9] xen/dt: dt_property_read_string should return
 -ENODATA on !length
Thread-Index: AQHYRWD1ghazNy9i8k6ND1boTze3v6zas2fw
Date: Fri, 1 Apr 2022 08:05:13 +0000
Message-ID:
 <PA4PR08MB6253935C99999D6966BD801592E09@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-1-sstabellini@kernel.org>
In-Reply-To: <20220401003847.38393-1-sstabellini@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F93DDA69FA79414B8A2C00372C0D39AF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c660bb97-e253-4989-dc5b-08da13b66387
x-ms-traffictypediagnostic:
	VI1PR0802MB2254:EE_|DB5EUR03FT063:EE_|AS1PR08MB7513:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR08MB751344BA903B22BDBABD65BB92E09@AS1PR08MB7513.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KKJqTV5FUEWLuQsxEYIQWUMDSdFxrmQMw66t5Un0M5Ba6dT31pLc13BpLdkaJkbyWC6nVuyNa68xanogKXMt41VZdPgQ1sziwnuhk2o7ASlx/rmDKnf4frT+EvRRMW6GlPrrJZ9YWnYs7SH8gegxWJxXaNVA9huWXUKUk1ciT+zCAQG7Kbg0hh1eD77Ew4gf4jsNu7uBBnFkLlgOXFjAPQWLVfZHvApepeYPjPmKjVUBFrzRKWYW5MaD5zD1IV9VhISi/53ZGPHo8lzbykCOjzD7zrDFTBoEyR9rNTf19b8JBs225++nkK807g+z9wUnuC3dCXC1HRlif0R+X4z9WODTBwOeF6j3duu9EagoyO3Zf5SFQfWhbSnzhRGJxQyaHnz/o6kz+ujz+ggOjiQ/JcByOmIU7X+E67FO8mFfpWu8P9Fzskmyfeq4fPJm7EBHLBNe8Q/MS1wsAhr0XzpSRF+99ueAxp9pW1uUzTRBFfLg1TdR0eLazKps17yKY8Us7LsKVMblRabu0z6Ka5ee+lLjpJkawB71CkRZ+CJnnwNWsHRkWXFytydh/JV7iTYLdesYduO0V/YAdHiy73rDby1LHsvU6lB3KhLcI4EWJce1E0JUvql4HzOHu/XToU0YhOgfyPhe2T7fnOmlIKyM2MvqxywONWGZpKExHWOZH5vWonu+hEox1F9VexEuoCxuWJYpJK/GdKtp1M0Lw4q2xg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(38070700005)(110136005)(8676002)(26005)(66556008)(186003)(66476007)(66446008)(76116006)(66946007)(64756008)(316002)(4326008)(86362001)(508600001)(2906002)(33656002)(8936002)(83380400001)(52536014)(55016003)(5660300002)(7696005)(9686003)(122000001)(71200400001)(38100700002)(6506007)(53546011);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2254
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f32e6b7-6354-4a77-9b0d-08da13b659e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wu+fuC1nGq4jepIqpuxFz3CRC4nKcS3i6bQEXWWKoIN7/4d5LM+DmFGJ6/xkjDxAIQoH9CtwBlo1XuYK16hqD8PcAjo4djMZR9CnGxrvTUKiE1FQ/4yV6jrgV5hkhkCyARU/cZyX9nVtdlT29rYGbhrZ4YqnDCHyqlsGW0RKH4ErAKZS0NyhBfz0wkOOf+Lak/WuKxCsRE6rqIWioA/pVyHrGRsjbKb/SPJUr8EAJVVwIZT+fei4Jr4DcE2QxF9T2i2tcU3G7NZ1X7S0vRakPqCoQFz1nezJjGsyLuZPH7BDfT6kgIvoEl+3Dfj16pw4b3t9NFL8Q8gMkQWfAIT/BFUKS+l51eTrcKnXoqNdJ1Foy0TbtWtcNrwuKBeMUYDCy61w3U0Bp85XVmi1rP4p+n80qRhP2tTftMA6dlIbbbI+NORKUqSvljwgclGurjl6xXgko/LqjiV2zo5k5nLN1mKTzzlswg7whs5Bt2c/PFAN0H9irjHIEUxUfRblXGSbMofj+V8xMw3sDV0qTQwg/LtztKW6sQnyXWNMR1tY7/ynL9yqFaC438TwYuBoC18yXcpFEL4Y7MmNQnXez+VMEymR8cNQHrW3NVhaWt78QiAL32G87cBNMSqOSWcH99Nj2WzU3E1BTEJBMvPa7166TRD7GHpgk+AZ2l3YbG58Lrr5vVjjyAadfSbmN//32O+I
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(6506007)(9686003)(2906002)(47076005)(316002)(53546011)(54906003)(83380400001)(336012)(110136005)(70586007)(8676002)(4326008)(86362001)(70206006)(52536014)(81166007)(5660300002)(356005)(40460700003)(107886003)(508600001)(36860700001)(55016003)(186003)(26005)(33656002)(82310400004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 08:05:30.1014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c660bb97-e253-4989-dc5b-08da13b66387
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7513

Hi Stefano,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Stefano Stabellini
> Sent: Friday, April 1, 2022 8:39 AM
> To: xen-devel@lists.xenproject.org
> Cc: sstabellini@kernel.org; jgross@suse.com; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; julien@xen.org;
> Volodymyr_Babchuk@epam.com; Stefano Stabellini
> <stefano.stabellini@xilinx.com>
> Subject: [PATCH v4 1/9] xen/dt: dt_property_read_string should return -
> ENODATA on !length
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> When the length is zero (pp->length =3D=3D 0), dt_property_read_string
> should return -ENODATA, but actually currently returns -EILSEQ because
> there is no specific check for lenght =3D=3D 0.
>=20
> Add a check now.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

> ---
>  xen/common/device_tree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 4aae281e89..db67fb5fb4 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -198,7 +198,7 @@ int dt_property_read_string(const struct
> dt_device_node *np,
>=20
>      if ( !pp )
>          return -EINVAL;
> -    if ( !pp->value )
> +    if ( !pp->value || !pp->length )
>          return -ENODATA;
>      if ( strnlen(pp->value, pp->length) >=3D pp->length )
>          return -EILSEQ;
> --
> 2.25.1
>=20


