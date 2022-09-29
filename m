Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D631C5EF425
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413653.657437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odran-0005ZN-43; Thu, 29 Sep 2022 11:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413653.657437; Thu, 29 Sep 2022 11:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odran-0005Vs-0G; Thu, 29 Sep 2022 11:20:37 +0000
Received: by outflank-mailman (input) for mailman id 413653;
 Thu, 29 Sep 2022 11:20:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yp8n=2A=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1odral-0005Vk-Nk
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:20:35 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50063.outbound.protection.outlook.com [40.107.5.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b83700df-3fe8-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 13:20:27 +0200 (CEST)
Received: from AS8PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:20b:311::6)
 by PAWPR08MB9541.eurprd08.prod.outlook.com (2603:10a6:102:2eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 11:20:32 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::a1) by AS8PR05CA0001.outlook.office365.com
 (2603:10a6:20b:311::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Thu, 29 Sep 2022 11:20:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 11:20:31 +0000
Received: ("Tessian outbound 86cf7f935b1b:v128");
 Thu, 29 Sep 2022 11:20:31 +0000
Received: from 19d93a11e58c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9FEEDE0D-4B01-4EDE-87AE-F0A58530CD9D.1; 
 Thu, 29 Sep 2022 11:20:25 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19d93a11e58c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 11:20:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6582.eurprd08.prod.outlook.com (2603:10a6:20b:339::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 11:20:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%4]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 11:20:22 +0000
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
X-Inumbo-ID: b83700df-3fe8-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bo9/r33X2ATnXqtQKIklI8uWpfIOjx6DTiTw7TyZpKOYlT8sOUz2smV4zfGZr5raza7sTfw7J33UTeyBqGUXgl1PpO6GR2wLPQYJ2vSFRPodr5YskeIWG9tmdZNhuh84x5/JemG/L7RFWyseHOZcmtRuz8+UaRwLCmUUX7ixfqS8qMds57QEbuuZqLnev6kTjK0O2prwEU37XzUtyULwBLYzXdkaf+VcCENCS/EF4RzqzxC/caQIT2Ato7yAkqabV1xYu9K9jM5/iI35kfcUwuQspmvgQTaKKdWgj7LeJ+NAFme9RyZ5N8PxVupsHHNyaiH4S+/Ci7teAMqWOw7NfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZ6yen5hHm/BGIZDZqAwbmOmKBPhJ4d/K7xEQF5KqbY=;
 b=ZlwW1TVK5wWTPJ3+0g8UeNFQiOYUkWXWnkr2gRnUgUXPVN3YrtHBguYW/YqtUpdAJt8f6loRkOc/GftgIyjlOJ9kDfozaVcmIEd0URtdzRdZCWiof1YZ2mZ/T1NI3Z5DmS+ST5HFPGuu6cuXVFM0u+tLelVP5ObTwKxVLFHNoVjGIBrH3m1udO1Ilc2Yb/FfmpGRScWVxOXZgzRlddhl1mp+ajk56lUMIk6mc6Z6aV3Dj4HHV/e2xVdavWERbrBxF4ulDMWUU8jPejDOYbfob12R70lITCU9Y3IjrhM+7N4gBAc2iHsEa4CpIWSQYt0THGef+iSMkCXuYFAS4Iw8jQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZ6yen5hHm/BGIZDZqAwbmOmKBPhJ4d/K7xEQF5KqbY=;
 b=TAI1334HfFBGX/DDkYiAAXjzBTKg2E1C1joEfPFpnjKcJmZiTyhF2DB8qmPMvqdGHHrR8xsVvIaufDpxgUb2Yi/WiydW3FjB2U13PHOhd809aAQbsLXGGKmibx/H0FfIF4/jxH0TOVlpZaU0yti6Du+T2qwZzZJwT7aKb7G3WxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/IvJ3z1TU4OrQLT4IIWSfFO2Y0+N68HQ74GV4OfctRVj2jMHasAxVUye0VUXRyhuwLfFWbThl2ts8pMA8aN5jpyHx+6+lefAwV500JkeH4dZC2cUwBOOhTIMRjoSGjtcotTuIuCUSZLEIqmIbIY79Ix7ZrOFEkZauBste2B7+VYXvFFLpT997eKzFNJfkrzxSR4Dh5xDnjYclaOqiFTPveVxu67K06PSqd6m3/C6G1DPwUcii3AJJGvQb7dwUk/qsZOOvpmtPuCeEqVE1kQJnyOdwhCbUtq+XzTvFJE6ppdt7lKlHZAxoDirCEFQv6nNESiPlgCcGgf2JAeUG7e/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZ6yen5hHm/BGIZDZqAwbmOmKBPhJ4d/K7xEQF5KqbY=;
 b=TQChPkqVy4tv6lKexcBKKqIDdsDDLvmahba3EPipeTN6jP0fc+aocUKQomTPeKNIntYACIv/yDczArNBKWzGsR5UIaforeZXRy5xkG/Ff1/B6V+KPCsuIFsiq7JjTaEvedaDseEkmdyJwFyg7vxNrK8qsC9/E0xRtIHdUNnZxJGT5EctBAnnpNxvtGs/fvrIxF8nefBvv7w7usMgJZ7KjAwU7HEQOok+0Lj6W6b7MI+OWDjRgEG23Qb1YzT51+RX8ChC/lPYM9kPSdW8MKJqSOhMsmTGZ3xKM2RqOCtg01KktEZoZNXvQOfnRISTn84WwRMrDudFuF29l41RYekz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZ6yen5hHm/BGIZDZqAwbmOmKBPhJ4d/K7xEQF5KqbY=;
 b=TAI1334HfFBGX/DDkYiAAXjzBTKg2E1C1joEfPFpnjKcJmZiTyhF2DB8qmPMvqdGHHrR8xsVvIaufDpxgUb2Yi/WiydW3FjB2U13PHOhd809aAQbsLXGGKmibx/H0FfIF4/jxH0TOVlpZaU0yti6Du+T2qwZzZJwT7aKb7G3WxQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH 1/2][4.17] x86: re-connect VCPUOP_send_nmi for 32-bit
 guests
Thread-Topic: [PATCH 1/2][4.17] x86: re-connect VCPUOP_send_nmi for 32-bit
 guests
Thread-Index: AQHY0+kC7K8cMpFO9kiDPRVs5xcyXa32QqHA
Date: Thu, 29 Sep 2022 11:20:22 +0000
Message-ID:
 <AS8PR08MB7991B9B24AF20F507154E0B692579@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
 <8b5c0b8f-b243-47b1-2ce9-f315d5c7138c@suse.com>
In-Reply-To: <8b5c0b8f-b243-47b1-2ce9-f315d5c7138c@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 019FA9DE7B0D9741AB5FD0DADF4D9CF7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6582:EE_|AM7EUR03FT033:EE_|PAWPR08MB9541:EE_
X-MS-Office365-Filtering-Correlation-Id: 09366daf-0c51-4bc5-c026-08daa20c9efa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8DBTLhZzdqT/jzb767fwcjD7KY+Td/V18cSEZU3l+JueGCIVogCCP/+BtDpGHrGXw63nPuJRo5ctiVpuvoDS+sNjCp6ml5rN5Dvbtjn9tjAhnn/msptI9eoYYyDtHvPUQshEhaszRTYo2jmglAq3HL0R2hbgsqHjCGHNKG7noxolYBcp0CYYPIR9l8hVLz3CKO7qP8iwJZ0KP1nzVC5nQTKCAcY3p8QSyweK7vBbzWjmz1I90dI6VYxz7BRHsOi/qrohwqEMRU/veXtQ5x20E6IZQ1UFLz2EDKSIyV5wOhe6YoxO6PZvalP34bJzsrSy7byFQj9m+19dSmz3uwItFW44lWJ/4mzT2ou/PRnmDDo/0Rl/NDBXb4oGMI79oN7v4Ry6jFtmdL9YJfTkU2kHWcgTG2B1aCsQFiCdPqvXoAUHfRGpqashW/GA+IrYO/1t7RrvzHTOAeR7ZmaWGrRMSqqdcNGdCnHnsml/ddtoJoHeE4TNEuumzLMSKBN+ddC0Ml6BEruFaN4FC77zzn+lieHLevbRQzMGUMM3bflAlNW+1A5alTL2xQuWykwKl1ATzxvJHnInrZJOe4FneQflgXdwIM6REI3Mv3RnDEKqwB48WtN0ZWP6GWPbgRcvKEEcylLbSbH+0TYJyEzvJ02RemDI3LrXPwxKT7BkpewdOL0foqTB7mAH+R0I3J+J1hcs76loHhBwOqJ84mynR5S8yUN2KJhAsbR/L2FvFQgAHgwkdM1E5Q1OXjukZGGUCDQubikrjSidSO1QFFRuQ608Gg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199015)(122000001)(4744005)(38100700002)(38070700005)(86362001)(55016003)(33656002)(26005)(5660300002)(6506007)(41300700001)(4326008)(7696005)(64756008)(8676002)(2906002)(66476007)(66556008)(52536014)(8936002)(66446008)(478600001)(54906003)(110136005)(76116006)(66946007)(316002)(83380400001)(9686003)(186003)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6582
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51fb5a28-49ae-4496-9ff0-08daa20c9987
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iw2qGVTtmnFYPyr9l1937eF0+k3hIMLb2uW7M5t74oYYZRnTp+pzNatMPcfRnArW5UiVskqZcHTP3IE72xJcu1SU2uz1k/BoWG+HA5MBGfqJRZfSgZNymjNcNGjy3q17o4q1l4pbDf3yABV4s+M28Ofa1SFiWTtBqMm+AijKkR2n7vg8BRAFHCTC6sPb1aW8CfiKHVOdyrBA2JiZMxOwrWzoAw3nfm/qllHbsswwkkJNzZi+gYgjOlFiC9Tm6/2CA1ggiFSovixlgGX9DAQDs8T1Y8pufuylHAL61GpDwC5Zlli0DiTSnIqjz4EkVvfUkbq/EbFRXZ542PqVmeZzYRZsyHm9JQnffS7dVbem2MsWF97axsSgmmsVQBIuRdO+QYGKwFeUK2GsjxzwW3mAVIxG8oy/+6Hl22HUMrY22At+eaGA7y0Avxpsezt+dtgIZl6ogDcCU5F0Y+AUDAbHvulSYYRPbXT15gQhNVRaPe+/cHrd/budU+hd1pBHYUPZ/Bu9ghG2oNO7oCTdv1D//w+KH+TTgi4rhNk+agL5zrVcuAPlNNV5BQvAkozi9inoh/tROq1Q58utXaRGVu1XlmJYVXVrtlx+1xc+xfx8P/KjGFIbFfQsJf7FCGEyIpidlX7yhjt2GtjfiBnkzKfa4GUWsr6Z7gA0i029bPvc6TpjCCrhmh4VYFgH0BSjqE/CrhrL/kATXM+TMHSE9BHfAy96hpudf8TbrgCfJdDF9kFqNv5lgBSXq52C54gOySqSgEwS8zPNK8jMIMYh+ZWlKg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(478600001)(8936002)(107886003)(40460700003)(6506007)(26005)(9686003)(7696005)(5660300002)(110136005)(55016003)(2906002)(54906003)(40480700001)(86362001)(4744005)(316002)(82310400005)(33656002)(4326008)(8676002)(70586007)(47076005)(70206006)(81166007)(52536014)(356005)(83380400001)(36860700001)(82740400003)(336012)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:20:31.6262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09366daf-0c51-4bc5-c026-08daa20c9efa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9541

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDEvMl1bNC4xN10geDg2
OiByZS1jb25uZWN0IFZDUFVPUF9zZW5kX25taSBmb3IgMzItYml0DQo+IGd1ZXN0cw0KPiANCj4g
V2l0aCB0aGUgImludmVyc2lvbiIgb2YgVkNQVU9QIGhhbmRsaW5nLCBwcm9jZXNzaW5nIGFyY2gt
c3BlY2lmaWMgb25lcw0KPiBmaXJzdCwgdGhlIGZvcndhcmRpbmcgb2YgdGhpcyBzdWItb3AgZnJv
bSB0aGUgKGNvbW1vbikgY29tcGF0IGhhbmRsZXIgdG8NCj4gKGNvbW1vbikgbm9uLWNvbXBhdCBv
bmUgZGlkIG5vIGxvbmdlciBoYXZlIHRoZSBpbnRlbmRlZCBlZmZlY3QuIEl0IG5vdw0KPiBuZWVk
cyBmb3J3YXJkaW5nIGJldHdlZW4gdGhlIGFyY2gtc3BlY2lmaWMgaGFuZGxlcnMuDQo+IA0KPiBG
aXhlczogOGE5NmMwZWE3OTk5ICgieGVuOiBtb3ZlIGRvX3ZjcHVfb3AoKSB0byBhcmNoIHNwZWNp
ZmljIGNvZGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQoNCkZyb20gdGhlIGNvdmVyIGxldHRlciBJIGZvdW5kIHRoaXMgaXMgYSBidWcgZml4IGZv
ciBhIHJlY2VudGx5IGludHJvZHVjZWQNCnJlZ3Jlc3Npb24uIFNvIEkgYmVsaWV2ZSB0aGlzIHNo
b3VsZCBiZSBtZXJnZWQgZm9yIDQuMTcsIGhlbmNlOg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5y
eSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg==

