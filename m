Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D30776190
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 15:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581114.909661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjWq-0006J0-Uo; Wed, 09 Aug 2023 13:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581114.909661; Wed, 09 Aug 2023 13:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjWq-0006FA-Rl; Wed, 09 Aug 2023 13:47:12 +0000
Received: by outflank-mailman (input) for mailman id 581114;
 Wed, 09 Aug 2023 13:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmRr=D2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTjWp-0006F4-UU
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 13:47:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ca472a5-36bb-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 15:47:10 +0200 (CEST)
Received: from AS9PR05CA0085.eurprd05.prod.outlook.com (2603:10a6:20b:499::21)
 by AS8PR08MB8972.eurprd08.prod.outlook.com (2603:10a6:20b:5b1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 13:47:03 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:499:cafe::87) by AS9PR05CA0085.outlook.office365.com
 (2603:10a6:20b:499::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Wed, 9 Aug 2023 13:47:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Wed, 9 Aug 2023 13:47:02 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Wed, 09 Aug 2023 13:47:02 +0000
Received: from e50cb6b2a6fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 13122922-4605-48AF-A6AB-39F962C47799.1; 
 Wed, 09 Aug 2023 13:46:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e50cb6b2a6fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Aug 2023 13:46:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8116.eurprd08.prod.outlook.com (2603:10a6:10:3ec::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 13:46:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 13:46:14 +0000
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
X-Inumbo-ID: 3ca472a5-36bb-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIERSjKWNtMQeI30hlttanV74S1x+tMjIBCWEsekEDE=;
 b=JS/9zyPB/Lz+pCT+egWgsbfaWN8sX+ykeMT+FRjgQUs2NTGzJnXaKBc8rSfu6ZcWXBbSqksiP24j2NXNqUAezrlBbIq0LN+XUYH8OTihDKjWaUgAKIYz1iR8yJKUmv5GpkyB5fQb3gxqnQivrEqUKfrJEC8kTBhGNxA2kzt8xtU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b44125c2c1412d39
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq67HLxrFClvX6EG2b1kHk+9kB3nrZE02/XYCwOJJEBwJbEY33YgChYeVYMfLKsAUatuOrov3pNIB3O/d+YOo58cktSQ7He1oZOkzIDmjsOLbLcYOCwFkrkZgvELH7qt4rxPfjp1u/JiuX1HLoyawMupCvqarTzZJGbRueFRy8yfP1DHm4khvuiVo6IJgl5FJrHbegOWUMvSSYXrd1mIfL+OFs5/tmIixX5bGvbfkKS22ScQAc7JWc8qXXr+4HvJV2ppKubRS8HLBUDjfqgLPEpCFiPkimslq1K8qzKmEHaxLc6d+OtgI0Oxr5whFnARrwnZA9ADXIOet6MCt8ik8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIERSjKWNtMQeI30hlttanV74S1x+tMjIBCWEsekEDE=;
 b=MYtw+7feV3Tbt3rUSXPhZHtQgrq7xJWL5s8Ko5fvZ0aw0a8ijMhEW0/GaWymEE4DlDcZRCJcOuq0E+Y6jNw6eY2TEw0yZQNE/AZ+vT4H/piOvqjwHbDZwL8t3MPtMjW9KwZTs9v7/VCesq7r5xQLOkpE9rL1o91C/BetdYXNabpB3TEdYJFoBWB9pSOyuwWYqs6X7nz2SvoqAlEQV4b2odDc8aewQw/EoTaSzkGteCM2r1KgGM4ez+ynnaIc1IE1c5obodQwHoQ0WbWEKoujguXIgHkO+m3EcHp9AYhfEMPFuSbFSIdpb8JgID+jPSR8IG1w2L+ue6x9uNZGlLpmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIERSjKWNtMQeI30hlttanV74S1x+tMjIBCWEsekEDE=;
 b=JS/9zyPB/Lz+pCT+egWgsbfaWN8sX+ykeMT+FRjgQUs2NTGzJnXaKBc8rSfu6ZcWXBbSqksiP24j2NXNqUAezrlBbIq0LN+XUYH8OTihDKjWaUgAKIYz1iR8yJKUmv5GpkyB5fQb3gxqnQivrEqUKfrJEC8kTBhGNxA2kzt8xtU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 1/8] arm/efi: address MISRA C:2012 Rule 8.4
Thread-Topic: [XEN PATCH 1/8] arm/efi: address MISRA C:2012 Rule 8.4
Thread-Index: AQHZyrEbxFin9q0gU0Kc4Cnx0VHQla/h+kkA
Date: Wed, 9 Aug 2023 13:46:14 +0000
Message-ID: <D4DD2E2D-85FC-4614-BB4E-D72FF3B0F58D@arm.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <4d087a54edb3f92e9271e3d01c1abebf00d3e298.1691575243.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <4d087a54edb3f92e9271e3d01c1abebf00d3e298.1691575243.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8116:EE_|AM7EUR03FT015:EE_|AS8PR08MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: a3b4435f-c8b3-4806-8d9e-08db98df1c66
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /Pu57sFhVnhcIBRCK1cwPqGS+Epw+/EDIT5ZOL/XK18iTSQKpiywBpc+Giyq8u5bDYISrz/x2TfX7s6kXeTHP5Dhv18R5qr8iEaXScGg3jPuXHr28TY7beiSOn1aveP4qPBefGh5w3Lvyjyvv9pawWPJFuBjf3eAQDA0xYLuG0OGK84ZBn4RH5D1fbh4bSZS/37BopxD5Gb+OQ9utgSjq3ZLBfl0wVLSRdHGgFlV9Y3x55ElP83FzpRui/dag2zOM53wg6pPc5aP+nYeF4peL7V1Lv1AmVnC9cein0sgx3Ze3Zs/z0AFVLlZsUsrHu9sEe1ewwge+6I1uxx5lzC3xZQ4NzLRIPCJ4MGtIYLetilpc5lBNpHuowuI/qc0Jge4GkyisjN9BHwjPueY51a9a070WO54/ILPyPMJOjLacChyZt8vAayX5wG1MdEwfje1e8XkeJLHQvO8fTbqtD4otcrIpdwQSmX4Iqt2/4+roS86d34a7x8bZO0F7i4UMnXw8GD0ecqplE7FDHXIvGZSS3OQULZNtngPj//fqcQQ81ckrBHFcA5aOBBpd8hvV3sdgdS7clw9ZmNlCQIsnV8q3wAnSuLhpQZGA+HCkAyYBGbYRzW+OBJg/u9AjA/zu6K4P4+tm3/ycRdqtF5xfPMFWg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(186006)(1800799006)(451199021)(316002)(2616005)(2906002)(4744005)(122000001)(36756003)(71200400001)(6506007)(8676002)(5660300002)(53546011)(6486002)(38100700002)(26005)(66446008)(64756008)(41300700001)(6916009)(76116006)(66476007)(4326008)(66556008)(66946007)(54906003)(33656002)(86362001)(91956017)(38070700005)(8936002)(6512007)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A52F88E1D468D4D8879FC51DF280EDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8116
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02ad181f-192c-453c-9a72-08db98deffb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fu/Q295nMAvQo92MlKZZJaE9yF8bSFNeyOK+4/qSmG1VEatG6rCMrfUtXhvSBfUmBNZtiOeN5rItp74oiTgEqmov11Lu5AaGmr/VfSybSmvBYRdqxuCi4IpIylO2C7zLlMe+YMblsoYXUgv4FKUIom8NwQkJCgz8A7YTP04YfL1rsVNKBLrzEB5J3sPvyEQjlzeEHbHH4k5sbuMP+rvJMSy8fO976aj5wMoJ+THJAQarJwxcXmqxkefnPqnc8/C8mo84Lwczv8UOq8nPXMJpHJW437sQ5zFzIby3V+Djyq6psfV0X8vywjddUwbnriSgdgvueb+56sKIiY+YbVGy9rMl8Pogv8C0TVZF0ajbagc9laEgu4QT8jEVZ8LribqTXlAdd626q9F1d8zjgognEem40pmkgO/Z9Ep9075m29HbXF+rPDqIXuwbHRjgb8x+rsf5UbfjBktUK2PqthH/xQhIogP+Hj8kaI371eUqu8S/oooihqK9HSml92vi+3qy3hEssLpD8wSYnYJIMVkgDR1JJh0YKkBWBs4NaKIq5UqdTNGH0/dOv2fkD288Nd7BPPFkYgMz7AQliANH7TVks+4BGhcZuVJDrXKtcF+n+kJOIFYw81TDCe+QjFTL2iSc2zX3rEOY4JWWyZQ6Nu6zol2F6YFjZcKGFzDu05cDuPOIsRPC8D22ME30aoS4/GB2PdLZSCk5bve4nUUIKqyN/q5eDjKnH44Wpkj/2Co3jHIAyhdjz6vnEMrHeAbyc8jS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(1800799006)(451199021)(82310400008)(186006)(46966006)(36840700001)(40470700004)(8676002)(6862004)(5660300002)(8936002)(81166007)(40480700001)(356005)(82740400003)(4744005)(40460700003)(2906002)(86362001)(2616005)(6486002)(336012)(54906003)(478600001)(107886003)(33656002)(26005)(6506007)(53546011)(6512007)(36756003)(4326008)(36860700001)(41300700001)(316002)(47076005)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 13:47:02.4044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b4435f-c8b3-4806-8d9e-08db98df1c66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8972

DQoNCj4gT24gOSBBdWcgMjAyMywgYXQgMTI6MDIsIE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0
cmluaUBidWdzZW5nLmNvbT4gd3JvdGU6DQo+IA0KPiB0aGUgZnVuY3Rpb24gJ2ZkdF9hZGRfdWVm
aV9ub2RlcycgY2FuIGJlIGRlZmluZWQgc3RhdGljLCBhcyBpdHMNCj4gb25seSBjYWxsZXJzIGFy
ZSB3aXRoaW4gdGhlIHNhbWUgZmlsZS4gVGhpcyBpbiB0dXJuIGF2b2lkcw0KPiB2aW9sYXRpbmcg
UnVsZSA4LjQgYmVjYXVzZSBubyBkZWNsYXJhdGlvbiBpcyBwcmVzZW50Lg0KPiANCj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGEgVmV0cmluaSA8bmlj
b2xhLnZldHJpbmlAYnVnc2VuZy5jb20+DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxs
dWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCldpdGgNCg0KRml4ZXM6IDZkNzBlYTEwZDQ5ZiAoIkFk
ZCBBUk0gRUZJIGJvb3Qgc3VwcG9ydOKAnSkNCg0KDQoNCg==

