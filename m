Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC73D5B3335
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403978.646266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa52-0006kn-ST; Fri, 09 Sep 2022 09:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403978.646266; Fri, 09 Sep 2022 09:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa52-0006ho-Oj; Fri, 09 Sep 2022 09:13:44 +0000
Received: by outflank-mailman (input) for mailman id 403978;
 Fri, 09 Sep 2022 09:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xTTi=ZM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWa51-0006hi-Ra
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:13:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa1cc64a-301f-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 11:13:27 +0200 (CEST)
Received: from DU2PR04CA0196.eurprd04.prod.outlook.com (2603:10a6:10:28d::21)
 by PAWPR08MB9688.eurprd08.prod.outlook.com (2603:10a6:102:2ea::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 09:13:39 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::d7) by DU2PR04CA0196.outlook.office365.com
 (2603:10a6:10:28d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20 via Frontend
 Transport; Fri, 9 Sep 2022 09:13:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 09:13:39 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 09 Sep 2022 09:13:39 +0000
Received: from b3760cb04c0d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C22A9C4E-874C-4AD7-9A35-629D20928932.1; 
 Fri, 09 Sep 2022 09:13:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3760cb04c0d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 09:13:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB8100.eurprd08.prod.outlook.com (2603:10a6:150:7a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 09:13:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 9 Sep 2022
 09:13:30 +0000
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
X-Inumbo-ID: aa1cc64a-301f-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TRdFxuKhjHOLppBoNGnBZSMwraauAzBEmtSchmHJQfAURwEz7qhdLZcx0Om3hp8QNqv9d9KLHHWFLP+kaP7IuoQsncytAPVuorUk2es/4NaiKima6KV+2mO9++3tu+nTsbr1nM6IGP61nNMV3asqOQ9ZP+gYOPSkRe3DqYlrSurffdl3ZD8IOtkaAlYDm4Hird8kvkFg44Kg2cO9lQWS6VZzTs0drTKwb5sbBWkmETAosGxOZ+f6KvnoQMbA4bPhwFtTT4OqENewaMb4MTJ2lNm8r2GBQ3JyyX4V5jao10RDlRb+GQgaETza2dkBU8uaM5LhA3K4gtv5wvH8uLMyrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsW6TVLehl8VTt+ux5yytFTBdA829iehgwRc/kKAIhc=;
 b=aHrIZF31GilfYc9ahg8QmyoobrHQGjIavJi047zo73wPo3ER8qULM6tRbjuup+hee9X6rtUTf443QkZxd1/+ZT4M1zw1ZYG9k38X1WArlH2aiQO9UlmaEm6nYif7Gw1p65GQFyU9VK4Ddb22hvVI+BJ0rmvKG2l91VkeNhME3TQ7wh4lWYfkxthWwBuv8+YJ5K7rntj2Nvuc+C2DSXBzJNLz+KI0DCC539oaGxM9MrQBqf6GNMRBBclrjmiW/SNQKsIxSgTjroebcM9FDZYFMSJmaQTbqMRd97EgItdNRHR8EoCyeAo9VUK59KNl3DEUfxH3iN/Ybo1y5v4x1qDIDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsW6TVLehl8VTt+ux5yytFTBdA829iehgwRc/kKAIhc=;
 b=QU2QGUz8j2Q0pIMQ+lxmBZkJOSlKDCviAhFtjHosYKFAUSjwY2MhPX68Jcp7xakxuba9+ipvsbx8gvlIDIbWpHkJ3ZnBj8Vi+5KsNjeJubtQRaexPwSKte99o/CkQL8IjC1BBw1Ke5ukFqWyuBPkWaPPSf+z1xHTFl/6343Yp4c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsoOCIC/MQIc4YdXjQRJBRQx62iaaW99f9I9Nb0ozqoTajJ5NPPl81Sy2wcHATqLEZ4Z7zzMWjG9CCW7jU79jFcDqvrFOAIKOH8c7RKrhbZaOiyrhLx4/VOv98uq+3hyfDO+/cTvlbANqququGwa6dZFAa2PiKSfKadZiGNM34VQe2tpvBnJezXc171Dl6JWoUXlgoNAqe7ivisQnqIzxl6T+eEMo8gUWgKSdtzb4MLiHUMV/ej7b7E2NVW0SCPW/1K+2y4qm6HKW5bhOioJo0r+9jn8tnYGl94df9lXQM/0myfSaLkFVNPxMmY4+A1UCIarb1usqQXg7b6iej7VSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsW6TVLehl8VTt+ux5yytFTBdA829iehgwRc/kKAIhc=;
 b=kValUNtVidSSpGqYJFglpmifusKtb/N58lQHHnAIqe5ZkVDXmzIdp6TypF+Vrl6s4srCt2FWkElGaBR56RjS6GiiF/l52YafF9duEXCXEIDDRPYHR9EBWC1wc0Md6HasisKAyLkymwBkgyGd4zJct4zMW4AYbHsyHmiYIhO5MugLKJwwOgQnWmgOwXH4QlWuHa9bLuAJF6/sIhMx+WN+LiTLqUo5pq9aHDV/8hXRdDAtzAwisCVgr66r1OMnVzXA3986kXeEr9Dncc1UuAyKcLyba8Tw5ibGh6WEhtuCWIrXeAce/Kuy5QUkMaa6YMuOoKgFs99a0LOb+fKjUYTKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsW6TVLehl8VTt+ux5yytFTBdA829iehgwRc/kKAIhc=;
 b=QU2QGUz8j2Q0pIMQ+lxmBZkJOSlKDCviAhFtjHosYKFAUSjwY2MhPX68Jcp7xakxuba9+ipvsbx8gvlIDIbWpHkJ3ZnBj8Vi+5KsNjeJubtQRaexPwSKte99o/CkQL8IjC1BBw1Ke5ukFqWyuBPkWaPPSf+z1xHTFl/6343Yp4c=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Thread-Topic: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Thread-Index: AQHYxCOLeMow4nnAdEmRQz42iuSBI63Wx2cggAAGtoCAAABn8A==
Date: Fri, 9 Sep 2022 09:13:30 +0000
Message-ID:
 <AS8PR08MB79913D5536DDF73B847CC57B92439@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220909080944.28559-1-jgross@suse.com>
 <AS8PR08MB79918E22F292563B320F502592439@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <29e45aa2-910e-33ae-cdaa-be2f9e9d2942@xen.org>
In-Reply-To: <29e45aa2-910e-33ae-cdaa-be2f9e9d2942@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0B13B627CA1AFC45A02496D190AE67F5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ee430faa-4cb2-47e3-4260-08da92439588
x-ms-traffictypediagnostic:
	GV2PR08MB8100:EE_|DBAEUR03FT063:EE_|PAWPR08MB9688:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 P3cBYIjd8aYWD30/L7ST3rv7Fvy2z8P0sVN0Xtg6yj+anEFJQwTGDjlYoJ5Rk739bOq47EgkUb3SpIbEPX+L0b92HtyhB9rmx77jMSxN1/jpQblqpWUIH7wQWdjHY9i31Nf42aAHjCKNjzOfB6/Ujmnmbif1XrPcEOf4O1Venmd4Ek4lr+LHkfGxiuqP6u/FgIN9snCLkGXsu08JYe/C7ValpDBrvuxJOW74H9hvtFoLmY3BMriVkNHSrVcyJdiAJhxyoeheSxRM+WQZ293w7bSy1axM5QJpG6vdfH6bj6OAVwF5Wbo1xqBRDuA3J9wNZ553wv4pjzAkAb4/gukDmww1BQQWKxcgw18Om0ph+r7Nk4VfKT3oyUiWHFSOGbo+N7bFSCjNraRB7XWdyT5Yk88chJ+xywhrZ0X4tgy/m9uPkMOqggMj2FbH0Foar6YmyDacEZU9Iog/ZjTDdxjRfg1LDuOex6LkuZ9E2LibeMoRODSShbBUaCFwtAgeh13oOy1wnJSK6GXrNriu56IJsa9asAXge8C36RHgDz7BkZJ+lSKCFM8KbL6H1pjjlZQlsKfgTVkTmGnykKqt0vPb83IY1rTaRLdLcBz73Im77sRIZ1BJxOb49+2xt7zgg+ABm+FVCFgbSEgiYJJMr+Qz/iHl+aOXkhyHnkyusULNzKi/mpQ019w7EoAGNe5oUc0qN62sY1mg1HOkYUJWYiO0PjEgymugTAQtbkqFv+BgMJ+UuuZ/E02tAPGSsQkxI35IaIqH55i6k6Pl355FBKDaKw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(110136005)(41300700001)(316002)(55016003)(71200400001)(2906002)(122000001)(38100700002)(38070700005)(9686003)(54906003)(83380400001)(26005)(66476007)(66556008)(8676002)(64756008)(76116006)(66446008)(478600001)(66946007)(53546011)(6506007)(86362001)(4326008)(33656002)(5660300002)(7696005)(186003)(8936002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8100
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ca17c0c-a3fa-471e-321e-08da92439046
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/a/BNhsFnc8qzlxKStoHAb4h0COQcgXPguXVAb6LIrFwDfOPtNN+MdDzvsrfewmo1Dj5sZF9bFYnFDHzvuB7XOGEqy871Fuyx5m7pzYZE5ia/N2FcSJx1KYNl9WK/9h1zjWUruxrEd7Jd4HIopcSM/r/spLq4DrWUL4nhf8HYr2ZaGRLSOB4y4eBpv/huiYyK2RCpKGeqtoGQUcUPXJlGm9o7GeK6AehneWootHQb9hOcWsT4NZe2rkpcxce/R6nKpHlvCAAWOwJyLnZiCFuq+p0PpMS9D84rF/SlpP3KQa/2rkTcgbLJbQ5tnFrBWEf9zbdrIM5ALY0JI5sFAdFebuM+MxDzOFGmVPTcMn29PC8OjM9yM3hh6A9LpvsRWD0PxdlSY29hpQ0jtfofwF6uMuiOGzCxK6N4A0ukq9Cr895dJPFBcTMik6ilspNvgoT337f/NGLtgtzlA29nfrXrDI7r0NJl/VOFsEVgtw0uphzUmHiC1C01BSFtTLoyHazEy8X23rTkVhGNxwgK/E7qwKfBxmicZCTWhL5Z32tOCFkuz57K3XP52vQ7VAw9KG0it9wFyRQfoxrfW+XHZxrUrj8hyoxuXVXRTYGoW4g0B/Rz4Fu1iqesc+pvz3gaaUPZLOQGIe37Jt5NhfRiz2tBu4lzfbZMKJnA/gC9sO/4OzKfDsBBs4M08RkObUhXUrcSJvB6azVuL1MofEtEBYZObHXYUCEo+TpOMDPaFY5ESY8kIEFfkv7TBeH6lIAxiQvgDbYg68LTWLIng4KhwxZrA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(52536014)(5660300002)(2906002)(82740400003)(8676002)(316002)(110136005)(8936002)(4326008)(70586007)(40480700001)(55016003)(82310400005)(356005)(33656002)(70206006)(81166007)(40460700003)(86362001)(54906003)(83380400001)(36860700001)(336012)(26005)(7696005)(6506007)(53546011)(186003)(478600001)(41300700001)(9686003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:13:39.5389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee430faa-4cb2-47e3-4260-08da92439588
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9688

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi9nbnR0
YWI6IGZpeCBnbnR0YWJfYWNxdWlyZV9yZXNvdXJjZSgpDQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+
IE9uIDA5LzA5LzIwMjIgMDk6NDcsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCj4gPj4gU3ViamVjdDogW1BBVENIXSB4ZW4vZ250dGFiOiBmaXggZ250dGFiX2FjcXVpcmVf
cmVzb3VyY2UoKQ0KPiA+Pg0KPiA+PiBDb21taXQgOWRjNDYzODZkODlkICgiZ250dGFiOiB3b3Jr
IGFyb3VuZCAibWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCINCj4gPj4gd2FybmluZyIpIHdhcyB3
cm9uZywgYXMgdmFkZHIgY2FuIGxlZ2l0aW1hdGVseSBiZSBOVUxMIGluIGNhc2UNCj4gPj4gWEVO
TUVNX3Jlc291cmNlX2dyYW50X3RhYmxlX2lkX3N0YXR1cyB3YXMgc3BlY2lmaWVkIGZvciBhIGdy
YW50IHRhYmxlDQo+ID4+IHYxLiBUaGlzIHdvdWxkIHJlc3VsdCBpbiBjcmFzaGVzIGluIGRlYnVn
IGJ1aWxkcyBkdWUgdG8NCj4gPj4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkgdHJpZ2dlcmluZy4NCj4g
Pj4NCj4gPj4gQmFzaWNhbGx5IHJldmVydCBzYWlkIGNvbW1pdCwgYnV0IGtlZXAgcmV0dXJuaW5n
IC1FTk9EQVRBIGluIHRoYXQgY2FzZS4NCj4gPj4NCj4gPj4gRml4ZXM6IDlkYzQ2Mzg2ZDg5ZCAo
ImdudHRhYjogd29yayBhcm91bmQgIm1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQiDQo+ID4+IHdh
cm5pbmciKQ0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+ID4+IC0tLQ0KPiA+PiBNaWdodCBiZSBjb25zaWRlcmVkIGZvciA0LjE3IGFuZCBmb3Ig
YmFja3BvcnRpbmcNCj4gPg0KPiA+IE9mIGNvdXJzZSwgZmVlbCBmcmVlIHRvIGFkZDoNCj4gPg0K
PiA+IFJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4g
DQo+IFVucmVsYXRlZCB0byB0aGlzIHBhdGNoLCBidXQgYXMgdGhpcyBpcyB5b3VyIGZpcnN0IFJl
bGVhc2VkLWFja2VkLWJ5DQo+IHRhZywgSSB3YW50ZWQgdG8gY2hlY2sgdGhlIHBvbGljeSBnb2lu
ZyBmb3J3YXJkLg0KPiANCj4gIEZyb20gbm93LCB3aWxsIGFueSBuZXcgcGF0Y2ggbmVlZCB5b3Vy
IGFwcHJvdmFsIGJlZm9yZSBiZWVuIG1lcmdlZD8NCg0KSSB3b3VsZCBzYXkgZnJvbSBub3cgaXMg
YSBsaXR0bGUgYml0IHRvbyBlYXJseS4gSSB0aGluayBtYWludGFpbmVycyBjYW4NCnN0aWxsIGNv
bW1pdCBwYXRjaGVzIChmaXhlcyBhbmQgbm90IG5ldyBmZWF0dXJlIHJlbGF0ZWQpIHVudGlsIHRo
ZSBjb2RlDQpmcmVlemUgKGVuZCBvZiB0aGlzIG1vbnRoKS4NCg0KSSBhbSBwcm92aWRpbmcgdGhp
cyB0YWcganVzdCB0byBzaG93IEkgYW0gaGFwcHkgdG8gYWRkIHRoaXMgdG8gNC4xNyBzaW5jZQ0K
SnVlcmdlbiBtZW50aW9uZWQgdGhpcyBpbiBzY2lzc29ycyBsaW5lIGNvbW1lbnQuDQoNCktpbmQg
cmVnYXJkcywNCkhlbnJ5IA0KDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBH
cmFsbA0K

