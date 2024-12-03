Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC779E1971
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847912.1262959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQGN-0005y8-4X; Tue, 03 Dec 2024 10:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847912.1262959; Tue, 03 Dec 2024 10:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQGN-0005qj-0E; Tue, 03 Dec 2024 10:36:15 +0000
Received: by outflank-mailman (input) for mailman id 847912;
 Tue, 03 Dec 2024 10:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tIQGL-0005nN-2r
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:36:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2614::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68101d05-b162-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 11:36:08 +0100 (CET)
Received: from AS9PR05CA0341.eurprd05.prod.outlook.com (2603:10a6:20b:490::27)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 10:36:04 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::57) by AS9PR05CA0341.outlook.office365.com
 (2603:10a6:20b:490::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 10:36:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 10:36:03 +0000
Received: ("Tessian outbound 3b1f0cd68b0e:v514");
 Tue, 03 Dec 2024 10:36:02 +0000
Received: from Leebd2d869ec8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 993D9F97-1532-4EC8-90E2-A1E6B720DAF6.1; 
 Tue, 03 Dec 2024 10:35:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Leebd2d869ec8.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Dec 2024 10:35:56 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB8874.eurprd08.prod.outlook.com (2603:10a6:20b:5b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 10:35:50 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 10:35:50 +0000
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
X-Inumbo-ID: 68101d05-b162-11ef-a0d3-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=slku8J403dkRDUAknjy0/E3wGIngc95KzzgODjhqYAA+MzCEuaIR2k+fEgkId7e437gqyYD9h2PsI3LeZK9v/F7nVWO443Yv1Vi4UUx5s/NGxUE6Mb0gKrxkREr9OwUku46qA4f01iZwPBnfT7E2zlMPyAREhO6zTrZ977plnxVfHnWxfNyUYK0SgQk7fM9sGQF6HSrz6clQZLBOqSRWIjvVVeHslMD4F/Ck1EgjHRdHCuNGAkhLGpjj5GU4P1olXAYT/i+d4YeRZXuMqtMKaHyjTnF9d5XcSvql1kBpuhI6cXV1h87xF3TnZMFCJ0WCjEmSP0osR9qkPJhOeJTvaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqpGvx/DKaZfbGFyKM6NO+fx+CIiYkQzdSiWawj89bI=;
 b=hg17gnkyTcsoe0olsm/DnRrIo142oV4QMA7Zerib/KmOq/q26/2qL8gPZWXB8RP/6jusT9kxKrN60Uo3mHJx7niW6QLAlBEM2QC7E/ZxTs1qGVRcrS1bLDOYfBFxDLAb9X57phB+NVdVnO2BPqGkZ9E5dnTWdws2tVq5PLll0CrSi+coOuteAvgYtUyvTHElJm0FHRMGtLlo3PFFNhtQ02soitfJ/z+rlPvNz4wetLI+ssqe14/ttHEROi2ulK8HaI7Jd9O5wYMalxkK3W7ipHTzhcEyMFealVhYfRLbe4slLi9L4kyBiJ3qLrfhdgLlVcKNF/nFfeahhmX1CKycyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqpGvx/DKaZfbGFyKM6NO+fx+CIiYkQzdSiWawj89bI=;
 b=a7W2AJe0Joxb3jcNTXqchVFR2x/KXaIWt+KVv7SLZEz6OopNt/PVhSyNh8tFErm+H3x7SLwvT37u2nG4Dfxuq0bRMZWffx7mud6skixlKgDdrVKACsE/quTO5hzDZJ5Ptx6zrh/5aeGE4nUo0MsOTXqrN5H7+IzY4c+WoJzEa48=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40b8cb1df06dcf98
X-TessianGatewayMetadata: OtZdU2y71sAMOzzfsLy3EC/Oj8R+znEnF05fX5SvOCNzHA7WSVQ/AnAsSkTeLKyrrgXEY7psrgnTyEzZI+V1SPPtbyPhIBBZHP9Z9LGQqQ2liG52Mm02ss76vj23nO2Jtgt7PRnbanFYYfAFcig8r8i5XefYPsf8Xmu6K/VgqWk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvY9+h6/5gwCAzPXpYiK73mNEVrL4LyA8NT/n3wfnNnHj4wPDw0v0LdISi2YDzpToY8W4CgsNWWmmrA7zMt9h2G4Ki2He9DSfU+CkDVk38joFZjhWa1GHMhRNEJmFRSwH05in9RO9Gx+PxiF07EwuOZYTqo17pYXvVBlYEgCcyx6pyfSYvDJOZIw3J1cMsBeae9zCSpBjTw3nbZD8cHdfou8ilrHXQQoAThCh4CSVOqQq1HAxbzVC+SathsH/YjM/AGmdxJYx+igyEIq5yyzVNW7qk+BGDJ9qRLr/1cmGphoruOiUaTJWKUIU213pRDU/6kJt9CaPxFrErqA0NVVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqpGvx/DKaZfbGFyKM6NO+fx+CIiYkQzdSiWawj89bI=;
 b=cTILu3z3Yy7NPQdG+433SXFA/xZevstRCrhgHtEM6XxIoXHxjG32kZlwJ0CclIJYyFexhITMyFELrgjdNFhPRErg6eTSsit95whZ31QUSLRyX0GzW8mVO8l0LCGyJ+qQWqqur5N2eDDYBaLrGzPl88EvxQdcPIzf65wQzySfKPOHwbx2k1+PW4UiHcGu28VSyAe5idJ9PeRvWoA23d7X/Yyztx62lW9i7aV8fpj8HR2Cep1X0+alpDzdf+3ICduIfjZ102RWUSZxohTZiyHPKg2iz9TiHfi7OiyuWWW2a9J2pLvazC4TB/T2AHO0AWX1PH20kWd/V/BxNwBxnVLXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqpGvx/DKaZfbGFyKM6NO+fx+CIiYkQzdSiWawj89bI=;
 b=a7W2AJe0Joxb3jcNTXqchVFR2x/KXaIWt+KVv7SLZEz6OopNt/PVhSyNh8tFErm+H3x7SLwvT37u2nG4Dfxuq0bRMZWffx7mud6skixlKgDdrVKACsE/quTO5hzDZJ5Ptx6zrh/5aeGE4nUo0MsOTXqrN5H7+IzY4c+WoJzEa48=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
Thread-Topic: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
Thread-Index: AQHbRPo1JX+4yJsUxkavQ6TQ6Lnjf7LUVCKA
Date: Tue, 3 Dec 2024 10:35:48 +0000
Message-ID: <F2802242-7101-49EE-A450-F0FE5E36A334@arm.com>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-4-volodymyr_babchuk@epam.com>
 <d8bdd084-3e0a-40aa-b829-534219b24df7@suse.com> <87iks5bsgd.fsf@epam.com>
 <8df584b8-fb23-4db4-af87-903fde91e42e@xen.org>
 <faefeec9-15db-4ab5-9c51-613056418755@suse.com>
 <6d4134c9-25ac-4b16-9928-2a4bdc48d996@xen.org>
In-Reply-To: <6d4134c9-25ac-4b16-9928-2a4bdc48d996@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB8874:EE_|AM3PEPF00009B9F:EE_|DBAPR08MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 3120b73c-19bc-4f5a-2ff6-08dd138649b1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?0k/FyMWfjDOP8axd7CW4MkO4G2cfa8yZP1TETrB002Vsll++7SzgMNQtWtkw?=
 =?us-ascii?Q?0EKhg8aeblZi1st9bIkfaSWRUxUnUQxpBkHZB91qni3KnVJwuO1jct4n1Rn8?=
 =?us-ascii?Q?7u2PZJ0ygJ0mSrMBe0ekM16GYADeZBG042fo89yuf65Js2g5Ztx7KAJDCEy5?=
 =?us-ascii?Q?oklnp3K3Ch9ukQtKeQEnTqZoMB7JoNtn8vA7QVLDM35PFrpD2+YG3+Vc8cMZ?=
 =?us-ascii?Q?KJD+T36TuC7imz5/qkcUAXLSV1GS3bjkNX3Noe9b2ZJGUNkKfO3IX+ttn1D1?=
 =?us-ascii?Q?GWphBRSZiGeKvtne0+2dUPSMlEeoaWn1U1FGmwwAhQdIuAs44/mNeVkdJLRQ?=
 =?us-ascii?Q?9BH46kYTgtqIaxQrpVyphklM9Z0T9Ie8Hdkqvijp0XhQoH7txgTKwhDMqzdx?=
 =?us-ascii?Q?OtcQpdDkSfVqgOlBfSWm2uw3pvpQOcr9/gS92Y9TyhJ+qD9P0fC9fTZMfvtr?=
 =?us-ascii?Q?qq4XMguNpGC6a78s/nbmx5b4hLyPJAosQxXFxVS1M9wigOgGMnT2HZOfmBub?=
 =?us-ascii?Q?nPdkgAUQnxrNf7Po2f2A7GuuTF/03RFOBq3mB24v/ReaNsabPOe6O3FRV+3l?=
 =?us-ascii?Q?zh8uGPh6QVzx5+i5cgSOTx5zEk3Qq0lSVIp8BjkUj0OKakJJ2Il9/C1hAAP6?=
 =?us-ascii?Q?RRSKr/2zin/S0lhuq8jtMtsGoCZzJizp7edkAUuGWZ5yxktMPHj3vflFmKAj?=
 =?us-ascii?Q?yPFi/RowyuKaJFgPxVBo58LNBlptQJFNd84/NcsnzJbJ8Ly/JX1NAkcG7eex?=
 =?us-ascii?Q?dg0c0knH0mUcnlocLGLZtG2uR8g78Nvvul/9MsLDcZCa7IiX3J63O2GVVaNu?=
 =?us-ascii?Q?nS+hpc7pwRdhBB+4Upt96ZHF/b4WrpuFQ7KXBv6DgeQ+MDAX//wgIXTUhLje?=
 =?us-ascii?Q?ruXmwnLxZJAiIhC0VoQ7jXeHSUkr0AO9JtraK6kOlnMe6ICSxJCKsw8+3tE1?=
 =?us-ascii?Q?f8sOgR9UFQG4WtAHEAhGicttgv3Du80dpy/xNNH9ypWlwNpI4EQNAP/s0bUh?=
 =?us-ascii?Q?CXvqtkChZ+j4BH9CVq+dNGoeY7B3dV9Wk/h8MMz+jWAPDjoGGtLGxNWkrbZp?=
 =?us-ascii?Q?WUy9jVD6f6oWXI/GbB4r+Z+6ZifZdSWAbBSCGvkutFlqBW5oBDjw6jdnfunN?=
 =?us-ascii?Q?H9sh6UAfKXVvC/QFqbViM8Qtknc6lBzSf9ltoPylEHe/sYhinIECqZg+9NOe?=
 =?us-ascii?Q?ERMaDbcgiPpgK9fDI1WREjCyCQdOFrk8Q9/sVbsB3JH7X2xi72rcawHhFYgj?=
 =?us-ascii?Q?XR0nUqE59L0z0GnAxyPGt3zYIbx6YBTBkdt99/AxbPfzuHGy1bm/37azZUnJ?=
 =?us-ascii?Q?45S+vSCcUjLUvOJ5TGeyiDG+EGJ5oTZdMniLeXHV8SCOTFQDOIXeHBbA7o0f?=
 =?us-ascii?Q?dVUYp7uLckps6+cjt3v6nifubCYXD8WD4ntcNLvAzTQj4ATCqg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E527A12AB3B4BD4593BFE11E35B77B76@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8874
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4711b94c-286b-4fce-da57-08dd13864166
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gcOr3cZrrKm9QgClLUGeNtB6vDcNPJ8VE2FF5CoiPHHVq/oOUy0DG/TrY31s?=
 =?us-ascii?Q?jXkiEQEptFcXJp/t1r8sKJLAE5k3Gf5iOeJqiQQhEmbQDDN3f46DUkuQOogU?=
 =?us-ascii?Q?q3jMUKSTvxpvHg9E/5h7E9HeU/CQJrHEPAuLm9LStU4QDu5NSqF71q99C9+O?=
 =?us-ascii?Q?9mSbLMzwxmMBbNOQtP4rtXpB5MgFv8aNanJUGtDesnmcGj9DKb+ujc3aLEf4?=
 =?us-ascii?Q?DdH/u54LilGtlYaGlNFk6gS4L+CYbGIDmfyPAXJphk47uBmxZ2UcEvhHFCsD?=
 =?us-ascii?Q?6bRKIA/QxC+e8w0SqojB1GH3dyzzsN2tLxu5+54OnL+yheMQo44mIZxXAjP8?=
 =?us-ascii?Q?iRpPIfU1TcCSI4wKZWkI2N4ds7z/9ayq1SJK9QTV6IguDnB/Qsh250yk3m1a?=
 =?us-ascii?Q?PnwnZOAMOwvacM1wkCrQTEwdyisJFrUQ00V1EhR7p0g8wbflGq5h249RbuQS?=
 =?us-ascii?Q?AaAqQfK+IrKfGeTl+kCjmSUi4X5Y3jhO5PeK+XJomQiBONDlySt3EsqIRCMu?=
 =?us-ascii?Q?SCGFPvi+RoCGfpSge9MKF3C+f/HP5f4pQO093iQDToWX4yXeGLK1GqKmq6Vw?=
 =?us-ascii?Q?CfkeEA5lLRw9G3/lzUMZVSV7oGcd31fpTMLBQlD6vo/OzD58Cc/PPHFmv6i2?=
 =?us-ascii?Q?2OFnztsKE0pzg+Fv530Oa3u3jG2XYDKVpu2TEhX/pP0I91PQ7Tj44yP32+db?=
 =?us-ascii?Q?PaRufZAsuyj+f75txt/cGM3waQ24yk09a1Pb6U1qPEnWn5umYx4xlgU7LMPL?=
 =?us-ascii?Q?OFzAzRggLLy9Q4e5s008+j9qepvLSgvuxpHBtY2zh9ApsAJJT8ukD+TXSbdp?=
 =?us-ascii?Q?+It51q/S5oizsA5w3ZowqkdFCvC+0dDIbGjEyksm/Uz+/OqoeOz5t7oT7/p4?=
 =?us-ascii?Q?IFp0p+Ywe9/jU6XCt0gGoj43GU79toT2+Y/FuNv3RLD+ZYRGhrcCvYikIF03?=
 =?us-ascii?Q?q6H+NaqBuOgoKH6zi1RhydNFHFMu5koc4A5js8eDgL2Hz18zJcoRBL5QLx7R?=
 =?us-ascii?Q?tb91jfrU5hcU3P3wa1dxQ/P2QN+m1T1JH04BcTyMQ41gxXuDPAuYcyByOKGq?=
 =?us-ascii?Q?yLxmDtPjFgItO0xLXkHrcmQLp8BKgVXOnRkEPor2etDJTmrTmoOa+s7VQd1f?=
 =?us-ascii?Q?BNPPLfHyoaVMu42lL/scuGAa+w/rPWbOXESCBNafMcUVEQ2pD6BKDcDaeExP?=
 =?us-ascii?Q?lg2DofYxZeULHlwMc5jep7esLpwBZp9tWjjt0TCS8Xg68a0nS5TeLGGW09Ar?=
 =?us-ascii?Q?4q60+jWMMozftnM34T+otWzYMjCRYqLIt9fWQiHlc8HlQy5KxPpKT7PONSGT?=
 =?us-ascii?Q?fO0jo/DXEaA9vPpcpKDl2VRktFOzxhUkE9vzMmh2S59UDc/+vhqp0QovxrS5?=
 =?us-ascii?Q?Y0wbZkhyDBU+38VDEjnr8wSaLzIUXYLl3AO9ZRhRjIvh7LnShcUWmlUyiBQy?=
 =?us-ascii?Q?C3qnAiyzq1PYKGSBtCX36rBRF1vJ7RSK?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(35042699022)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 10:36:03.8591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3120b73c-19bc-4f5a-2ff6-08dd138649b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5752

HI,

> On 2 Dec 2024, at 20:38, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jan,
>=20
> On 02/12/2024 07:52, Jan Beulich wrote:
>> On 30.11.2024 18:15, Julien Grall wrote:
>>> On 29/11/2024 22:12, Volodymyr Babchuk wrote:
>>>> Jan Beulich <jbeulich@suse.com> writes:
>>>>> On 29.11.2024 02:49, Volodymyr Babchuk wrote:
>>>>>> --- a/config/arm64.mk
>>>>>> +++ b/config/arm64.mk
>>>>>> @@ -5,6 +5,10 @@ CONFIG_XEN_INSTALL_SUFFIX :=3D
>>>>>>      CFLAGS +=3D #-marm -march=3D -mcpu=3D etc
>>>>>>   +ifeq ($(clang),y)
>>>>>> +CFLAGS +=3D -target aarch64 -march=3Darmv8-a
>>>>>> +endif
>>>>>=20
>>>>> Why is this dependent on (just?) $(clang), not (also?) $(llvm)?
>>>>=20
>>>> Because this parameter is handled by clang only. There is no harm in
>>>> providing it explicitly. When building on arm64, value of this paramet=
er
>>>> will match the default value for the platform. When building on x86, w=
e
>>>> need to tell clang that it should generate arm64 code anyways. There i=
s
>>>> no reason in trying to make ARM build with x86 instruction set.
>>>>=20
>>>>> Also
>>>>> this affects both toolstack builds and hypervisor. Is applying -march
>>>>> like this actually appropriate for the toolstack?
>>>>=20
>>>> This is a good question. I can't see why this can't be appropriate for
>>>> toolstack. I.e. what bad can happen when building the toolstack.
>>>=20
>>> In the future, we may want to build the tools for Armv8-M. So I think
>>> the -march should also applies for the toolstack.
>> Perhaps I don't know enough of the Arm world, but: Wouldn't it be possib=
le
>> to build a tool stack suitable for a wide range for Arm64 flavors, while
>> requiring more targeted hypervisor binaries?
>=20
> Good question. There are some commonnality between ARMv8-M and ARMv8-R bu=
t I am not sure whether it means we could use -march=3Darmv8-a build and ru=
n on ARMv8-M. Adding Ayan and Luca.

AFAIK a binary compiled for armv8-a aarch64 will work also on armv8-r aarch=
64 since they share almost everything apart from some MPU registers,
instead in order to work on armv8-m we might need to pass the appropriate m=
arch

Cheers,
Luca=

