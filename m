Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C87603A40
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425522.673396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol34b-00066o-SO; Wed, 19 Oct 2022 07:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425522.673396; Wed, 19 Oct 2022 07:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol34b-000650-OU; Wed, 19 Oct 2022 07:01:05 +0000
Received: by outflank-mailman (input) for mailman id 425522;
 Wed, 19 Oct 2022 07:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2xL=2U=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ol34Z-00064u-DF
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:01:03 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20080.outbound.protection.outlook.com [40.107.2.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caaa59a7-4f7b-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 09:01:02 +0200 (CEST)
Received: from FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::15)
 by AS8PR08MB9576.eurprd08.prod.outlook.com (2603:10a6:20b:618::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 07:01:00 +0000
Received: from VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::31) by FR3P281CA0043.outlook.office365.com
 (2603:10a6:d10:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.17 via Frontend
 Transport; Wed, 19 Oct 2022 07:01:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT046.mail.protection.outlook.com (100.127.144.113) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Wed, 19 Oct 2022 07:00:59 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Wed, 19 Oct 2022 07:00:58 +0000
Received: from faf9a8707409.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8FCFBF96-695E-47A3-9F81-9E85DBD4C1E4.1; 
 Wed, 19 Oct 2022 07:00:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id faf9a8707409.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Oct 2022 07:00:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB10029.eurprd08.prod.outlook.com (2603:10a6:800:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 07:00:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:00:44 +0000
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
X-Inumbo-ID: caaa59a7-4f7b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=j0Iy+Ev5noo7dZwOxpOMJoOXuU1cg7MdtX+38o35I5RiOmtSI5ysTf1MUKVETGwG0ab6ARuvbeik3U4TqM9Bog8b1T2suJS5nw9/QVneuV/GxERPkOOeyAnN56VIb7rgW/BGGLjgZ6JL4X9wmu0juDVji+LnronPnZ+y9rQfX7emr9MWr2SWeHSdLPLMIQclKTsBpDui/c+04tvHEBVbvTjwE6toqljIviKa4WA0Dks09C9vqUVhKkJlI3oyT1k1Y5L1L44gRZoQFZn2sMmkt7MAN75vl8iuByAcZBcTTOqFm62D/5WRr1vo6hdF4zmZ829o9k6yuu997tgXChicNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWBACWjmM3frdlb9BxYg6vvmstDvji8EwYqqLzcqGW8=;
 b=WzpNcWgR8EVDzlaWeLsiZcnXF5X24jGl1fdkMopl9EzyIK1YZZWC/WsoSM007YWfb1mYCpWc6EMI0yGNdHWKvFp4WhbTpNCcuG2enx1o+9mjlgQigAd1uT3vQ1Dr7JMxcZ7fF+lsAnXR4k0EY2xABGVdAAjn0lhErUv9B/p7Yo2nbdv5qnIV5w8sOMwbh5mNi62w3jMZIlGEE4vNSXM8tL3Qiq3oL7oFbU+3trgA3DJpgk8UOzZJA/hn0NSLOhuyd3+Nh1Bk91mymI46vPq4h13i581A/dl7Bl5z+Ltz7fVJOBX6IhgikrI/w/YC9o68QAk8Fje0LXfMVgztukioiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWBACWjmM3frdlb9BxYg6vvmstDvji8EwYqqLzcqGW8=;
 b=MuoRrW8zt6sYLUEknANKhvfEx7g77kARn41ylZ5C7ObPHVOLeDCOnzb3eKEraz1HCK652k4x+rDrzUa3aaady1G8KwTCX+WXxu1G9IjPwBw8VBAb0e//AhWjxsVdjtiWtRX7OMdOsxudObB0Tf/XRgN587+met2czkDnwLBfJXI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlcLCrHW4wWyXv+OcLCRbruRkyjCQ3Jr6Sb8ByHvarPnJ0styA1x+6YSsZ8LBd0EqmisuYNm8S2d/vKGASKZ8CyIlrXE5thrNhyzhjsWQ5QLLDNvm5KU2X6XRQiMFk+1SvNqYXLl9uhO09MRDla/0r6wZacG7M6gWhMEZt/ZGEsSVDCcLcv5yrIuMJaC/jIzPP2B6R4CwM9oQO1SqaBr+e8Z0MRfuGw8WcZnMb0DCpGTSRlf4PzJb2vxrOIlXgZ/JFJG0dlAhFQOHtG7enHeALhaGtLoesDJQNhuOZPP+EFhZxLuV3v5AC2D1K7vWlebSdJjShaCD6NlD4eBsHT/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWBACWjmM3frdlb9BxYg6vvmstDvji8EwYqqLzcqGW8=;
 b=NWEpfASdRKN9hvjpES5bFPyk/7q3el0cNM4eCrBmSBMz41ADEO4CniKdP5xM9TnV3Qbm3KonM1iKgrdY283orXCmSE2YJt4pEz7yp1EYlV6P+lE2sKXjtgmbGISTBQokFiW79V2icZE5AxIRcWW3Y858/VwuW/g8LjADIxa7q2JJ/EELBM8DP89lvrRtQkbNt9yNQYXlh/0i6afSx0AsM4T9HJua7baKrnXMJHE/LAAi4+baPydf4rYldzYnM60eTkI+Y/Vd4sQDqk/f5KL7K5ykWjdyymMAHPKYD6rv6CdLDp2W4vCSUNuWt7JYXwfRaDWYUtsS6IzBmPPaozYKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWBACWjmM3frdlb9BxYg6vvmstDvji8EwYqqLzcqGW8=;
 b=MuoRrW8zt6sYLUEknANKhvfEx7g77kARn41ylZ5C7ObPHVOLeDCOnzb3eKEraz1HCK652k4x+rDrzUa3aaady1G8KwTCX+WXxu1G9IjPwBw8VBAb0e//AhWjxsVdjtiWtRX7OMdOsxudObB0Tf/XRgN587+met2czkDnwLBfJXI=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>
Subject: RE: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Topic: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Index: AQHY3WMp8fkwGFUvPUGj/zptqNRTAq4UNRwAgAEdejCAAAIqgIAAAIHw
Date: Wed, 19 Oct 2022 07:00:44 +0000
Message-ID:
 <AS8PR08MB79919D975E305428D47B9500922B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-3-wei.chen@arm.com>
 <039ba141-766b-a7ea-2124-be396e8433f2@suse.com>
 <AS8PR08MB79911F3700C0619BA1DA34DE922B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <aa6ada50-8eb5-49b1-3e16-a3347ef55f2f@suse.com>
In-Reply-To: <aa6ada50-8eb5-49b1-3e16-a3347ef55f2f@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F4127F475E87334DBC5CAC8B1F99DC38.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB10029:EE_|VI1EUR03FT046:EE_|AS8PR08MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: 462c2a12-0f04-44b8-fdf4-08dab19fad75
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Qrie4ol9Q2gRJNec5Jpex/1qgQiQwxq2tmHZfMe8RUMzKxqeUzH5FrX5EjlsbW0fgnYbfx6epZuuZ7zDZzFLLz/gyLMns0BlzC0OZ3YabrdpMmXh/17ARqdJCDkI26EjZ7nM8TrS2krmnVVTggP4VsC9Lx1E+PigfQiRAnEJzVVbIAfUY8FulpJZcmRNudOeywaB1fB7CQLgDndTQ2LTfFJvkvKR4ycWh6nfGl1RsbOvV9Nwj+nHA0TFSrTg8lLTLlWa4L8+F7Te5sN3eSQUYO1OPIoizFWwkDAdloLdK2NcPxwO7EHJ6OT/WmCRBcY6jQpZz9whmXIu1oPYqc/Dt5pfOiWcI0LQzIgTxzHYRsTG6iOuKlZk8FWu7vwf+COZ7DJeZV1hk7LVCT0VhlaaHNf/9vLkoBPl+CJF1AVyWTIasGnx5CzRwaqP+m6LNqZl/QM8CYHH11ZwSbs+D7uCrxiT2N632gHZfcCZGI/feHmlOQ0bqEi+yRFnvIL7PCyGfqRTSWmcI2ONG15mycJccWGEa166wCgT3xMwr88BK5SZLrdXGdmdWXL7FEkzWpI70tfxvbe41K6FbqZKH2g6kRIT7A7lq00I1a4oR2KhazTQmknwxN2EzHQtiwmJpipkox1NmqUcBuCIp6ITatXXI672KxNzDgKYyGkGImhrbHuOtyOOL+1BVrDkhaPsGz0z3rNPvY9yIsBybjLibSoWfwx0Y3HYldJBV+eYKF8Tl4BLaeplm3+swG1/WPghqVJCABxWuoL4NhkT6/CNk5HaEw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(86362001)(33656002)(122000001)(38100700002)(38070700005)(83380400001)(7696005)(5660300002)(26005)(9686003)(55016003)(6506007)(186003)(2906002)(64756008)(478600001)(316002)(71200400001)(54906003)(6916009)(8936002)(66476007)(66946007)(8676002)(76116006)(66446008)(66556008)(52536014)(41300700001)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10029
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6950acb-432f-43e2-b69a-08dab19fa4cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rdHWqX1/cDZSXJsrykSouZm9mupxg3ICzv9NgtpyH71KUpRXChPUBMMWBTRBLkm3ZYm6j5J1GZNLxQOMxdMopOwmzMTO9rTILmoGRxkwNGkDOHc7VEdDQTr7GnAfEcKFePR0V9tlEeWqVSmE0dV0mD1xw8tdMR5cLTMSlFzXGSoQARcdnCWQS2Cz3648f4WSO7pVrQTqfyDUnsEVnFTijvuUAjF0MqkJmkgmIOmcxPP9mnku/25thGGBQByMEBZjLH5+bTTsQEayfQ1W+xofS4C6HSqNGfyT6fyaHQhJoIC9LQGcTnJm6ddby4l7chY4ViPlTHhsZu8J0JdWtYNugWCMZaHwdSYnSNBmUkLu4d9cO0kLT2BmeTVlUo0HGOsIQ13YyJinW8RJKM4S0c1nZVmzUuqgXipOlYhMx7m6Bx5MtYLC8uKEGCjyjw1GfKlSBKlHki8xpGSvn98H3ww2d+W4d2SUGriCsjIhVZNYSIfEdkA3XfpMAaiFaOQjjMeSqsGfstE6/THnNHJpD9188TIn7hKwkwTaqJgpwO3GxzsXcnn3SHIxlYOqaM5TT4rFPXT5fvDtGDdkCxTA4MEflaH1Fky4l+2Oiicq5M5Ns0Z6iFmzXbrLyVDT9PQr+tNPTBcnfjQWhFjK/odr4wq2VgMlbyceFr44c4u4PBvnd5UDi8iZAKN7vbPCm7tjfnL6sFdgporvqT6cyP0/3B934ls5GCTxTqqyH9U78PnQZhkEK6RnCtkub/NBGqsajZdkgEUOYT8jzLm+whBHiJkTcQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(33656002)(9686003)(54906003)(4326008)(8676002)(5660300002)(70586007)(36860700001)(40460700003)(70206006)(316002)(2906002)(478600001)(41300700001)(86362001)(82310400005)(6862004)(8936002)(52536014)(83380400001)(7696005)(6506007)(186003)(336012)(47076005)(40480700001)(356005)(82740400003)(81166007)(26005)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:00:59.3360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 462c2a12-0f04-44b8-fdf4-08dab19fad75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9576

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+ICA0LiBVc2UgJXUgaW5zdGVhZCBvZiAlZCBm
b3Igbm9kZWlkX3QgYW5kIGogaW4gbnVtYV9zZXR1cCBwcmludA0KPiA+Pj4gICAgIG1lc3NhZ2Vz
Lg0KPiA+Pg0KPiA+PiBUaGUgb25seSBpbnN0YW5jZXMgb2Ygbm9kZWlkX3QgdHlwZWQgdmFyaWFi
bGUgdXNlcyB0aGF0IEkgd2FzIGFibGUgdG8NCj4gPj4gZmluZCBhcmUgaW4gZHVtcF9udW1hKCku
IEkgZ3Vlc3MgeW91IGNhbiBsZWF2ZSB0aGVtIHRoYXQgd2F5LCBidXQNCj4gPj4gc3RyaWN0bHkg
c3BlYWtpbmcgJXUgaXNuJ3QgY29ycmVjdCB0byB1c2UgZm9yIG5vZGVpZF90IChhcyBpdCBwcm9t
b3Rlcw0KPiA+PiB0byBpbnQsIG5vdCB0byB1bnNpZ25lZCBpbnQpLg0KPiA+DQo+ID4gU29ycnkg
Zm9yIHN1ZGRlbmx5IGp1bXBpbmcgaW50byB0aGUgZGlzY3Vzc2lvbi4gRmlyc3RseSB0aGFua3Mg
SmFuIGZvcg0KPiA+IHRoZSByZXZpZXcgOikpDQo+ID4NCj4gPiBJIGFtIGEgbGl0dGxlIGJpdCBj
b25mdXNlZCBoZXJlLCBub2RlaWRfdCBpcyBkZWZpbmVkIGFzOg0KPiA+IHR5cGVkZWYgdTggbm9k
ZWlkX3Q7DQo+ID4NCj4gPiBzbyBJIHRoaW5rIGhlcmUgJXUgc2hvdWxkIGJlIHByb2JhYmx5IGZp
bmUgKEkgbWF5IGhhdmUgbWlzc2VkDQo+ID4gc29tZXRoaW5nIHRob3VnaCk/DQo+IA0KPiAldSBp
cyBpbmRlZWQgInByb2JhYmx5IGZpbmUiIChoZW5jZSBtZSBzYXlpbmcgdGhhdCB0aGV5IGNhbiBi
ZSBsZWZ0IHRoYXQNCj4gd2F5KSwgYnV0IGZyb20gYSBzdHJpY3QgbGFuZ3VhZ2UgcGVyc3BlY3Rp
dmUgaXQgaXNuJ3Q6IHVuc2lnbmVkIHR5cGVzDQo+IG1vcmUgbmFycm93IHRoYW4gImludCIgcHJv
bW90ZSB0byAiaW50Iiwgbm90ICJ1bnNpZ25lZCBpbnQiIChhbmQgdHlwZQ0KPiBwcm9tb3Rpb24g
a2lja3MgaW4gd2hlbiBwYXNzaW5nIGFyZ3VtZW50cyB0byBmdW5jdGlvbnMgd2hlcmUgb25seQ0K
PiBlbGxpcHNpcyBpcyBzcGVjaWZpZWQsIGkuZS4gcGFyYW1ldGVyIHR5cGUgaW5mb3JtYXRpb24g
aXNuJ3QgYXZhaWxhYmxlKS4NCg0KQWggeWVzLCBzb3JyeSBJIHNob3VsZCBoYXZlIHRob3VnaHQg
ZGVlcGVyLiBUaGFua3MgZm9yIHlvdXIgZGV0YWlsZWQNCmV4cGxhbmF0aW9uLg0KDQpLaW5kIHJl
Z2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

