Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF57D6865
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622818.969997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvb4d-0006OD-79; Wed, 25 Oct 2023 10:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622818.969997; Wed, 25 Oct 2023 10:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvb4d-0006LC-4A; Wed, 25 Oct 2023 10:25:15 +0000
Received: by outflank-mailman (input) for mailman id 622818;
 Wed, 25 Oct 2023 10:25:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p229=GH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qvb4c-0006L4-3d
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:25:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c761f2e9-7320-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 12:25:12 +0200 (CEST)
Received: from DB8PR03CA0028.eurprd03.prod.outlook.com (2603:10a6:10:be::41)
 by DU0PR08MB7883.eurprd08.prod.outlook.com (2603:10a6:10:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 10:25:02 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::16) by DB8PR03CA0028.outlook.office365.com
 (2603:10a6:10:be::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Wed, 25 Oct 2023 10:25:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 10:25:01 +0000
Received: ("Tessian outbound 028b72acc2da:v215");
 Wed, 25 Oct 2023 10:25:01 +0000
Received: from c27a914830f9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4E456117-AEAD-48F7-AF5D-057D3F97218D.1; 
 Wed, 25 Oct 2023 10:24:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c27a914830f9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Oct 2023 10:24:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9573.eurprd08.prod.outlook.com (2603:10a6:20b:61b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 10:24:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6907.030; Wed, 25 Oct 2023
 10:24:50 +0000
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
X-Inumbo-ID: c761f2e9-7320-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo1SuZNdnuEQYif/3zhWxa19vW1Js6FBL2EXNYGw/rU=;
 b=GbwHHX+AOrNmKWhPM0BVV+5FWDHrqcoZvnp9XYu+COjzsdbmvjUqPAibH9L4Bo+kC9G+pNt8SzGIObChJCCSc0/WcKkj1lDn26l5zR/Gn+XVpXRzxA4qWpD7ENZ4Fozd9tuMFh4Loi//BlX4+8DD0mL9FomE1I6J/22k8+EGzq4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cce9e837b2542a5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EULdrBAdJKyNklAYBRXkL37+2ssBQmcYpc+shW7zrH8c0aBtzz5sIXqhvTaQH19cFBbt7Vnu6E0e8xG+NnAmZmwqS9NxmEzeDcXNoNwjLdASlstzrTIs5U1dOEt8xo0T0OXyyTQTMb8RqkNV3GlELtcFZXVye+ScOfTTGrI7O7d7Y6C7H+CISi/r6q2Rb8TPPQdlorfBJZYBiJ/0ecxZFlNwpmOfgb7H2mkJpQm0F4S3933PiSXc/kNWCyKEQel/MKzEqhkb5MuQMjysdDTEK/SnFYGSqwqMveQPgXAIEqE7DNERe2AGpRGN6Q7OTKfmqMjNwIcbUV5OfrV19BMxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo1SuZNdnuEQYif/3zhWxa19vW1Js6FBL2EXNYGw/rU=;
 b=TQ+EN6GpI/xtzP248KZ+cgOD/8q8uw74v3L16op5wCBD0C0kUKqOUnP7UNVYaM7YtBAl7JQbOOB55TNeUKvdTOMuVvh99LnJD2Tz6+io1fSjJH1AwUd1AQKZeBkt7HNnCzlorpQlF01mQYX3A1f0U+Ia8FKHvNOj0gpM7lrMN1GVcvhwsQP55V5H7NOkzzJ7ArPpTHhevcWOmNUAgX1nmiHsiH4723BHK06h+bIERU6MS4VHFACTFMc37Y0oFYVoHp8pyUC8dPPX5X8gAsYqIcGjuzJrvDZqR1WnHFeAN0Vlxlp/eNQB7hinPw1hoqWnlXATcJ45nylCm5izFgR7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo1SuZNdnuEQYif/3zhWxa19vW1Js6FBL2EXNYGw/rU=;
 b=GbwHHX+AOrNmKWhPM0BVV+5FWDHrqcoZvnp9XYu+COjzsdbmvjUqPAibH9L4Bo+kC9G+pNt8SzGIObChJCCSc0/WcKkj1lDn26l5zR/Gn+XVpXRzxA4qWpD7ENZ4Fozd9tuMFh4Loi//BlX4+8DD0mL9FomE1I6J/22k8+EGzq4=
From: Henry Wang <Henry.Wang@arm.com>
To: "committers@xenproject.org" <committers@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: Commit moratorium for branching 4.18
Thread-Topic: Commit moratorium for branching 4.18
Thread-Index: AQHaByyrPO+3wCfL+UGXB2cQc11Ty7BaTJKA
Date: Wed, 25 Oct 2023 10:24:50 +0000
Message-ID: <CE001769-5AC1-4F9D-B1A6-BAD0215992F7@arm.com>
References: <E63E9C8C-471E-4524-A61B-EB5BA4618288@arm.com>
In-Reply-To: <E63E9C8C-471E-4524-A61B-EB5BA4618288@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9573:EE_|DU2PEPF0001E9C2:EE_|DU0PR08MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: f65644a3-2555-4f80-ba56-08dbd544a5cd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fRxuCwvVIjbCZ0SUri4P0++9LJMQIHs53O69XYWzSZFbequLDMPsnXKTQ2389pJe9YlZkQERxtlDh7HD3iT2Kj8BM93zNvkWSuHOeQySDhqYl5lPb+Wygqpm79/P3iJb4SnxU7jVT6xRR6tzWDSX75NpxB1MikjRvhQCVHayE/qj++ndPuHaodv4Np7YDdHVg5W8tBBnYy69K8rz6GCRhdBcEMCg/cAKwj/KByOJVFkrQI6LB42Z/d9NXGdAgmqZAmWJcyXEjGua/F4XjHJN5pgd3wz9/96aFLGIm9nKPFtMmI8At3jyevNOu1zWMNwUohzAKEWsKvvdPWwR9B+Cnn4t1ZhzI7ZsXrzpRUy5YSJ7isHFVfOwSKAynklwewOK+vsicILS+ko/dlfLyhOoCmICYd7waTBFP6lTvbANocn8HHWhBXX9hlxO7c2aqp8PIAhDZmaI2O+TV0A6g460u6tcn6ZEki1yKOpdxpppgNEy6ZI2yKVSbVKJaqi771VU4pjyj+XIHbCWYj1Kju3Zd8cXsHEWl4p3gpJuIXU5QH7n44amNyUY4gcTwhB6OrUY6M7nKRA6wIbxowoT6FhLZ4WcT0rwuoNAsM+XQ/qADQaaB5xrVlxd2d3XwzdpWz8IIMJqnAXb/T6pSRoDZ/VobQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(6506007)(53546011)(71200400001)(478600001)(2616005)(6512007)(76116006)(66556008)(66476007)(66446008)(66946007)(91956017)(110136005)(64756008)(54906003)(36756003)(316002)(122000001)(86362001)(6486002)(33656002)(558084003)(26005)(83380400001)(38100700002)(8676002)(8936002)(38070700009)(4326008)(5660300002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F2F39CEE18CC5346BE2B454E4B85985C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9573
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6954b81a-3c1d-4f8b-0844-08dbd5449ef1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+3Re10ugRYlr74RIv3mTGbXbGbPv1h7KenwmG9hL5rgASubpF2Eu9xvsukNgu/2UOmbEXFT6LrMPZVhqaULqwAE7E+CTLEIW7/np9TG4JBwqRGiS0vKvT3weLSfVj93wMoYy1g/Oj/qGX3JWzPEIpITwfmNgvoVr9Y28N6Qxj1QcpK7Uwu988UoyhNSjgnXZTTeuqlYqGku6o3yguN50+YUp3TR7ZOnYcxflzFIcG94gtJGXIW/oyhMmeYiBKE0XClHdNJeKHdYmStmButjS/yMakqL8bKb2GO6wgTC02yuj4ay+DG8mTF9iQsPtb1Nz8I+8u+9fBZnUeSfZCgo+xet7ILrPP1ex/NqJGbYae0vfJTvUfGeR938QUAPmKt+iKzwdvYfv+x8mJrTvmp3QnsJwM7R13leNS+c07vKhAeMFc1MWvbsvjeD3PMIU/SmQD/YAqoke9KYRRuHhlTYADxSuyKAdjpMt2ix63e/GRHwonm6u5ArFEn2yn3b+SQTW31u7cMvUh+PR8Pl2oHXXkZb03ig9PVz4VxtkkT/r8RzNJJ3KA0+3vsjl/w/rBu/0ivz+Og7+TVYl9by2WUymPzVkyJKU/cR1VymvOk49bWKPZJWqlkfsEZ1aTMPl3drewAmKm4smt7gGwxjZVwXbDecVK9SJO1anRYZ3D7sW5OW9ZN/orYyUfIiYKVypVHLuJBKIrPzcyExSkGkPvzd+Z/9Carx3UM7FgTKQcacXH5GyMf6HOxOmemYPKGe/FO7T
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(2906002)(4744005)(5660300002)(82740400003)(54906003)(478600001)(356005)(316002)(81166007)(110136005)(70586007)(6506007)(70206006)(41300700001)(6486002)(6512007)(53546011)(47076005)(2616005)(83380400001)(40480700001)(86362001)(336012)(36860700001)(36756003)(4326008)(33656002)(40460700003)(8676002)(8936002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 10:25:01.9116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f65644a3-2555-4f80-ba56-08dbd544a5cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7883

(+xen-devel)

Sorry I forgot to send to the list...

> On Oct 25, 2023, at 18:18, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi committers,
>=20
> We will be branching the tree for Xen 4.18 in the next few days. Please=20
> avoid committing any new patches to staging until further notice.
>=20
> Kind regards,
> Henry


