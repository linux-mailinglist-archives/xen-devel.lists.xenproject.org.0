Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920316185C4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 18:06:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436952.691214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdfl-0002wE-TG; Thu, 03 Nov 2022 17:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436952.691214; Thu, 03 Nov 2022 17:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdfl-0002uR-Pm; Thu, 03 Nov 2022 17:06:33 +0000
Received: by outflank-mailman (input) for mailman id 436952;
 Thu, 03 Nov 2022 17:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfRY=3D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqdfk-0002uF-Pl
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 17:06:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcd99239-5b99-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 18:06:31 +0100 (CET)
Received: from AS9PR06CA0483.eurprd06.prod.outlook.com (2603:10a6:20b:49b::8)
 by DBAPR08MB5573.eurprd08.prod.outlook.com (2603:10a6:10:1a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 17:06:28 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::e9) by AS9PR06CA0483.outlook.office365.com
 (2603:10a6:20b:49b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 17:06:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:06:27 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Thu, 03 Nov 2022 17:06:27 +0000
Received: from 94954ca5c007.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FD6C8E56-278F-4A95-9830-D38EEB7BC147.1; 
 Thu, 03 Nov 2022 17:06:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 94954ca5c007.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Nov 2022 17:06:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB8006.eurprd08.prod.outlook.com (2603:10a6:10:38e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 3 Nov
 2022 17:06:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Thu, 3 Nov 2022
 17:06:19 +0000
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
X-Inumbo-ID: dcd99239-5b99-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ER6Ov0XGtPvYVOVz1m8flvuystqaPNNV0/gG1VJduZmlr1h7GJuO4Pgzo5FA+KWvd2+HvYkJLZqFm2efV/6awBlG7UbE4QVqAwLChe5oaJ92DKDorDAQr+DozB5B5DyMmrYXHvzm8d3G+/cW/Ki6qjggaP1+vT1J0RjqDhaKdaAQvc8BLhyERSYbCKi52DEc6MV7PFZ4l13Mvq5yd/81p1wpCfK2+oQyqiV6MJCZxqt3JVM+P0ceMUY09SOnRWLzyNgrQ2miM6Vxv5ym2Q7yVSrGXzHGeOoTzm8uVs+BGVn/ZDFe39w/F90+fNUpvOjKx3BwYMrtp0ZB+qwWx+dxHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09TC2OjTAstvwX+aOcOTzRe5uVb8e6TNwkmQHhTATSo=;
 b=IId4kwDYsAgmjwgOUZyv/ye3pRSfzQY/gCnE0pDDxUj+U/XW/EeE8+sM8gJ3cdX339Bf2mRQSnUxdhMGJJ6ngmBqLrX4mD/a1Pg56FjS1x/lPH3pSA4RV1CRVo82WBra6YSibYYxztuE9clp/96xot7POl0rSCFXw5DD5Ptl9XpD4c2nQ7StFqZg1ZkmbXiKztxdA5RGYOuWbjudetxoMcAE1r4bfMJ7HTeD4jPph5aPzdvWYufYH+x+zMOcm1e9Vgk12r+LQP1OWgvymQkvB//Vvi6WnYTKX4rQd00sJh6iXTVTuXxTN/U+RZIycNHd/Plg+KMJWbVfIBTCaZxYeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09TC2OjTAstvwX+aOcOTzRe5uVb8e6TNwkmQHhTATSo=;
 b=AYVt5mG8f2Pe5yDfxso2kcNNN1SNE1KdpeX4MG7hmO2imcP0F0LcH0SKN+lTiwYJ8zETNEm772Yvel9adOD4I0MlGteGyuE+oK2W+FD5yCDVM7gdDlHWWy2zZYaHY8CShWjf6hFAHWm/d8Y9sm+hUgpqELboEYG9rVB64HHsK2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJNgC3XYTeXFjHz1EHxrRgH7Syv/ngFoKues6+V6L1Zna+4VASOZrLapIeKO3i7EXy6thZ2UbjRHYxe58IKdAh1Al6gVyfQFQvLWpt8AH+ZSXXzR5PEI0YX9Wl0SyB8skosUAYB5S9Dlw1K/sBkxBpLrfU2iIzj7Qm5chpK4zY26E5BSwuHSLX0ejTd/BxtNzcqyPhRSRE0uW2mWfBxi3/DtpiZH9CKrYEUwxnv+BVYhasktbgsisCZw53ZOwIDJRFwrr/xXg7pJ5nKCJQydx20fWGaXoP9fYPBrWPN+C1led6RbuRsES6o7eYnPtkxlfms2QhCxmIhcx3fXt+XvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09TC2OjTAstvwX+aOcOTzRe5uVb8e6TNwkmQHhTATSo=;
 b=lOxaB0qY0hNS/aJpdShkzoPpDOJ5bJ9w0oBxKyTNgImT860ujZL5msSL8iQsPduyYLH9TmHxzQ9CLde4dAzSLpJ9U701tszrLQTg65Q7AwExJjtUXcSLGV6EzRLXjvCLZ/iLDcGbzO1Gl9wFmu3au2GwxaJ4fiqo2PH8Ceqn0GZqioAvywiBcyJrVWm0o8ULrZ/ldswFyTxKB1ZRe59Ijo2TLS0N6UnilXOOCsWSh0EQK1ErUIST2OplC0wja0VfNqYd9P4ZcXbgzRK/oEu2kI7bavWIuheHnIFmfCbWOuQwWmaNcxwqh939d6Z2PBTYOMrPR2FXNeurUzAx0xrsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09TC2OjTAstvwX+aOcOTzRe5uVb8e6TNwkmQHhTATSo=;
 b=AYVt5mG8f2Pe5yDfxso2kcNNN1SNE1KdpeX4MG7hmO2imcP0F0LcH0SKN+lTiwYJ8zETNEm772Yvel9adOD4I0MlGteGyuE+oK2W+FD5yCDVM7gdDlHWWy2zZYaHY8CShWjf6hFAHWm/d8Y9sm+hUgpqELboEYG9rVB64HHsK2o=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context
 switch
Thread-Topic: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context
 switch
Thread-Index: AQHY76ZET1O4McAMZk+SDG8R2oR8564tbbLA
Date: Thu, 3 Nov 2022 17:06:19 +0000
Message-ID:
 <AS8PR08MB7991E17BFC8F6755E33C097C92389@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221103170244.29270-1-roger.pau@citrix.com>
 <20221103170244.29270-2-roger.pau@citrix.com>
In-Reply-To: <20221103170244.29270-2-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4743EF7AEBDAC84A850A8BD367F8EF87.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB8006:EE_|AM7EUR03FT030:EE_|DBAPR08MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: ab53b349-76f7-4b38-5be0-08dabdbdbf1f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hcKx2ZK5if9UW/ntBBSW12rAg96svISIbgi06Twn1Dsqje/hkx1nFrOtPpV+fyYQBmd+/esLfx+rwOepdKIT0A7/nDmQCngEptpSJiZw+0hc9w7BR2n4gl2nx7I/ngHZ5PCW2HonZt/YMV5QrYGbAIPr/HmXMGsZZibDkSmdtUP26MeGszm3q/K+dzjNFIoI1prVYiZnXCyoZwhrdT5pdjsNdMpHfuhm8GEVpjsU0iHm2HM/zV8nmwW66onqOwHqIBAePhhChjNiukzHzEBA1aiKmLoVbcnyEaQvKb+BeUfTtkbzhWvHZ/NYJaopF3sxXNAGIEv++bcy+S9gGTfJ6XDPC+NFbmDVr8q/eZKEuuTUVnJwqSVvZgY7NmCbdt69tcD4mC4IUKz/YNhjBXlUAVWuzmei/CuHgPOMER5/pJHGOaOVLPVO3a9/aI0GoljY924JlNAolrCHh++W/FKa2QrVzbZ3uUgMHWojS50uABSDePS0RfX+M7F4PN5TtGjjbGtZrvYYCrnk0lE/VML52qYBYR4H+ZD+aaA2YRiZeRAsO5ZSB01xPkk9s4+0uESuvhcaJ4OBAa3LpyJfmvYJe12SyjfDDu8YzLhZumNf2iviJVFmdXqEg3TpyWnXR4BwkqN7JHjgrGhPPorPW6OlUqcExfWGdvCrhr59rUaqDFEiCwUWbCs3reQETfD+fhZwcurG4fmmInF5tXR4fcgztyqVSm6V7bIruM12s8jG2dk9Mh648qAOBRqagxyI6UpB+8ceG8OdqlRCCZbMmtCsyQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(55016003)(5660300002)(38070700005)(122000001)(83380400001)(2906002)(9686003)(33656002)(86362001)(52536014)(7696005)(26005)(54906003)(478600001)(316002)(71200400001)(64756008)(41300700001)(38100700002)(8676002)(66946007)(8936002)(110136005)(66446008)(66556008)(76116006)(66476007)(4326008)(6506007)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8006
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba299566-2e8a-4241-7b46-08dabdbdba2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R/l21/Gyl1GvheNcXELGrgAJhNAz+1kMcXd3OQr1R4mDcnhvBcPsleXiBBoqx6LJipclZ6amsQ2CVQnEOuUAaH8x4kiMvOapFyeCq9v/6hEXZ7+L+RaDa8CY3w14x4/lp2mYlMlFdEGpOZgS5CdRVExgRXtrhdqDt+D6NwMUHT2cIEV20VK8sBlRyRW5VVK7pxLczdWpd+utWy7c3HIbsVCJo/ehfwmD+rWCNtkzMKwzj/FtedVj+W8iHe+vQq3noTbD9BHk3K+wR9pyUh7BeiBM4Lx5itLuINUFXtxtK9+fgQ0Fmscnp87dOqu+jgcg6VO7tb6mlfbT2gNElcJcrKorOgODKmM4K20XwtC4x4jKOqu2lI40KbVD3U6gzacbykoiHFLSLnuYiWnfG489A+XAF4WVgsn116+5h7R8UfMW7mgHmDEPiWShjLB7TNS6ELLIl0iuTZT28CZ2lEKK+cb1CwqV6qDvA8NGS3yUVHCDs/0ukaeDciUZ0J2Bvuy09D8KM3jYfTyLWS3mK+hJ1GZDdY2HQ8UfVdqxZ4dGZ8Zuxv4Vyqq8OViupGjrJVvbYck0cfOmoGIdLApyRfyVCEueiA7oH+7KwE7iR/+HV5bxSiXRKAbrjXwqrYe/ynvtceWDM5UbzXT/ikH/6Vueoc3lA0JBvFypyskSfOO8XLgammaFePgQpE/EqpM8BqQ2T35lCfKDr3Fmwthl1dPdplQgLgUrz3NZd+bwoYdQ/8ekS8d1vrCjauoqVwtDQ9/lN7+xZUAJ6uwiwRI3A7KIpg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(6506007)(7696005)(336012)(41300700001)(8936002)(52536014)(2906002)(26005)(9686003)(4326008)(356005)(70586007)(316002)(8676002)(82740400003)(33656002)(70206006)(5660300002)(36860700001)(82310400005)(55016003)(40460700003)(478600001)(83380400001)(186003)(40480700001)(81166007)(110136005)(86362001)(54906003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:06:27.8693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab53b349-76f7-4b38-5be0-08dabdbdbf1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5573

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGZvci00
LjE3IHYzIDEvMl0gYW1kL3ZpcnRfc3NiZDogc2V0IFNTQkQgYXQgdkNQVSBjb250ZXh0DQo+IHN3
aXRjaA0KPiANCj4gVGhlIGN1cnJlbnQgbG9naWMgZm9yIEFNRCBTU0JEIGNvbnRleHQgc3dpdGNo
ZXMgaXQgb24gZXZlcnkNCj4gdm17ZW50cnksZXhpdH0gaWYgdGhlIFhlbiBhbmQgZ3Vlc3Qgc2Vs
ZWN0aW9ucyBkb24ndCBtYXRjaC4gIFRoaXMgaXMNCj4gZXhwZW5zaXZlIHdoZW4gbm90IHVzaW5n
IFNQRUNfQ1RSTCwgYW5kIGhlbmNlIHNob3VsZCBiZSBhdm9pZGVkIGFzDQo+IG11Y2ggYXMgcG9z
c2libGUuDQo+IA0KPiBXaGVuIFNTQkQgaXMgbm90IGJlaW5nIHNldCBmcm9tIFNQRUNfQ1RSTCBv
biBBTUQgZG9uJ3QgY29udGV4dCBzd2l0Y2gNCj4gYXQgdm17ZW50cnksZXhpdH0gYW5kIGluc3Rl
YWQgb25seSBjb250ZXh0IHN3aXRjaCBTU0JEIHdoZW4gc3dpdGNoaW5nDQo+IHZDUFVzLiAgVGhp
cyBoYXMgdGhlIHNpZGUgZWZmZWN0IG9mIHJ1bm5pbmcgWGVuIGNvZGUgd2l0aCB0aGUgZ3Vlc3QN
Cj4gc2VsZWN0aW9uIG9mIFNTQkQsIHRoZSBkb2N1bWVudGF0aW9uIGlzIHVwZGF0ZWQgdG8gbm90
ZSB0aGlzIGJlaGF2aW9yLg0KPiBBbHNvIG5vdGUgdGhhdCB0aGVuIHdoZW4gYHNzYmRgIGlzIHNl
bGVjdGVkIG9uIHRoZSBjb21tYW5kIGxpbmUgZ3Vlc3QNCj4gU1NCRCBzZWxlY3Rpb24gd2lsbCBu
b3QgaGF2ZSBhbiBlZmZlY3QsIGFuZCB0aGUgaHlwZXJ2aXNvciB3aWxsIHJ1bg0KPiB3aXRoIFNT
QkQgdW5jb25kaXRpb25hbGx5IGVuYWJsZWQgd2hlbiBub3QgdXNpbmcgU1BFQ19DVFJMIGl0c2Vs
Zi4NCj4gDQo+IFRoaXMgZml4ZXMgYW4gaXNzdWUgd2l0aCBydW5uaW5nIEMgY29kZSBpbiBhIEdJ
Rj0wIHJlZ2lvbiwgdGhhdCdzDQo+IHByb2JsZW1hdGljIHdoZW4gdXNpbmcgVUJTQU4gb3Igb3Ro
ZXIgaW5zdHJ1bWVudGF0aW9uIHRlY2huaXF1ZXMuDQo+IA0KPiBBcyBhIHJlc3VsdCBvZiBubyBs
b25nZXIgcnVubmluZyB0aGUgY29kZSB0byBzZXQgU1NCRCBpbiBhIEdJRj0wDQo+IHJlZ2lvbiB0
aGUgbG9ja2luZyBvZiBhbWRfc2V0X2xlZ2FjeV9zc2JkKCkgY2FuIGJlIGRvbmUgdXNpbmcgbm9y
bWFsDQo+IHNwaW5sb2NrcywgYW5kIHNvbWUgbW9yZSBjaGVja3MgY2FuIGJlIGFkZGVkIHRvIGFz
c3VyZSBpdCB3b3JrcyBhcw0KPiBpbnRlbmRlZC4NCj4gDQo+IEZpbmFsbHkgaXQncyBhbHNvIHdv
cnRoIG5vdGljaW5nIHRoYXQgc2luY2UgdGhlIGd1ZXN0IFNTQkQgc2VsZWN0aW9uDQo+IGlzIG5v
IGxvbmdlciBzZXQgb24gdm1lbnRyeSB0aGUgVklSVF9TUEVDX01TUiBoYW5kbGluZyBuZWVkcyB0
bw0KPiBwcm9wYWdhdGUgdGhlIHZhbHVlIHRvIHRoZSBoYXJkd2FyZSBhcyBwYXJ0IG9mIGhhbmRs
aW5nIHRoZSB3cm1zci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KDQpUaGFua3MgZm9yIHJlc3Bpbm5pbmcgdGhlIHBhdGNoIQ0K
DQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktp
bmQgcmVnYXJkcywNCkhlbnJ5DQo=

