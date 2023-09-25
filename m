Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00E7AD6C9
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 13:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607822.946140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjV7-0001n5-EF; Mon, 25 Sep 2023 11:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607822.946140; Mon, 25 Sep 2023 11:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjV7-0001l6-BA; Mon, 25 Sep 2023 11:11:41 +0000
Received: by outflank-mailman (input) for mailman id 607822;
 Mon, 25 Sep 2023 11:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkjV5-0001kz-S2
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 11:11:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c22b372-5b94-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 13:11:38 +0200 (CEST)
Received: from DUZPR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::17) by AS8PR08MB9840.eurprd08.prod.outlook.com
 (2603:10a6:20b:613::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 11:11:36 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::8f) by DUZPR01CA0064.outlook.office365.com
 (2603:10a6:10:3c2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 11:11:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Mon, 25 Sep 2023 11:11:35 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Mon, 25 Sep 2023 11:11:35 +0000
Received: from b1932902f14c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F1E3F85F-99F1-4011-AAD1-DA41003488D6.1; 
 Mon, 25 Sep 2023 11:11:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b1932902f14c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 11:11:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6238.eurprd08.prod.outlook.com (2603:10a6:102:e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 11:11:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 11:11:27 +0000
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
X-Inumbo-ID: 4c22b372-5b94-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgfUXEUsclrNv2W7ehQdHKt6Eu82+bdctyihwVew8YI=;
 b=YccxtLLLDGxvcXHUwsuLkUCPgs2w7RigvENNM4wQcE+i8EFFLGgRemA4sprKkXuju771jo7ydapjz4Cd+463mJQTcoeiKtFlKJE2QCeIW2P7sTyDqPk1cnQ+Xftle5MGzlMvrZ/swE8qYXkl80jKzljBtP2tN7zYNySREIcUd8Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ab877325e33b9fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fp/e7zinK0e3uNKG8QT0+oEJWjmsKoFHy5zPR6MhzVchQjnn95tBSXLMRFxoK4EmT4RFjAoY72uN6EnMw+vwm2ZgfRrRIk03aFnvrxDN91QGFBKoFESZb+f9/LZANtbGRHPJl3EqP+KOmvsxi7HxOp6s8xr9CfZtFODZCUG2Wr21awf6oFVKMby9bJ0r6sOMMpejvPKgV1ET9wMExvSKCKfGXlA0F+QgiewDhw/8O3ANz8faLkJeH49N4JKelwTa6RPI2HXZuPPmWr+HtWbfmlosFiYdvNN07tJkxRbpziloqfEdXULKa+19KUdTCCia/VYiTSISsdtfiDehUoPorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgfUXEUsclrNv2W7ehQdHKt6Eu82+bdctyihwVew8YI=;
 b=YmXIhZjG3nqY5I8VoCaBCQlg5NZD8vA3dn8LoaGfCo7s/4yqlBwFshuNNjsvyl2TPblBtA2dMvJMHJQaQnxcjo7ytSe7c+aPg1EiBM5HCYRlppSuSpsHHJahF4NW0iai72jO8ja+5QcLH0WUfT7ESilOhUjYS3+nWmTOL9gb/7jYrEgjcYSgLarNCytEJEfC+CBws6FzayBtsV9QUoYUNRQdHvg62TGxsivLUUYFl36TBaX2mEQOxOo6V1HMqcctylnu1i7wRr9vpgXz+idYhHScBLj8s9vxL8V7T6CsuboW4jhdUX2GnMpoqZzLA8XGG3JUm0KnCf/t99EZS6O7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgfUXEUsclrNv2W7ehQdHKt6Eu82+bdctyihwVew8YI=;
 b=YccxtLLLDGxvcXHUwsuLkUCPgs2w7RigvENNM4wQcE+i8EFFLGgRemA4sprKkXuju771jo7ydapjz4Cd+463mJQTcoeiKtFlKJE2QCeIW2P7sTyDqPk1cnQ+Xftle5MGzlMvrZ/swE8qYXkl80jKzljBtP2tN7zYNySREIcUd8Q=
From: Henry Wang <Henry.Wang@arm.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [XEN PATCH v4] drivers/video: make declarations of defined
 functions available
Thread-Topic: [XEN PATCH v4] drivers/video: make declarations of defined
 functions available
Thread-Index: AQHZ75BxeEriYuxeZk+v70ty8+HkJrArXccAgAAFGAA=
Date: Mon, 25 Sep 2023 11:11:26 +0000
Message-ID: <C7F9410A-F5F1-4DC4-B8FF-242F58792950@arm.com>
References:
 <5830a4d838883a20a6b320dd9af44ef4bb18ddaa.1695632599.git.nicola.vetrini@bugseng.com>
 <28310181-d7f5-a8b6-f1fd-ea9ca0db56cb@citrix.com>
In-Reply-To: <28310181-d7f5-a8b6-f1fd-ea9ca0db56cb@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6238:EE_|DBAEUR03FT036:EE_|AS8PR08MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 150530de-da96-4afb-43a9-08dbbdb82eb5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jf51OoSmgHHS6tF+qyiffD9H4WHKhdJC6rTl4KR8i+du+ROZ2Y52CNyVbNo0MECSh0dTMUU7en9nIiPjqVyq2TrjmXuCxeE4Hs61qtnyoLoUUYSkNiMrjgOQ+eu93YZi6SUZlBkjR5NloE0TKZ4NudFaxo09u+BNh1KqPZeXLRwwrQC9z2EpnRD3ih/qYf5vo3OYTbIBiLI5DTws2z49X9RJaRhZD8Vyl7jj9mMm0z3G9w7ucd1kibQNpZhl+AMocBt2M4cwJOubo33PQMg5289hiY19sRTx7Rc/bTN3OVElt2I0Wqm5bCrb04Xmt7+ffsk9G+lYRaXZj5Tmdt/gZEyRrcQf0kj9Q4KLFour3VpX5qvGpw1abFNSOmgRak4QkSsUqeBlpJQUzssiXmwY8ySD8VADkjX8tjWT+5zbtcYVSk+xZh7XRFp47vTuZMnjMyUgplh1PI9nmvU5dWdJgW8NLd9kkLiwT7uhAJ6YQEYGOflVHBnyTGvIdlitYGDW0PK2z85bov9Wxllc2khtccRkRXv9sqcuRnVOL3jgfbEx2tA3TZJyZgWv6f8pOjhtI/a4g6o69XbUp6heCy95xZPieoXv8LpOEWIpMTA/JYPRTMRPz9FffzjqKFIkg7HWS2Oj5cz4lWSembuczQsaDQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39860400002)(136003)(376002)(230922051799003)(1800799009)(186009)(451199024)(4744005)(7416002)(6512007)(316002)(6916009)(76116006)(66476007)(64756008)(66946007)(54906003)(91956017)(2906002)(66556008)(66446008)(41300700001)(8936002)(8676002)(4326008)(478600001)(71200400001)(5660300002)(38070700005)(38100700002)(33656002)(6506007)(53546011)(122000001)(36756003)(26005)(2616005)(6486002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <77FF484483F1D341821AC420FB6A7F2A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6238
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6ff9ec3-f30c-48ae-707b-08dbbdb82974
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ivNaxkqs+tta77s7tKzkrsCTBlDh1NCPS1KX1zZ0RgxkHva8VKPQy4ojp7w/i1cB70nlWkJL6D7bc/xy+Oh1ns6oClt3JnNxIG83ACYBRR7YiVbICBp5QLTLqMNukkxd9yEvgNsAVs9X/c2kcaJHMRLFBfwgzlC1Zs5k61hqucfs3xH37/d4vKdJjENDbg9Zt2tYifbaa9DXqQMD4jq5vUfl19I6vbwrkwFWZmN67lA1dseSzIRV+8TzTN819lrQii8zMQxxaaKcz8lhQBir1W//0fR+N59JTYeHA4LmieerABLwIQX5tVl1tSRpyBStrHDL12LuWvmYe2TAlqsw2cxHDg28302FR63kZib0bjnHHlgIWFKji/h8RCFxXpDK7iVkbiuX4pd2J8n+HgqmGA6DCz1RE7sFyVRGpekQiY86Y3B516FEGXwvVLI+2ibTLZfnEuQdIP0mmWmlcYB1SIgievAKW3GytKKAO2dPA6Ref6nBYLyquPCyan5lbOQo91Dgmq2IFOb4+gm6hNsTjHFUKMD4tmfe5q5QloV7tUMEPro8sB6Mdwr0zUGIRA5+LOYJXZS9KbgSI9vR9b8uRyjP75cnFwJbIfyKaSe+9egMTQEK0mcezm/6aEI2meIghuTDlyzFqRDcl31qZ4o9okXhctq5/rXqPxvvur/snIuz6apsI7hEFKyOmhCDbX98iOWiTp/MKoTh73wd0NNd6/67SXQLMNQyQP8R8WBEHNmvnmkcbcRcBvCD+ZKWKU3K
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(2906002)(47076005)(36860700001)(4744005)(356005)(82740400003)(81166007)(53546011)(70586007)(54906003)(6512007)(70206006)(6506007)(6486002)(26005)(5660300002)(336012)(41300700001)(316002)(478600001)(8936002)(8676002)(6862004)(4326008)(2616005)(86362001)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 11:11:35.8164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 150530de-da96-4afb-43a9-08dbbdb82eb5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9840

Hi Andrew,

> On Sep 25, 2023, at 18:53, andrew.cooper3@citrix.com wrote:
>=20
> On 25/09/2023 10:11 am, Nicola Vetrini wrote:
>> diff --git a/xen/include/xen/vga.h b/xen/include/xen/vga.h
>> index f72b63d446b1..9b2c47971d0c 100644
>> --- a/xen/include/xen/vga.h
>> +++ b/xen/include/xen/vga.h
>> @@ -13,6 +13,12 @@
>>=20
>> #ifdef CONFIG_VGA
>> extern struct xen_vga_console_info vga_console_info;
>> +int fill_console_start_info(struct dom0_vga_console_info *);
>=20
> ci
>=20
>> +void vesa_init(void);
>> +void vesa_early_init(void);
>> +void vesa_endboot(bool keep);
>> +#else
>> +static inline void vesa_init(void) {};
>=20
> Extraneous ;
>=20
> Both can be fixed on commit, but we're in code freeze now, so every
> patch needs approving by the release manager (Henry, CC'd)

That is very nice of you, yes please kindly fix on commit, feel free to
take my tag:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> ~Andrew


