Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB88262295B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 11:58:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440853.695079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osilR-0003nc-AF; Wed, 09 Nov 2022 10:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440853.695079; Wed, 09 Nov 2022 10:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osilR-0003kF-70; Wed, 09 Nov 2022 10:57:01 +0000
Received: by outflank-mailman (input) for mailman id 440853;
 Wed, 09 Nov 2022 10:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mL0W=3J=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1osilQ-0003k9-Cs
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 10:57:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60076.outbound.protection.outlook.com [40.107.6.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b22f178-601d-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 11:56:58 +0100 (CET)
Received: from AS9PR06CA0350.eurprd06.prod.outlook.com (2603:10a6:20b:466::10)
 by DB8PR08MB5306.eurprd08.prod.outlook.com (2603:10a6:10:117::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 10:56:56 +0000
Received: from VI1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::35) by AS9PR06CA0350.outlook.office365.com
 (2603:10a6:20b:466::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 10:56:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT040.mail.protection.outlook.com (100.127.145.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 10:56:55 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Wed, 09 Nov 2022 10:56:55 +0000
Received: from e6557a4a4960.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA3A37F3-7D22-40A7-8417-A64E999A8A20.1; 
 Wed, 09 Nov 2022 10:56:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6557a4a4960.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 10:56:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7941.eurprd08.prod.outlook.com (2603:10a6:20b:539::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 10:56:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Wed, 9 Nov 2022
 10:56:46 +0000
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
X-Inumbo-ID: 3b22f178-601d-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gi9XkfkFTgsWbO2tKnd2V+tU98+LxfMrWYPAHKfbAXI/BRfN1nSo1mApVif90lTmDlR4gNjLlOBPAc2mnEWVTz2XK5sxXtKmgCB6Ndiy7EcsKEE9NF8+hJfrEIHsWPhVW23pHP/t1stc5QDoQFFzqgvsn3oLvIQESNES75xxY2Y3cZZCbspUuVq+LO9avqkhOABQUY36eRrN6CcpCVXlUO/KzJf/lENWtfsf3oMIzYa77lUHMcnmOrqEd7fuaW2py7UhlXk6OlN/84RkuC4UM13oxQ6ji2Pr57wWQ0UCna8LfAi4E4EB3QmqQsyxM8wZmYJQdEYYKBiA1wQ4aAyAfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjzQ7RvglG5pfmMXHkG+pwMUwZ5FqKf4opNhriAfMng=;
 b=SDOmQamxnXPs9tQvyPP1S9LefcBN3c7ffb1VvUbAXInNfPh6IH3rHDZuGTtwsw0u1DDqAmJYAOb6+TzrINhc2yRrxPP4BrNZWLbaizYL5NrKv6BUA/l4Otim8ReAQq9el2S50EFIGTS2zG8iQ0azvGAjPO16jHThWQNrfhVoj1wxRovuIut3nfJVZpMIt8+X2y6+MpoMncQDQR7hkAaTcshnJxb8J8ZScTvrnjsJ6F1Jx2a8LPLaMeYAw7pV1CH1X0AsxRvGb+FaBZdRm0Zj0SH8Y5BTvpHNvPnbJpGzey/92AzsCjLxoIhQVxStYc0sZWQPBTBdA83BXN6uZZgjeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjzQ7RvglG5pfmMXHkG+pwMUwZ5FqKf4opNhriAfMng=;
 b=tDJyZnWWohQ0dEFqb/sSBWQdxQDvtjzWL8MumH0lHr4LXhi0ahPldpvgXL2jfhgvETXMmjronJsrNSVW/8nDOQaxbA4FUky7TKK1oIlxG3zUFUryNIpXT6Wssu9DXuHHN2EzRvmIBDitsgHWKNTWGP4rieFp5hZKRjqpu5Lwurs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLfUA2l6EERI7O7F45I9BFhJQttMD1J/CjDqtcTkT3EqoBMn37gXB37jEDrY1hOrGJ5YH2WPO7zavANF6EwtfnAwQ9T696ycKeT6P3/Ktl6TSOBYiPB0cMuKcT6ISXP/2eODez4l2Egwnt6vydbPLvTxj0yu3pYBOeXcpSnKMeEbZlxKyAmZL1c4xIboOYPs3sTaXOU8u2Gfr/xme4FTsMTASKgepXfuBMqT6xipjLLwyQ3SEyvxX8zcWAVXlSazqNJkaZxgjTQNg+WY8F1LAePLgK86UIefIHSpvUkG5qRtvfoHuAQozGwGHn1t8bqK0xDarDLInlhq39VDTAaoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjzQ7RvglG5pfmMXHkG+pwMUwZ5FqKf4opNhriAfMng=;
 b=M91dpsBAXypz44KfZvE/JszjoHPKmURvak6+ACWjccwBUlJ6G5jDxNiC9z7b+km2jCtKIuSYPhjcR1plv3bVQy43kJVlYZwwgaMbtQPny4Qo90DEAlO1LxA7D2KDDbF4tKQz4Mo2V1c1Ro9/eey1fG6o1mzAcTuKKsZHfHACdkDp351RL1tWrxVi6mwgPZOxydQJ9E+btXieH1wwdxlVDubt990FsjyWMVjDW8Pj599hz2C7hYOQzBqZmNZYkbUSU8MzFyXCGvu8E1Av4WdXwuXbLyuTMtMFGy5NlHfd5Q58lrOr6igJwbEmHEOO3i+d6o+r31V1sI8iLrIWL9H9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjzQ7RvglG5pfmMXHkG+pwMUwZ5FqKf4opNhriAfMng=;
 b=tDJyZnWWohQ0dEFqb/sSBWQdxQDvtjzWL8MumH0lHr4LXhi0ahPldpvgXL2jfhgvETXMmjronJsrNSVW/8nDOQaxbA4FUky7TKK1oIlxG3zUFUryNIpXT6Wssu9DXuHHN2EzRvmIBDitsgHWKNTWGP4rieFp5hZKRjqpu5Lwurs=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC
 assist options
Thread-Topic: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Thread-Index: AQHY8GkebAmmr6JZXEeYf3zz1Gj/l64zs2EAgAK/RgA=
Date: Wed, 9 Nov 2022 10:56:46 +0000
Message-ID:
 <AS8PR08MB79917BB9C22016A4863A3264923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <4c8d31de-539a-4252-f0a1-617b220eadc2@suse.com>
In-Reply-To: <4c8d31de-539a-4252-f0a1-617b220eadc2@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6E9F281EE0937345938CE18B17326DE9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB7941:EE_|VI1EUR03FT040:EE_|DB8PR08MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 16efc7bf-54ff-43d4-1d44-08dac2411dd7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SmkjHk6g2JlsemROO4FTGXKbJgwknE44/P6UF2G5ms2jfaQ5c5of9V9Io0VKbI7LNwAnMGpjsckMY8G9wkZmOuL03hgSEvgEnY4oYqJ9oh0JBWVnDSZJ97M0jfGnj0GgGgOfnRkNUuYEr7liqkCI5XY6yAQsqSxZ0we0r5kEwTKIid0CdU1HgZDhJFOen9lDr54sCEFxODA9Zgp56YVpB/j8+AwHXyEU7KV5Jqb8lIfaHHD/kObz8MEe3kj/NUAH+Pm5OJci95rs0iqQHmLk338EVWaN+kRD3rRwyELwRL1V/yq6OZeprX/1UCZ9Suy9TWI6OMxQ4NhpWqD8hnR9FOliBAPYOfrYSVzBbOS0x5T4rHkr3Y2gvUwwRuyqktGJeBjzvUNA9ov8FX+Jao2S1VNjlzq5MGoAhsKYTy0FCsY1Fw0jU1tLMrgdZfyrSoirjKhMAdia/9SxTkfyc2RWmFr9Oyk1qpz+GJtS7C6PAv7gQiYXCkVCltSjTYVBKNgsO2qtehlrE0K4c3iFRflbJrLZSTQk2qDGCmbFeNvN83/YugIUfzzD9K7d1Hw9b88CBwtHoQmEbg1V7NTEqBq1mxRG26iNaKtt1RKWSy69pFvHiBE2Ufw1oV/Wum8gp+v3zgnM3aZzFjySG5f0vxmEUgnlZXVaiFjvpi2c5keiBKzVXKY4vqIFaR5Vu9msR6cfWeoSbN7gSl4tampWQCwtGGI20q0RdMQHzKyuqQDJ2NGWK4WEZsXxuL/o6UvhfWRri8FVonFnyunAhA86Ag9b7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199015)(83380400001)(86362001)(122000001)(33656002)(38100700002)(76116006)(38070700005)(478600001)(55016003)(71200400001)(66476007)(66556008)(52536014)(5660300002)(8936002)(66946007)(8676002)(4326008)(64756008)(54906003)(66446008)(316002)(110136005)(41300700001)(26005)(186003)(2906002)(4744005)(7696005)(9686003)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7941
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	069d6937-54aa-4ee4-7351-08dac2411858
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rA7CnHfXnufF7dIfobFxgaLcPva8aBbfLwO3mZuahtVEyL6nd2sM8t2Jkpv2KmC4HVnWgrnnjlUd4lNfblQbXFbYhtm70PWCRCNZAmt9RePT6bAlaNQSNw8KDO7ltJrVD4K+EUpR7O8lk+8Ec/HvpFmMwYsSb+T+tZzM4kTfywxIncbhMh8a52Vv7e9zeNOrC5ozV0CsC1XGrvHimBm2nZbKFLOcE2XEqnYJ84+Pp+9vdDv0JnK4MsjvCj3Tscvk21N5jeN331/Jm/FtEBcv/uy3M2EO1ZCAq4YFx8Fz8A7Nu39ixNgGNWjTfh5KP21YKZ5kJdt3d+7ClgQ3PY7EQ+hC4QYzQpSfVwYJKSBdu9I6YMQp76tWWHTrNUX6OHvB8npNY1YAMOaXRAVW6PQ8UzVjcynzJBuXHA5i98cx7JZDWZLlUs612w2LhILAP2DHvRf0aXwaWdiKnXMMYQKW3rlkiGX7NQS/KptILI+sOhSKpZnlcMUZRJcD+KwCkrfqoIzkcmGuxfn68Q8rFwZctG8o3U7IV0754C6ah4z+JcBVFHTUJ0OxCyl6jIXT9s3IDmuvXwM67ZfBDojN9KPve4XlNunglMg9/jvUW5lPwuSwRJekwtntS6dILr2t8Cgo7MjeUCE2i+2rEUCohpllMdrnCn9g33wawldJhJkM5oQ6bAtkO4bXxAHMDZBwHoPFzZJCw8776KmioTv12XIQKSSZy1V4+rmvOU2U5R12wr1Dz9TtAUa9gmzkBsNgvPPXagYbyR90WvLlcM1jc70W2Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(8676002)(82740400003)(4326008)(33656002)(70586007)(70206006)(316002)(7696005)(55016003)(40480700001)(4744005)(40460700003)(83380400001)(336012)(2906002)(47076005)(41300700001)(9686003)(86362001)(26005)(36860700001)(186003)(5660300002)(8936002)(52536014)(6506007)(82310400005)(478600001)(110136005)(356005)(54906003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 10:56:55.4552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16efc7bf-54ff-43d4-1d44-08dac2411dd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5306

SGkgQW5kcmV3LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTcgdjJdIGh2bS9hcGlj
OiByZXB1cnBvc2UgdGhlIHJlcG9ydGluZyBvZiB0aGUNCj4gQVBJQyBhc3Npc3Qgb3B0aW9ucw0K
PiANCj4gDQo+IEV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBwbGF1c2libGUgdG8gbWUsIGJ1dCBmcm9t
IHByaW9yIGRpc2N1c3Npb24gSQ0KPiB3b25kZXIgd2hldGhlciB0aGUgcmVzdWx0IGlzbid0IHN0
aWxsIGdvaW5nIHRvIGJlIHRvbyBjb2Fyc2UgZ3JhaW5lZA0KPiBmb3IgQW5kcmV3J3MgdGFzdGUu
DQoNCklmIHlvdSBoYXZlIHRpbWUsIHdvdWxkIHlvdSBtaW5kIHByb3ZpZGluZyBhbnkgZmVlZGJh
Y2sgb24gdGhpcyBwYXRjaCBzbw0Kd2UgY2FuIHByb2NlZWQgYmFzZWQgb24geW91ciBmZWVkYmFj
az8gVGhhbmtzIHZlcnkgbXVjaCENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFu
DQo=

