Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394845FD97B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:47:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421991.667753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixcH-0006Rd-Ha; Thu, 13 Oct 2022 12:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421991.667753; Thu, 13 Oct 2022 12:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixcH-0006Ph-Ef; Thu, 13 Oct 2022 12:47:13 +0000
Received: by outflank-mailman (input) for mailman id 421991;
 Thu, 13 Oct 2022 12:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oixcF-00060E-Lk
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:47:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150049.outbound.protection.outlook.com [40.107.15.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27178157-4af5-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 14:47:10 +0200 (CEST)
Received: from AM5PR0301CA0034.eurprd03.prod.outlook.com
 (2603:10a6:206:14::47) by AM7PR08MB5333.eurprd08.prod.outlook.com
 (2603:10a6:20b:104::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 12:46:58 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::9a) by AM5PR0301CA0034.outlook.office365.com
 (2603:10a6:206:14::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Thu, 13 Oct 2022 12:46:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 12:46:58 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Thu, 13 Oct 2022 12:46:58 +0000
Received: from dd1327c5c0de.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 25982FFE-D900-42A0-A7BF-E0A141E6C377.1; 
 Thu, 13 Oct 2022 12:46:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dd1327c5c0de.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 12:46:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU2PR08MB7376.eurprd08.prod.outlook.com (2603:10a6:10:2f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 12:46:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 12:46:50 +0000
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
X-Inumbo-ID: 27178157-4af5-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YzA5sjqKk0ztIRFkoy6sw7De1E5719nyMCXLshgK61e/ko+dug6LKruMPbC9JgFq+GNW+/x0vqLVFe9qv8qn4rVXS/GlVN9k6WJTiYY9hJkRmVhp2ZMGLQ/VcGidKXFYvY6lo5yCFqxz/t3P/0rlNaDn6DG8xl07BztYB77t6Xg8yLUtdnF6KchHQQzUoVoHzz6DSYbUhICJ2nkRex+LKYGDkoHdDhLe0gm76iBj7Vqgp6fVjLxpZjEXnODR4hycxj0pc9jHWh3CXh+X55HZ4TL4z9FnMoSuk96euHqh5m+wEi5Xs6ompoffGBZj4lYosOGOZ/nw9T5qzok8+Osocw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veGR7p+pdePrM5Rn6tpcyvpEjr6EgHPhcZ6kpXeXDK4=;
 b=BjmL4mpejvoYis5eenfY/kg24xTM4zVhKqv3ROXZZjS7JSVr6IWNsKCaCgsbzxVkx8FNGCqW3Mlj96JqUWBegxHY4jWMESgkGc4SwqWq8+Op2oz1kchpC58WvUXv6f5SiXPS1Cu/BV2do+ATXQHcTFRb6HBtamrmcXrguNRn9Nz/Jx9UZro3h4tqPgHiKeVMO9e51fqqmX6trBgVl8qzvfwvzjSVh43rmxzT7UAtGpzm05ybwmrHiVqxDaun+zcfQDAVZitcY2yvwoPSN/Z4gXMHbgXa2sGAhtIFYMet0IrX4MqcoUvzzkShh3FhDxw0B6Q6SlgBgbu3wj8kPbOBog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veGR7p+pdePrM5Rn6tpcyvpEjr6EgHPhcZ6kpXeXDK4=;
 b=T32uLHmkuokK6uIqz4lEe8GMecmUyhb5i+38ZIYinnYkHtLt3qoFE8PWEvobHBKzLlXcTTMUVPbHbHthgeip+5zWV1y0PmJtDWHirIND0MovNmJxQdkrkweVjgRj5EGgtB4IcTzfP1Z5pAOCAW2e1A+zSZw/QU3tHxDeN7RCbak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVKIP0mNly5F+xTjF9z9xLYS4NL3d8HaZMamh7HKioKsSjVFUZkMwsESXDhBW4CixhQ6yVAciuk6bE8A7qrI3bgBCQUvJCn6cyQgWeGSV1BwEq8Hl3WXCSKhmpkeRMXq8au3jDrwCmKlHBCBscrpIFAptkhZxZ1IXt748Y6Mlu+LeBCwtKmrYcGRw9Gx0tBjYBaKizSpa55I39+JL2gWieoVCAKhO8ImsiWRf/boy7iRljig4L+5gjWqYIjBJ+klVYnzr2DfHPyzFaiy1wGwX8kUUiydR7F0w/1z3MkW+ZFIjg3FqB78ZLFN85YNqebyf/NP9+EU8TO62TDqsTi4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veGR7p+pdePrM5Rn6tpcyvpEjr6EgHPhcZ6kpXeXDK4=;
 b=cWJxoW8tu8NiCALsC1ILYOa10sAzOZtaL0gApCWAyIWg3Wl5NjndtZZd9HdIQghdmwrVjY7TtzA26z30RuiDvDXLTk2Qc9xOHDr9a3l2pTIG1chDEvsG+STTlPq1ANBlcwi3YPLvEAcBEGZoXBTEmnDd5cqrU3UcD42AICXKIyYNgwX9/CCztJTOznyj2H4hIz1Lty2EZAO4Hw0WFLHOrbZ8urAF37G7ySyudU3Cb2m0M+j2pm1VVB84u+THI5onnyxFocKCzdpq+vWHFNkBr6bKrC38DUsykoXN7Od1tQ+H5pfdVuWCq9Ka7eAdOTmu5W9d+lN2NstJdr8UCmu+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veGR7p+pdePrM5Rn6tpcyvpEjr6EgHPhcZ6kpXeXDK4=;
 b=T32uLHmkuokK6uIqz4lEe8GMecmUyhb5i+38ZIYinnYkHtLt3qoFE8PWEvobHBKzLlXcTTMUVPbHbHthgeip+5zWV1y0PmJtDWHirIND0MovNmJxQdkrkweVjgRj5EGgtB4IcTzfP1Z5pAOCAW2e1A+zSZw/QU3tHxDeN7RCbak=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [4.17?] Re: [PATCH v3 0/5] x86/mwait-idle: (remaining) SPR +
 (new) ADL support
Thread-Topic: [4.17?] Re: [PATCH v3 0/5] x86/mwait-idle: (remaining) SPR +
 (new) ADL support
Thread-Index: AQHYswLgEBgyLJ1ZH0yh+Kjbzu0UFa4Ml9eAgAAEOVA=
Date: Thu, 13 Oct 2022 12:46:50 +0000
Message-ID:
 <AS8PR08MB7991E01945110983DFCB0AEE92259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <1f8fd1b4-e84b-a211-eaef-c0abe9c0056d@suse.com>
In-Reply-To: <1f8fd1b4-e84b-a211-eaef-c0abe9c0056d@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 05730C2E1731564CB34879B34EF485D3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU2PR08MB7376:EE_|AM7EUR03FT018:EE_|AM7PR08MB5333:EE_
X-MS-Office365-Filtering-Correlation-Id: b37666ed-58b6-44a5-1664-08daad190488
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d031ef1Iyn4JRZQBNcJB85Ny5SrtkfZ2Qmfa7GEPBEDvaHvhKl49/0IQf8RkzzuuI9l1HMJuamE1HY/PNrRIaEONRzewzMzKMQBVvp8ScJnGforAZn4XKDeIkRaWD/6jE8sayfJmtQjg7Uubxe91gPpIQwLuOVvoGMe58n/bw0cLbJAzQyQmfwv/uOPh7UPZauRoAOA9VYG9QIB6brAiPI0qTifHF+oJxkW24ptCHdNRsPP9tiYaAXLRQMB7eS/GJ2uUcyXh3sGTLxzmf3RxKfP+dSK/P+JqjspwEDKMrz0IZotfpXdZi4kXAKpJoP8un97uG+r2s+25KFtBurYqulrXw7JdqKgeXSsQlZls5WIDhuO0hAAlGL5S3os1Af4o/tR12qlmP/O5VfE6W3cd83FgDdjyuTRlKfV1ReOo2JTj7hX/YhqfYwFpHWYR/Q10tCOUFduWLkEqW6U3uKQwEBe9hh2SqeoCxo+YtRfzDwXh3Hi6SewgS2A3tiwXyDj+RMm3td7PQVGHeykC3ieToGPRNE8cvCdcC9OnkbYcQof80itye6l3QH0Ji+oMWo2PDhFgMHfKBuV/CslIMQlyVAvG+6SExFHSyNPa5pH2BbhhixST/PZPlcSUysa0MnJhur1NFX04SPtiXqHipAW/+P+gUYGd0OHa5bJY9L4OL8+bKj0G/aPyyWuG8swEbknYvsNNhSgbMrNc5S5ER8ltQUY9rY6sfZNgmq9zV5wbLigyFiMbYI7jf7OvB7EDTqEVK78zkSNalpmUEgqSGIlHUg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(76116006)(316002)(478600001)(6916009)(54906003)(71200400001)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(52536014)(9686003)(53546011)(8936002)(26005)(41300700001)(186003)(5660300002)(7696005)(6506007)(2906002)(83380400001)(122000001)(38100700002)(33656002)(55016003)(38070700005)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7376
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f402c057-f7cd-4a9d-a30a-08daad18ff88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qDkdRl+tiCQIXdgkHgJvzLD4HiASPgWrxHnR7z6RcoOan4z1+15qicdTA59mSfpU8Qp5tv9nngUnWAE2HkPHerYwtzwwetUxyN0lPqdW8AJS2DIZyijsT+dE3EzBHPt5WdpQ/Dpn4OpxZG8qTEbty/ItHRq7J3ANAxt752Fp7vrCvc8b/XFkbHXKZdLcRtm+cGkg2D79Q6Ok6HlxsqiWMkuj861K3QZphoATf2sEoCT8Xd3ZdHZ2E/AtZrypS+SCFC6Kap5US6HgJynEslO5UMlmL5Lvdmg5J6oJHv+rFApDFH6/fqSIxTGa4D25r2tFx43z8xMJwdBhrVLDQz6WqCEAwVUJmSQOb8Y1ftfkM7/4Awd9XMjjw5cleW9De1xW0jc3Zx6DQZUkORiY/BRZM4MZ56yK5QZr+bX1fzJzlJaV1G2+ExHr45ousdVKZ/6Uo19vHPkcVrkiz1WP+CtlUz51j96CYxET0lXVAdxwhG7GE1rWzq+T2jfCfumx4WjsbrmfxbIBYsL7SEZpvwRBC8YC+wOZDFdL9NbOaOJXrfzD9JhZrum+0Qu5OR7BlAsAzD03f84zmO16y/1jZAz3JkV9dzWo/m3alA4CAd73Ls19CGlheeJqNIFWwaotPgYK9QRa9oSv+I9cDpS1Tl4wjik0TVRICt7RwfUnWVSpTf1BczYojyWUUrfX2PEjoqMu1dKW1NeFlViOoN8WK9OKwQBZhUGGQWuk8h7gqeOUup+HuT6pkJ5a0Y7KfcqXrzLU7KLEFBz33QsKPaeGlek9fQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(478600001)(36860700001)(82310400005)(41300700001)(86362001)(54906003)(83380400001)(70586007)(70206006)(8676002)(7696005)(4326008)(6506007)(356005)(26005)(47076005)(53546011)(40460700003)(336012)(81166007)(55016003)(316002)(186003)(82740400003)(2906002)(40480700001)(8936002)(6862004)(9686003)(52536014)(5660300002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 12:46:58.7536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b37666ed-58b6-44a5-1664-08daad190488
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogWzQuMTc/XSBSZTogW1BBVENIIHYz
IDAvNV0geDg2L213YWl0LWlkbGU6IChyZW1haW5pbmcpIFNQUiArIChuZXcpDQo+IEFETCBzdXBw
b3J0DQo+IA0KPiBIZW5yeSwNCj4gDQo+IE9uIDE4LjA4LjIwMjIgMTU6MDIsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPiA+IE5ldyBjaGFuZ2VzIGhhdmUgYXBwZWFyZWQgaW4gdGhlIG1lYW50aW1lLCBp
biBwYXJ0aWN1bGFyIG9uZSBwYXJ0bHkNCj4gdW5kb2luZw0KPiA+IHdoYXQgd2Ugc3RpbGwgaGF2
ZW4ndCBtZXJnZWQgKHBhdGNoIDEgaGVyZSkuDQo+ID4NCj4gPiAxOiBhZGQgJ3ByZWZlcnJlZF9j
c3RhdGVzJyBtb2R1bGUgYXJndW1lbnQNCj4gPiAyOiBhZGQgY29yZSBDNiBvcHRpbWl6YXRpb24g
Zm9yIFNQUg0KPiA+IDM6IGFkZCBBbGRlckxha2Ugc3VwcG9ydA0KPiA+IDQ6IGRpc2FibGUgSUJS
UyBkdXJpbmcgbG9uZyBpZGxlDQo+ID4gNTogbWFrZSBTUFIgQzEgYW5kIEMxRSBiZSBpbmRlcGVu
ZGVudA0KPiANCj4ganVzdCBub3cgYWNrcyBoYXZlIGNvbXBsZXRlZCBjb21pbmcgaW4gZm9yIHRo
aXMgc2VyaWVzIG9mIHBvcnRzIG9mIGVhcmxpZXINCj4gTGludXggY29tbWl0cy4gVGhpcyBhbGwg
dGFyZ2V0cyBuZXdlciBoYXJkd2FyZSB3aGljaCBvZiBjb3Vyc2Ugd2UnZCBsaWtlDQo+IHRvIHBy
b3Blcmx5IHN1cHBvcnQgd2l0aCA0LjE3LiBVbmZvcnR1bmF0ZWx5IHRoZSBzZXJpZXMgd2FzIGtp
bmQgb2YgbG9zdA0KPiB3aXRoIGFsbCB0aGUgc2VjdXJpdHkgd29yayB3aGljaCBoYWQgYmVlbiBv
bmdvaW5nLiBUaGVyZWZvcmUgSSdkIGxpa2UgdG8NCj4gYXNrIChpbiBwYXJ0IGFsc28gbW90aXZh
dGVkIGJ5IEFuZHJldyB0byBkbyBzbykgdGhhdCB5b3UgY29uc2lkZXIgc3RpbGwNCj4gYWxsb3dp
bmcgaW4gdGhpcyBzZXJpZXMuIEluIHRoZSAoSSB0aGluaykgbm90IHZlcnkgbGlrZWx5IGNhc2Ug
b2YgcHJvYmxlbXMNCj4gKGZpcnN0IGFuZCBmb3JlbW9zdCBiZWNhdXNlIG9mIHRoZSBjaGFuZ2Vz
IGNvbWluZyBmcm9tIExpbnV4LCByYXRoZXIgdGhhbg0KPiBiZWluZyBob21lZ3Jvd24pIHBlb3Bs
ZSBhbHdheXMgaGF2ZSB0aGUgb3B0aW9uIG9mIHNpbXBseSB0dXJuaW5nIG9mZiB0aGUNCj4gdXNl
IG9mIHRoaXMgZHJpdmVyIG9uIHRoZWlyIHN5c3RlbXMuDQoNCkkganVzdCBjaGVja2VkIHRoZSB4
ODYgZ2l0bGFiIGJvYXJkIGZvciB0aGUgbGlzdCBhbmQgc2F3IHRoaXMgc2VyaWVzIGlzIG9uIGl0
LiBTbw0KeWVzLCBwbGVhc2UgYWRkIG15IHJlbGVhc2UgYWNrLiBGb3Igbm93IHdlIHN0aWxsIGhh
dmUgMiB3ZWVrcyBiZWZvcmUgdGhlIHJlbGVhc2UNCmFuZCBJIHRoaW5rIHRoYXQgd291bGQgYmUg
YSByZWFzb25hYmxlIHRpbWUgZm9yIGJ1Z3MgdG8gZW1lcmdlLg0KDQpUbyBzZXQgZXhwZWN0YXRp
b25zIEkgYW0gcGVyc29uYWxseSBiZSBtb3JlIGNvbnNlcnZhdGl2ZSBpbiBiZXR3ZWVuIHRoZSBS
QzMNCnRvIFJDNCB3ZWVrLCBiZWNhdXNlIHRoZSBmZWFyIG9mIGxhc3QgbWludXRlIGJ1Z3MuDQoN
CktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IFRoYW5rcywgSmFuDQo=

