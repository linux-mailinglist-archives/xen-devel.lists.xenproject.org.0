Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385EA5324EA
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 10:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336405.560715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPZR-0000mb-M1; Tue, 24 May 2022 08:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336405.560715; Tue, 24 May 2022 08:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPZR-0000jW-Ij; Tue, 24 May 2022 08:07:13 +0000
Received: by outflank-mailman (input) for mailman id 336405;
 Tue, 24 May 2022 08:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1r1=WA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ntPZP-0000jM-N4
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 08:07:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82f2325a-db38-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 10:07:10 +0200 (CEST)
Received: from DB6PR07CA0190.eurprd07.prod.outlook.com (2603:10a6:6:42::20) by
 DBAPR08MB5717.eurprd08.prod.outlook.com (2603:10a6:10:1ae::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.15; Tue, 24 May 2022 08:07:07 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::f8) by DB6PR07CA0190.outlook.office365.com
 (2603:10a6:6:42::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.7 via Frontend
 Transport; Tue, 24 May 2022 08:07:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 08:07:07 +0000
Received: ("Tessian outbound 42cead292588:v119");
 Tue, 24 May 2022 08:07:06 +0000
Received: from a0fafbd3df2f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 405CC274-4556-4DB9-BADF-75250D376570.1; 
 Tue, 24 May 2022 08:07:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a0fafbd3df2f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 08:07:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB3983.eurprd08.prod.outlook.com (2603:10a6:803:e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Tue, 24 May
 2022 08:06:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 08:06:57 +0000
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
X-Inumbo-ID: 82f2325a-db38-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=U4I5YGLOIQobneJi2EBqLt4JqBJiay+bt4HNkRmP+HBEldomUozP/Su7/girURBFYozjhjraZnVwwLP9scaV0WKWJjto++6tZz9BXBUjxPX/Blt6th1/HnVU1sf/+WOXHBkenKvoApFUklJQvpVEHbzMb0C7YgzAnItXUe3oemGiQJxwTBSRry+d0++9J2VjEmW4AbYPAmtN0jH8aARCOQMN04usFZInbgXQTdpVdsPz/oKndRrG0YiI1eOduGRlbhl6lPDmlb+3s++jDW6B8G5EX8FdpYmnQcnIQHYBrP6/YNf80yMZsYyrxBg1P0EdMt9nwLules3hvPT8QgypPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yJrjdjqvnYyzaOCe7H4G7tGSWPjbTwijcGopXXKvIQ=;
 b=TUS5L1u04WWa7m3SrRekJE+BtIEEpXs8aygv4l48lLIA3GJK87BK0RNfm+/sSwJEVeYFd/n63wv4PL8hAu7HoYg62l3jK9ZM0zXxxtZONzLCFCzsE9xnXey83p/rah7V6SZxjULkOUL/tZQov0InwqpgBXJ/x0sEu5eE0WtR1w0oBzr25e/dqjnm/HNUONqHIdcTr651zBqcg1OJJj17YD822V/eMibhQQy2VpwxCYLVb1Cvm2ySTw7ZuRzp94+ljXGrDLtQjLc51phsVjdhzL2CA8gvOzaiaymUdNAK5TDqOhYlXXSBJnD0ST+JgL7rd+i9JQ20GuyiRKmWYnSCgg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yJrjdjqvnYyzaOCe7H4G7tGSWPjbTwijcGopXXKvIQ=;
 b=YazUQYlmI1mnysB766znBtf779QFR1ab6wKo9x8zbqrs6VXK/yhBT3uifhi6uXVmMOPtncDE7/nveA0CqXHFYezWsHY2IJZI3e8w+Hp0McTCfoBBn35ZYY60gwFiWIOMOT7yJfBh6H0sdm5mlJi2Gis/qQWK/D9XhMozxB9xg28=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93d21a852ea32afb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k58c62vdc6QX9y9KqIN17o6EX14dMnY2w+NjSS2rP2ysPXzSYWsi/BJkQFn/RdtXcXEPfgcWMaEHGBwDtMGImk/So5sbfc2gXnFIOn8RIAG6DUOQMkM4vOf8X/f0DzrPPXLTF+n8KRbxaw7xv9foLetXyh8oa+rkJAOJQkxKdkfI2r6qyzdCmKnk8ShPr/yNGE+7scF+ttOubpzVlVX5wjJLJzip4QvCjYoeeUfUqM2D0WU4jP0y8yKLd2hXqCKeUbIpKPnlH2a+qxVOVf4a1u30XCeGbVe4gJ2HQLB/aQ1ZMyf562YO3lE9TrhOjRZiARMHk8Mp59jwBL0LxnucGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yJrjdjqvnYyzaOCe7H4G7tGSWPjbTwijcGopXXKvIQ=;
 b=mxnLabzpIiRIdhlpLgJ1fcHdeL3nxojsaOJAh8lN11aP8q3Pz1qvWacS6UvJnikjTw6ZAJ1zuDkm3eQquWcKyT/Xlh7rvrHm6dR/YpSwv0IHpppq1ZSYT4XaWPBZ6CDdk0pCElg+7TjMLC48gKUnwEFDc/K4qaHnbUKvIuQQShSeCpOoinGUq88DXmtEG5IpW4U4dwyDG3RZlu56m4llJ3sj6uvV/pLJWm/cy8uczj4QHlpI2zSTYC6k6FBWMUj4byWI3q2q5oZiPVH0yTmeF96PxC0iz8QR4MdVTaB8oJjlaWoKKZsC6ahFFsNNDtaKm8qCiLo8Teng1kzjhVDZKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yJrjdjqvnYyzaOCe7H4G7tGSWPjbTwijcGopXXKvIQ=;
 b=YazUQYlmI1mnysB766znBtf779QFR1ab6wKo9x8zbqrs6VXK/yhBT3uifhi6uXVmMOPtncDE7/nveA0CqXHFYezWsHY2IJZI3e8w+Hp0McTCfoBBn35ZYY60gwFiWIOMOT7yJfBh6H0sdm5mlJi2Gis/qQWK/D9XhMozxB9xg28=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Chen <Wei.Chen@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Topic: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Index: AQHYbt5OQ+9i9MqGEE+kzOfwd/8WE60tPcKAgABu+QA=
Date: Tue, 24 May 2022 08:06:57 +0000
Message-ID: <21E706F6-0625-489B-AA19-278B58CD3537@arm.com>
References: <20220523194953.70636-1-julien@xen.org>
 <PAXPR08MB74203220E82BEBB49540A7FE9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
In-Reply-To:
 <PAXPR08MB74203220E82BEBB49540A7FE9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c6d96dd1-0685-4759-f35d-08da3d5c653f
x-ms-traffictypediagnostic:
	VI1PR08MB3983:EE_|DBAEUR03FT024:EE_|DBAPR08MB5717:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5717D9D3AA803B399953A73D9DD79@DBAPR08MB5717.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2TXCLLVhWRDmc5i6C+jmeFV2lPqdlFF6+j3WL1mBXQPHB6nuGIfesVBqde3h9bOlfg/pWLKxyi6wknsQjT6PX68o1o+udDbhqDFhhOvGNe0TFTsQd+RxdwpzxHLCKTwN1s6EfLa8oygU7GpYXrfhMlr6fQZV0u00m8+ko/VD99Kt8rXb5etQCWzAMvx/0ULLHXpxdBWI9ut2usF3b3WJTLJpIcVEBtLRKUx+jwoB0yu5U7bcH0GjfJdHY+zsfiJW3GAGB9iMZFSl8w8X+DgdLxrOTTQjRk4xW8qu5ppgIZ1Tr7AaByoi4dhMrVW4P3ZQPNYNkauLNNPTyLehIQ3RIxLNyEibBCX4RfQ6ywiXXthi/kOtzk/rmgQ9VymIJkfQaAfwVthqMW9xofBwZB1y/KHv8EVIg12sDSLIhmSAJjOS9xYxBnItK+o4tJKu7Nx2wyYbKJLNVrRQpMsLaOLQGFo6v1JyndeWF7eBer09BtUv3lYlCbfgjDEdb783uOMASu7mhwtnp6fJtGDq3ViH6x5PKqaD5pTtvyvRmwGI82/UFib9pCLwotyti/e5FS3oj/M8CgPhGi+sfhtKrLHdid7WmAMP7AdnBxYqNqWlv7FWMk7W65Q9aNoGt2dHdPgWf18ehZYP+6T5BVCjsvNJgycg9cK7cojoJqiWYkQDcz4FrU6CNz5PLr8BLgrmSSxNwKK3S+4dbmg1/o0yJHR6DuC3n8bsjeek53WDZSvG6ccNREi6S5Yw0zfuXQJvLFDO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(2616005)(37006003)(6506007)(53546011)(38100700002)(33656002)(83380400001)(6486002)(36756003)(71200400001)(186003)(316002)(26005)(6512007)(508600001)(6636002)(2906002)(76116006)(6862004)(86362001)(8676002)(66476007)(66556008)(4326008)(64756008)(66446008)(66946007)(8936002)(5660300002)(91956017)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE1A6A6E47F0A741B75D13B29584D343@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3983
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5e5736f-22a0-4210-4b9a-08da3d5c5f79
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ODleFBg8Jla2wR334Qh6NtCEzc32e3rjm3jJxQ2MnrtvRXJ1oDpDCp0EyfAKAdOOndoKd/5ffKdZ2sJne+QZjhDXScXhLRqedHiMoQ4kFQdyRSY4w8EqpJfvZwq5tUokKV0LDm2SRebV7AEK4NFSVlAOqKGI2BmdJNFVNOV1j1xRswS4JNjc8SlX5fo2X9Ae0s2l53qWxYJBHQ11vicCouGi0drjNA/kZSuqw5RnqCm7d+6juHHVGZJslW7EgQ8JBcPz7BTEtThxpfgncsJMfY7/dsDipn38adt4t47dw7/hCvJaMZxYW82jkAiloLK8JBJLsZ4HVbfxRndyUzbGF/nHCLUOcHaHYb6fAYPisxIOBLEX4GNSZ5LqwanEjlMbniUamGILJQRXwdRRaFxiIzvB4fG+9cJixn2tNzhMJk2jgp/XYrC9K8lgXAVQjuJCh5whg5oxWiYOKFnPl5shDyL622dW37AQAMkcTNszhp5SULDtp5t1QSvLWEsJEsV4sNWRhxKZeu3ARgmMUKJgfnFU0JJoBFVTysCo++sQi2MQEnSP5g63Yde8MfE3a7692U7WkhlSh8WHoFHQplBxcpdtBtFt1mjU0Bz8LZHCBqz8o5z/yFHM4d+iDr5g/t7nHmK9tP6J8f+us8Rc0vay2BkAgZp3FNUlXnOUdAJ9pIic6aqKXMqxUMlJFLIUr1xK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(82310400005)(54906003)(83380400001)(508600001)(6636002)(2616005)(37006003)(316002)(336012)(47076005)(107886003)(6512007)(26005)(86362001)(186003)(40460700003)(6506007)(81166007)(6486002)(53546011)(8936002)(8676002)(70206006)(6862004)(2906002)(5660300002)(36860700001)(356005)(33656002)(4326008)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 08:07:07.1321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d96dd1-0685-4759-f35d-08da3d5c653f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5717

SGkgV2VpLA0KDQo+IE9uIDI0IE1heSAyMDIyLCBhdCAwMjoyOSwgV2VpIENoZW4gPFdlaS5DaGVu
QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgSnVsaWVuLA0KPiANCj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4+IEp1bGllbiBHcmFsbA0KPj4gU2VudDog
MjAyMuW5tDXmnIgyNOaXpSAzOjUwDQo+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+PiBDYzoganVsaWVuQHhlbi5vcmc7IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4+IFZvbG9keW15ciBC
YWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEtvbnJhZCBSemVzenV0ZWsgV2ls
aw0KPj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdl
cndhbGxAY2l0cml4LmNvbT4NCj4+IFN1YmplY3Q6IFtQQVRDSF0geGVuL2FybTogUmVtb3ZlIG1v
c3Qgb2YgdGhlICpfVklSVF9FTkQgZGVmaW5lcw0KPj4gDQo+PiBGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPg0KPj4gDQo+PiBBdCB0aGUgbW9tZW50LCAqX1ZJUlRfRU5EIG1h
eSBlaXRoZXIgcG9pbnQgdG8gdGhlIGFkZHJlc3MgYWZ0ZXIgdGhlIGVuZA0KPj4gb3IgdGhlIGxh
c3QgYWRkcmVzcyBvZiB0aGUgcmVnaW9uLg0KPj4gDQo+PiBUaGUgbGFjayBvZiBjb25zaXN0ZW5j
eSBtYWtlIHF1aXRlIGRpZmZpY3VsdCB0byByZWFzb24gd2l0aCB0aGVtLg0KPj4gDQo+PiBGdXJ0
aGVybW9yZSwgdGhlcmUgaXMgYSByaXNrIG9mIG92ZXJmbG93IGluIHRoZSBjYXNlIHdoZXJlIHRo
ZSBhZGRyZXNzDQo+PiBwb2ludHMgcGFzdCB0byB0aGUgZW5kLiBJIGFtIG5vdCBhd2FyZSBvZiBh
bnkgY2FzZXMsIHNvIHRoaXMgaXMgb25seSBhDQo+PiBsYXRlbnQgYnVnLg0KPj4gDQo+PiBTdGFy
dCB0byBzb2x2ZSB0aGUgcHJvYmxlbSBieSByZW1vdmluZyBhbGwgdGhlICpfVklSVF9FTkQgZXhj
bHVzaXZlbHkgdXNlZA0KPj4gYnkgdGhlIEFybSBjb2RlIGFuZCBhZGQgKl9WSVJUX1NJWkUgd2hl
biBpdCBpcyBub3QgcHJlc2VudC4NCj4+IA0KPj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVu
YW1lIEJPT1RfRkRUX1NMT1RfU0laRSB0byBCT09UX0ZEVF9WSVJUX1NJWkUNCj4+IGZvciBiZXR0
ZXIgY29uc2lzdGVuY3kgYW5kIHVzZSBfQVQodmFkZHJfdCwgKS4NCj4+IA0KPj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+IA0KPj4gLS0tLQ0KPj4g
DQo+PiBJIG5vdGljZWQgdGhhdCBhIGZldyBmdW5jdGlvbnMgaW4gWGVuIGV4cGVjdCBbc3RhcnQs
IGVuZFsuIFRoaXMgaXMgcmlza3kNCj4+IGFzIHdlIG1heSBlbmQgdXAgd2l0aCBlbmQgPCBzdGFy
dCBpZiB0aGUgcmVnaW9uIGlzIGRlZmluZWQgcmlnaHQgYXQgdGhlDQo+PiB0b3Agb2YgdGhlIGFk
ZHJlc3Mgc3BhY2UuDQo+PiANCj4+IEkgaGF2ZW4ndCB5ZXQgdGFja2xlIHRoaXMgaXNzdWUuIEJ1
dCBJIHdvdWxkIGF0IGxlYXN0IGxpa2UgdG8gZ2V0IHJpZA0KPj4gb2YgKl9WSVJUX0VORC4NCj4+
IC0tLQ0KPj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NvbmZpZy5oIHwgMTggKysrKysrKyst
LS0tLS0tLS0tDQo+PiB4ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMgfCAyICstDQo+PiB4ZW4vYXJj
aC9hcm0vbW0uYyB8IDEzICsrKysrKysrLS0tLS0NCj4+IDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vY29uZmlnLmgNCj4+IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2NvbmZpZy5oDQo+PiBpbmRleCAzZTJhNTVhOTEwNTguLjY2ZGI2MThiMzRlNyAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jb25maWcuaA0KPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2NvbmZpZy5oDQo+PiBAQCAtMTExLDEyICsxMTEsMTEgQEANCj4+
ICNkZWZpbmUgRklYTUFQX0FERFIobikgKF9BVCh2YWRkcl90LDB4MDA0MDAwMDApICsgKG4pICog
UEFHRV9TSVpFKQ0KPj4gDQo+PiAjZGVmaW5lIEJPT1RfRkRUX1ZJUlRfU1RBUlQgX0FUKHZhZGRy
X3QsMHgwMDYwMDAwMCkNCj4+IC0jZGVmaW5lIEJPT1RfRkRUX1NMT1RfU0laRSBNQig0KQ0KPj4g
LSNkZWZpbmUgQk9PVF9GRFRfVklSVF9FTkQgKEJPT1RfRkRUX1ZJUlRfU1RBUlQgKyBCT09UX0ZE
VF9TTE9UX1NJWkUpDQo+PiArI2RlZmluZSBCT09UX0ZEVF9WSVJUX1NJWkUgX0FUKHZhZGRyX3Qs
IE1CKDQpKQ0KPj4gDQo+PiAjaWZkZWYgQ09ORklHX0xJVkVQQVRDSA0KPj4gI2RlZmluZSBMSVZF
UEFUQ0hfVk1BUF9TVEFSVCBfQVQodmFkZHJfdCwweDAwYTAwMDAwKQ0KPj4gLSNkZWZpbmUgTElW
RVBBVENIX1ZNQVBfRU5EIChMSVZFUEFUQ0hfVk1BUF9TVEFSVCArIE1CKDIpKQ0KPj4gKyNkZWZp
bmUgTElWRVBBVENIX1ZNQVBfU0laRSBfQVQodmFkZHJfdCwgTUIoMikpDQo+PiAjZW5kaWYNCj4+
IA0KPj4gI2RlZmluZSBIWVBFUlZJU09SX1ZJUlRfU1RBUlQgWEVOX1ZJUlRfU1RBUlQNCj4+IEBA
IC0xMzIsMTggKzEzMSwxOCBAQA0KPj4gI2RlZmluZSBGUkFNRVRBQkxFX1ZJUlRfRU5EIChGUkFN
RVRBQkxFX1ZJUlRfU1RBUlQgKyBGUkFNRVRBQkxFX1NJWkUgLQ0KPj4gMSkNCj4+IA0KPj4gI2Rl
ZmluZSBWTUFQX1ZJUlRfU1RBUlQgX0FUKHZhZGRyX3QsMHgxMDAwMDAwMCkNCj4+ICsjZGVmaW5l
IFZNQVBfVklSVF9TSVpFIF9BVCh2YWRkcl90LCBHQigxKSAtIE1CKDI1NikpDQo+PiANCj4+ICNk
ZWZpbmUgWEVOSEVBUF9WSVJUX1NUQVJUIF9BVCh2YWRkcl90LDB4NDAwMDAwMDApDQo+PiAtI2Rl
ZmluZSBYRU5IRUFQX1ZJUlRfRU5EIF9BVCh2YWRkcl90LDB4N2ZmZmZmZmYpDQo+PiAtI2RlZmlu
ZSBET01IRUFQX1ZJUlRfU1RBUlQgX0FUKHZhZGRyX3QsMHg4MDAwMDAwMCkNCj4+IC0jZGVmaW5l
IERPTUhFQVBfVklSVF9FTkQgX0FUKHZhZGRyX3QsMHhmZmZmZmZmZikNCj4+ICsjZGVmaW5lIFhF
TkhFQVBfVklSVF9TSVpFIF9BVCh2YWRkcl90LCBHQigxKSkNCj4+IA0KPj4gLSNkZWZpbmUgVk1B
UF9WSVJUX0VORCBYRU5IRUFQX1ZJUlRfU1RBUlQNCj4+ICsjZGVmaW5lIERPTUhFQVBfVklSVF9T
VEFSVCBfQVQodmFkZHJfdCwweDgwMDAwMDAwKQ0KPj4gKyNkZWZpbmUgRE9NSEVBUF9WSVJUX1NJ
WkUgX0FUKHZhZGRyX3QsIEdCKDIpKQ0KPj4gDQo+PiAjZGVmaW5lIERPTUhFQVBfRU5UUklFUyAx
MDI0IC8qIDEwMjQgMk1CIG1hcHBpbmcgc2xvdHMgKi8NCj4+IA0KPj4gLyogTnVtYmVyIG9mIGRv
bWhlYXAgcGFnZXRhYmxlIHBhZ2VzIHJlcXVpcmVkIGF0IHRoZSBzZWNvbmQgbGV2ZWwgKDJNQg0K
Pj4gbWFwcGluZ3MpICovDQo+PiAtI2RlZmluZSBET01IRUFQX1NFQ09ORF9QQUdFUyAoKERPTUhF
QVBfVklSVF9FTkQgLSBET01IRUFQX1ZJUlRfU1RBUlQgKw0KPj4gMSkgPj4gRklSU1RfU0hJRlQp
DQo+PiArI2RlZmluZSBET01IRUFQX1NFQ09ORF9QQUdFUyAoRE9NSEVBUF9WSVJUX1NJWkUgPj4g
RklSU1RfU0hJRlQpDQo+PiANCj4+ICNlbHNlIC8qIEFSTV82NCAqLw0KPj4gDQo+PiBAQCAtMTUy
LDEyICsxNTEsMTEgQEANCj4+ICNkZWZpbmUgU0xPVDBfRU5UUllfU0laRSBTTE9UMCgxKQ0KPj4g
DQo+PiAjZGVmaW5lIFZNQVBfVklSVF9TVEFSVCBHQigxKQ0KPj4gLSNkZWZpbmUgVk1BUF9WSVJU
X0VORCAoVk1BUF9WSVJUX1NUQVJUICsgR0IoMSkpDQo+PiArI2RlZmluZSBWTUFQX1ZJUlRfU0la
RSBHQigxKQ0KPj4gDQo+PiAjZGVmaW5lIEZSQU1FVEFCTEVfVklSVF9TVEFSVCBHQigzMikNCj4+
ICNkZWZpbmUgRlJBTUVUQUJMRV9TSVpFIEdCKDMyKQ0KPj4gI2RlZmluZSBGUkFNRVRBQkxFX05S
IChGUkFNRVRBQkxFX1NJWkUgLyBzaXplb2YoKmZyYW1lX3RhYmxlKSkNCj4+IC0jZGVmaW5lIEZS
QU1FVEFCTEVfVklSVF9FTkQgKEZSQU1FVEFCTEVfVklSVF9TVEFSVCArIEZSQU1FVEFCTEVfU0la
RSAtDQo+PiAxKQ0KPj4gDQo+PiAjZGVmaW5lIERJUkVDVE1BUF9WSVJUX1NUQVJUIFNMT1QwKDI1
NikNCj4+ICNkZWZpbmUgRElSRUNUTUFQX1NJWkUgKFNMT1QwX0VOVFJZX1NJWkUgKiAoMjY1LTI1
NikpDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jIGIveGVuL2FyY2gv
YXJtL2xpdmVwYXRjaC5jDQo+PiBpbmRleCA3NWU4YWRjZmQ2YTEuLjU3YWJjNzQ2ZTYwYiAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9saXZlcGF0Y2guYw0KPj4gKysrIGIveGVuL2FyY2gv
YXJtL2xpdmVwYXRjaC5jDQo+PiBAQCAtMTc1LDcgKzE3NSw3IEBAIHZvaWQgX19pbml0IGFyY2hf
bGl2ZXBhdGNoX2luaXQodm9pZCkNCj4+IHZvaWQgKnN0YXJ0LCAqZW5kOw0KPj4gDQo+PiBzdGFy
dCA9ICh2b2lkICopTElWRVBBVENIX1ZNQVBfU1RBUlQ7DQo+PiAtIGVuZCA9ICh2b2lkICopTElW
RVBBVENIX1ZNQVBfRU5EOw0KPj4gKyBlbmQgPSBzdGFydCArIExJVkVQQVRDSF9WTUFQX1NJWkU7
DQo+PiANCj4+IHZtX2luaXRfdHlwZShWTUFQX1hFTiwgc3RhcnQsIGVuZCk7DQo+PiANCj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+PiBpbmRl
eCBiZTM3MTc2YTQ3MjUuLjA2MDdjNjVmOTVjZCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9tbS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYw0KPj4gQEAgLTEyOCw5ICsxMjgsMTEg
QEAgc3RhdGljIERFRklORV9QQUdFX1RBQkxFKHhlbl9maXJzdCk7DQo+PiAvKiB4ZW5fcGd0YWJs
ZSA9PSByb290IG9mIHRoZSB0cmllICh6ZXJvZXRoIGxldmVsIG9uIDY0LWJpdCwgZmlyc3Qgb24g
MzItDQo+PiBiaXQpICovDQo+PiBzdGF0aWMgREVGSU5FX1BFUl9DUFUobHBhZV90ICosIHhlbl9w
Z3RhYmxlKTsNCj4+ICNkZWZpbmUgVEhJU19DUFVfUEdUQUJMRSB0aGlzX2NwdSh4ZW5fcGd0YWJs
ZSkNCj4+IC0vKiB4ZW5fZG9tbWFwID09IHBhZ2VzIHVzZWQgYnkgbWFwX2RvbWFpbl9wYWdlLCB0
aGVzZSBwYWdlcyBjb250YWluDQo+PiArLyoNCj4+ICsgKiB4ZW5fZG9tbWFwID09IHBhZ2VzIHVz
ZWQgYnkgbWFwX2RvbWFpbl9wYWdlLCB0aGVzZSBwYWdlcyBjb250YWluDQo+PiAqIHRoZSBzZWNv
bmQgbGV2ZWwgcGFnZXRhYmxlcyB3aGljaCBtYXAgdGhlIGRvbWhlYXAgcmVnaW9uDQo+PiAtICog
RE9NSEVBUF9WSVJUX1NUQVJULi4uRE9NSEVBUF9WSVJUX0VORCBpbiAyTUIgY2h1bmtzLiAqLw0K
Pj4gKyAqIHN0YXJ0aW5nIGF0IERPTUhFQVBfVklSVF9TVEFSVCBpbiAyTUIgY2h1bmtzLg0KPj4g
KyAqLw0KPj4gc3RhdGljIERFRklORV9QRVJfQ1BVKGxwYWVfdCAqLCB4ZW5fZG9tbWFwKTsNCj4+
IC8qIFJvb3Qgb2YgdGhlIHRyaWUgZm9yIGNwdTAsIG90aGVyIENQVSdzIFBUcyBhcmUgZHluYW1p
Y2FsbHkgYWxsb2NhdGVkDQo+PiAqLw0KPj4gc3RhdGljIERFRklORV9QQUdFX1RBQkxFKGNwdTBf
cGd0YWJsZSk7DQo+PiBAQCAtNDc2LDcgKzQ3OCw3IEBAIG1mbl90IGRvbWFpbl9wYWdlX21hcF90
b19tZm4oY29uc3Qgdm9pZCAqcHRyKQ0KPj4gaW50IHNsb3QgPSAodmEgLSBET01IRUFQX1ZJUlRf
U1RBUlQpID4+IFNFQ09ORF9TSElGVDsNCj4+IHVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gKHZhPj5U
SElSRF9TSElGVCkgJiBYRU5fUFRfTFBBRV9FTlRSWV9NQVNLOw0KPj4gDQo+PiAtIGlmICggdmEg
Pj0gVk1BUF9WSVJUX1NUQVJUICYmIHZhIDwgVk1BUF9WSVJUX0VORCApDQo+PiArIGlmICggKHZh
ID49IFZNQVBfVklSVF9TVEFSVCkgJiYgKChWTUFQX1ZJUlRfU1RBUlQgLSB2YSkgPA0KPj4gVk1B
UF9WSVJUX1NJWkUpICkNCj4+IHJldHVybiB2aXJ0X3RvX21mbih2YSk7DQo+PiANCj4+IEFTU0VS
VChzbG90ID49IDAgJiYgc2xvdCA8IERPTUhFQVBfRU5UUklFUyk7DQo+PiBAQCAtNTcwLDcgKzU3
Miw4IEBAIHZvaWQgX19pbml0IHJlbW92ZV9lYXJseV9tYXBwaW5ncyh2b2lkKQ0KPj4gaW50IHJj
Ow0KPj4gDQo+PiAvKiBkZXN0cm95IHRoZSBfUEFHRV9CTE9DSyBtYXBwaW5nICovDQo+PiAtIHJj
ID0gbW9kaWZ5X3hlbl9tYXBwaW5ncyhCT09UX0ZEVF9WSVJUX1NUQVJULCBCT09UX0ZEVF9WSVJU
X0VORCwNCj4+ICsgcmMgPSBtb2RpZnlfeGVuX21hcHBpbmdzKEJPT1RfRkRUX1ZJUlRfU1RBUlQs
DQo+PiArIEJPT1RfRkRUX1ZJUlRfU1RBUlQgKyBCT09UX0ZEVF9WSVJUX1NJWkUsDQo+PiBfUEFH
RV9CTE9DSyk7DQo+PiBCVUdfT04ocmMpOw0KPj4gfQ0KPj4gQEAgLTg1MCw3ICs4NTMsNyBAQCB2
b2lkIF9faW5pdCBzZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzKHBhZGRyX3QgcHMsDQo+PiBwYWRk
cl90IHBlKQ0KPj4gDQo+PiB2b2lkICpfX2luaXQgYXJjaF92bWFwX3ZpcnRfZW5kKHZvaWQpDQo+
PiB7DQo+PiAtIHJldHVybiAodm9pZCAqKVZNQVBfVklSVF9FTkQ7DQo+PiArIHJldHVybiAodm9p
ZCAqKShWTUFQX1ZJUlRfU1RBUlQgKyBWTUFQX1ZJUlRfU0laRSk7DQo+IA0KPiBJdCBzZWVtcyB5
b3UgcHJlZmVyIHRvIHBvaW50IF9lbmQgdG8gdGhlIGFkZHJlc3MgYWZ0ZXIgdGhlIGVuZC4gRXZl
bg0KPiB0aG91Z2ggd2UgZ290IHJpZCBvZiB0aGUgbWFjcm8gZGVmaW5pdGlvbiBvZiBfRU5ELiBC
dXQgd2UgZGlkbid0IGFncmVlDQo+IG9uIGhvdyB0byB1c2UgaXQuIEZvciBtZSwgd2hlbiBJIGZp
cnN0IHNhdw0KPiAiZW5kID0gc3RhcnQgKyBMSVZFUEFUQ0hfVk1BUF9TSVpFIiBJIHN1YmNvbnNj
aW91c2x5IHRoaW5rIHRoZSAtMSBpcw0KPiBtaXNzaW5nIGhlcmUuIEkgZXZlbiBhZGRlZCBhIGNv
bW1lbnQsIGJ1dCByZW1vdmVkIGl0IHdoZW4gSSByZWFjaGVkDQo+IHRvIHRoaXMgbGluZSA6ICkN
Cj4gTWF5IGJlIGl0J3MgYmV0dGVyIHRvIHBsYWNlIHNvbWUgY29kZSBndWlkZSBmb3IgRU5EIGlu
IGNvZGUgY29tbWVudA0KPiBpbiB0aGUgU0laRSBkZWZpbml0aW9uLCBvdGhlcndpc2UsIHdlIG1h
eSBoYXZlIGRpZmZlcmVudCBwb2ludCBhZGRyZXNzZXMNCj4gb2YgX2VuZCBmdW5jdGlvbnMuDQoN
CkkgdGhpbmsgaXQgaXMgcXVpdGUgY29tbW9uIHRvIGhhdmUgc2l6ZSBiZWluZyB0aGUgYWN0dWFs
IHNpemUgYW5kIG5vdCBzaXplIC0xLg0KRU5EIGlzIGNsZWFybHkgdGhlIGxhc3QgYWRkcmVzcyBv
ZiB0aGUgYXJlYSBidXQgU0laRSBzaG91bGQgYmUgdGhlIG51bWJlcg0Kb2YgYnl0ZXMgaW4gdGhl
IGFyZWEgc28gSSB0aGluayBKdWxpZW4gaGVyZSBpcyByaWdodC4NCg0KQ2hlZXJzDQpCZXJ0cmFu
ZA0KDQo+IA0KPiBDaGVlcnMsDQo+IFdlaSBDaGVuDQo+IA0KPj4gfQ0KPj4gDQo+PiAvKg0KPj4g
LS0NCj4+IDIuMzIuMA0KDQo=

