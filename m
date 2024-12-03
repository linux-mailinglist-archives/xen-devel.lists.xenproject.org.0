Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86649E1970
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847911.1262951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQGM-0005q7-PZ; Tue, 03 Dec 2024 10:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847911.1262951; Tue, 03 Dec 2024 10:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQGM-0005na-MT; Tue, 03 Dec 2024 10:36:14 +0000
Received: by outflank-mailman (input) for mailman id 847911;
 Tue, 03 Dec 2024 10:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tIQGK-0005nN-DK
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:36:12 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f403:260c::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68774d29-b162-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 11:36:09 +0100 (CET)
Received: from AM6P195CA0085.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::26)
 by PA4PR08MB5952.eurprd08.prod.outlook.com (2603:10a6:102:e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 10:36:04 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:209:86:cafe::b7) by AM6P195CA0085.outlook.office365.com
 (2603:10a6:209:86::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 10:36:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 10:36:03 +0000
Received: ("Tessian outbound 3b1f0cd68b0e:v514");
 Tue, 03 Dec 2024 10:36:02 +0000
Received: from Leebd2d869ec8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 558BAF45-EE58-4BFA-9280-EFED15AA8A0C.1; 
 Tue, 03 Dec 2024 10:35:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Leebd2d869ec8.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Dec 2024 10:35:56 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB8874.eurprd08.prod.outlook.com (2603:10a6:20b:5b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 10:35:49 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 10:35:48 +0000
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
X-Inumbo-ID: 68774d29-b162-11ef-a0d3-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tV51WzxR6ko9i3GrPjzjHnpmlzsxcL2kKeS8HZdtxwY7wSiQIV31BldFv0Eu8NkT4UVYj43Vipi45FBDJVoJrxltOrdI5ZNAdkIRgIZO+VTNXJ1TgD4bVFdR6AAuaFeNJws8/crl7cDcxUfrNtpPWJs+FZOY9FeqbWOjFM/cglSpV7uGWUhX0KKMPaj1Lur+0+v6TsVNzuNon2nWN+NA/acqMLTam2Fl9SP2tmlJGziyDyLMt7OLY8+vFOn0GwFWjQ3DT/ZGE2Er7sYaplF1HlToRN0bJfAlLzhPdVZmhs4/hGRgtW0U4UFvAkdmmRgxlqGvkcvH+0GVYpRjM/K/AA==
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
X-TessianGatewayMetadata: ugqjC5HMuAf5nqrc+Kkz3/pCQ+sFO/UQoaXtzxYSOm3zgwdFp0V4ZquSOkd5t6B+Gepo8t8XWsQFurHDUpfmJJ03bTb5K8kA0LHrlMX+ip+lkhEUK0bBwmD4NgbKPGyN30SjlkfzDQ2Tj0q220eyoAKWi8OAXDC+FpnZB99eOKU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RC1txj8SnYbmWWZUdAi+58wFS3oX9qmm5A0c8tas2zP6cHACmCT0RdhnuRxhEG4nyKFNdYmxAhQURbKVbP1EJiyb71RrGpCELk4jcjYZV1OBUdE20ObFO4b8tUjlXa30LMR6o6p7sYznPcGYkeYk91S9d1o6hZLF14P6XuDhg53n/yaOukA/iJqsupAQmKXXoU3hIY9HU6LttjDMrrMlEOMZ8ISxb6+Fi5Fx8f/24P8kBC8liIpw4Xje0i9yquODG2AaoI49tYdo2gIC9T+SZnj2gIIX0OybMSiS/yizANyUqM/TFtHlG8iMZUSjVlml/yO9mZH/oVgARABzWi9TJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqpGvx/DKaZfbGFyKM6NO+fx+CIiYkQzdSiWawj89bI=;
 b=YGHqXY1WK7+Accq0PqTae00Qe3CCJJPo3EuxPWwQY38r71/ySe9kPosT0GFcXSM4mKlQwdC/nOHaXZlcOHqzGP/shKFAd/nzYI3MXAjoJz4YTARZTFKoO5/6Yj7bbx/qgounhm4eVD1P4pnAvS+4EicwCB001bl9C+6x1hJcK/CpY8DMNQ1mxucIm6lh7BQBN2EQmbJz15lPEzsRcYpevt9nGkS9RxG2GWitViMgl0cbMPWKxKpjeL/bf7WaNzdJHM50Bar49dglpTq7dLgBR1Sz8b5NL6/mEl5US87sq856aevfHK9RcLZow1qW+YAkHx/HkQHTazew1bYnBOS0QQ==
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
	DBAPR08MB5798:EE_|AS8PR08MB8874:EE_|AMS0EPF00000196:EE_|PA4PR08MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddba862-0f63-41f2-a0df-08dd138649a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?M24G/fjeQMuSXHfROy/H3bSAgB99ZYIJHVerW/2ZI2COTjQtAjSjXqTrWmZJ?=
 =?us-ascii?Q?lAvanCh28Doc9TcRk8lFy0TGC3HZoQaqWqKe5Ceqv1HXDMxyuQTVsU49nSeb?=
 =?us-ascii?Q?dQjSyTjZYIqw5bUUuOKrVnsuLe5rUHu1krHoz5zz8lGYaEbMckFCXLSUuV1T?=
 =?us-ascii?Q?RiKciYklTfEsZ55jad/dTUFJMxOMWfoIwYkXobHt/xfPm1X3SviVPt3+bPVx?=
 =?us-ascii?Q?uSDDFXLZ0ODlKjG+x2fAF/52y4dtWpvjdPNtHlrMtukvU0DcBH5h2XZzVv8v?=
 =?us-ascii?Q?OmoGJHUNWCdYIAYcWMVjZ1MAgqzIkpx3mST1DSghnXKLVewpYlAIA8O7n3k+?=
 =?us-ascii?Q?0XHqJUX5qGRXDMWDeQ1Y43JsH0B9xM/njODZKDrgzcNvbUgxYFZOMSOGAi/2?=
 =?us-ascii?Q?gC8sT4vW4V5Rjy++U37JAAyU+44//BPKEB72jQ8sJicQdTz6OD5HDF1D1/dK?=
 =?us-ascii?Q?TALN3mMypcEiK/uvvzYAJtyqBgxEu07wRRnpSP7h151eiRNiqc/qtb57K4Du?=
 =?us-ascii?Q?BqmD0OAE9/ow8/2sTQXID2SpsOGW+C+yIrI+48m/jbi1W0JWdlv/vG2s9pir?=
 =?us-ascii?Q?QTCF/tXengzD2Rh0qMrS07+YuC15cie5TKszYZOVY9mMfnAR9kM28B8qSVCS?=
 =?us-ascii?Q?Zy5eRKR3HHN4wsdDXH1bPuutO9wH4CkMFwuxXZl8Hz9+Bv+BSjDyu3PVuKJV?=
 =?us-ascii?Q?w+Ant0DG8fUbEVPVn5nictwyjNr3GJAKK0BVfOLtJ7lOxjeGYCmPgVnexwAA?=
 =?us-ascii?Q?l0jOtKTHo7mUArkCK+A7OBtFE4DAPVgpUR7SHQTV71/KUOK0H1nTC3Pnq4VY?=
 =?us-ascii?Q?RXFM7LDqpERmisoXVeFur8Gi/7KPwuKDM0J6SME7kUqicGM7fQBd17RSVyS6?=
 =?us-ascii?Q?PIqo9OQBMtruHp7HTpjNu3MiP2DZa21MHTq6wO+y04sFIkaFd+xKHSH6UgfC?=
 =?us-ascii?Q?jmd8tspK1TVFalxubPSQEagwuZpjcdezcMMl5Hgg45O5FP9k/lU1Txy2ZY3X?=
 =?us-ascii?Q?S+OIfY+4qIoAg6SLEo7EgBHxbANeAuan9bg246Z+A2DzTsfz8vg+bjTkm7Pl?=
 =?us-ascii?Q?/QOo3YXw9a2qtXaXUgFyI5zgTFw4xWRq5pWBkMRl8fuijx+PnV8h1uzgQ4k0?=
 =?us-ascii?Q?mogSa7qPjv1gHBn3KunceADJTfHZbFisBjCTBV5qX7xjHYYtX9Vjhzaug+tP?=
 =?us-ascii?Q?4xASuTGYPhEsxOQhHYPCUf9FXMb2R+Apb8Q9lFmeoNHYNmHmFjDxxGOiS5hV?=
 =?us-ascii?Q?P4KwqOuuO5lcdiu14w2Qc6ZcrF3u8XR1O5Q359AH7o395flxDh2FLGul3WHk?=
 =?us-ascii?Q?wUQn2KzIv/ZSnpErfXs6CkMQXIc7jpPGLO44BBIhRrmO8tVb3nnRyisOHO4w?=
 =?us-ascii?Q?/42J7ZsdYTF0vGYO83nHmOu0vxxY0k8yANRulnWdrlg0QT1NVA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <472F1D44DFC4AC4DBF1CD70720AED2E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8874
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1be35616-8856-497d-b48c-08dd13864071
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|14060799003|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WhMMFMEGvAPFvYxiIU87fwIJHq55deaj9YzxJI/w4+XBlywYV93/OXSDiJYY?=
 =?us-ascii?Q?LFs2CtjWoEaQzHEdFoVjwqJRRhi5juli7DXdyrbMdN8/RAxgeiKVTV85GlwU?=
 =?us-ascii?Q?tabjg6yeJdzABzozkXVhGpY4+ObTUTamaFw53WZm5teZiYF4Ajyy/RefMT/H?=
 =?us-ascii?Q?8FbxubSt+e4E+EkP1NUc5pfG6ezuCEk73v0IBEgoT9JatM1cM+Wot/efwAdk?=
 =?us-ascii?Q?XKH1fwGEwXRi/TI5EcKRNA9vi1F/gkUqRng4nFfIGrdyz2JIXnC0N3RnOlIC?=
 =?us-ascii?Q?N99K8NHYtHQn7ZdtdANhrL5ZV1S0hcNTAdXJORaOTaprIKyv49xtaj4xzfob?=
 =?us-ascii?Q?aNtQzMu1cUrw019s52rWkHHEfse4jF1B/+ozbaAuIqsTio2PGdCYthPEuxD+?=
 =?us-ascii?Q?STTvs1spRtElBo0294JiUO56t2qs47esTY9968Y4TM/wT2xrzHYZaB2J56IS?=
 =?us-ascii?Q?wzEnz+iS7WD6q5cuRtqYjhY4J3LUtZscwp6KvDiTmDE5AnW3JPRf4OI0RsSa?=
 =?us-ascii?Q?SgMBa3/zh1+ICXFapcp5mk+EO267jdfHwueB3gNZ9MmcwbfDvhAGnhNCcJTt?=
 =?us-ascii?Q?d55J/04tyrVnzE0AC5rtF6n8LL2PUdCAZsEJbFmBAEMS/PsRW45FU+5MYE3Y?=
 =?us-ascii?Q?I4erUMaRDa41wI80HSNNYMtHitaMlVuGXGr/CUN0olrw8baRlddhBPDaTeN2?=
 =?us-ascii?Q?FR2g31UceAUp5kdfpIk2oyTfTsn8Yodh9r4aPjaWnl7wKLW/9y0Hy37Zgen+?=
 =?us-ascii?Q?OBtZGPLrEtobB8d7P1tbJnXGQOppud+1nmmobJAdBKzoGblMmpNcATzYVn64?=
 =?us-ascii?Q?Bg2AAgYKn8cnpFD/JKCESZlHKumgLsrEaZJgXJjQl5tWIQ32gRKevjeEh9tA?=
 =?us-ascii?Q?HpJPwC06+JhqmQVOWKLSiMLK7XOGV/ny3ljv5/cmHQ1DnlszJRV1fEDA30+Q?=
 =?us-ascii?Q?+w1mr99T04YpOjmflpFslBo+xT5bUyugzzzf8+dy+1FKG2PgsFqZag0LQxqr?=
 =?us-ascii?Q?we1RTwAnW68Q8DG8aGxSAEerhCcbztwOft+HdD1oXGfDGrRFehVNwue7a1d2?=
 =?us-ascii?Q?r6s84a7SNW+HSUKoLds5ffHa9o589hClQbw66Jo+OORzQ1rVcG1Uvrz/mAZa?=
 =?us-ascii?Q?3oH898gPfIj4dLJaJVcOy7c4PBnu8yIOclgw7gJEgfbpjmQsWSYBRwjqiNWJ?=
 =?us-ascii?Q?HiCBb04/mYYV1mwgFbV3yV4hAwjAdKQLiXWYlvXQ7sy2DciyUx5/guGfuhxY?=
 =?us-ascii?Q?bwTISwLx1VZzBYnt0FzKYIRgCZD1KscZ2ZW4fGOuMMypKZ3jWsCAjHyzEcBs?=
 =?us-ascii?Q?/6T7fvND+ILdeWjM7XlnGH5mgluKa9wtRHA+I2OyC5/K0V648pli21I4CaBo?=
 =?us-ascii?Q?DEm/tPHUFtrMtwNrY+eHOM4PrqgJ4TuKYAH2elHtnvFPdUtx4YOnrAqFCh6S?=
 =?us-ascii?Q?1KMkfYD5RLg7+vCVF14WBgocEZbcWVpe?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 10:36:03.8096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddba862-0f63-41f2-a0df-08dd138649a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5952

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

