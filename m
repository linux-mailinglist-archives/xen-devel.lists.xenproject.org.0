Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D3C70DAA7
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 12:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538406.838318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1PNB-0007BH-7X; Tue, 23 May 2023 10:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538406.838318; Tue, 23 May 2023 10:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1PNB-00079M-3q; Tue, 23 May 2023 10:36:09 +0000
Received: by outflank-mailman (input) for mailman id 538406;
 Tue, 23 May 2023 10:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIFg=BM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q1PN9-00079G-Ev
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 10:36:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe02::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f122520-f955-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 12:36:05 +0200 (CEST)
Received: from AM5PR0601CA0026.eurprd06.prod.outlook.com
 (2603:10a6:203:68::12) by AM0PR08MB5299.eurprd08.prod.outlook.com
 (2603:10a6:208:18d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 10:36:02 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::38) by AM5PR0601CA0026.outlook.office365.com
 (2603:10a6:203:68::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 10:36:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 10:36:01 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Tue, 23 May 2023 10:36:01 +0000
Received: from 61a77d812223.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10907E15-410A-412C-81E6-E0EA105F3A9F.1; 
 Tue, 23 May 2023 10:35:49 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61a77d812223.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 May 2023 10:35:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8472.eurprd08.prod.outlook.com (2603:10a6:10:404::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 10:35:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
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
X-Inumbo-ID: 9f122520-f955-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA0mV2B5cDKm8ei7Ve+40Brx4aFdGQWaPzgY9XxKeHk=;
 b=nTAScV4zfh45q2hhZ6WLgpDXYY7psT0idPEWDUlffZSl7q9U3wBl8Pm+QJUuIO3ZlVg2vTaVRLTD5pr8k2Is9u25zxLt+CJKyWsmFN1pSLPLVTJp8sXLKXRzdy9OCz9305ykgXrZmQkeRe+93k9/O5E4iNJWjkvjz8bFeEEZ+ug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1abb61c29e232e67
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDocUBfFhxuFdEWf/ZzsMoxM83oNMKrxpJyK/Fxm7iM7GSdNpXYZvZFBaWyOsyVOgnQsQtGv7nNhS7DBdL6PTNvQp5jqRqko0jM+wbBCu9WhFmNVKk/xgXkNdehVr9qLWQaqvNDlvjWrL5/SY2DSzS8gsDiCm/k/9ExV5YS9h0k1l++mfaSFMWphDqcAMf8aZIzVb4kzNNCNfLloMSH3ODMi1vH12JMddUIX0oGu0+f8Z3KCMiMBmqXA09WSDycv05y6Bc0aOMPwcm0/EdgWlshFE0Bs8ol8Zu+ezaR57l22LnI7ebSgMxwu1D885mugJE9bVM/fsFRR6WqQxsRikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HA0mV2B5cDKm8ei7Ve+40Brx4aFdGQWaPzgY9XxKeHk=;
 b=iuY9x6pm/3BgNlLX5CEV8VavEWK4dbvFORCgBBu22oKMK/6BFx9M2hz51NHtTHNNNtGNXP1mupb+KS8+oMH0jQ2LdMtHFiMvMKEHp/LxRQdk/SQIc6xCJvn1sph9t9bTkfd9NkjBKNMRTBB6gfGUYBme21HQ8REdyeAeCFutTORLOpoF/il4VkDfB20L8xOJWUPY0E4RouTHVrBneWbcn4YGdNoZAA0WGJNiUqaZ82Lhm1DMHW4GtuoDXQ/ICPIUaRwB/+Zn696c6W0CfAVGJz76yT3rwGVFa6btZ3ZmhnUoF+DnyNEJib6WdYYVHcVQAvFnFenjjE9I7ft9IyckPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA0mV2B5cDKm8ei7Ve+40Brx4aFdGQWaPzgY9XxKeHk=;
 b=nTAScV4zfh45q2hhZ6WLgpDXYY7psT0idPEWDUlffZSl7q9U3wBl8Pm+QJUuIO3ZlVg2vTaVRLTD5pr8k2Is9u25zxLt+CJKyWsmFN1pSLPLVTJp8sXLKXRzdy9OCz9305ykgXrZmQkeRe+93k9/O5E4iNJWjkvjz8bFeEEZ+ug=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Index:
 AQHZd0ulMpqFICe/LUiDVq6+aDsW9687sveAgAFTkCCAACNagIAAAPgggAADbgCAKli08IAADIuAgAADKTCAADbvAIAAB2ng
Date: Tue, 23 May 2023 10:35:47 +0000
Message-ID:
 <AS8PR08MB7991E08D46F3609CBC5805F992409@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
 <AS8PR08MB799117EDD6BAB892CAB870A192659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <13635377-e296-370d-121b-5b617dc210bc@suse.com>
 <AS8PR08MB7991DCE0DFC850FEA920BF8C92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c195ef53-1151-1fb2-0cf9-f6f47d20b75e@suse.com>
 <AS8PR08MB79919CD7C233345113F8D5C992409@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <79859cfb-ab60-8661-e1ec-75fac74531b4@suse.com>
 <AS8PR08MB7991C727E0A90875055DA1D492409@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <7f01db34-3256-0c79-018b-f081863f2599@suse.com>
In-Reply-To: <7f01db34-3256-0c79-018b-f081863f2599@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 600217892549AD4BBD9DB346F7F6AB12.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8472:EE_|AM7EUR03FT031:EE_|AM0PR08MB5299:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6407a6-18de-4b94-ece5-08db5b798127
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oavPctWkw2+Kk3iX8+VKy8DmG5su8740j+EXIwojGss+ehP6YVuChuESn9DpVaJglhWRwj56zci6boGVJu9FcyWxBmiynF9mlsCY20L3sN4KdBFIZZV3A22cHtOuZMkM11an0N4Ue/M7JZr8f6+kNuDCP0wJeGPk5n4ANVHq7VK2AXW8mY+CMdHhLjrxCx9gtvNqXGaZOZnp1hocsb6PdJ+ksoE0ROz0mDmKySBUkMe3Ftf4uY3vsPzhcL7miC1gTj9NutGCXLCqcpw1Vcwy+nyOB14CCvAkvAQ9Djhr+VNbMXJwoIYikuLaF6VZXaWAuJnzL6RdNteQ6Xk32afhADqPGQLwLtR0l1SsXQpwC5r35uypSyLmd6IZrYs7RO5IfwewMxa5c9B5RK2Gac51WwVcfezDRc4JKWQs0+ZUcCyeO/TSq+VQUfJEMHxIbKBvnBOoIaybIUzoE3kHLjZKY1orLUYSDQcG9zuIBU8eYwKEanLGEG9bKL7AwQqk3vvtES2+vwy1x7A2hgZoI3MmtFa1ESdzUs8tr9LUBgJRdxD+elV7o1yvvLHT/T9CjBPWyv2m+KXGJWi1dIa3f9QlcCVhHwt0yAfOhiexYPLGvjA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(186003)(2906002)(4744005)(55016003)(8676002)(8936002)(6506007)(26005)(9686003)(52536014)(53546011)(5660300002)(478600001)(66946007)(66556008)(64756008)(76116006)(66476007)(66446008)(6916009)(4326008)(86362001)(38100700002)(38070700005)(54906003)(122000001)(83380400001)(41300700001)(7696005)(71200400001)(316002)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8472
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f65823bb-634e-4f31-0468-08db5b7978d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sgSsUbS8xLhQyD/XJnT+n6V3WgkHCux5UEzX4h7g/jKY9KV9bDU2d9GPV0ccgGbj1VLgFNCiSWAtA2lBRFM71liRffK6uFBon52CQ/3HW21Fdbz2lPuZJfijJ35S43Wfxhvk6XXDZvwUa90cazh6b4GgaEFwKhTdTuxZam8KCqvNQSZevT/EfJLwdn2bJjarrFoOlHTJWI0IgHcMgaFsCpt/z2ioI/JTBLcZt/md0e68DL8GUKOFeHemNkvuIIm/ISAmsFX1EdizbT9VUw1bnfY+puXAVP7a+MiR01w1m5uthSMUZK7ogm/9qL+wANzcCeuxNcS6LZwFNHCp8t8hgHv4CzKrxWA61n4HTVrqq2H+RwULDhRtNUwjsgRlPxURVhfiQNP0adej2vCNPn1TXvvjOpVObNbBsvgh3nY+9UerB+e/MGfcotRhAX70ragkgYsrlddq+zWLGaxxCYqxaADIFVJm13eg3DoyvKWZ8rGR2bcNIHZuk+E4DTNg2QY4VqqJe29RKE5eP1C3llgM1pYg7oLEH/b2+U8aiMSVAdy8KESEI8vCe5gDm6JKr9m5nlmqZu2g2r9h+RiD13xZ5GqqcvQAI4mabB7dvAZCYJ9WrtsKUAjAlRFc1hTZe/AubHyHM+wBYgeZ2znYmKcXZA6LbZgZMnAEm8q6phrhjqz/f3lwcRBnZDwgsUjWWNa0qo59qOWWge8KwAmGRTyGfO21W1yXsE4LML4GaK/lPm8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(41300700001)(7696005)(316002)(26005)(53546011)(6506007)(9686003)(40480700001)(55016003)(82740400003)(8676002)(81166007)(356005)(8936002)(5660300002)(52536014)(6862004)(40460700003)(86362001)(478600001)(82310400005)(36860700001)(83380400001)(54906003)(2906002)(47076005)(4744005)(336012)(70586007)(70206006)(4326008)(186003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 10:36:01.8480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6407a6-18de-4b94-ece5-08db5b798127
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5299

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IE9uIDIzLjA1LjIwMjMg
MDk6MzIsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gQnkgbG9va2luZyBpbnRvIHRoZSBleGlzdGlu
ZyBpbXBsZW1lbnRhdGlvbiBvZiBOVU1BIGZvciBEVCwNCj4gPiBpbiBMaW51eCwgZnJvbSBkcml2
ZXJzL2Jhc2UvYXJjaF9udW1hLmM6IG51bWFfc2V0X2Rpc3RhbmNlKCksIHRoZXJlIGlzIGENCj4g
PiAiaWYgKCh1OClkaXN0YW5jZSAhPSBkaXN0YW5jZSkiIHRoZW4gcmV0dXJuLiBTbyBJIHRoaW5r
IGF0IGxlYXN0IGluIExpbnV4IHRoZQ0KPiA+IGRpc3RhbmNlIHZhbHVlIGlzIGNvbnNpc3RlbnQg
d2l0aCB0aGUgQUNQSSBzcGVjLg0KPiANCj4gQ2FuIHdlIHNpbXBseSBnYWluIGEgc2ltaWxhciBj
aGVjayAoc3VpdGFibHkgY29tbWVudGVkKSwgZWxpbWluYXRpbmcgdGhlDQo+IG5lZWQgZm9yIHNh
dHVyYXRpb24/DQoNClllcywgSSB3aWxsIHVzZSB0aGUgc2ltaWxhciBjaGVjayBhbmQgYWRkIHRo
ZSByZWxhdGVkIGNvbW1lbnRzIGluIHY1LiBUaGFua3MNCmZvciB5b3VyIGNvbmZpcm1hdGlvbiEN
Cg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

