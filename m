Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E285351B8E8
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321538.542541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVuF-0004e4-8S; Thu, 05 May 2022 07:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321538.542541; Thu, 05 May 2022 07:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVuF-0004aq-5f; Thu, 05 May 2022 07:28:11 +0000
Received: by outflank-mailman (input) for mailman id 321538;
 Thu, 05 May 2022 07:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1YwP=VN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nmVuD-0004ac-8I
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 07:28:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8e06781-cc44-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 09:28:08 +0200 (CEST)
Received: from AS9PR04CA0134.eurprd04.prod.outlook.com (2603:10a6:20b:48a::9)
 by AM0PR08MB3761.eurprd08.prod.outlook.com (2603:10a6:208:103::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 07:28:06 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::14) by AS9PR04CA0134.outlook.office365.com
 (2603:10a6:20b:48a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27 via Frontend
 Transport; Thu, 5 May 2022 07:28:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 07:28:05 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Thu, 05 May 2022 07:28:05 +0000
Received: from 05d98706846a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8BB515AF-AEF9-4A82-9885-4396A0852A3A.1; 
 Thu, 05 May 2022 07:27:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05d98706846a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 May 2022 07:27:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6350.eurprd08.prod.outlook.com (2603:10a6:102:12c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 07:27:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d49:4e03:8569:a07c]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d49:4e03:8569:a07c%7]) with mapi id 15.20.5144.027; Thu, 5 May 2022
 07:27:52 +0000
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
X-Inumbo-ID: e8e06781-cc44-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AVtDFUk06UtQSF47zoKzsV7OZp344arAemapA2DVCW/4b4W0xft3kUkDOPIwX8VPR7RC/DzuFsbM3/3yBQ7OhaNxG8yWxs5LZiQtR2CZqAFc70xHQQ8IkQWTY1373TehxXdHWH2jIvWwr1T8W+KmmqmHvygoD0IQoSsxON03Ima+tSWWtZhPH5aiItCigOucKJ9ko3+DcOuAbntyU5Pyxor8lVt4wV+BfHRlmzySO6et53KdeBmZcxvKuj9Ipad8UlbABSL/4M9uye1utnWJP8+zcl82BoqK35IStrXi3jTflX1YiNvsJUxhMRaQ7Y3NShq/vZ7inSKfE6bRUS0i4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pk0LjocVE6GhlK5fZwvyOKzsUSDK9bj8ABNjqw79Q8=;
 b=mhU2DFQlr5u0ZTdVg1NADU4Cp7olJ+9EsnQZZqz6kfGLZEL71wpZ4MkZ+Lkb/cyn7Sz3IZzBY9krqvRxkKYk6ivczqO8uxdDC6VBzT7DhzLZLGVqoztvT3aATaQBJilxP6eoTWnDBPz07udUvYAyyuKWnt/o/qJ+vBH3FD8EZk/SurgFR1XR7z/3WTs8ipnAYBabcyjdDyERMM63pXzFBiT/BvybrEevQYH+1Xo7P5QI8JMVbt8Pp3teiKVT42D429+KeLmoWNSfX6aBv/WQHmmIohp2KrjrbQ/QHjT4ZK6ESTjWzy/lmOzHPFcY7PioKHbIvwX1xMEsjuBESyI+Ng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pk0LjocVE6GhlK5fZwvyOKzsUSDK9bj8ABNjqw79Q8=;
 b=sfPumtZ9jMQBVK3wumxfkw1WnRvpeNjtbn2ilp6jg3pWQbIzg/F7S1rC2nTrDl1sPz16F3b/qHbJ7zNBCfx791wjNuCJoJIeLBEefe/ZcIprz42QExdArDxcWBd+TDonSW4ElZ8u+5JrafiB8Zqh0XayGabuIBqV6+wcM/eXbNY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgHEI/KrF148kdAPbVkhcuk9+7Yyfi7soQXPJ0MuReaeZv6yGWCqVVurUIfyoq4bN//8PGZ1RbASHSqQLBwroA2R18dal4VHTnfpVQQ5zcV9xC1s/1OVQpnehWP00GP7qacMaOoNe9W9kGMet5NZZWAwRjbigrHLKJ3UvKYy3M48C5gQp3FkZeqTHlxRqXmDHTVIt9rKBqIVY572yy6UNOE6uTHjOGtMrFd1ltd6qbhatw0Q5ZkALWCPu0FuKOV7KI1aPXsKzH0Z2GZaDheoYvBVbV/exRBGLfuk55w8O39+u6OCOxXQ93wYmlE38uo13JvOnRx34jgUYkap7y0QcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pk0LjocVE6GhlK5fZwvyOKzsUSDK9bj8ABNjqw79Q8=;
 b=c/RppT8+TuYGvkMxI7Y/OAM/RsL18RjWM5fuqeAiIgREAKs2P3hgPSoh9BowncrIwUrjOj34Sr6I/yt7UVvQC2WNL37D/obx6V8dRiZ8lj2478El1GXBwfQn9kfGA9IpaA5haDGYvhsQuTs836o7+Gt6zJVsgnU0W4YLVDEQnhM+RPR/Z+JtI11aBAR9waT2qiLg2H9xViGtA7FT+p3cHeC+K82AsoTqp5synWOonBWy3OhqGL8QOtCQxW3urPUw+zn0+I+rXLzb3X3QZP8K9grQ02S94eL4MsX5xgOGREXrs9uXdG5BoorH9MvEk14f6jzAfOKe/+oss8wEg51l3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pk0LjocVE6GhlK5fZwvyOKzsUSDK9bj8ABNjqw79Q8=;
 b=sfPumtZ9jMQBVK3wumxfkw1WnRvpeNjtbn2ilp6jg3pWQbIzg/F7S1rC2nTrDl1sPz16F3b/qHbJ7zNBCfx791wjNuCJoJIeLBEefe/ZcIprz42QExdArDxcWBd+TDonSW4ElZ8u+5JrafiB8Zqh0XayGabuIBqV6+wcM/eXbNY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 1/2] xen/arm: Defer request_irq on secondary CPUs after
 local_irq_enable
Thread-Topic: [PATCH 1/2] xen/arm: Defer request_irq on secondary CPUs after
 local_irq_enable
Thread-Index: AQHYYCt6dq3rsqHdhkOYsjKIcgbjk60P4h+AgAAAaRA=
Date: Thu, 5 May 2022 07:27:52 +0000
Message-ID:
 <AS8PR08MB799190ABC5155ACC4FD5446A92C29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220505025407.919988-1-Henry.Wang@arm.com>
 <20220505025407.919988-2-Henry.Wang@arm.com>
 <9b082ec7-c9a1-18ac-5d7e-59922480ea65@xen.org>
In-Reply-To: <9b082ec7-c9a1-18ac-5d7e-59922480ea65@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 104F20D87291B9498A0762615E7B034C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 31610ca8-d10a-421d-2276-08da2e68cbe1
x-ms-traffictypediagnostic:
	PAXPR08MB6350:EE_|VE1EUR03FT011:EE_|AM0PR08MB3761:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB376178E4D8A8BCF260675CAD92C29@AM0PR08MB3761.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ze/zCOkrewb+ZYtIm+6Tcvica9jU+914iMnVNPyKuqaSgxajUyb/tz23AjVsiE07EsXUq8wgzTrDiTNj5E1F7cNdqrT5LEwFKL6vDVsLU/DnXGG4IB4uHGwp1X6pkWzqo7+9ikgf4kAydf2Xlb0wctquzgmeTlJA68p73ezJ7lFtoyvUNUs9CENZhsg7eMenvvyc1Tt+ztudhsX+2y6r5t69ADsqqNH/udwKi6q3v9QWf8SMXER1NWtHjhsaSpwkwRU7M+4iEJy2S+/x16jYAfzFBM9HLWE3gGFDWVSlAZkJicVsPIHt50hkZxYjtX9ZvtnRb8+D707KNozXQUqj4bAzg3zyOsBx133bVbmZIbtu6YknavDd4gvdU4GkJJvx6ABRctqg4uoPUuPyZuH88gn3+zbEXLqv6MhQj7+daeBeEJ2fhcaHZmtdzNMLeTPlx6jHjg8m4zay907hZwfqZwY4SwEHh7CRLKbpYJHuEAVjgEibVc2xKl2s2zef9XyVNBzY50fdiue1W+vgwFfn6R4r5eS6zTa1V4J3u3ACAL2HGDZPV+VFAszyyPKhHrsumUL87cXeLWMK8WxHp4AedjIgr+Myx2QReEZXGgLB46Gmvl7E7iZFOqoyc7WpE4PRuDVjBZKIB2BaIc1vVaSjvw0wt26RwMIFoJGsZBaMhnf3qew29i4A3C/H8XytOwavzFnNge3SMfQe9qo6PDrMEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(6506007)(53546011)(26005)(86362001)(2906002)(55016003)(52536014)(8936002)(38100700002)(38070700005)(122000001)(508600001)(71200400001)(7696005)(5660300002)(4326008)(64756008)(66946007)(66556008)(66476007)(66446008)(76116006)(8676002)(33656002)(83380400001)(316002)(186003)(6636002)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6350
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f15647f2-85fe-498b-6167-08da2e68c3fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kc7asACskBCK8gAjLcvGl0TvL5dHOGtjq/jQcqfxCeC3BcXCmJlQtkIegjTDo3EYKWotK7J4E8E6juGiGLblUFCZoqNGhXenIHorGsYDmyl01DyAp90YJ+/lGfw0XzO+WOvQDBhmhkIHS4q3Sz1r69ocHZpAGAzrYmDbd8LEovNQgVyHxPc3tGPwmYebdHD0m1yYkjnJUDaK6ZN1ZrOuLw5GGgzg4Qa1qeLEOIzeMTxaXgfVJ03aVfZO6MVNxIKUiV/S9JFEsMSic6UxNNJX/lAD/EJiiwyBCZfSxY4TdEYW1FKYaMYofPLbxHEBwyzx+23aN2n7PXwuSrRVR1DzAnHYx7AX7DmjI/wxvXMa3/OVzSr5ffIv6RO+dCaORpqQs8i3zaKfLConN9lntyl435J5Ear0bpc2zN6uf3Is8da5YqUiyatNoDRMkG5rP3limqPNnoj+X1S/Y9MiFG8BmaNZZXr3Oii8T0jFw3HxuiX07BIp8GxPfXaQ2HEI1mOOqcyV14iPduW8JmPtNLPARXutUyRgilABsSlHzXuuUIUh3FA0az5FmDAqHJ4g7TSZ+SKDAJR7ggXQ8iV2wFjW7gfzQW/qqVLw9Bn7GpFvk9vqzjMZNtZxoW3aEKHHxZqlqRzkIO9aGVpR/8y6hFb/XlOJVHsZU9p2fGKrud2ELhEKiRGExDE5VOw0LJOHrEyg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(36860700001)(6636002)(110136005)(55016003)(54906003)(86362001)(316002)(33656002)(47076005)(83380400001)(336012)(508600001)(26005)(53546011)(9686003)(7696005)(40460700003)(8936002)(6506007)(5660300002)(2906002)(82310400005)(52536014)(81166007)(4326008)(356005)(8676002)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 07:28:05.7258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31610ca8-d10a-421d-2276-08da2e68cbe1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3761

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IEhpIEhlbnJ5LA0KPiANCj4gVGhlIENDIGxpc3Qg
ZG9lc24ndCBzZWVtIHRvIGNvbnRhaW4gdGhlIG90aGVyIG1haW50YWluZXJzLiBQbGVhc2UgdXNl
DQo+IHRoZSBzY3JpcHRzIHByb3ZpZGVkIGluIHRoZSByZXBvIChzdWNoIHNjcmlwdHMvYWRkX21h
aW50YWluZXJzLnBsKSB0bw0KPiBnZW5lcmF0ZSB0aGUgQ0MuDQo+IA0KPiBPbiAwNS8wNS8yMDIy
IDAzOjU0LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IFdpdGggdGhlIGVuaGFuY2VkIEFTU0VSVF9B
TExPQ19DT05URVhULCBjYWxsaW5nIHJlcXVlc3RfaXJxIGJlZm9yZQ0KPiA+IGxvY2FsX2lycV9l
bmFibGUgb24gc2Vjb25kYXJ5IGNvcmVzIHdpbGwgbGVhZCB0bw0KPiA+DQo+ID4gKFhFTikgWGVu
IGNhbGwgdHJhY2U6DQo+ID4gKFhFTikgWzwwMDAwMDAwMDAwMjFkODZjPl0gYWxsb2NfeGVuaGVh
cF9wYWdlcysweDc0LzB4MTk0IChQQykNCj4gPiAoWEVOKSBbPDAwMDAwMDAwMDAyMWQ4NjQ+XSBh
bGxvY194ZW5oZWFwX3BhZ2VzKzB4NmMvMHgxOTQgKExSKQ0KPiA+IChYRU4pIFs8MDAwMDAwMDAw
MDIyOWU5MD5dIHhtYWxsb2NfdGxzZi5jI3htYWxsb2NfcG9vbF9nZXQrMHgxYy8weDI4DQo+ID4g
KFhFTikgWzwwMDAwMDAwMDAwMjJhMjcwPl0geG1lbV9wb29sX2FsbG9jKzB4MjFjLzB4NDQ4DQo+
ID4gKFhFTikgWzwwMDAwMDAwMDAwMjJhOGRjPl0gX3htYWxsb2MrMHg4Yy8weDI5MA0KPiA+IChY
RU4pIFs8MDAwMDAwMDAwMDI2YjU3Yz5dIHJlcXVlc3RfaXJxKzB4NDAvMHhiOA0KPiA+IChYRU4p
IFs8MDAwMDAwMDAwMDI3Mjc4MD5dIGluaXRfdGltZXJfaW50ZXJydXB0KzB4NzQvMHhjYw0KPiA+
IChYRU4pIFs8MDAwMDAwMDAwMDI3MjEyYz5dIHN0YXJ0X3NlY29uZGFyeSsweDFiNC8weDIzOA0K
PiA+IChYRU4pIFs8MDAwMDAwMDA4NDAwMDIwMD5dIDAwMDAwMDAwODQwMDAyMDANCj4gPiAoWEVO
KQ0KPiA+IChYRU4pDQo+ID4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKg0KPiA+IChYRU4pIFBhbmljIG9uIENQVSA0Og0KPiA+IChYRU4pIEFzc2VydGlvbiAn
IWluX2lycSgpICYmIChsb2NhbF9pcnFfaXNfZW5hYmxlZCgpIHx8DQo+ID4gbnVtX29ubGluZV9j
cHVzKCkgPD0gMSknIGZhaWxlZCBhdCBjb21tb24vcGFnZV9hbGxvYy5jOjIyMTINCj4gPiAoWEVO
KSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ID4NCj4gPiBvbiBz
eXN0ZW1zIHdpdGhvdXQgYSBiaWcgZW5vdWdoIHBvb2wgZm9yIHhtYWxsb2MoKSB0byBjYXRlciB0
aGUNCj4gPiByZXF1ZXN0ZWQgc2l6ZS4NCj4gDQo+IENhbiB5b3UgZXhwbGFpbiBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UsIHdoeSB0aGlzIGlzIE9LIHRvIG1vdmUgdGhlIGNvZGUNCj4gYWZ0ZXIgZW5h
YmxpbmcgaW50ZXJydXB0cz8NCg0KU3VyZSwgd2lsbCBjb3JyZWN0IGJvdGggaXNzdWVzIGluIHYy
Lg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiA+DQo+ID4gUmVwb3J0ZWQtYnk6IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiA+IFN1Z2dlc3RlZC1ieTogSnVsaWVuIEdyYWxs
IDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIZW5yeSBXYW5nIDxIZW5y
eS5XYW5nQGFybS5jb20+DQo+ID4gQ2hhbmdlLUlkOiBJZWJkZGU4MWY1Mjc4NWIwYzZlMDM3Yzk4
MWZmNjg5MjJkYjAxNmQwOA0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL3NtcGJvb3QuYyB8
IDcgKysrKy0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc21wYm9vdC5jIGIv
eGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0KPiA+IGluZGV4IDdiZmQwYTczYTcuLmEwNTdlODVhYzEg
MTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0KPiA+ICsrKyBiL3hlbi9h
cmNoL2FybS9zbXBib290LmMNCj4gPiBAQCAtMzYxLDkgKzM2MSw2IEBAIHZvaWQgc3RhcnRfc2Vj
b25kYXJ5KHZvaWQpDQo+ID4NCj4gPiAgICAgICBpbml0X3NlY29uZGFyeV9JUlEoKTsNCj4gPg0K
PiA+IC0gICAgaW5pdF9tYWludGVuYW5jZV9pbnRlcnJ1cHQoKTsNCj4gPiAtICAgIGluaXRfdGlt
ZXJfaW50ZXJydXB0KCk7DQo+ID4gLQ0KPiA+ICAgICAgIHNldF9jdXJyZW50KGlkbGVfdmNwdVtj
cHVpZF0pOw0KPiA+DQo+ID4gICAgICAgc2V0dXBfY3B1X3NpYmxpbmdfbWFwKGNwdWlkKTsNCj4g
PiBAQCAtMzgwLDYgKzM3NywxMCBAQCB2b2lkIHN0YXJ0X3NlY29uZGFyeSh2b2lkKQ0KPiA+ICAg
ICAgIGNwdW1hc2tfc2V0X2NwdShjcHVpZCwgJmNwdV9vbmxpbmVfbWFwKTsNCj4gPg0KPiA+ICAg
ICAgIGxvY2FsX2lycV9lbmFibGUoKTsNCj4gPiArDQo+ID4gKyAgICBpbml0X21haW50ZW5hbmNl
X2ludGVycnVwdCgpOw0KPiA+ICsgICAgaW5pdF90aW1lcl9pbnRlcnJ1cHQoKTsNCj4gPiArDQo+
ID4gICAgICAgbG9jYWxfYWJvcnRfZW5hYmxlKCk7DQo+ID4NCj4gPiAgICAgICBjaGVja19sb2Nh
bF9jcHVfZXJyYXRhKCk7DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cg==

