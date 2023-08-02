Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5AB76D720
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 20:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575122.900907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRGtg-0005H0-Ts; Wed, 02 Aug 2023 18:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575122.900907; Wed, 02 Aug 2023 18:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRGtg-0005Dp-Qy; Wed, 02 Aug 2023 18:48:36 +0000
Received: by outflank-mailman (input) for mailman id 575122;
 Wed, 02 Aug 2023 18:48:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWG=DT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRGtf-0005Dj-Pk
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 18:48:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dc02f67-3165-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 20:48:33 +0200 (CEST)
Received: from DB7PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:10:52::35)
 by PR3PR08MB5738.eurprd08.prod.outlook.com (2603:10a6:102:81::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 18:48:27 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::52) by DB7PR02CA0022.outlook.office365.com
 (2603:10a6:10:52::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Wed, 2 Aug 2023 18:48:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.45 via Frontend Transport; Wed, 2 Aug 2023 18:48:27 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Wed, 02 Aug 2023 18:48:26 +0000
Received: from 0776538ef36a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8AADE72D-01B9-4818-ADDE-3AAA5A1491B3.1; 
 Wed, 02 Aug 2023 18:48:20 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0776538ef36a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Aug 2023 18:48:20 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM0PR08MB5364.eurprd08.prod.outlook.com (2603:10a6:208:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 18:48:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 18:48:18 +0000
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
X-Inumbo-ID: 2dc02f67-3165-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nr1QaiDje45fN5p7/GB+rS2vVH33PQsie3UEFvVOUW8=;
 b=vfEkUlMCZTRn/GWB4H5xxieO781QdiIgDLnwvziyCKXYf2TMcIRRzmfyUb6YJKK/5BcK3vn5UND1lwhQ8ZZHz0eN3k6c5eczxmha4wPx9x/JfQs7fULFk5mvrWLH3WGayQ3pzlxnwbG2gbfF8tnmYhfwP7rfEs+DoESivuFp+Iw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 112f36a131564bb6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ6l3Gx4MFKlaxb5whUOWHc/horA5To4WC5epQOu1yKIckDU4cvVqfgXZ8CFg9SXU+5d0kN24x3rtAOnCy40WPjIaNJ0IBPihDKNBcz58u88TiAFxJ/WxPQA5Uqu9YR3x/8ktszrl+S354+DWUsHfb5H86gdYeuMVbibwt7eZ7OTtz+0/eDPDYrO4LdBUKtO2amgjC+KLJ++UakHEOvwq7N2SqSoH4mTxNTACxfnyYL0tSBeQmuvaVQ+umemVvK+FCfz1R6Oqd0tMh8KYh5aejGib0z6RqshaYlm0MoFPTuIePrVEX2MjsTcS73G9mAsHMIELUJopoYwaOFkp23RGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nr1QaiDje45fN5p7/GB+rS2vVH33PQsie3UEFvVOUW8=;
 b=FrycME60j1VwgdmDdf59cirXeFUjVYIXk5JCIdKnQc6sBaV70UzUPTfHittMKATbIrzIXMegLdrmkKcKrtNcxWqw6MGqniR1Od/cYTk55YNdfrmMwfASgjvhYy8RrFdZPGfk/RknufzYpcDNMwPHNNxy90kBGINVuiSO8B2H2agLMrbqrvASWKo3h7SsIo/alqEZRj+aO0AIVrk70bSXXYHIb+HZVQAXeddQ0coXP55TJuh9K3SbYW2jeDp7jnhrmJlqzqU9WzDjrbAPpJ3CUYJeArxRkDwf7u2c1AsWKzv2rCQbajDNee4+fq13KWr3Yuq8iY2P5H+ftWhVhJsfFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nr1QaiDje45fN5p7/GB+rS2vVH33PQsie3UEFvVOUW8=;
 b=vfEkUlMCZTRn/GWB4H5xxieO781QdiIgDLnwvziyCKXYf2TMcIRRzmfyUb6YJKK/5BcK3vn5UND1lwhQ8ZZHz0eN3k6c5eczxmha4wPx9x/JfQs7fULFk5mvrWLH3WGayQ3pzlxnwbG2gbfF8tnmYhfwP7rfEs+DoESivuFp+Iw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Topic: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Index:
 AQHZxUjDKmzjB69oo0mbnCqJ2MJvKa/XEDgAgAAEZQCAAAGbgIAABJqAgAArPoCAAAQngIAADKcAgAACUgA=
Date: Wed, 2 Aug 2023 18:48:18 +0000
Message-ID: <E90F9075-3578-472A-AF42-6495F8E5456B@arm.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
 <9B62D8DC-2425-42A4-A95F-BC41FA27238D@arm.com>
 <46a985da-03e9-b05d-0107-7c54526c71f9@xen.org>
In-Reply-To: <46a985da-03e9-b05d-0107-7c54526c71f9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM0PR08MB5364:EE_|DBAEUR03FT018:EE_|PR3PR08MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a7a808-3ab7-4f94-d768-08db93890ec6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tMc2opZUmLEsfIBYb7zjCQJyoSkteTJJkLZK8LFS6rytI/jiKLll+YXdrNoUa9chEHs9EsKkyJacL55XZm7QDsD6YOzL1z0IEdw5Ht6KEmu4uvrbJHNVG4mLEUd0+8sTdfIc6bMFVmWqzNyXng6acGKwUqS7bVHZuVsNiLAeZcZQsby+CnoGukl8uH0h6+tEWRDb13Szn8sw6E6ar7NXdBPoawu85sCCH5MvaZr53jlBmk3y0D36KRZobzpZzww5Sp23Wl8q6xQDrOVkB4qvuIwdEnagxBIsUKktfm9CQqEfnCgWmQ5dBt1hWWtSFR6GCIkRKUm6eMySmZfmhuNca6RaGhaTJR+drsNPUdQLkoINAdxYBlpfURgj8TmyqPynibOIvhowfb2hSQXpgmY1DbW0JqAxwo2zqCE81fBToMjflw2gg/u0k0fjwUy6I89mYaz4fJfCY6iB/fncUHin9gPaQaTtmzS0mL6oBS3hpSg72+dKfqNgkRrfabJDoyh6lni+gpFcvJaKjjTtvtahPj3SbFMi/mHXc1nrksM9psyVzi3tyBSDwbnraIYUPR4UDvVPCuX6vzkmd3cWdvFZSGlyCdaPjxEvghBk+xf/ALtOqJldJ9FB/QpjcQQp0vrvKxHKQXv7SfF1ya4l840Xrw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(2616005)(186003)(6512007)(316002)(86362001)(478600001)(54906003)(122000001)(38100700002)(66476007)(66556008)(91956017)(66446008)(33656002)(6486002)(66946007)(71200400001)(76116006)(4326008)(6916009)(64756008)(53546011)(6506007)(36756003)(41300700001)(26005)(8676002)(5660300002)(8936002)(2906002)(66899021)(38070700005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <73BE56D147FB5442ADF1CC8477AD975C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5364
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31e93a97-f348-4135-eacf-08db938909bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7czGggujyUqV+Qpso75Nje0g+hZODUS1zcTwPVetrymferReAxG+ZLVICqO6I2UyPEKPeGekwDLgrRKPtewtbPa+r/WeLVHwag8c1bOn9sgC+eWvnuenHji/U5TBCfirIjyO31c0lwwQVXqQfL047Rbmj8OSF1AA1TeKU+3Wa5YFHT2CL+8z1vCrISCjLCaJnKC/nB4zR1zzCTwm+2IbbQQ34TFf9Q5gRHJfCXigMKCweE5Jeqv1p/kyrDDPBEZCEU0LaloPd/R17WggDVZSLqwPv59UwokC8FJs8ZzGwlqS6QlZvzRp9qixlUF9WLf1ma/lMxEevFuAcFmWvMaSendp717yc74QC6Cy9h9/xLgvEvEdKhXO1fAbFRNtP/6zjg7zx59zwHZB7f83uXSGR6vhL2gF1JFbTV/RnwuQymuF89AsHC//FXBdVWCeN6TojRYh3FkobXCMlz0ugDy8EqZa9u/IGXHAPM/4K2lk7VrHUfh9bFU9ztpgS6sFEZAviSZBMXu+e9YZ3M5Fh6ab+QYVIMTHyUACOqZfJcH/IWvnGgqgjmzq7cWoBDN0M9ipPJo37TkkrE2AJvz0IOsmKBXPXJybCg6XJ18ZxAKjv6+cDvElTDrE/W24uBcnQbCvslsymG50QbxJ8kuY+rwf2kuiAzpY7Qzcygqz8muWOU3vtRo+v2bZFK77oOBoH8a5X3PFK9QGGNcw5jg0DwFFiDnNr3tESXcv8D6jOlSQVWS1ixbH3DDb0d/N4B7VWeKn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(376002)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(336012)(40460700003)(2616005)(186003)(6512007)(316002)(86362001)(478600001)(54906003)(81166007)(33656002)(6486002)(70206006)(70586007)(356005)(4326008)(82740400003)(53546011)(6506007)(36756003)(41300700001)(26005)(107886003)(8676002)(5660300002)(8936002)(47076005)(6862004)(2906002)(66899021)(36860700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 18:48:27.0772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a7a808-3ab7-4f94-d768-08db93890ec6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5738

DQoNCj4gT24gMiBBdWcgMjAyMywgYXQgMTk6MzksIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAwMi8wOC8yMDIzIDE4OjU0LCBMdWNhIEZh
bmNlbGx1IHdyb3RlOg0KPj4+IE9uIDIgQXVnIDIwMjMsIGF0IDE4OjM5LCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBMdWNhLA0KPj4+IA0KPj4+IE9u
IDAyLzA4LzIwMjMgMTY6MDUsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiBPbiAyIEF1ZyAy
MDIzLCBhdCAxNTo0OCwgTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6
DQo+Pj4+PiANCj4+Pj4+IEhpLA0KPj4+Pj4gDQo+Pj4+PiBPbiAwMi8wOC8yMDIzIDE2OjQyLCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+PiBPbiAyIEF1ZyAy
MDIzLCBhdCAxNToyNiwgTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6
DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBIaSBMdWNhLA0KPj4+Pj4+PiANCj4+Pj4+Pj4gT24gMDIvMDgv
MjAyMyAxNTo1MywgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gDQo+
Pj4+Pj4+PiBJbnRyb2R1Y2UgS2NvbmZpZyBHSUNWMiB0byBiZSBhYmxlIHRvIGNvbXBpbGUgdGhl
IEdJQ3YyIGRyaXZlciBvbmx5DQo+Pj4+Pj4+PiB3aGVuIG5lZWRlZCwgdGhlIG9wdGlvbiBpcyBh
Y3RpdmUgYnkgZGVmYXVsdC4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gSW50cm9kdWNlIEtjb25maWcg
VkdJQ1YyIHRoYXQgZGVwZW5kcyBvbiBHSUNWMiBvciBHSUNWMyBhbmQgY29tcGlsZXMNCj4+Pj4+
Pj4+IHRoZSBHSUN2MiBlbXVsYXRpb24gZm9yIGd1ZXN0cywgaXQgaXMgcmVxdWlyZWQgb25seSB3
aGVuIHVzaW5nIEdJQ1YyDQo+Pj4+Pj4+PiBkcml2ZXIsIG90aGVyd2lzZSB1c2luZyBHSUNWMyBp
dCBpcyBvcHRpb25hbCBhbmQgY2FuIGJlIGRlc2VsZWN0ZWQNCj4+Pj4+Pj4+IGlmIHRoZSB1c2Vy
IGRvZXNuJ3Qgd2FudCB0byBvZmZlciB0aGUgdkdJQ3YyIGludGVyZmFjZSB0byBndWVzdHMgb3IN
Cj4+Pj4+Pj4+IG1heWJlIGl0cyBHSUN2MyBoYXJkd2FyZSBjYW4ndCBvZmZlciB0aGUgR0lDdjIg
Y29tcGF0aWJsZSBtb2RlLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNh
IEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+Pj4+Pj4+PiAtLS0NCj4+Pj4+Pj4+
IHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAgICB8IDEzICsrKysrKysrKysrKysNCj4+Pj4+Pj4+
IHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICB8ICA0ICsrLS0NCj4+Pj4+Pj4+IHhlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYyB8ICA0ICsrKysNCj4+Pj4+Pj4+IHhlbi9hcmNoL2FybS9naWMt
djMuYyAgICAgICB8ICA0ICsrKysNCj4+Pj4+Pj4+IHhlbi9hcmNoL2FybS92Z2ljLmMgICAgICAg
ICB8ICAyICsrDQo+Pj4+Pj4+PiA1IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+Pj4+Pj4+PiBpbmRleCBmZDU3YTgy
ZGQyODQuLmRjNzAyZjA4YWNlNyAxMDA2NDQNCj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9L
Y29uZmlnDQo+Pj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPj4+Pj4+Pj4gQEAg
LTc4LDYgKzc4LDE0IEBAIGNvbmZpZyBBUk1fRUZJDQo+Pj4+Pj4+PiAgICAgICAgIFVFRkkgZmly
bXdhcmUuIEEgVUVGSSBzdHViIGlzIHByb3ZpZGVkIHRvIGFsbG93IFhlbiB0bw0KPj4+Pj4+Pj4g
ICAgICAgICBiZSBib290ZWQgYXMgYW4gRUZJIGFwcGxpY2F0aW9uLg0KPj4+Pj4+Pj4gDQo+Pj4+
Pj4+PiArY29uZmlnIEdJQ1YyDQo+Pj4+Pj4+IFNvLCBub3cgaXQgd291bGQgYmUgcG9zc2libGUg
dG8gZGVzZWxlY3QgYm90aCBHSUMgZHJpdmVycyBhbmQgWGVuIHdvdWxkIG5vdCBjb21wbGFpbiB3
aGVuIGJ1aWxkaW5nLg0KPj4+Pj4+PiBUaGlzIG1lYW5zIHRoYXQgWGVuIHdvdWxkIGZhaWwgb24g
Ym9vdCB3aXRob3V0IGFueSBtZXNzYWdlIGFzIGl0IGhhcHBlbnMgYmVmb3JlIHNlcmlhbCBkcml2
ZXIgaW5pdGlhbGl6YXRpb24uDQo+Pj4+Pj4+IFNpbmNlIGhhdmluZyBHSUMgZHJpdmVyIGJ1aWx0
IGluIGlzIGEgbXVzdC1oYXZlIEkgdGhpbmsgd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBhdCBs
ZWFzdCBvbmUgaXMgZW5hYmxlZC4NCj4+Pj4+PiANCj4+Pj4+PiBIaSBNaWNoYWwsDQo+Pj4+Pj4g
DQo+Pj4+Pj4gSSB0cmllZCBhbmQgSSBoYWQ6DQo+Pj4+Pj4gDQo+Pj4+Pj4gU3RhcnRpbmcga2Vy
bmVsIC4uLg0KPj4+Pj4+IA0KPj4+Pj4+IC0gVUFSVCBlbmFibGVkIC0NCj4+Pj4+PiAtIEJvb3Qg
Q1BVIGJvb3RpbmcgLQ0KPj4+Pj4+IC0gQ3VycmVudCBFTCAwMDAwMDAwMDAwMDAwMDA4IC0NCj4+
Pj4+PiAtIEluaXRpYWxpemUgQ1BVIC0NCj4+Pj4+PiAtIFR1cm5pbmcgb24gcGFnaW5nIC0NCj4+
Pj4+PiAtIFplcm8gQlNTIC0NCj4+Pj4+PiAtIFJlYWR5IC0NCj4+Pj4+PiAoWEVOKSBDaGVja2lu
ZyBmb3IgaW5pdHJkIGluIC9jaG9zZW4NCj4+Pj4+PiAoWEVOKSBSQU06IDAwMDAwMDAwODAwMDAw
MDAgLSAwMDAwMDAwMGZlZmZmZmZmDQo+Pj4+Pj4gKFhFTikgUkFNOiAwMDAwMDAwODgwMDAwMDAw
IC0gMDAwMDAwMDhmZmZmZmZmZg0KPj4+Pj4+IChYRU4pDQo+Pj4+Pj4gKFhFTikgTU9EVUxFWzBd
OiAwMDAwMDAwMDg0MDAwMDAwIC0gMDAwMDAwMDA4NDE1ZDAwMCBYZW4NCj4+Pj4+PiAoWEVOKSBN
T0RVTEVbMV06IDAwMDAwMDAwZmQ2YzUwMDAgLSAwMDAwMDAwMGZkNmM4MDAwIERldmljZSBUcmVl
DQo+Pj4+Pj4gKFhFTikgTU9EVUxFWzJdOiAwMDAwMDAwMDgwMDgwMDAwIC0gMDAwMDAwMDA4MTRm
MWEwMCBLZXJuZWwNCj4+Pj4+PiAoWEVOKSAgUkVTVkRbMF06IDAwMDAwMDAwODAwMDAwMDAgLSAw
MDAwMDAwMDgwMDEwMDAwDQo+Pj4+Pj4gKFhFTikgIFJFU1ZEWzFdOiAwMDAwMDAwMDE4MDAwMDAw
IC0gMDAwMDAwMDAxODdmZmZmZg0KPj4+Pj4+IChYRU4pDQo+Pj4+Pj4gKFhFTikNCj4+Pj4+PiAo
WEVOKSBDb21tYW5kIGxpbmU6IG5vcmVib290IGRvbTBfbWVtPTEwMjRNIGNvbnNvbGU9ZHR1YXJ0
IGR0dWFydD1zZXJpYWwwIGJvb3RzY3J1Yj0wDQo+Pj4+Pj4gKFhFTikgUEZOIGNvbXByZXNzaW9u
IG9uIGJpdHMgMjAuLi4yMg0KPj4+Pj4+IChYRU4pIERvbWFpbiBoZWFwIGluaXRpYWxpc2VkDQo+
Pj4+Pj4gKFhFTikgQm9vdGluZyB1c2luZyBEZXZpY2UgVHJlZQ0KPj4+Pj4+IChYRU4pIFBsYXRm
b3JtOiBHZW5lcmljIFN5c3RlbQ0KPj4+Pj4+IChYRU4pDQo+Pj4+Pj4gKFhFTikgKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPj4+Pj4+IChYRU4pIFBhbmljIG9uIENQ
VSAwOg0KPj4+Pj4+IChYRU4pIFVuYWJsZSB0byBmaW5kIGNvbXBhdGlibGUgR0lDIGluIHRoZSBk
ZXZpY2UgdHJlZQ0KPj4+Pj4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioNCj4+Pj4+PiAoWEVOKQ0KPj4+Pj4+IChYRU4pIE1hbnVhbCByZXNldCByZXF1aXJl
ZCAoJ25vcmVib290JyBzcGVjaWZpZWQpDQo+Pj4+PiBIYXZpbmcgZWFybHkgcHJpbnRrIGVuYWJs
ZWQgYWxsIHRoZSB0aW1lIGlzIG5vdCBjb21tb24gYW5kIG5vdCBlbmFibGVkIGluIHJlbGVhc2Ug
YnVpbGRzIEZXSUsuDQo+Pj4gDQo+Pj4gVGhlcmUgYXJlIGEgbG90IG9mIGluZm9ybWF0aW9uIHBy
aW50ZWQgYmVmb3JlIHRoZSBjb25zb2xlIGlzIHByb3Blcmx5IGJyb3VnaHQgdXAuIEkgd29uZGVy
IGlmIHdlIHNob3VsZCBsb29rIGF0IGFkZGluZyBlYXJseSBjb25zb2xlIGxpa2UgTGludXggZG9l
cz8NCj4+PiANCj4+Pj4+IFNvIGluIGdlbmVyYWwsIHVzZXIgd291bGQganVzdCBzZWUgIlN0YXJ0
aW5nIGtlcm5lbCIgZnJvbSB1LWJvb3QgYW5kIGhhZCB0byBkZWJ1ZyB3aGF0J3MgZ29pbmcgb24u
DQo+Pj4+PiANCj4+Pj4+PiANCj4+Pj4+PiBXb3VsZG7igJl0IGJlIGVub3VnaCB0byBzdWdnZXN0
IHRoZSB1c2VyIHRoYXQgYXQgbGVhc3Qgb25lIEdJQyBuZWVkcyB0byBiZSBzZWxlY3RlZD8gSW4g
dGhlIGhlbHAgaXQNCj4+Pj4+PiBhbHNvIHN0YXRlcyDigJxpZiB1bnN1cmUsIHNheSBZIg0KPj4+
Pj4gSSBhbHdheXMgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIG1lZXQgdGhlIHVzZXJzIG5lZWRzIGJ5
IHByZXZlbnRpbmcgdW53aXNlIG1pc3Rha2VzIGxpa2UgdW5zZWxlY3RpbmcgYm90aCBkcml2ZXJz
Lg0KPj4+Pj4gQXMgYWx3YXlzLCBpdCBpcyB1cCB0byBtYWludGFpbmVycy4NCj4+Pj4gQW55d2F5
IEkgdW5kZXJzdGFuZCB5b3VyIHBvaW50LCBkbyB5b3UgdGhpbmsgc29tZXRoaW5nIGxpa2UgdGhh
dCBjb3VsZCBiZSBvaz8gSeKAmXZlIGNoZWNrZWQgYW5kIGl0IHdvcmtzLCBpdA0KPj4+PiBjb21w
aWxlIG9ubHkgaWYgYXQgbGVhc3Qgb25lIEdJQyBkcml2ZXIgaXMgZW5hYmxlZA0KPj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPj4+
PiBpbmRleCAyNjRkMmYyZDRiMDkuLjg1YjRhN2YwODkzMiAxMDA2NDQNCj4+Pj4gLS0tIGEveGVu
L2FyY2gvYXJtL3NldHVwLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4+Pj4g
QEAgLTEwOTYsNiArMTA5Niw5IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25n
IGJvb3RfcGh5c19vZmZzZXQsDQo+Pj4+ICAgICAgICBwcmVpbml0X3hlbl90aW1lKCk7DQo+Pj4+
ICArICAgIC8qIERvbid0IGJ1aWxkIGlmIGF0IGxlYXN0IG9uZSBHSUMgZHJpdmVyIGlzIGVuYWJs
ZWQgKi8NCj4+Pj4gKyAgICBCVUlMRF9CVUdfT04oIShJU19FTkFCTEVEKENPTkZJR19HSUNWMykg
fHwgSVNfRU5BQkxFRChDT05GSUdfR0lDVjIpDQo+Pj4+ICsgICAgICAgICAgICAgICAgIHx8IElT
X0VOQUJMRUQoQ09ORklHX05FV19WR0lDKSkpOw0KPj4+IHJhbmRjb25maWcgaW4gZ2l0bGFiIHdp
bGwgbm93IHJhbmRvbWx5IGZhaWwgY29tcGlsYXRpb24uIElmIHdlIHdhbnQgdG8gZW5jb2RlIHRo
ZSBkZXBlbmRlbmN5IHRoZW4gaXQgc2hvdWxkIGJlIGRvbmUgaW4gS2NvbmZpZy4gQnV0IEkgaGF2
ZW4ndCBsb29rZWQgYXQgaG93IHRvIGRvIHRoYXQuDQo+PiBPayBJ4oCZbGwgaW52ZXN0aWdhdGUg
aXQsIGFwYXJ0IGZyb20gdGhhdCwgaWYgSSBmaW5kIGEgcG9zc2libGUgd2F5IHRvIGhhdmUgdGhh
dCBpbiBLY29uZmlnLCBkbyB5b3UgaGF2ZSBhbnkgb2JqZWN0aW9uIG9uIHdoYXQgdGhpcyBwYXRj
aCBpcyBkb2luZyBhbmQgdGhlIGFwcHJvYWNoIHRha2VuPw0KPiANCj4gRXZlbiBpZiBpdCBpcyBu
b3QgcG9zc2libGUsIEkgd291bGRuJ3Qgd29ycnkgdG9vIG11Y2ggYWJvdXQgaXQuIFdoaWxlIEkg
YWdyZWUgd2l0aCBNaWNoYWwgdGhhdCBpdCBpcyBub3QgZ3JlYXQgdG8gaGF2ZSBub3RoaW5nIHBy
aW50ZWQsIEtjb25maWcgY2FuIG9ubHkgcmVqZWN0IGNvbmZpZ3VyYXRpb24gdGhhdCBhcmUgcHJv
cGVybHkgYnJva2VuLiBCdXQgdGhlcmUgYXJlIHBsZW50eSB0aGF0IGFyZSBzb3VuZCBidXQgd291
bGQgc3RpbGwgbm90IGJvb3Qgb24gc29tZSBwbGF0Zm9ybS4NCj4gDQo+IEEgcHJldHR5IGdvb2Qg
ZXhhbXBsZSBpcyBzb21lb25lIG1heSBkZWNpZGUgdG8gZGlzYWJsZSBHSUN2MyBhbmQgdHJ5IHRv
IGJvb3Qgb24gYSBHSUN2MyBwbGF0Zm9ybS4uLiBBbm90aGVyIG9uZSBpcyBub3QgZW5hYmxpbmcg
dGhlIFVBUlQgZHJpdmVyIGZvciB5b3VyIHBsYXRmb3JtIDopLg0KPiANCj4gVGhlIGxhdHRlciB0
aGVyZSBpcyBub3RoaW5nIHdlIGNhbiBkbyB3aXRob3V0IGVhcmx5cHJpbnRrLiBCdXQgZm9yIHRo
ZSBmb3JtZXIsIHRoZW4gd2UgY2FuIHRyeSB0byBlbmFibGUgdGhlIGNvbnNvbGUgZWFybGllciBh
bmQvb3IgZGVsYXkgd2hlbiB0aGUgR0lDIGlzIGluaXRpYWxpemVkLg0KDQo6KSBKdXN0IGZvdW5k
IGEgd2F5DQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2Fy
bS9LY29uZmlnDQppbmRleCA1Y2RiYTA3ZGY5NjQuLjkzMzA5Y2Q0OTE0NCAxMDA2NDQNCi0tLSBh
L3hlbi9hcmNoL2FybS9LY29uZmlnDQorKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KQEAgLTE4
LDYgKzE4LDcgQEAgY29uZmlnIEFSTQ0KICAgICAgICBzZWxlY3QgSEFTX1BNQVANCiAgICAgICAg
c2VsZWN0IEhBU19VQlNBTg0KICAgICAgICBzZWxlY3QgSU9NTVVfRk9SQ0VfUFRfU0hBUkUNCisg
ICAgICAgc2VsZWN0IEdJQ1YyIGlmICFHSUNWMyAmJiAhTkVXX1ZHSUMNCiANCiBjb25maWcgQVJD
SF9ERUZDT05GSUcNCiAgICAgICAgc3RyaW5nDQoNCklmIEnigJl2ZSBwbGF5ZWQgYSBiaXQgd2l0
aCB0aGUgbWVudWNvbmZpZyBhbmQgaXQgc2VsZWN0cyBHSUN2MiBpZiBubyBvdGhlciBnaWMgZHJp
dmVyIGlzIHNlbGVjdGVkLCBzbyBiYXNpY2FsbHkNCmFzIGJlZm9yZSB3aGVuIGdpY3YyIHdhcyBh
bHdheXMgZW5hYmxlZC4NCklmIGV2ZXJ5b25lIGFncmVlcyBJIGNhbiB1c2UgdGhpcyBzb2x1dGlv
biBhbmQgaW5jbHVkZSBpdCBpbiB0aGUgbmV4dCBwdXNoDQoNCg0KPiANCj4gQ2hlZXJzLA0KPiAN
Cj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

