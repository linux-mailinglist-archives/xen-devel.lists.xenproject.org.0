Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64E5570FA0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 03:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365433.595595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB4tk-0002H2-Mi; Tue, 12 Jul 2022 01:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365433.595595; Tue, 12 Jul 2022 01:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB4tk-0002FF-IY; Tue, 12 Jul 2022 01:41:12 +0000
Received: by outflank-mailman (input) for mailman id 365433;
 Tue, 12 Jul 2022 01:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RdAP=XR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oB4tj-0002F9-3T
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 01:41:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3ff7abc-0183-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 03:41:09 +0200 (CEST)
Received: from AM5PR0301CA0029.eurprd03.prod.outlook.com
 (2603:10a6:206:14::42) by PA4PR08MB6096.eurprd08.prod.outlook.com
 (2603:10a6:102:eb::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 01:41:06 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::9) by AM5PR0301CA0029.outlook.office365.com
 (2603:10a6:206:14::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Tue, 12 Jul 2022 01:41:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 01:41:04 +0000
Received: ("Tessian outbound f9f15f9daab2:v122");
 Tue, 12 Jul 2022 01:41:04 +0000
Received: from ec2e6dd7fafc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 070DAB9D-01A4-4675-8DDE-E74EDE146D33.1; 
 Tue, 12 Jul 2022 01:40:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec2e6dd7fafc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jul 2022 01:40:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM6PR08MB3703.eurprd08.prod.outlook.com (2603:10a6:20b:83::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Tue, 12 Jul
 2022 01:40:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 01:40:56 +0000
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
X-Inumbo-ID: b3ff7abc-0183-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Xsl/UstWMds+D/XkwvfnKCv53zQlxJ5AjlPSd2y6ZgnbaZNsxy6R+Zee16bkeE0pNyP3OR7wz5hLHwq1CLNliXzGlMvKXlTgea4QVQpp+HG8btJi9XFE9r0E9ajyo/6vJpDfks0sOu/cxisxYI3wUgY++chEiEhGOpQHWFIAAuUG4wf+cZiHo9Kqd71KMP1zdshV4QpVVDbjOWBRqakaCtbICUUSfABLf61IbsZvVMVsPRcjrfz2LAnsNjl4VXelgErspsad/rExNyXZbUFKQ6LsWRr8YOphdZfSTvlFqUh613Z+0HbHixRWw/alJ7oQrWANeK1aSNtihGGKz9zerA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4EVgc0I8vrHt/l3xKDeulj8wo44gRll98CWbAr/wB0=;
 b=Q7yuqMVXJIVkNobGPgS84V80QGcEGLZZxYmg5im1gvDDId4xUe4NzEkz2WoAq0D1TsVhakChaDbt3NPVkG1ACu/jIankVChyQBfnWlm1GK/F63O7oU0nhsgqbCPL/J2O+xJc6mMbU3L9MEAwJ3uvRAF6D0P1SeBeGI12OjZTgNSU8+S5syYlQyNT3rByDKKSbuufSKSAl3uuLS0jT+rW6Dc6yRKcx3fK9p2ecX+XqgLqKWSj9J6t38QLpkFRhNfVievE86grD86UWMedEmDsQQXe3DMtjrtjrQ8TC1iShEspZkLzkQj3w62HOo8txGKyAN/1DeT82tGsISTZ8SzPxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4EVgc0I8vrHt/l3xKDeulj8wo44gRll98CWbAr/wB0=;
 b=TVv/FIwDFhOJIRiajQf2tipWAuPXeJ+zRbwLmqQEf0i4Vhtmdzy137JrtYhi9CWL1pyp3EI+bRPUe5ZN3TYcEFYz1oOTnKuRT9Qzw15ERsMCAwyiF7zK7G8wskIdfZaa8ot/AkpP2+JKRUKqBpMPU+BpyAMpScRdgfdHMBa4LuM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SahODHvnr4Nr+YnkrSWC4/djNeR29I1i3aZKLWuFoOd1/T8m8PGx1mLsJT+zLGnnVZzbMKmv0l4NahYnOB6DFeByUwSaUqFO7qiJb4GETysZEmvFjKYTxbeU3KSw/dRUtWpd802l+M/dk6KsDBlsRvP7PlmQgO01Q/vFb5fMcun69l3wXauaYj8lGlqiibAgwWnJRDZWrGS4dZN0WsESdJD4WCgdMPG2W7M02QsXK+RedVYgFIYozGCuUJI5uKJopL+MdZQWigDLpJg8JlvwubGAFC+E57vv/WMmZmUPS4mWH2cnBrlaHamI0ShNam538ANtrphlyD0Tm3PVvF+/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4EVgc0I8vrHt/l3xKDeulj8wo44gRll98CWbAr/wB0=;
 b=PaDPd3+OYGeuyAZgqQ3ITFjfiWn5Dkc17HqePHfbT/DKjZy2GrsQuKcypTIjB6WlHkBNc5OhwFz4yxil4O9uhGe9nD9PpQv0KzaoqE2Bz0GVm2WnCrSrsrNq5o/L90uYAE00V6LCsru+th+WjacomEG+/JDkzohTP8RWTDm3bBJ+jOs9cYbbkyap1jHCs2MATdLBM3BDBe1xJhQBPtEp36K7mLTV29zqW/zjBAxQuzpmKLdmNpvSNI7X2j3Hxiz1IKHO7N/SXHlvvpoz5FCxxPKjofXpuCeYfD7HnFAV9NZHV3WzE3jXJt99HTJedgCj31gOaQ90ys90YNVCH6Kbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4EVgc0I8vrHt/l3xKDeulj8wo44gRll98CWbAr/wB0=;
 b=TVv/FIwDFhOJIRiajQf2tipWAuPXeJ+zRbwLmqQEf0i4Vhtmdzy137JrtYhi9CWL1pyp3EI+bRPUe5ZN3TYcEFYz1oOTnKuRT9Qzw15ERsMCAwyiF7zK7G8wskIdfZaa8ot/AkpP2+JKRUKqBpMPU+BpyAMpScRdgfdHMBa4LuM=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Nick Rosbrook <rosbrookn@gmail.com>
Subject: RE: [XEN PATCH v3 20/25] tools: Introduce $(xenlibs-ldflags, ) macro
Thread-Topic: [XEN PATCH v3 20/25] tools: Introduce $(xenlibs-ldflags, ) macro
Thread-Index: AQHYh+TOfU5dsFm/sEOUOCdWz1aYvK16EN1A
Date: Tue, 12 Jul 2022 01:40:56 +0000
Message-ID:
 <AS8PR08MB7991446F783B822B1689962892869@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-21-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-21-anthony.perard@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4DAB08760A148645A0A36438A1616838.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 26756e56-73c3-4171-7e2f-08da63a795bf
x-ms-traffictypediagnostic:
	AM6PR08MB3703:EE_|VE1EUR03FT015:EE_|PA4PR08MB6096:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8vomCpHkWRp77cjQY4NMWIEoJQ+AeDtsKKy3jl72b09PMWo485FIzjACI27kayHMjNmXLzoy4jGtiSPhqF+eui6saL8MsUpQUo4fn5Cf9kp3W2itIdxQClDHhzlpxzvuwADZYo+RLQpgI5vLEtUZfFenkJwiHh7WRhPkrKmSMU32gq2g52d7bVnasONsqzV5+78ss40DNKudAm8YX5IAfMWHECNqIA2k4WxjGGysPYRS6rCXHFruBzHLc5o0RS3M8HbMAdG1D9r3eu++pBzmmpVjgClSdqJbCZLrqO4l0aGXDMVRDGRbeIy/NzPNrOrUd2i5oAPyzGOVQOJ2DjCi/2qfl+E9qEUVljWAQA75YCTYact+dQaTQYweU6n1FWGprHIELBBgB5xlFlE3PMDoevdKj78xJjco7bCr9tNLeSfOOXtAyVMVlWH7eurCyQ+72uQqWhyw74ITJaDViS+VawSjYr2Q1CpQBXae8tVbmiD5kSi3A2ftGlYjy2gf0gmm6WCbfgTOdnGd+3VTyDUH/7ooJ6BevnlrjyxPbcTKAXpZ5LJexWGDZidwMBktyVBx5vTHlp0xz0u4G7fNRh+4xSJRU4XYW5ZQgMr78ChsYj4TOxipHm+mj1fKG0LsGSmMbJ4dxcQ0AUuySaYZMuqyNpRJ4m2H2e37boAw/wCvf7PbF8YpzToLebf+dY5v9QFwp2dXAUc3gBxPhQPy2tKq1Hwt5Mdd4oPmkIIRaq0eIqAl+wkB3ueTScFqJFyzYJdDUIgyxWToIV6vFSuHU6jmZqzBNvZ/36fulR8pQtjUarSOX/YDtaVmX/qIXCofjDUi
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(38070700005)(52536014)(33656002)(86362001)(122000001)(55016003)(26005)(7696005)(9686003)(38100700002)(66946007)(8676002)(478600001)(110136005)(54906003)(66476007)(66556008)(186003)(41300700001)(4326008)(66446008)(71200400001)(76116006)(64756008)(4744005)(8936002)(2906002)(6506007)(5660300002)(316002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3703
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a5eacc6-a98f-4393-d965-08da63a790e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8+ABfBB0lxhr4U4Cwkd8td3EDCJGhy41CPIrFbxkLsg6L5sIbvDMF5iTesptlbZj23kiezr7YN0IIKytV4SeilTD0svdfH9BS5AvSRUtEdsVjAwCTbfvkaBaWzero8NEmEzLa2X+fqwf2ba2uKJbQKVVDPzuHYCdNs18/cDXHv/X3f6kkfxwnL4TurSaVxZcfzny8+1x62Ym7ddKvCtVdeOGnvELhYzKF6zKbQ216rohHRX/tyaY8OxJt18SnUhztD4iovEeNF1Lr/ziSBr6bJn3xCm29PUcvCzQaKI3d+KjeB1HzxdbjirCNjeKut0IooCjmmawumQTSiFPAehvkmfPBcu0VqqFbAO3Bk/VFcIs3zZ7unNT9IxndnjSuhbEu6NnQJvJrzLgVV+uhbxKv5SbGffit8DqxnCduG0iRbNDfL7jckkkt12l4dnwU9Iuwkkx1Bl71XWYViy4i0zmWjqnIxWe0sJppyDadBuWbxFLl7BFufsVsy8n41F4ME1kbLt14APR2CNCQrlCWJSA1vJ6KXe69IMFY6DLYdtbR7yM64zULLJsoQZJy2mOoYLP0ergkfsUim6E5WqITmm8W0z/TMcEgLr5Vft7wAESU0d5AX4Ghl2XO/RW1WnEFlkexqPdCGbxezuOLqhOaUqFb+XIqHZfVOLJMc7tSvps7ytchCKQLEbZTlxwP5Ll3s2PfWCrYdCiAFLgU0z6qMmpT9InOHFeN0fKH9YRd99aFpxymSC2eGhHeK3PrWu/D2sOKez4vtbpx03ua/iw3a5OAJqDElraLU+wBoAEwYm/N9owYZyNaoRE5tK63KWRrRu1
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966006)(36840700001)(40470700004)(33656002)(52536014)(55016003)(4744005)(186003)(107886003)(54906003)(36860700001)(478600001)(81166007)(8936002)(40480700001)(82740400003)(26005)(336012)(47076005)(5660300002)(356005)(40460700003)(8676002)(86362001)(6506007)(2906002)(7696005)(41300700001)(70586007)(70206006)(83380400001)(82310400005)(4326008)(110136005)(316002)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 01:41:04.8295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26756e56-73c3-4171-7e2f-08da63a795bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6096

Hi Anthony,

> -----Original Message-----
> Subject: [XEN PATCH v3 20/25] tools: Introduce $(xenlibs-ldflags, ) macro
>=20
> This avoid the need to open-coding the list of flags needed to link
> with an in-tree Xen library when using -lxen*.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
>  tools/golang/xenlight/Makefile | 2 +-
>  tools/Rules.mk                 | 8 ++++++++


