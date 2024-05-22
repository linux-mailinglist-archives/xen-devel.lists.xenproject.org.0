Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EC58CC2CA
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 16:08:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727736.1132388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mdE-00059Q-FR; Wed, 22 May 2024 14:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727736.1132388; Wed, 22 May 2024 14:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mdE-000575-Cg; Wed, 22 May 2024 14:07:52 +0000
Received: by outflank-mailman (input) for mailman id 727736;
 Wed, 22 May 2024 14:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfTZ=MZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s9mdC-00056z-Gn
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 14:07:50 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac09e281-1844-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 16:07:49 +0200 (CEST)
Received: from AM8P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::31)
 by PA4PR08MB6110.eurprd08.prod.outlook.com (2603:10a6:102:e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 14:07:42 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::44) by AM8P189CA0026.outlook.office365.com
 (2603:10a6:20b:218::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Wed, 22 May 2024 14:07:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14
 via Frontend Transport; Wed, 22 May 2024 14:07:41 +0000
Received: ("Tessian outbound f97ed8ca492d:v327");
 Wed, 22 May 2024 14:07:41 +0000
Received: from 440a50f4b897.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ABC966A6-7134-471D-BEA6-CC2BC388EFD9.1; 
 Wed, 22 May 2024 14:07:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 440a50f4b897.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 May 2024 14:07:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9636.eurprd08.prod.outlook.com (2603:10a6:10:45c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 14:07:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 14:07:32 +0000
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
X-Inumbo-ID: ac09e281-1844-11ef-90a0-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MTai4aRKHb6mTEqi18wNfICwSXX/NAR96XS7xxbSpWDzyyizwrJlBrNAOgUtD+DZ3/FjIxmQKpJGBJSyIbqWuuhoH/mJV+bd3RL1z+stafoVWoBiblZ8JCEyaqe6OgjJlRLxu/IXlOXjeAfJU9YzVQRHaeMwokCGSKGqfuFHkMfcKN7XS/J210qcqoEucj/7U6qrfTJ3GiNpkdD2O5b1FOWM32+OzKVHE+CGKyvosRg+xD6JnFMCMLkQQxGFlW2wzlO5ndeNTopkV5GiuiOSW1wt+ekXgPrUBf61dUkL5FZyNYWuMy7W1cjJB6fqOw7T4Os7yCDPZm4UjGqpgOI9fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OddZpErMz4b2RPmJ4CFrNZ+f5/3Au+Xg5aIfEAhcO6w=;
 b=dFobLSfwMxpi07eUIrbsbFG2WZamZhkBZGQpBwYBkKgybvejMriLFk1m6nRk64xj8QubKV9jaLA+nCOoZGwZZZxIZf+evsuQYaaOQk/VLVeprCnzig/+SOmtfkB/DZQG1jL+p3DrHiXLToTj06aWO12V8wbJgsghX3bo6x9QZl3NXI+duDy/wSwjbW4N9iCjEQnF6o2ZmW726RA8x3X4HitCdep4INkl1VP40jfGiLWt4vzfuwK3tl9JnN2ASkSPnu8mJHQKBqpvQOv79uy5N4JQ/UYJb2mJ7PHfXVJ6ZS5w8hMvE125I5MVXW9wGp+Vft280/KAvCiX6pSpesY7LA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OddZpErMz4b2RPmJ4CFrNZ+f5/3Au+Xg5aIfEAhcO6w=;
 b=R330+A0iX0qeGP0vvmwnAh1NecfNpliaA3rMCK99/h2gniwsQjGlVh0eB7GL5ioB7ZRADnN/EgXELBbjY50k2ETew8YONWqHF2W8fz4wdS6T6JYx6UsCbn94fXrbgHADgeqwiS5cGPrl4LuoCPhNBikruadz7/yyj/dGXbjJ/qI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8df9f1b6dd19dd5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAtvNWadDqjC1cBN/2E8UXm4pm33p+6CPhzxPDRChvyWDIgIyjLHsQR0W4O+TNN/9M2R2IfD/d2vE3DooAEE2mP+YIKUYZTpFJ5krQyBud/YpSTirefXn4cMUB59dg1+GmkW0C60tgnDAoSrni9vokhoRcBLxMJLAnigEQ7Wic2yxJCNCiswaV+DpjkCJslCG3Setv+7uogUZlDwiOI6chErDtBEJliV55TQSxgXh7IthimRD7elfFa/O5rtRw1vjjXXkOGB7tzdf8kgXNluFUQYNf6j72aIdddrbfOec17MWyW3XGe2eNVFa/Zm73eDw0nZD5CCRFESImimkqP8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OddZpErMz4b2RPmJ4CFrNZ+f5/3Au+Xg5aIfEAhcO6w=;
 b=ZN+QAjCzpmdMmguO3/hkdTjycUYi1UgWQ+IHYzlbka/hxYUXYQRuXLismYgcUDTInxOskTP7FVfcUk0yxtR/nqWh9hIJBFmHNuSyTNDXnnSM/Q4QhZohE3NUm+FZnQapNLtHmOY1fQgKJqRFnYZMXKxuZYWG7dFXZNXQNJCBOOsR9dZRMri870cB3uItKqzPlMC256S+QPQtk4ElnqekojuFi1texovnJ2soTA7nlZqzI6+RTNUgw88jlPnxcPnf9CWS8PLphbcRjmGn3qEoEIgt1WW8dzopVUuefzoqHi+5fTH9M6H+yj0gIOFwVndjD3rbdx8oKAG56Xo8N9d2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OddZpErMz4b2RPmJ4CFrNZ+f5/3Au+Xg5aIfEAhcO6w=;
 b=R330+A0iX0qeGP0vvmwnAh1NecfNpliaA3rMCK99/h2gniwsQjGlVh0eB7GL5ioB7ZRADnN/EgXELBbjY50k2ETew8YONWqHF2W8fz4wdS6T6JYx6UsCbn94fXrbgHADgeqwiS5cGPrl4LuoCPhNBikruadz7/yyj/dGXbjJ/qI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/7] xen/arm: Parse xen,shared-mem when host phys
 address is not provided
Thread-Topic: [PATCH v3 4/7] xen/arm: Parse xen,shared-mem when host phys
 address is not provided
Thread-Index: AQHarB0DEGh17L7PW0qcXAGhEqHugbGjRaeAgAAE2QA=
Date: Wed, 22 May 2024 14:07:32 +0000
Message-ID: <0B5D10EA-B93F-45C5-81D1-3908EA1ED50D@arm.com>
References: <20240522075151.3373899-1-luca.fancellu@arm.com>
 <20240522075151.3373899-5-luca.fancellu@arm.com>
 <5a339b77-0ce6-4670-9e79-99be5ac48bb2@amd.com>
In-Reply-To: <5a339b77-0ce6-4670-9e79-99be5ac48bb2@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB9636:EE_|AM3PEPF0000A790:EE_|PA4PR08MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 8280391f-0d62-4bdd-6f90-08dc7a688bc1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dFhWWE9RZjYxcDd2dzZiekNqYkxLdEFuWGwwWGdWQmM2dCtyQ2YxOWdoeGtK?=
 =?utf-8?B?aENxSmx1NlR3ZDZoQ3RWL0xtaGV0OTFydndZcTQ4Q1F0cDJUaTFUUzBHWUly?=
 =?utf-8?B?ZUExNzFFUC9HTjBrUTIvSUVhbDBjUXd4cTlpZmhha0pRdHZxMUxLazdGejRO?=
 =?utf-8?B?bWF1OElxOW1tNDJHcVkvUnNhWmptWEVxMS94b01ZTW9lRXhGQ2lVOWF3amlW?=
 =?utf-8?B?N2tTTlRGS0Q3bkoxSTdSd01WMUJaYjBQM1JzVzFCOURxdFlMcC9SQ0ZDejRM?=
 =?utf-8?B?TncrOURmK1Y4ZENlQXFjU3lzRDRJTWlIT0MzV0hMUTZJUlFnN2dwSUZSckh0?=
 =?utf-8?B?amJkR3diVzBGVnVDdElia3FCNXZNdUE0Q1BXL2huSzVJa1gyZ1FBdGZ2SE5j?=
 =?utf-8?B?ZlY4OUdYRUpRNW1ESXgvQUhFTnhTY2cvYm1VQWNLOEsycm1XRWExZVViZjFW?=
 =?utf-8?B?R3dHNExRLzVZa2FBVVF5Q1VvaS9hd20yMnN0STc1R2FQUFduOERCUEhHSzg1?=
 =?utf-8?B?WnZWSlcvKzQvOXdWdENURTgrMGJwUWtYVWVweDAxNmpsRFBldk1OblJNd01l?=
 =?utf-8?B?L2ZJM3l2dlFzRnhXbVJ1NjVJbkZqb3kweUdFWkxTd1dvbUY4T1J2ODh2UjJJ?=
 =?utf-8?B?clVMd1ZJRnNZbXY2YUM0YVhoRWduNm0vMG5qcTBTMWQyMEtYalY0MmJFTEQ5?=
 =?utf-8?B?cmtxTDk5YkVmTSttVkIwZXpyek02WWh0aUdpd2xrcitob3FLZ3NOc1NEUlJG?=
 =?utf-8?B?eStCbnVnOGZvSUFxcE1wT2l2QUNLSkVzdFdsOW5ZTGlVY3ZzMndyQ0I5Skp5?=
 =?utf-8?B?K1RkT1JJRStScHV1MnZYUXFtM2gxMkduSnZaRTN3SFhGcHF6T1BBV0J1ZzVz?=
 =?utf-8?B?azBUVGk1K2ZDaU1SK1M5cW1taklieEhNVE1NUEF4UFhPdGtaWkR3MllMV3Rp?=
 =?utf-8?B?S29pWnhDNFBYTjAwRVlqQkpOdExoZU8rWFZMQlVGNlQ4d0c1S1B4dEtOaFds?=
 =?utf-8?B?K2tmV2QxYmRuNUdFSHh3WFY1NFFyNGdTb2x2QzdzVVlaWG5rNEcrQWxEUWJ2?=
 =?utf-8?B?YnJiVGtyU3Q1cE4yK1ZhYnRMUE1hUVhYWFppemxHNnBybm8yZWsrWmtWSXBS?=
 =?utf-8?B?R3EwQTIrczNneHdKc2htQkZ6ck1NVkFyNTA1ZGZHOElxQVl6QURqejVjaGtw?=
 =?utf-8?B?eEovWUpFVjA3TTl4Qzl0RW5qOHlyeW1JdDBEajV1Kzg1TGJZUkVkc2t6Z1pN?=
 =?utf-8?B?RHhEUTA5V0psMmlNd1g5MjVYa3pJK3hyOEs1VnBJY2VFQlVJeVAyMHBJajhY?=
 =?utf-8?B?WUlTVG42MjBzR2dXenpLbkVubGxXSk80RHJvM1phRG9IZGdaZW96OVp2UXVt?=
 =?utf-8?B?MERhZ21EM1ZhdUNUSzQyV2JCem1yemVVMkpHSlNLQTI2ZXN5Ykw5U3phdFhU?=
 =?utf-8?B?ejN4S29hbHBGYnNuNDd6YllpREQvMUZMQXM4WXorRXMrNTZTU2hnRFRxME9s?=
 =?utf-8?B?YlpDQVVUUmMzUXlpSzBnK3ZEU3dYUzliYWxMUUtiOXBjZ1FFOEhOcEVMYmUr?=
 =?utf-8?B?NWlBZzZPYTVmR21JYlJTVzJ4cU9qZ01mMmFrQlQxSVhlSFcvRm5IaStxQTVu?=
 =?utf-8?B?SVRSQTJlUWUwd3Q2azdZQjFBM0ptcW1ZeXRnWXk4MXliZFowK2M1ZlRST2VW?=
 =?utf-8?B?eHZpNGVubWozYTRFQytBWjhOTmErelhYU2pJdzk2K0l1Nk81d29adEdIMFBt?=
 =?utf-8?B?dWFVOUFHNWU3RjZqR3BPWkpKSGI4VjZFOVRnRUkwclNDTkx1UGdjTHp4elVa?=
 =?utf-8?B?YlRWVFh5SnJWM1kwSXF6dz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <37A64EC1F03868488192042A020D04B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9636
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	299bd493-0458-41cf-4408-08dc7a688651
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|35042699013|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djZFZXorZFBSYmpzUXFNNGRpZDdvQnlZaHZSMlQ0aU5tNG9YbXBNTk9qMjgz?=
 =?utf-8?B?V0dwcGRGcjdlY1RZL0tXVndrbkozbjNNeFM0RklUYTBEU21RaHpsaHM1cE8x?=
 =?utf-8?B?REZyaUh0MytqVnplL2ltYXZVa0VaM2c5U2t1UGtzQlZRd2pwczh2SVZ3SWhw?=
 =?utf-8?B?Uko0RjBzNU1kSG5QZmNQdlIvTzJVdERSV2JOSjcwRXFWOFk0dkdXUytmVFVO?=
 =?utf-8?B?Nk9XbzR6S1kwbXlRVE5ZV3VqbjA4VTN1TTVxYXpmSC8xZ3ptbitFUEpUUkl2?=
 =?utf-8?B?cUJuSTlrR3E4UjdsK3l6Q0dhamtuMXhjZ0ZBcWJrUCttOVk3aFEwT0VYUkdR?=
 =?utf-8?B?ZGc1OEtSYmtQajV1blpnZnVXNXJBdzg4VjYvZ2hwckRtWnJtNnV4VWtRVTBJ?=
 =?utf-8?B?NjFPaTNSRTFrd0Vyei83d09MUHJBaFVRckxVNE8zeEZmQ0h3NHNaZXpObUR3?=
 =?utf-8?B?K09GdGVQQ3RWaGZtTXk0ZDUzOHJoa1R4bUUwejhEUS9XZjU1ZlVWVG1rK2hM?=
 =?utf-8?B?QmZ5WHZjRVpvMDZwQkpzZTZJMGJIbHJoSkh2U3Fjci9sVXFkWm9ZWlNlU2pH?=
 =?utf-8?B?Q3JkL1pydzZjdjlRNUtOd3hHTGprRnhralJtanVyczA1aXpOTWNsbmhzK2lN?=
 =?utf-8?B?MlNhdE1jRTIyK08vN2VtZ1R2OXBXYjJ5cHVvTWpXV0Rzc1V3ajVJS2lpSTNy?=
 =?utf-8?B?S2oxOGpUVGdwdlFmVlp1a2lXc3RGOWxwZENKZG5JV2tISHhNRjdESm96ZUx5?=
 =?utf-8?B?VW9yN0NoUlFTT1FyQ2tUa3NTYUxDUHcwNTR6UU1udDhjTGJLcUVZdGR6T045?=
 =?utf-8?B?V3lEclJYSjNvWEc3dzRIN25JMnJGSFJVM1BqcHgzanVrbGE3Q1BtaURUNmlJ?=
 =?utf-8?B?OHAzOXJ3YTFhVkNzL00zOVpncGFPOHk3MlRKNlk4dGVHYXZYR0FCd2xBQWJo?=
 =?utf-8?B?TE05RjJpbHBvZGZHR2N4M1dLSHQ5M20yVDd4WWU1d21rVVdsb1M1N0FJMU9y?=
 =?utf-8?B?UGxrbFRhUTNoUG1MSitndmU4V2dXbVNkN3lwVEJHbUh3aWVXOXVjNkpvREp6?=
 =?utf-8?B?RDRQdDdscjROanBQSG9XSHJtVDZaOG5RZTlyeHY1aWNRckcxc1hPNnRtRzds?=
 =?utf-8?B?S2hselhTMEZ5aldIbnF4dGF4d1Rqc1dzOHFxeVlrVDdKemNzdElaSEtYeEZ6?=
 =?utf-8?B?OUQveW4rNWhDT2JLM3pLZ3ZzNWh1NU82cWdXUEt4SUVKOURRMTBhQ1lpZUpY?=
 =?utf-8?B?dmg0bWM3R004VmxKbnA3Ty9UMnpOMURObndmdmlvM0JYZmRVeFJMMmVISVAw?=
 =?utf-8?B?SmZwQmhyYktLR293SmxLczJPYnRZZzhXMzZnaU05eE1jRGJpaFdsT3dxTkx2?=
 =?utf-8?B?SjJ6SE9XU2g5V3lPSFBYbnUrMjkrblVCbXErTjd5QWJDc1VrdTFZRVFGeG9J?=
 =?utf-8?B?OEVNWHpndGtYYUl5UzN2ay9WNC9xMWZKeGJnSEY4N1pLVTJUZW4zTmxGZHNy?=
 =?utf-8?B?bS9LeWtBditSRnkySW40TnF3SWdYOEZVRTdEc1NTN3cwa1hoQ2FpUU1MUVBI?=
 =?utf-8?B?Z2Fyaldjekt1dzNyN2Fwc3NFalRmajZyOUxmWDlQVk5FUmd0Nkl2RDh0NDlm?=
 =?utf-8?B?dmtaZ08yN1dCZnpvOEFSUmJPL3BPYWZDcDU3QURXZkZXN0MvcWhoMkttNUpI?=
 =?utf-8?B?d2RXZk55VURvN09IMWVBSUhOSTQzOExnOGk2YVpSbUNDMmkxTEJ3dEtDV1Q3?=
 =?utf-8?B?Kzc1MW5pYStFd3hXTzJ4NE13czdMeFlvblc1K2pyN2hObVZKcDNQZkl1c0FJ?=
 =?utf-8?B?U0NlUjJpcHo0WXVqamFWMlpyd0hBMGo5dFo0a3dudHMyeDM0NHNZaWVrUkpL?=
 =?utf-8?Q?XtmL7wyasObqW?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(35042699013)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:07:41.9040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8280391f-0d62-4bdd-6f90-08dc7a688bc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6110

SGkgTWljaGFsLA0KDQo+PiAgICAgZm9yICggaSA9IDA7IGkgPCBtZW0tPm5yX2JhbmtzOyBpKysg
KQ0KPj4gICAgIHsNCj4+ICAgICAgICAgLyoNCj4+ICAgICAgICAgICogTWVldCB0aGUgZm9sbG93
aW5nIGNoZWNrOg0KPj4gLSAgICAgICAgICogMSkgVGhlIHNobSBJRCBtYXRjaGVzIGFuZCB0aGUg
cmVnaW9uIGV4YWN0bHkgbWF0Y2gNCj4+IC0gICAgICAgICAqIDIpIFRoZSBzaG0gSUQgZG9lc24n
dCBtYXRjaCBhbmQgdGhlIHJlZ2lvbiBkb2Vzbid0IG92ZXJsYXANCj4+IC0gICAgICAgICAqIHdp
dGggYW4gZXhpc3Rpbmcgb25lDQo+PiArICAgICAgICAgKiAtIHdoZW4gaG9zdCBhZGRyZXNzIGlz
IHByb3ZpZGVkOg0KPj4gKyAgICAgICAgICogICAxKSBUaGUgc2htIElEIG1hdGNoZXMgYW5kIHRo
ZSByZWdpb24gZXhhY3RseSBtYXRjaA0KPj4gKyAgICAgICAgICogICAyKSBUaGUgc2htIElEIGRv
ZXNuJ3QgbWF0Y2ggYW5kIHRoZSByZWdpb24gZG9lc24ndCBvdmVybGFwDQo+PiArICAgICAgICAg
KiAgICAgIHdpdGggYW4gZXhpc3Rpbmcgb25lDQo+PiArICAgICAgICAgKiAtIHdoZW4gaG9zdCBh
ZGRyZXNzIGlzIG5vdCBwcm92aWRlZDoNCj4+ICsgICAgICAgICAqICAgMSkgVGhlIHNobSBJRCBt
YXRjaGVzIGFuZCB0aGUgcmVnaW9uIHNpemUgZXhhY3RseSBtYXRjaA0KPj4gICAgICAgICAgKi8N
Cj4+IC0gICAgICAgIGlmICggcGFkZHIgPT0gbWVtLT5iYW5rW2ldLnN0YXJ0ICYmIHNpemUgPT0g
bWVtLT5iYW5rW2ldLnNpemUgKQ0KPj4gKyAgICAgICAgYm9vbCBwYWRkcl9hc3NpZ25lZCA9IChJ
TlZBTElEX1BBRERSID09IHBhZGRyKTsNCj4gU2hvdWxkbid0IGl0IGJlIElOVkFMSURfUEFERFIg
IT0gcGFkZHIgdG8gaW5kaWNhdGUgdGhhdCBwYWRkciB3YXMgYXNzaWduZWQ/IE90aGVyd2lzZSwg
bG9va2luZyBhdCB0aGUNCj4gY29kZSBiZWxvd2UgeW91IHdvdWxkIGFsbG93IGEgY29uZmlndXJh
dGlvbiB3aGVyZSB0aGUgc2htX2lkIG1hdGNoZXMgYnV0IHRoZSBwaHlzIGFkZHJlc3NlcyBkb24n
dC4NCg0KWW91IGFyZSByaWdodCwgZ29vZCBjYXRjaCwgc29tZWhvdyBpdCBlc2NhcGVkIHRlc3Rp
bmcsIEnigJlsbCBmaXggaW4gdGhlIG5leHQgcHVzaA0KDQo+IA0KPiB+TWljaGFsDQoNCg==

