Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB48A0216
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 23:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703647.1099407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rufUn-0005V7-59; Wed, 10 Apr 2024 21:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703647.1099407; Wed, 10 Apr 2024 21:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rufUn-0005Sh-0g; Wed, 10 Apr 2024 21:28:41 +0000
Received: by outflank-mailman (input) for mailman id 703647;
 Wed, 10 Apr 2024 21:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rufUm-0005Sb-2r
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 21:28:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4af46d37-f781-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 23:28:37 +0200 (CEST)
Received: from DB9PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:1db::14)
 by AS8PR08MB5893.eurprd08.prod.outlook.com (2603:10a6:20b:23e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 21:28:02 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::cb) by DB9PR06CA0009.outlook.office365.com
 (2603:10a6:10:1db::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Wed, 10 Apr 2024 21:28:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 21:28:01 +0000
Received: ("Tessian outbound 1b0f2681ce6f:v300");
 Wed, 10 Apr 2024 21:28:01 +0000
Received: from a67bee210758.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C26E5EE2-179B-468D-9353-B2C73CB0C01B.1; 
 Wed, 10 Apr 2024 21:27:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a67bee210758.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 21:27:54 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB7624.eurprd08.prod.outlook.com (2603:10a6:102:242::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 21:27:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 21:27:52 +0000
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
X-Inumbo-ID: 4af46d37-f781-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d0Z62+XQ/6hbs5DG+uSZIqL7yjxwHxETlF39Fmk9ahdmtKe741PmwcKZYgjjOnzVwz2woLDg6VLRjbuqDOIwZ9SMUSqNPoUZQEK2GGnMboGxYeI+FJCJrnCPvsF9j0LS71DdCMjWldqdcL1uttyQinLZGU0YxkThD4cQZTIVlz7yWZRmSU6FE0p2L2lK5da8mzkREv6NxFcHa4qZkOAsvxLNJrIzIFaQLw+ofOphisya5IicYERxlu0ZCLMSLC2FEnzJjlFLyMDOW6X3cCuRAZ9Abs+nL+L4EWZkZz3Hq7U0eJfqn0X5gPzXg2QxaU6wmXr+a2OQvP9DCXd4sQFC7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqDVVuVZIT9XpLtZ9dxEXKgRvETkyzpDzmWB1qR8OmI=;
 b=WDuOouxTLcdhiZ3ObQQuOa06yYSTNcNbGj6KgGqzm1gLgab2wQWioh3te6W/Zzm5PbIqv+TqnBrmb/15ejF5bVl/eYxyGZDK4IbJfS7g6XYpT0mY8ABw1foo2WvnV66P6kNVbekSReQbNnHHz33MagwDrgDu2Fhy9sZ+vkbBbmL5s4Eqct/8hYcrtcQsAWyg26poFxlFdhppOhcbqJHd7cHNKwiFRuc/qAmAjlVfC2ghZNl+yRHvFGqEh2+nSL5Y3vBG11m4UkCeyrYyEW8pV9WefbONbvtBtrGG09xQT7jP/Hs69zjydPLTUk4NVh0DyTfjT2npvKlkLyNNdp/wzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqDVVuVZIT9XpLtZ9dxEXKgRvETkyzpDzmWB1qR8OmI=;
 b=2L5Rr+5bckfp/RiDRm3yW31lYrPQ5bjb/JB/0Ej5GGqWNSbuB5fPdpY7Wz/WfzPONqX++Vqf1MGihqIgIdGSEiwpIn2Dw/rnuQWJsISix1UVq7+B7g7Bwes9BKbnNjAWoTgOX1nNeTNSQIUusXVHqtWsxVME07eAIzCcCLeUM+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15cd4e06bb220371
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGtnyaobqjB8P+mvoHh/0UlBUQbWo/xSCqADHxdssmPP3iNiM2FeWwpnnPrw4Sk1MnPJudyjAk7RxaNxIg4qFCvX8NSxicyD5uOivwfqMbpxqzJcvz6mgNECaJqvd1Kvm0peDMK/tYm9RslBflYJMeH+8A8pYrFm+dRl7PQ8oToWe002p4vzNau/eWsryjPBA/kw1Al2E4uEvAfRggFDdki2HEU6HYlkGhsKYFcgeJBEyPYIUkOdTJlFD2sjwJo0cWYh1JvCvgh6a06+5JFJyxW7ZSlnLvB56X9FES52HOpVem14o1IlUC5yWURRL1gMjSRPTuPzwsL1kwHKOE/fIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqDVVuVZIT9XpLtZ9dxEXKgRvETkyzpDzmWB1qR8OmI=;
 b=Oj1dVKOI5HDEk4Vzxjt++mMkPZU4H2HHRzTw1ZrVM2m1u8CIEng7Ts1BQQDh8URziIbsRka1oZxJaRlvt3armCgTyq85AVc6CN1j/cVk3pJOAKsdk9xh9n+VI1hIdQzJ9hDgiWWP1Un0JFb6jmrbLvTsfzsxjT9W4E9+PIAdkIEpcvq0u3SUJorzjwcvXxSYjqRNinku2uXaBJiZoxw9J9VT9FAIPeCmZPVKaVztHTYjBNccF/HsTyhQ1vsXyMJnaaN/SckLjXQwsxIiRd6NSXFhCv7Qq0BYgzYePF0nBGwY2i+QW8VcWMBUaXo2PW8bTdtfcfDo1tr9xxG/zKtvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqDVVuVZIT9XpLtZ9dxEXKgRvETkyzpDzmWB1qR8OmI=;
 b=2L5Rr+5bckfp/RiDRm3yW31lYrPQ5bjb/JB/0Ej5GGqWNSbuB5fPdpY7Wz/WfzPONqX++Vqf1MGihqIgIdGSEiwpIn2Dw/rnuQWJsISix1UVq7+B7g7Bwes9BKbnNjAWoTgOX1nNeTNSQIUusXVHqtWsxVME07eAIzCcCLeUM+Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] xen/nospec: Remove unreachable code
Thread-Topic: [PATCH] xen/nospec: Remove unreachable code
Thread-Index: AQHai30hEj6dToSBkkethOfcXBQ7mLFiBNuA
Date: Wed, 10 Apr 2024 21:27:51 +0000
Message-ID: <BA6C8B3D-4381-4356-A473-BF1A9E26C57D@arm.com>
References: <20240410192659.1490271-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240410192659.1490271-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB7624:EE_|DB1PEPF000509E9:EE_|AS8PR08MB5893:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 56ghAF6z7wsujAAhEz0zJP9FxRghs0O1dqVSg9Eyv7JfOPoQ4JIwF/GSXKoN1WrSKp4S/+hBZTRPEtehiFzN4ZScNqMR5gCFt8LiF3zQKQYfikmzKWAB7Hbx/BagOMy81sG5B/VD5+EA/Hhccb/ubjqZXQlvEbDhFsP8DSOHq99Tt+tL9tTtQyomzNXMbeHof8BMS1vnQRTJkVNjEwPzoF7dDVQWnhlOZxvhPqTSE7Pqrkc/fMRFWB8DSkoUmFjA4lpasc5sovJv3R24sHP61RA1X+tcpBAU+YEmOOgvsYhyR5kzr+Mm8RsixihQZxSCc7s+kh/S6VVvpGefOrEhhJ/ngz4nFNG7idDxTAEca5MUJQHs+fTtkuzayS4BeLoKNMxe8cUZc1OmGhfJQhHgZ4gfual5KSsXBLQ7bgbUv/eSLRw05gkvO6UsSBcGPKB8CKGyAHFSReikOfU35p6OoYrSXrSFApqhxaIUxRE2qqcRqja4oSit6E8/ttF9sB9sdKbXO4nKMTUjuwYDGU1Y9QuJmDnbhMVvJEbi4dz1XYIBhTFHV3fxatbUmHbFyKQuk5stViab2w4r5PqPiEe8eZbJyrwFVHsQ6maiPpCNS1hwlOWkSYyaMoTfhmxax2IcVdwKlQs9mlA2Pftltk1kBmgMKsg+QLbkgGZbhPty3kM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AC364FB2FE141F4C8254B5FA154F96BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7624
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 820462c2-6901-40e3-43c5-08dc59a519c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wtQVl1kbw6En/5sw17C5njKC1Ed4A8IFuza6ruRlNiGv7tjtmOgjoc8Ml+yIkOYIn5ZDSYky/XMk4s+Au9IyetTJhinZ5axKOAQae5IyxPxLA7kr0C6j9jVA/ERG8PoFMxeLx4+KZ9RFlkObme4yKnmG5ssC0ChKbVvy2B8oXwIqso54R9P7uPQt2MdnaE00bhSv3SSzN8xtmNGCOqv921Si0J7NzYCUabdRPtdY//6HQNK4uf1bAkvSZ+YablBRcntlC01pLfoO4bvEYXDnCCFeFX9td15u2Ws5EnmFbnicYBw7G1NtN7L6lHO+sTSviNdZ22A3JGMb9mtGP/OwxLOPbMzqF+oVH1ZTJcN7+ufJc9OqxtdItsGK4TPZIJdHtyNlv6OaxP7SltyN7tVp0MEZ307oZxGy3fDWfQj6w8yNneblXpEN0spnwDDza3k17DxWHrl11Yx8+NJ76nU3ayIKATl1Vxh2BvK1RfUbXr3ZbJGTgp31hhKJfyeWeThfy1iJqZKOGQhAAAqVmCKklJELkJ39J3XPHW76XpKAozhsQq4FgcdZnAj4spYLhPz8iTKlTRb/HYxEgvatbtMNH6/BnWfustyLHOGnNdR9+rkH6MQ17aLFgYKdKXJCIWGgIHOkJs/RY3n0dMx5gl9rKrFXd8nc1hyJab/3qLeZuRW73Ac9o9Wxa4bKLXJDlNg7xv++xnCC2duCNCZG7FKVZVtp/pRFc244Si7Cb6x0+HpxfFDyxhnJbPfHQlzlJM9f
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:28:01.6602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 820462c2-6901-40e3-43c5-08dc59a519c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5893



> On 10 Apr 2024, at 20:26, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> When CONFIG_SPECULATIVE_HARDEN_LOCK is active, this reads:
>=20
>  static always_inline bool lock_evaluate_nospec(bool condition)
>  {
>      return arch_lock_evaluate_nospec(condition);
>      return condition;
>  }
>=20
> Insert an #else to take out the second return.
>=20
> Fixes: 7ef0084418e1 ("x86/spinlock: introduce support for blocking specul=
ation into critical regions")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




