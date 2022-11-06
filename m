Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CBC61E086
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 07:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438413.692527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orYyv-0003iX-N0; Sun, 06 Nov 2022 06:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438413.692527; Sun, 06 Nov 2022 06:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orYyv-0003gl-Jp; Sun, 06 Nov 2022 06:18:09 +0000
Received: by outflank-mailman (input) for mailman id 438413;
 Sun, 06 Nov 2022 06:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yzl/=3G=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1orYyu-0003gf-HF
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 06:18:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6979470-5d9a-11ed-8fd1-01056ac49cbb;
 Sun, 06 Nov 2022 07:18:06 +0100 (CET)
Received: from DB7PR03CA0088.eurprd03.prod.outlook.com (2603:10a6:10:72::29)
 by DU0PR08MB8563.eurprd08.prod.outlook.com (2603:10a6:10:404::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.10; Sun, 6 Nov
 2022 06:18:04 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::32) by DB7PR03CA0088.outlook.office365.com
 (2603:10a6:10:72::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Sun, 6 Nov 2022 06:18:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Sun, 6 Nov 2022 06:18:03 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Sun, 06 Nov 2022 06:18:03 +0000
Received: from 70d9f59ce48b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CD0D5B0-3E92-4270-8752-725F63E901A4.1; 
 Sun, 06 Nov 2022 06:17:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70d9f59ce48b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 06 Nov 2022 06:17:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB8822.eurprd08.prod.outlook.com (2603:10a6:102:2ff::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Sun, 6 Nov
 2022 06:17:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Sun, 6 Nov 2022
 06:17:54 +0000
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
X-Inumbo-ID: c6979470-5d9a-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HzdKoOLb8N4LEqaEnCnLgawbSMjckIki7ZewXj2khCHvjzYlI01G+EDwWTgO/5D3YGJxcJPeVBuibn1k4o6/9+aOgNhfFDhonKwFPLroPG7lMzqsN8jq1z/81fKieq2zxHOH809jULaX2kf4sWt/L3AEa2xU0OU2Q7uEsWetwTA789o0qNnJ3tmWxqkRxMobdeZn1IB4FMbGYuf8FzS5trNiOVScLCO8MsyiZJoh06gVjeddCP5YPa2Kvj8CMvEJXuxvaxvfM+mKt4qfcIEjbtDCC72MeYLCuCpW2xUEcxnp99Z6rCw24lkm19/4TuLRibJFF1svZDfa8enzp1o7bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg77E8X52ak0YcAa5w+xIeYYeozSdFDrkf0twqK4xlE=;
 b=PhcPrbINd54b+8+hspFGw1tSDoGb8yKG6Ux3b8hBdvnssCaP4abpOq3biCYGoNFrkLOrgkbygzuuSINhPT2WXfTCDqfS4P8JoA7YgMUtHoCWo350q4YOo84FN3amUGd2BYjKSy1Zo0kF0+QSUwiZaJHYzLHg5Vf/kxtocCeYB+QtsjrxODJ/BfZ2B9jd5jgRmOb9l1Cl0bbjqGmcfKw+OsG1hFJWEbeEiRZG0LqHd5EX35HlEB/urTEDySGr6Bm/3RnO4etO+k/RJO5Acq+tlqTQz66uHo1xF+UEzLIQoXlqCubMGJapNpm39SZJxZ4Bf/QDT65uafE3eqPPTJbGRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg77E8X52ak0YcAa5w+xIeYYeozSdFDrkf0twqK4xlE=;
 b=m44p6zSWLl0i39CrodI1ARmjXsm9+iEM0sr5nt5SI3OSRz608pkA18pi4wiFtDREpWLqVtvVa6vbnXh6leVbuqcS1OglIJ6ASXKcoEcObAXHVXN9/p7kPdxnJ+mFcd6kAuDPA8T3dggYaSrS0mlxOXlsM8F8+OfG4hwua9icO1U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atfJhUG3ZfFWSpaG4b6f3OdxfRXVkumVy40M29uuALblEFE6mnby0cZxv8pkcUuQe5YUkDpjKaU4G5iinVPG3g4cRvc+cGTT8iG3jVM/ctygZh1OQmR8GNu6WgjxukBQWvXruP46Rea7vnSZtkgjRgjTJXHL1fK397vTcyzaj13Y7WDoMPTxu7kiPTzdCh1r845eU2IxplkCsXEk3EdkzMeuMDmi0jUpkicLZ9xqHH2ubip+QTGQXQjJFUYWY98sSvzjopStNqCcApl5/jWfVwg13A87t9dxR7pLIndqryXFO6O3qVvLtCKKXXqMTAfdz7wtf34iunclFYVYdHhTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg77E8X52ak0YcAa5w+xIeYYeozSdFDrkf0twqK4xlE=;
 b=ZZOI6FKcGX2uHltIvLB1r5r91gJDdW+h0VotE0xgzh2FpeVjRIvA0qPghghuEsOVYVLn5QzxR9hshfyFYeDw4tYaOUqT/b5FTRPsbg1qQTHClx29uuNY9DpH9d4+sVpOps6V+TiHh00Ij9GJrHnDXOEgddw7HE3iH4ARaCb0rxZxmKsZ1hzIHUCpGP6PE7p6b3oieiqWNs23gk+f7s/yiYz7MsFtl4qP95FdsLaUTj6GghzdQ0lrkqqswbCH9ul4gIgthEi424iwD0O1dItDhOYoY1n0Ja5/L0373EvBbK/qwmzvIBB42tDZZPYldLrQgBOmY5zI/xzhHUlhfOvBgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg77E8X52ak0YcAa5w+xIeYYeozSdFDrkf0twqK4xlE=;
 b=m44p6zSWLl0i39CrodI1ARmjXsm9+iEM0sr5nt5SI3OSRz608pkA18pi4wiFtDREpWLqVtvVa6vbnXh6leVbuqcS1OglIJ6ASXKcoEcObAXHVXN9/p7kPdxnJ+mFcd6kAuDPA8T3dggYaSrS0mlxOXlsM8F8+OfG4hwua9icO1U=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: RE: [PATCH-for-4.17] tools/hotplug: fix systemd unit dependencies
Thread-Topic: [PATCH-for-4.17] tools/hotplug: fix systemd unit dependencies
Thread-Index: AQHY8acq/wc9uembvUavxm0oHbdHfK4xa5qQ
Date: Sun, 6 Nov 2022 06:17:54 +0000
Message-ID:
 <AS8PR08MB7991F76A18D6A17F47D83E66923D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221106061517.15602-1-jgross@suse.com>
In-Reply-To: <20221106061517.15602-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DD8CCABDCBA4E941BBBD6D9E6C61DCC1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB8822:EE_|DBAEUR03FT048:EE_|DU0PR08MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbe046e-4851-4830-4b0c-08dabfbea9aa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d50kPqxQDNWuGijds5cmTMq0ceBh0So5xAghiUvprhGs77YqLtBgsByLzPSKO9CKPWpU4Injd4pEQ/PTBMfSO4cUBa7OGJanqEJ23YbPub4mYxmHKX/Gu8U++EwURDf1U4J0NaoXrT6KXDy/hbB/6GiBfkF7BNxd4Y75jEDfckyGgIWnFOn3QFvCd5qlgdNzwQ9NoATg5cM/+B428F2uLRcxqY0zrR2BPRly7Uui0J4D4zKmLzguL7DXFg/KKO1VMCKpRPzQ4vz4wADq+67w268KtO69FyoMGNVaXjue8Elkxf+TZrt8ewI5gZjRskPOu/HUd9CTaYjzsMawG6IP9VdtEC0SShfTbKd1HK8YF3444bBsvGhtX8maWyJdRWcQzG/CaG9mXGeBUs0A7O6claqm8gn08RWB5QR0osy77Tf2Sr5GrT5kq8+F3VpRqhhyoWeM9OIZFj2WtnmzVmIOAl5orCHjNBM+qRUQePvOXiH97RZ4Cc0O7YOpX/s7OCLwFFV4jJh1Cnb3SUydbSCSYYrpLu+V9l5Qg/puCrulRQmscaaw00+yaP5FTgEKRZOE9Nz11RPxHb3pc6AqkeykNUif+qfVLkLOwvkL0LsiSBOxrP8Y4nlI0Ga4WtguNHCnD+PULUyfxoMyVa83LxhpC4USX5+Ly1Zbb6l7gufPp/kIkz73BqpmlEWWZrzspmmasMQ5EkL0iU71eOFD/GEbOkWRVA9OLRkkxhUYvtWQZxo9t/YhyL2ZRiF4gOdls8LQ3U7OOH9htW1U6JWRvNF2qA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(366004)(396003)(376002)(451199015)(8936002)(5660300002)(41300700001)(52536014)(7696005)(4744005)(2906002)(55016003)(71200400001)(66476007)(76116006)(4326008)(66446008)(66946007)(64756008)(66556008)(33656002)(122000001)(38100700002)(8676002)(110136005)(316002)(54906003)(86362001)(478600001)(38070700005)(9686003)(26005)(83380400001)(6506007)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0fc229ee-785f-4c9c-5db1-08dabfbea45c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TLAbWEaSG4IRvn8CKaC4mv2X8RbX0PQ0Kd0Bl8b/cB9OkeIhAoAwwQ0POiVPkHx6T0z1SxsLc6oMTOam5k2BBafkwKA/Qp0MDgLc2I27La9n8PbxS16Gj4STljKKkS63cC1bFTOydONJuVVVehHBO+3cfslbWSH9KkiUhA99Sf2YlOW55x5ha01bWEktXCq9TucR6ciSA6BwhgZAqRrSBhPjk5dtI8U1UTXBwgEIWrRjCwikOBErDVDIUE6Axzlv0qyYpHoHMBVl5/1LY37I5kVQsj2e7DvxfQqNTJLad1TsBnH/91vwp8iy07rMkN6Ip2afD9EcCZshR/e+UYC3E3Vt/txKQqbK53jxoA4ZBpoQEO0LP2Lr4y/nzw8iRWifmQcxU/Pg4fmyXhX9Qt5K+XyDsHDtdHRyK08vp6l/39jaLyT8UCXW5HlNmK+2jm/FDl48IddSq+dQtyOGOAfOwkxeBGipXqC9f2oDK48/Hscpxml6dx4qLiK/t/qC6LX7YLjTIeIwIqSewGHM1RQjRcwx0VjyMU+qvUNvTH8p3BjXMTIOhfArrp64dKMDnKd64nV6Kqu5cZiyZpYE5m0UW5eHmw2/V4XUGLT2nM8pP+l8w3owYwlvJ3XPJDpsU7ovxbVTtaX0ook9dRl1V+6WuK4uFV+G48F3zrtua440bxMh2zbjtqozB7wDaUit64xTCANgX6G1RhDwQhYGOayKCEWxYhHPuILkKo1G3yRFwVc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39850400004)(396003)(451199015)(46966006)(36840700001)(36860700001)(82310400005)(86362001)(81166007)(82740400003)(356005)(316002)(54906003)(7696005)(52536014)(110136005)(8936002)(70206006)(70586007)(5660300002)(4326008)(2906002)(8676002)(41300700001)(47076005)(83380400001)(186003)(336012)(4744005)(107886003)(478600001)(55016003)(6506007)(9686003)(26005)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2022 06:18:03.7391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbe046e-4851-4830-4b0c-08dabfbea9aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8563

Hi Juergen,

> -----Original Message-----
> Subject: [PATCH-for-4.17] tools/hotplug: fix systemd unit dependencies
>=20
> Commit 1283af6465cd ("tools/xenstore: remove XEN_LIB_STORED and
> XENSTORED_ROOTDIR") removed the systemd file var-lib-xenstored.mount
> without removing dependencies to this file.
>=20
> Fixes: 1283af6465cd ("tools/xenstore: remove XEN_LIB_STORED and
> XENSTORED_ROOTDIR")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

