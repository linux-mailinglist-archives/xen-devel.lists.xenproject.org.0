Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78993C6EF1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 12:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155295.286701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Fzp-0007lA-RL; Tue, 13 Jul 2021 10:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155295.286701; Tue, 13 Jul 2021 10:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Fzp-0007iO-Nv; Tue, 13 Jul 2021 10:50:37 +0000
Received: by outflank-mailman (input) for mailman id 155295;
 Tue, 13 Jul 2021 10:50:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tLs3=MF=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1m3Fzo-0007iE-8G
 for xen-devel@lists.xen.org; Tue, 13 Jul 2021 10:50:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2603b172-e3c8-11eb-873d-12813bfff9fa;
 Tue, 13 Jul 2021 10:50:34 +0000 (UTC)
Received: from AS8PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:20b:312::18)
 by AM6PR08MB3909.eurprd08.prod.outlook.com (2603:10a6:20b:8e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 13 Jul
 2021 10:50:31 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::89) by AS8PR04CA0043.outlook.office365.com
 (2603:10a6:20b:312::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Tue, 13 Jul 2021 10:50:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 10:50:30 +0000
Received: ("Tessian outbound 770f4ae52989:v98");
 Tue, 13 Jul 2021 10:50:30 +0000
Received: from 62b0970c553e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 987FDE56-F544-4837-B3DC-6F1DBB3E5F9D.1; 
 Tue, 13 Jul 2021 10:50:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62b0970c553e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Jul 2021 10:50:21 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB5948.eurprd08.prod.outlook.com (2603:10a6:10:202::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 13 Jul
 2021 10:50:18 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::c45:7e0b:231:b050]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::c45:7e0b:231:b050%9]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 10:50:18 +0000
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
X-Inumbo-ID: 2603b172-e3c8-11eb-873d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QepIXfzkBJrmwksHDfXsLidyKq4aMvUuffWXtzxvRY=;
 b=G+4f6Krzs7mo7DKx3HwzDKdk35slUSn9vYFeZ1n9+O+uT52av2ogWKjGT5rEtRWiwPTiy1ArnyXfsbmCT49XWWjSV3xxo0LoQwyaykrzOMYE+5dEHazH6SzU7Hnc61ib/8lQ0VJsb35KCpA9lB8QABqNyea9OQPWpbn7P1aiJCg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHi4cuLdDhE9h3/Zjv7ggOWEGOB1aFBqb7Z2OI3hyKU0klmJIxEFjBrOt9BZ7z7iQ9UMbn50Lg6IJ8yUOluEIJsbbHLZYuLaE6rig8l8STRhaprFxaPOXjeoq/wUbmacY8O0Accqz4nt/14GoRKfbn7IR4/VWLi0MUUpT7coCYDU77GQoUo5/gCu6MpCAh7kGdZTJE8p3GEJJKv4sePFRRlWrbSMq4s5bgiIHf8AUDJf/x/ZMdYgNdkvcDnQfEQPlLTlZj4WrXVK/I5bAKPeNR/jqca059uVwyiwlxOPCVxPwqdLsZcRw5lmaWi3Z2RyBfVEa7KMPBCxvK4AzfH4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QepIXfzkBJrmwksHDfXsLidyKq4aMvUuffWXtzxvRY=;
 b=OwxjV8n5cHwWpByHdQP7PBfMf7I6FwXzX0ZLSrSkAG/RTbsD8oFmFbLjUAMn7SVK/9IebIiNrPD0ut74N1UAOGe692IHEZTgLUO3DJwPNpmXlXHNhjGqluVBByVymHwjHm9l1WRhYPNEiG1HLLUS2s4SowJGD/VFXY6Zhjb2pj4SaYxKVhrXiO7bAApWw9m+dxARoxG+a3zvlVny+Ymg29NE8jneM2KW5P5o746DEPb0L2qul8h0eLni2Tz3gJkb2qvLK9aSGq4mTZFQJYe2kUhkXVKjwjiiCEkAYHaVKlss4/HoJx/Cez1x8yylDY1r/SpgBsvdvJIHPiWRIE1iWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QepIXfzkBJrmwksHDfXsLidyKq4aMvUuffWXtzxvRY=;
 b=G+4f6Krzs7mo7DKx3HwzDKdk35slUSn9vYFeZ1n9+O+uT52av2ogWKjGT5rEtRWiwPTiy1ArnyXfsbmCT49XWWjSV3xxo0LoQwyaykrzOMYE+5dEHazH6SzU7Hnc61ib/8lQ0VJsb35KCpA9lB8QABqNyea9OQPWpbn7P1aiJCg=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "xen-devel@lists.xen.org"
	<xen-devel@lists.xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: RE: DMA restriction and NUMA node number
Thread-Topic: DMA restriction and NUMA node number
Thread-Index: Add3jZlm0dMwxzV2RvOni5fmVkcvwgAO4HYAAAHsL4AAAIBVIA==
Date: Tue, 13 Jul 2021 10:50:18 +0000
Message-ID:
 <DB9PR08MB6857356F5E942970978838099E149@DB9PR08MB6857.eurprd08.prod.outlook.com>
References:
 <DB9PR08MB68573DE6333A36646EDC75409E149@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <89025168-bf55-5dff-db61-989b95934775@xen.org>
 <080cf741-7a11-4df5-5f24-cc7680f92151@suse.com>
In-Reply-To: <080cf741-7a11-4df5-5f24-cc7680f92151@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3277E48538F01E4CA5B3C4E3D7331820.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1e4c010d-27c6-4fc0-1194-08d945ec08a8
x-ms-traffictypediagnostic: DBBPR08MB5948:|AM6PR08MB3909:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3909F5BE4EF23BFBED1DE1359E149@AM6PR08MB3909.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 slK49nrv4MkWboYCoQSNJRNk3Vp0BCuJGPLNeePlyN8chDYeQIYmdCeUasVF7rBT9kVZH0K897Wx8DnSnvRBqkidBgBC2cuWxb+YwQXDrUB0rlvZOglHonOfnG7ROmXWecM2BZBE0G5es4jXz4b3j8LmNGHro3RGqCbqIbsBbGhkelPUSH0kJLdpqAtSunUHcJfNh/BZChVF9h6ynJiIn4N6gA/F6KuufuHlb6qLdwOuXqsOcWC3KHa4slgDrUpKuagIg9SJGqc2XGLBp3vMx/tc/DnUkVaOAgOrMjeTWlSlIwa+6y6C+ixd9+iPVzEs3H+ntZq/NjnJM56zk4VcOEuo2zlS+C6S6zm3jZY6c2twYHA2Qj32eKlbCWOJgncxBLYVdZT7m8AcGDxmqn++wGfI1Yn3eWpszOJKUurobKoyxmY/NnaAeT8JhfgqcmD2aIq3WngX44igBPfC2ZLLqPnbGzHnLQz9WJRCVCsaIqq0jynzBazjWctkcw+9+3+TwNKTZR7HDjpKmE5pcWozkSO+hEpsdzZxKH1Cd4o8eeeTQsiLsZS310/D46GONI72PGzWGvwoxoGZ9jDJk4aq9+M2BasuDKMzDUN6ePicTcV0cbebQyz2MpxkpCYvmzckyKcaEAtVC2Bjsh8sOjg3wA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(52536014)(6506007)(478600001)(66946007)(122000001)(7696005)(38100700002)(8936002)(66446008)(66476007)(54906003)(83380400001)(71200400001)(8676002)(26005)(55016002)(66556008)(9686003)(4326008)(2906002)(64756008)(5660300002)(76116006)(110136005)(186003)(316002)(53546011)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2JCOXUwVkg4bVNycmU2Q0NYdGVCbkNrQUV2aE80azFtTlI4MXNxekpzV1kx?=
 =?utf-8?B?Skh5Yko0RHcyWFBSaEcvcElWejRxNVVyMDVDWDZvY3lhdDNEbWc4ajZKbDlX?=
 =?utf-8?B?Zi8yWW80QzRaWUx5akJ0NGxoSkxRcVBEYnJDRmZHU3BzYnZHQUgydnlXWitT?=
 =?utf-8?B?Y0ptSERldTFlckJIMjdmSWJ1cHpSODVodjVHdjhuZTVBaWlsMnFsK041ckFW?=
 =?utf-8?B?ZnNESEM2UzMyWm90bXZmbC90aFVSQ1F2cmJHSTNYSGYzOFNIaDVsRGc4Njl6?=
 =?utf-8?B?cUI5b1JpWEkrM1pva2FaN2pWNFhiOSs2ZUZYcUVuU1VDejg2MWpteWc3SDdo?=
 =?utf-8?B?eVNOeitEOWVyVnN5MU5yemF4Q0dpM1k5dkVvTzdKczIxNlZTYUZXV3RKQmV6?=
 =?utf-8?B?VjBMVjEwU29FKzM1MndTZ3BndVl5TkF5YS9WdzV6SXZEWk1USzBaU2xRRDN5?=
 =?utf-8?B?MmdGWnJJTHFmQ0JaQmNhaFVQVW84VHd6dUVRMG5ES2pHTWJwK3ZlQnVDQ0Zk?=
 =?utf-8?B?WW1BL0xpc1o4TXNkcjg4UjRsR2VvZUE4Z0Z1T0tuYWR6dDJLcjNEbW5Lelpl?=
 =?utf-8?B?K3E0U2ZKYTloMUNYVmdNVUZ1V2xrTEJucXFxOEZ3RDd1VFg0enZaMk1pNGxW?=
 =?utf-8?B?RnBWMHBkclRrTjZ0TXVJdW9IRE1uc1djczlyVmgzcjk1N2xUSFpoMnVseko4?=
 =?utf-8?B?UDB6NVpYN25PS1VMRmc5c0ZuYkg5MHlTZ3JuVkhUSGw2TUpMYUxOMzBNVmtU?=
 =?utf-8?B?UjQ5cmZyQmNsZU1QN0tVSElzNjdXZ0tQQ2RrWkI5T0N5MVNWaUJKWnY5VnJz?=
 =?utf-8?B?NXJMOEJvT0xkanZVaTdCVzEwSzZIeFJnS0tKVEpPKzNDNElidVhSeHlFZVFR?=
 =?utf-8?B?ZS91RFpkYW1iQWtJRmp3NUZSb1QveFR0S1FFellWMDBUT1ROV3hXTVo3eUdv?=
 =?utf-8?B?RHZWYUxlSmdqSFdsVElxak5veEtMQmZ1aU5qM0crcEg1NlBJTzVqNnRVMU51?=
 =?utf-8?B?SkVsdTBFT29aNlBYeHQ3dWJndHl3MVpkckIyRkhnZUhrZGNaQVdvak1BU2tT?=
 =?utf-8?B?WENTeE5uNHk3TWY5QkJGV2NDNWg3WVlGTzQzMlNncE0vWEpvWCttVnIyQ2xM?=
 =?utf-8?B?ZkphUkNQRWh2aWtBYy9kdGJTY2lYTU1BUUlCSU1jVTRUY1hMQ3dFRDZsVDdt?=
 =?utf-8?B?T2pYTTRzZUZ6SmFLMlAvN05IQS9oTndVcWluanNXakFaWmxTVnJWSitna0N1?=
 =?utf-8?B?YTZ6aG5aZlFmUVcvdml0SFFJSDJrblUxZm00SG9CaEVEeHpRbFFnenJweHlS?=
 =?utf-8?B?TzZINzJLdlQ2cHNWN28wcFE0djhBWW9oRWl1bi9kVThvN2RxRkhDM3d6Sngz?=
 =?utf-8?B?VHFOUEdHZ2p6QVk4T2dvVTh4MmcyWU1HeHV6TXpRQ0Rja2JTSTFTcGpPcnVS?=
 =?utf-8?B?OUJrelMzNDUrWFkzdTEyWWgzWkU1Z0prUmFMdjBmMTdPMThPWi9vN0xrNDVW?=
 =?utf-8?B?cjFqUld0T0JKK0oxenEyTVJ4VEFDVXkwMHBmYUNnZFBFQUpxcFdUdWM4OWdR?=
 =?utf-8?B?YmRQZXVFSjhjSkRrQnVNaTdGdTdsMnZ4Y3dzWTljb21ubGtsYloxOGNSd2Yv?=
 =?utf-8?B?bUd2US9vc2FaVW00T2pYa0FJQWlIM2pVMTYydndaQXlkeGhibEhUcXZoT3Ny?=
 =?utf-8?B?Z2x1TFE3VjBZRW5vemF0TzRjVkRhSkVwQloraXFDSDZHc0FQKzF0dVEvZ29n?=
 =?utf-8?Q?7vMtQPnv89taOFlKIk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5948
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	634d7664-cd1d-4619-251d-08d945ec0139
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JDmQ69ZOSvFIJVozdlh+vg6fZ6A00IuW1oW7Zk+zlEF890P89LjIBCm943UX+lKQjEScaOQAqp93SaSoj9A3f/9HBdvPfAaQfCqsW3YsZlPbOlfaQtbOokrB5zWrJ0ETKo4G53EfmYE7LoYCa9uZPun1jID2KpXuPxNOi6CRrzg2f1HHrJ6nlNVuaOlR64NpgxmFcPAAAH/BdK4x4NHBJrZG1h6z60XfZZv3FSe4ZagvffrhRi/7IEpqnCDFjA34WgeiAN0LSb2JCikDzHBZplx4dlAe3W7b3zKcNG5PS3w6RwfraOQAEggwIY7lMtaUVIFVtgz5YOYNwFQKb79DnBbiMe6I1HfNNGko6qJU/OK1KsjXdaC54DNwSTi+cUzqubR33zN5NLN1xwQgWDCMx3sPMGcLGF21/HzW0BbQ6+HquJ9yUUcdVZCkTcvLd2z/NYYOYcrkEi6+7Zhr+Pym89wI9q3Kv2CgW6MK4CJZ0CEsD/wz3cB5FSbaNqiJDdDUzFwzNn4duIJYAuHOxY+ZoTOGfH0ehqauFWgtB+W4iMvueNGves33sZc6eywDvU23vJzjRuJOEYufULCxfwhDS62L3CxeCLNyksmdAfePZiI2PxZYvAm26OTIMtWfjTqaQ8kqo52XOXGHVAWvJN35MvyWjVQEnqkJsaWJXQuKs4n95sOiI21RBSedPjcZ31W1v/8Vet84MyECY1aMDWgKAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(36840700001)(46966006)(5660300002)(7696005)(478600001)(53546011)(186003)(86362001)(52536014)(33656002)(4326008)(36860700001)(54906003)(82310400003)(83380400001)(316002)(8676002)(82740400003)(70586007)(47076005)(8936002)(2906002)(81166007)(356005)(110136005)(70206006)(26005)(9686003)(6506007)(107886003)(55016002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 10:50:30.8722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4c010d-27c6-4fc0-1194-08d945ec08a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3909

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDfmnIgxM+aXpSAxODoyMQ0K
PiBUbzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFdlaSBDaGVuIDxXZWkuQ2hlbkBh
cm0uY29tPg0KPiBDYzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyBCZXJ0cmFu
ZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVuLm9yZzsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogRE1BIHJlc3RyaWN0
aW9uIGFuZCBOVU1BIG5vZGUgbnVtYmVyDQo+DQo+IE9uIDEzLjA3LjIwMjEgMTE6MjYsIEp1bGll
biBHcmFsbCB3cm90ZToNCj4gPiBPbiAxMy8wNy8yMDIxIDA0OjE5LCBXZWkgQ2hlbiB3cm90ZToN
Cj4gPj4gSSBhbSBkb2luZyBzb21lIE5VTUEgdGVzdGluZyBvbiBYZW4uIEFuZCBJIGZpbmQgdGhl
IERNQSByZXN0cmljdGlvbiBpcw0KPiA+PiBiYXNlZCBvbiBOVU1BIG5vZGUgbnVtYmVyIFsxXS4N
Cj4gPj4gICAgICBpZiAoICFkbWFfYml0c2l6ZSAmJiAobnVtX29ubGluZV9ub2RlcygpID4gMSkg
KQ0KPiA+PiAgICAgICAgICBkbWFfYml0c2l6ZSA9IGFyY2hfZ2V0X2RtYV9iaXRzaXplKCk7DQo+
ID4+DQo+ID4+IE9uIEFybTY0LCB3ZSB3aWxsIHNldCBkbWFfYml0c2l6ZSBbMl0gdG8gMCwgdGhh
dCBtZWFucyB3ZSBkb24ndCBuZWVkIHRvDQo+ID4+IHJlc2VydmUgRE1BIG1lbW9yeS4gQnV0IHdo
ZW4gbnVtX29ubGluZV9ub2RlcyA+IDEsIHRoZSBkbWFfYml0c2l6ZQ0KPiA+PiB3aWxsIG92ZXJy
aWRlIHRvIDMyLiBUaGlzIG1heSBiZSBjYXVzZWQgYnkgdGhlIEFybTY0IHZlcnNpb24NCj4gPj4g
YXJjaF9nZXRfZG1hX2JpdHNpemUsIGl0IG1heSBiZSBhIHNpbXBsZSBpbXBsZW1lbnRhdGlvbiBh
bmQgbm90IE5VTUENCj4gPj4gYXdhcmUuDQo+ID4+DQo+ID4+IEJ1dCBJIHN0aWxsIHF1aXRlIGN1
cmlvdXMgYWJvdXQgd2h5IERNQSByZXN0cmljdGlvbiBkZXBlbmRzIG9uIE5VTUENCj4gPj4gbm9k
ZSBudW1iZXIuDQo+DQo+IFNvIHJlYWxseSBkbyB5b3UgbWVhbiAibm9kZSBjb3VudCIsIG5vdCAi
bm9kZSBudW1iZXIiPw0KPg0KDQpJIG1lYW4gTlVNQSBvbmxpbmUgbm9kZXMuIElmICJub2RlIGNv
dW50IiBoZXJlIG1lYW5zICJjb3VudCBob3cgbWFueSBOVU1BDQpub2RlcyBhcmUgb25saW5lIiwg
bXkgYW5zd2VyIGlzIHllcyBmb3IgIm5vZGUgY291bnQiLg0KDQo+ID4+IEluIEFybTY0LCBkbWFf
Yml0c2l6ZSBkb2VzIG5vdCBjaGFuZ2Ugd2hlbiB0aGUgTlVNQSBub2RlDQo+ID4+IGNoYW5nZXMu
IFNvIHdlIGRpZG4ndCBleHBlY3QgYXJjaF9nZXRfZG1hX2JpdHNpemUgdG8gYmUgY2FsbGVkIGhl
cmUuDQo+ID4+DQo+ID4+IEkgY29waWVkIEtlaXIncyBjb21taXQgbWVzc2FnZSBmcm9tIDIwMDgu
IEl0IHNlZW1zIHRoaXMgY29kZSB3YXMNCj4gY29uc2lkZXJlZA0KPiA+PiBvbmx5IGZvciB4ODYs
IHdoZW4gaGUgd2FzIHdvcmtpbmcgb24gaXQuIEJ1dCBJJ20gbm90IGFuIHg4NiBleHBlcnQsIHNv
DQo+IEkNCj4gPj4gaG9wZSBYZW4geDg2IGZvbGtzIGNhbiBnaXZlIHNvbWUgaGVscC4gVW5kZXJz
dGFuZGluZyB0aGlzIHdpbGwgaGVscCB1cw0KPiB0bw0KPiA+DQo+ID4gSXQgaXMgYmVzdCB0byBD
Q2VkIHRoZSByZWxldmFudCBwZXJzb24gc28gdGhleSBrbm93IHlvdSBoYXZlIHJlcXVlc3RlZA0K
PiA+IHRoZXJlIGlucHV0LiBJIGhhdmUgYWRkZWQgdGhlIHg4NiBtYWludGFpbmVycyBpbiB0aGUg
dGhyZWFkLg0KPiA+DQo+ID4+IGRvIHNvbWUgYWRhcHRhdGlvbnMgdG8gQXJtIGluIHN1YnNlcXVl
bnQgbW9kaWZpY2F0aW9ucyA6ICkNCj4gPj4NCj4gPj4gY29tbWl0IGFjY2FjYjQzY2I3ZjE2ZTlk
MWQ4YzBlNThlYTcyYzlkMGMzMmNlYzINCj4gPj4gQXV0aG9yOiBLZWlyIEZyYXNlciA8a2Vpci5m
cmFzZXJAY2l0cml4LmNvbT4NCj4gPj4gRGF0ZTogICBNb24gSnVsIDI4IDE2OjQwOjMwIDIwMDgg
KzAxMDANCj4gPj4NCj4gPj4gICAgICBTaW1wbGlmeSAnZG1hIGhlYXAnIGxvZ2ljLg0KPiA+Pg0K
PiA+PiAgICAgIDEuIE9ubHkgdXNlZnVsIGZvciBOVU1BIHN5c3RlbXMsIHNvIHR1cm4gaXQgb2Zm
IG9uIG5vbi1OVU1BDQo+IHN5c3RlbXMgYnkNCj4gPj4gICAgICAgICBkZWZhdWx0Lg0KPiA+PiAg
ICAgIDIuIE9uIE5VTUEgc3lzdGVtcywgYnkgZGVmYXVsdCByZWxhdGUgdGhlIERNQSBoZWFwIHNp
emUgdG8gTlVNQQ0KPiBub2RlIDANCj4gPj4gICAgICAgICBtZW1vcnkgc2l6ZSAoc28gdGhhdCBu
b3QgYWxsIG9mIG5vZGUgMCdzIG1lbW9yeSBlbmRzIHVwIGJlaW5nDQo+ICdETUENCj4gPj4gICAg
ICAgICBoZWFwJykuDQo+ID4+ICAgICAgMy4gUmVtb3ZlIHRoZSAnZG1hIGVtZXJnZW5jeSBwb29s
Jy4gSXQncyBsZXNzIHVzZWZ1bCBub3cgdGhhdA0KPiBydW5uaW5nDQo+ID4+ICAgICAgICAgb3V0
IG9mIGxvdyBtZW1vcnkgaXNuO3QgYXMgZmF0YWwgYXMgaXQgdXNlZCB0byBiZSAoZS5nLiwgd2hl
bg0KPiB3ZQ0KPiA+PiAgICAgICAgIG5lZWRlZCB0byBiZSBhYmxlIHRvIGFsbG9jYXRlIGxvdy1t
ZW1vcnkgUEFFIHBhZ2UgZGlyZWN0b3JpZXMpLg0KPg0KPiBTbyBvbiB4ODYgbWVtb3J5IHN0YXJ0
cyBmcm9tIDAsIGFuZCB3ZSB3YW50IHRvIGJlIGNhdXRpb3VzIHdpdGggZ2l2aW5nDQo+IG91dCBt
ZW1vcnkgdGhhdCBtYXkgYmUgbmVlZGVkIGZvciBzcGVjaWFsIHB1cnBvc2VzIChmaXJzdCBhbmQg
Zm9yZW1vc3QNCj4gRE1BKS4gV2l0aCB0aGUgYnVkZHkgYWxsb2NhdG9yIHdvcmtpbmcgZnJvbSBo
aWdoIGFkZHJlc3NlcyB0byBsb3dlciBvbmVzLA0KPiBsb3cgYWRkcmVzc2VzIHdpbGwgYmUgdXNl
ZCBsYXN0ICh1bmxlc3Mgc3BlY2lmaWNhbGx5IHJlcXVlc3RlZCkgd2l0aG91dA0KPiBhbnkgZnVy
dGhlciBwcmVjYXV0aW9ucyB3aGVuIG5vdCB0YWtpbmcgTlVNQSBpbnRvIGFjY291bnQuIFRoaXMg
aW4NCj4gcGFydGljdWxhciBjb3ZlcnMgdGhlIGNhc2Ugb2YganVzdCBhIHNpbmdsZSBOVU1BIG5v
ZGUuDQo+DQo+IFdoZW4gdGFraW5nIE5VTUEgaW50byBhY2NvdW50IHdlIG5lZWQgdG8gYmUgbW9y
ZSBjYXJlZnVsOiBJZiBhIHNpbmdsZQ0KPiBub2RlIGNvbnRhaW5zIHRoZSBtYWpvcml0eSAob3Ig
YWxsKSBvZiB0aGUgbW9yZSBwcmVjaW91cyBtZW1vcnksIHdlDQo+IHdhbnQgdG8gcHJlZmVyIG5v
bi1sb2NhbCBhbGxvY2F0aW9ucyBvdmVyIGV4aGF1c3RpbmcgdGhlIG1vcmUgcHJlY2lvdXMNCj4g
bWVtb3J5IHJhbmdlcy4gSGVuY2Ugd2UgbmVlZCB0byBzZXQgYXNpZGUgc29tZSBsYXJnZWx5IGFy
Yml0cmFyeSBhbW91bnQNCj4gYWxsb2NhdGlvbiBvZiB3aGljaCB3b3VsZCBoYXBwZW4gb25seSBh
ZnRlciBhbHNvIGV4aGF1c3RpbmcgYWxsIG90aGVyDQo+IG5vZGVzJyBtZW1vcnkuDQo+DQo+IEkg
aG9wZSBJIGhhdmUgc3VpdGFibHkgcmVjb25zdHJ1Y3RlZCB0aGUgdGhpbmtpbmcgYmFjayB0aGVu
LiBBbmQgeWVzLA0KPiB0aGVyZSBhcmUgeDg2IGltcGxpY2F0aW9ucyBpbiBoZXJlLg0KPg0KDQpU
aGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24sIHdlIGhhdmUgYSBkZWVwZXIgdW5kZXJzdGFuZGlu
ZyBvZiB0aGUNCnRob3VnaHRzIG9mIHRoaXMgRE1BIHJlc3RyaWN0aW9uLiBBbHRob3VnaCB0aGUg
bWVtb3J5IGxheW91dCBvZiBBcm0NCmFuZCB4ODYgaXMgbm90IHRoZSBzYW1lLCB3ZSBjYW4gdHJ5
IHRvIGtlZXAgdGhpcyBpZGVhIHN0aWxsIGluIGNvbW1vbiwNCmFuZCB0cnkgcmVzb2x2ZSB0aGlz
IGRpZmZlcmVuY2UgaW4gQXJtJ3MgQVJDSC4NCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0KPiBKYW4N
Cg0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBh
dHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55
IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0
aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K

