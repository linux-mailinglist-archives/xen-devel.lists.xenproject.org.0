Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88B28B991E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 12:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715752.1117621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2TtP-0007sE-7I; Thu, 02 May 2024 10:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715752.1117621; Thu, 02 May 2024 10:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2TtP-0007pI-4J; Thu, 02 May 2024 10:42:23 +0000
Received: by outflank-mailman (input) for mailman id 715752;
 Thu, 02 May 2024 10:42:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7KU=MF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s2TtN-0007pC-1U
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 10:42:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a62b1db6-0870-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 12:42:19 +0200 (CEST)
Received: from AM0PR02CA0079.eurprd02.prod.outlook.com (2603:10a6:208:154::20)
 by DB3PR08MB9087.eurprd08.prod.outlook.com (2603:10a6:10:43c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Thu, 2 May
 2024 10:42:16 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:208:154:cafe::ea) by AM0PR02CA0079.outlook.office365.com
 (2603:10a6:208:154::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29 via Frontend
 Transport; Thu, 2 May 2024 10:42:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.0
 via Frontend Transport; Thu, 2 May 2024 10:42:15 +0000
Received: ("Tessian outbound af213ececc3d:v315");
 Thu, 02 May 2024 10:42:15 +0000
Received: from 695135e593ff.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 135B1535-9E40-417E-BCEC-CBA6D6AB1349.1; 
 Thu, 02 May 2024 10:42:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 695135e593ff.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 May 2024 10:42:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB7441.eurprd08.prod.outlook.com (2603:10a6:102:2b9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 10:42:05 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 10:42:05 +0000
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
X-Inumbo-ID: a62b1db6-0870-11ef-909b-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cSgG+JNfxwH8ex4qvgvGcZxMTdPVztMSKj4NT8vVJEv33uIUoaG5MOAZFrN7YKKfVTHytKLgbi79F0JyNbLrqhf9f3vVSzPxqYC3eIvSGEbVySAB2HjtVbiKuMgohyHEpUiSkQF2XWBx6qNdq+oy/Fym0yZ3z4IvBBxnE3cWSJxIqqNP4jZCfI1MYqlW7ZixcNTFmvCGHhw3L7vmfraKBZqm3kEpumngs8KXeecf7Dwqkatu2H7oZZ7809h3wX0cN1c84vQgpDOW9WZYSrXYoStpvsfCJFafDONzWfopC4v/XbUlb/3qtdundcKOG02JViraQ/k10iDunYVqB0QYVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K0ZGamDqyoPVex3PZ9FO3vycwjLLcguT8T4UOwvcHg=;
 b=dasyRi1j6OYdZqc24E3lsOcWtFef7ezZW/C3Dvai1T4E3lkeORbGwjZKZauDKNTugxQnrv/R0+yynAka17PE0AYVX3six2Km45eIgnRxPWz83S8pQZYa9kK/uaqqJk26dlFvn1InCSZ1v08U1d3k/bn0aYcDmkf3uVsJyRvv9HjzHheEhCVvnFpO9bsyTiUJJkptKMkfMQYTzW8NJ48E7BtKRjvqtOVMe0omXtYqSW3VS2ebOxau/LMldKGGCKcvwWF2fsYGjMmpjcWnOVA3En5gg9ZoG9hfe/YgeFgsyjx/PKHCVUslXLE6PVGNJMoxHxq+JVmNWuUxVkVViQe3FQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K0ZGamDqyoPVex3PZ9FO3vycwjLLcguT8T4UOwvcHg=;
 b=ZStWzAd2z7bc9LIrkQdg84aL4IvSAcb9Fo22Jb5VDW0sgD7XOjwS1YntnHLuVZ9iMZYNYsk78WpcjaVtVkMHFWZ39U3UjBhRz9IBDwqsnXi9wR7n+gn6gBUQjSiNXkLnP6hIAon6pg+x9U0yd7kiVr/vdB4UhFwaGbFVVL0UFVo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 106821810e08db42
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPFt8iyJSKycwF6us0QYwB4Ii2kR3PmkoaTemiqhHRGHwFHkXs5iVMOxcTx49dwpFyCnTZVYi9vX1pEdj9oczZDP+0+55uF729++NZAbq8JwVgzr0jGgbf6uTE7s9QLvhAO+ZUxeO9ZqlHpexeOPKjOyDYPDQHjam4r6wOAv9bHyWjFEUItJQTay0ysrqtssUkXm+uFuVeTBQEgMcS1vlVYwY+OLeum+id/Q4klPRE8Tbych6NaTpfD3FuiRdjqYSRih7/o3HmQdnlRUjaHbnKmnQK9i2d+3xEZaZtehzN2Q753IhX0w+sDuwrtwjTy4f+4h4PK2G43kj5y+rKLcRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K0ZGamDqyoPVex3PZ9FO3vycwjLLcguT8T4UOwvcHg=;
 b=P07mmGsimz4qjgjRUJWJhbcTIQfNsou4DjlWPhAVm0+W3q139jNLFZzqriRvunQLTGVzI0K3kVTLT4fHDhY8w0FAQ/5L2VDeCY4qfdFK6GIS0vS9WEHvIYAk/SlhUsWPC/qMYKs58fd9SXNFmQ7/JI6UW4IvyjoTseR1yWFdJAnE86bIXblvZodfkv1Wot7pt09Uvfz+mYV/FOmoF7suVwPpAyApySmZM6TXl7i5y0lEmppqR4Q0Mf6xbwQdZhdy39Fwctv/Nj/N2tLqvljER8uw1pJ3P1SixBkGFjHKhubUYGSn6aQRkz5C9jQtEEoR1c1woQNy/hTWI4v446ncwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K0ZGamDqyoPVex3PZ9FO3vycwjLLcguT8T4UOwvcHg=;
 b=ZStWzAd2z7bc9LIrkQdg84aL4IvSAcb9Fo22Jb5VDW0sgD7XOjwS1YntnHLuVZ9iMZYNYsk78WpcjaVtVkMHFWZ39U3UjBhRz9IBDwqsnXi9wR7n+gn6gBUQjSiNXkLnP6hIAon6pg+x9U0yd7kiVr/vdB4UhFwaGbFVVL0UFVo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "consulting @ bugseng . com" <consulting@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Thread-Topic: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible
 array member not at the end
Thread-Index:
 AQHamu72Eq1RpEGs60mNp9DIfY8mn7GAr6+AgAFEGQCAAYYzgIAABVAAgAACyoCAABlOgIAAG+eAgAAFWACAAAUMAIAAAyeA
Date: Thu, 2 May 2024 10:42:05 +0000
Message-ID: <7DAAE080-61F7-49E9-9DA9-CF0C02237ADA@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
 <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
 <91B23E5F-7515-4C4E-9FBD-57654980905F@arm.com>
 <de09e134-0150-49ca-8338-a0f4759c218b@suse.com>
 <29573F6B-BE27-4A65-A310-35883A39F989@arm.com>
 <af1116ad-6401-403b-a3b8-abe421e2e3da@suse.com>
 <2DF15520-B0A4-4972-92F6-FCB6BB852292@arm.com>
 <4fee2998-e29b-43bb-855a-8600dbef9f13@suse.com>
 <6A50BE71-7F92-4B7B-9A58-1D3A084FDA3C@arm.com>
 <be052201-8e3c-4bd4-800b-08a5f717dcdc@suse.com>
In-Reply-To: <be052201-8e3c-4bd4-800b-08a5f717dcdc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB7441:EE_|AM4PEPF00025F9C:EE_|DB3PR08MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 467d8e35-1ed7-4b84-0ccc-08dc6a948867
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?DjcRIDICfPzaO41a33nfTBw7s09wnQWmIhuP3u6rZQu0+WWJgdKJgog4ZH/s?=
 =?us-ascii?Q?hgjWCWaLewHsUVGhs1Pjs4PHwNorrWltF/Ke+QVzRnnCUjy04Q6ipsOmKGmU?=
 =?us-ascii?Q?5v2S14cAoF0uZPopzBSixzcG5Rh1Dm07e6JVL7ApPh9mCvt5CiwRtORSBe+P?=
 =?us-ascii?Q?rI1+WadgY4Fi+X20QRPIMyeXT3SNDkReQjcvpIx0wE3CupRg7MRmfkpUBQ/l?=
 =?us-ascii?Q?NjXeClfM81pomxdU55jr6oWSPs0Flz1+AggNjRxPxFUFO4XpmFc/zRJhCWau?=
 =?us-ascii?Q?2LfU3KaXgArjSt1KfMzoX17xwwdCNjsDulwdQkEHrLtxbCFSLKx1zinZ0DAh?=
 =?us-ascii?Q?tugRO1Q5w4kQj2WIbEGhyBYhqOJDwVc+5sY9GlK0ZIuoTCXIQcXFoWVlZeo+?=
 =?us-ascii?Q?GC9dRMT+kVUUosugLt4yCNvgSFRX93SmkANw3bcwFpZzd4dX+/z0ACkBhEsQ?=
 =?us-ascii?Q?4mSY3Lg4/31/85dawDdSZi7EvTRb/XHieUtRZBYhSkAzblqNHjyf9CtmGh9J?=
 =?us-ascii?Q?XvsZOaJeAhbUhIbX0cG2o37zr+8pV5HQVWrMPCwKZEoEW1H6ObHsYFJWC6sH?=
 =?us-ascii?Q?clsM8qzFhZlhnGlBfu1X20wBuwGi3HcWWPqlshl72K32wYjnlRF7OuUwEwUs?=
 =?us-ascii?Q?QZd2tJSfIyDWyivO/6VoNuRttstjCF4HVgVTvu7vrFJK/j2priV4/ahfOPDN?=
 =?us-ascii?Q?Q9kUzTqxGlPQ76ayDuz3lIFR7HT4VA2bXQmmylhMlMUQZWNjxCxK/CGOI+3w?=
 =?us-ascii?Q?MvqUB11FJu69tZBbskef5+jL6+xFlPPxS/d5fzgXL6TS2znmMC83RtC16OOv?=
 =?us-ascii?Q?eFuX8JmMaoUufucv4NVlXESmNuSL/lnTt6RlUbIjdUxSJcVFoiD0UoAeAzKE?=
 =?us-ascii?Q?4MvH3CSNTOE6uGhkjfk7g37bhoewrfdxmao3QZBVjBPCvAXvM1Zux4ELgPs5?=
 =?us-ascii?Q?PwxLA8A4cX50c1h8CiQa/bBqTgrTnPEacVNiKQ+eI0DpG8h51O0Mf8FQEGau?=
 =?us-ascii?Q?QJKcnz8QttyOk+AGK4LTw8eGH8fwCCt858Hafo7lLBFKaDneJRLCHBpHV/PO?=
 =?us-ascii?Q?JhrlQeb/iLj6psmaA2xRCLojbBOrv55GBFvgjLGJAtJevg86UFwtChcBp3xB?=
 =?us-ascii?Q?QpGKYx+ZZZ/bf52f17KTZljrY5afBwgEV2sRXwLHkVbNB3kH7S0D/hOTsUqg?=
 =?us-ascii?Q?AWfEAAHbavyvmhyns8s/KO6tFbopEsDeUNFKu1PM0v8/E8JTtAiLCHGNk2ro?=
 =?us-ascii?Q?VcIyJElRIWgAhUGCR7UbZfZ+LA2JxWBwncZJA8Uuhg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CB924931D885334BB8958761197F91A9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7b909418-877a-46a7-7991-08dc6a948266
X-Microsoft-Antispam: BCL:0;ARA:13230031|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ShP6Y75tG88lrdph5L3xP9V6AY/Gbbg/XDRIh3xOpnzXp0CQaED/gqzYLFKO?=
 =?us-ascii?Q?pUBst8pVdm6rCiPC0yXVr5s4I5FdHNUJAm2MleyNH1tK769k3I/QTHA3d9Mv?=
 =?us-ascii?Q?wbnpOqbKCC/DaU2KomSzb+Fos3EJn3Sg23lT5/f61G5+5J7feiUMLCrCEEyC?=
 =?us-ascii?Q?J/YHf6lJHEfyJBzqUjfxj4IKrejIiraqLCriX+V8IVTMa2uca//wyR9z+71t?=
 =?us-ascii?Q?CF47WyYwoitbT021dCki6hOvY3S/3GRZ3cdb2NPnUq/E/7c2fl1nuy5FK+fj?=
 =?us-ascii?Q?Fk7TpjG76mF1XLOPMOIYYaAe2KaY9bWCO6/qd0J08LZ/4PlBSwGuDqSECeaI?=
 =?us-ascii?Q?vhGWq+bRL0n8MawQkOf8o4AdwJ9rsdHF3+/qZ7vzTg8f0IvEP+0taV5HkuVZ?=
 =?us-ascii?Q?OvhMWQ8k2/M8WBU/iYlXzLw6vyN7ACE3KxNkKBwOTJ2CZp+7BTiytTtw4a8f?=
 =?us-ascii?Q?D8rM3QkqmT60P1gk2ZkQE/MZ6/9hCHVv+lU8eeGCpD35d9IrfKYRNfgcLp3D?=
 =?us-ascii?Q?H3mMvQegwBsyugkmRrYOlORYgk1uTVZ/5E+DT3a9sS/oh0ALb+X5aHC0Yydj?=
 =?us-ascii?Q?fRsKOUho4CzQrHMJbIgNgcadKuQM2WuXc1uKEJVy5jZEKtC8tF/I4iK2lXiU?=
 =?us-ascii?Q?GLbpH1SvCuwG88rhBLRFXOl1wvSwR3n7xLsrIqCIYDFaqaBRqSvLHJ1ep3gl?=
 =?us-ascii?Q?tWQtmTDQW0jbORz8Y8fbsEhVXfWkjcZZvynNCMh8trwa5h3DraZzZwn1F0tF?=
 =?us-ascii?Q?ELAW9VVKlyTSuJdDEaDtiK6q/K57HQeUbyo2jkWws2/qLd5xFilMTVHToiUq?=
 =?us-ascii?Q?GMJGoTcP/9Gv0khchT07MOTX2MJku6tPQrmuTnom2uBoDWoVV7Jw4JAKIlQL?=
 =?us-ascii?Q?kwbBxAeOupeUlkaNbRmRpLM5nYHG2NeHRtzOT41gl/dROkne7p8TP3lKzZgU?=
 =?us-ascii?Q?zGZ0XTNDInF4neHzbtakPpuSbGPCN4iQAZgkpML+JvZ6ffz0frxGzv+Nog6b?=
 =?us-ascii?Q?2W7IkC1x6DKYlCFeMJ8i/akUKUwq/Ex1SJvelvdFt+ffE97iRqdLjnLw3YFP?=
 =?us-ascii?Q?gL+sgm5FLKeJKDX3TULIq397QSbosiA6CYahrHcorqlfX6JN1erBMqWKdEwL?=
 =?us-ascii?Q?KfEsVmhI7QSBFJ1CB4hDWHmE/jE5sYrOo9xzEFdzF9Lhst014mYCMGfqnEaQ?=
 =?us-ascii?Q?NOnDFTOL/5RrbkwxbUWZrXwgj8jVzyvztBcwWzf94lmpsIM8RfK8DfMIDEsq?=
 =?us-ascii?Q?hUZ/oVd+Vj3XtXp4qgdRdlySrjKSG4wmCZuS3/oHjeZT+xNPCJEgHeVT+MQs?=
 =?us-ascii?Q?2kYAFMnKCX9Xc0fZlQwxhOUt?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 10:42:15.5301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 467d8e35-1ed7-4b84-0ccc-08dc6a948867
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9087



> On 2 May 2024, at 11:30, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 02.05.2024 12:12, Luca Fancellu wrote:
>>>> In any case it would be used soon also for other architectures using b=
ootinfo.
>>>=20
>>> Oh, would it?
>>=20
>> PPC people have plans on putting that interface in common:
>=20
> I'm aware, but ...
>=20
>> https://patchwork.kernel.org/project/xen-devel/patch/451705505ff7f80ec66=
c78cc2830196fa6e4090c.1712893887.git.sanastasio@raptorengineering.com/
>=20
> ... I can't spot any flexible array members in this patch.

I guess v5 of that patch will have that, because it would be rebased on the=
 latest state of
xen/arch/arm/include/asm/setup.h, moving that interface in xen/include/xen/=
bootfdt.h, in
order to use part of the code taken out from xen/arch/arm/setup.c and put i=
n
xen/common/device-tree/bootinfo.c



