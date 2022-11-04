Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C417619AE7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 16:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437688.692141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyEt-0008Gl-1E; Fri, 04 Nov 2022 15:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437688.692141; Fri, 04 Nov 2022 15:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyEs-0008Dg-UR; Fri, 04 Nov 2022 15:04:10 +0000
Received: by outflank-mailman (input) for mailman id 437688;
 Fri, 04 Nov 2022 15:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKjc=3E=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqyEr-0008DZ-6Z
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 15:04:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150088.outbound.protection.outlook.com [40.107.15.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edf6b19c-5c51-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 16:04:07 +0100 (CET)
Received: from FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::9) by
 AS2PR08MB8645.eurprd08.prod.outlook.com (2603:10a6:20b:55c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 15:03:57 +0000
Received: from VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::7c) by FR3P281CA0061.outlook.office365.com
 (2603:10a6:d10:4b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 15:03:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT046.mail.protection.outlook.com (100.127.144.113) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 15:03:55 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 04 Nov 2022 15:03:55 +0000
Received: from 303b80ec8ec1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 006F00FB-650E-44B3-95BA-77710F91AD3F.1; 
 Fri, 04 Nov 2022 15:03:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 303b80ec8ec1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 15:03:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB7334.eurprd08.prod.outlook.com (2603:10a6:102:231::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 15:03:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5813.008; Fri, 4 Nov 2022
 15:03:46 +0000
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
X-Inumbo-ID: edf6b19c-5c51-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jEGswKG6DQi+RjJnN0acbzA/TjUJRj3RIsDf+iB++empE/3KbYmhDyfQIkRvIBqr6codbd3bMepnqC0KKrFtXjp9sxoX+6N5m37L6V7uoEDVP0aPWC8pMKuf2mHCiRbFaSO72Vorv4E0bL0PueQ0NNTSCWjA2R2JPjgdN/FJQenKKxPq1S9HkRFQ+j723Z8jhaHUG+N7LIfBzl/XgzweagFfvI8WV0Bxr0xzyNTbIlQSZPpbiI4i39GCk/KS0m9m8OkF9RATpCDjS+6nV3VUX5DMD2n/dlMrRgjpjeezvigIvoxkvYUJ/I4mcozF9C4Hr3PBzWt0gacO2Am1mmlA8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFCG13yBuFB1fDz7FFko66VMXeHFo+FXxoqBj7CxRxU=;
 b=aw1HKkLcrLJvqT5B0wzwYfQ7Yotn1+7LO3+z3o21zu4EqdHV43jc1cI0ojbSKQuku6D1c0FWNloitVHTSJ6hBczDybUGGOGkRvFq+o1M1BBt6d/UyaWKfDefLJZdUP+q5Sjp6SKTlqy/O+GOEr94TdzBJMooYb16j3AARhY6GnDPyZJb693+CIHGhPVSLOALhXlxPx7x94d2HlOQN/JaMVleGKONIQPDXtPqpBcOe6hl2lMFxfQB5Js4ELj3mHjiD8iKxt0wFxghDkUALDrry0Q7oD6AuEbqC3ATlGxMA3aoDV8knvjdosu6NwkpCBSvOlPaCK9wfADQdpLAhwWmqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFCG13yBuFB1fDz7FFko66VMXeHFo+FXxoqBj7CxRxU=;
 b=cSSpPo/ktSG5QlAHgUArLveZOfm0C0RQf1dzLc6p+8lsNYT/3T17uE/pYb0c/PIyjuL0owlzJHAGpS59p94gnkBJzh5y6NAojxdydOdHnygn4rnFPE6s5+hkYjXFVNFdTcpyu9Ssdxy25pwlbjRWHEIshQfpvWKE5bveHSxF6aw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L++kvhYlIRd4ah8Wu+I9p65FYfcB1MK3oP2E7/kzEW9IFQOxI9ESe8NKv6rWyqq+gelq5vAmY4yEflvMUAMAQsfEi9oLlt/JNAwUpUA5q3HThHttVToUmXsnptnQK6D9+aUtK41zHz2p1igy086l0+5sAl2YfpiEEqi/+CEfHrGtNfP8OnTy1zdgrQSMVOh7zY8sghaoez7t51XuakxUNIjeefRMV9fz29nzFvOEH2L6bWhfTFDLuCX4F4yw1Le4c9UiZmUljd/E4ERlvtyByFIOfP3HudwnkIy9SL5PMXuMPsrDtfYq1/uTdGawj2oSZLwmixU2hhNJEtT2yDhSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFCG13yBuFB1fDz7FFko66VMXeHFo+FXxoqBj7CxRxU=;
 b=AL0uH/hSl/qKptoVJ7WbjG+7/XgERcwXXjgxZWojO9S1LAjHKwSqcGWM5CebCNMHn4ae5xjj9ILHHizy0DG98qI0w3Yz9vSkNvH95X1fA85xZZCofgKwFslCROxgDYR0kJfuH29hooSpD0TerxPwuZsV7AdX0HdeLtsJvMX4RE6exQtHY/NRUovaizgzHnhMnkMuZbp/D2xQxLfFpAM9VdmEzFipAfsjT5p9IPHI+t2auXCFh8URV4VwvUClmrq5bqmNnCot1mcBEGsRS1j+p7V8c6Q7+cMxBdyz1nPt8V/U40PnqlqwX5C5LauwCGD5/8bAZfO8PX8i1xaeomf9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFCG13yBuFB1fDz7FFko66VMXeHFo+FXxoqBj7CxRxU=;
 b=cSSpPo/ktSG5QlAHgUArLveZOfm0C0RQf1dzLc6p+8lsNYT/3T17uE/pYb0c/PIyjuL0owlzJHAGpS59p94gnkBJzh5y6NAojxdydOdHnygn4rnFPE6s5+hkYjXFVNFdTcpyu9Ssdxy25pwlbjRWHEIshQfpvWKE5bveHSxF6aw=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: RE: [PATCH for-4.17 0/2] vapic: followup from assisted APIC series
Thread-Topic: [PATCH for-4.17 0/2] vapic: followup from assisted APIC series
Thread-Index: AQHY8Fj9tLGFgwntT0yR/u6/Ci856K4u3FtQ
Date: Fri, 4 Nov 2022 15:03:46 +0000
Message-ID:
 <AS8PR08MB799107F1BD689D8E463CB4BF923B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221104142235.36556-1-roger.pau@citrix.com>
In-Reply-To: <20221104142235.36556-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FBDE7B6DEA5B344EA50D1D8BDEE918E2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB7334:EE_|VI1EUR03FT046:EE_|AS2PR08MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e01ef8c-ca19-420b-827a-08dabe75cb23
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1iGa4g//88Iq5Gus3ODuEH8GOwFeIeTHWqat3dxB1gYbOowKoXL54guXDzGryaOWrIlArA7xBU8HygQwtlNKM6gFqb034L3O8tbuwJcyWZWWZwns3FH2XOYjh3paFTaDHNosr4JKEBbj++vbf7SEjz+ufcU25SrbZS5dpNNVl2bTb6z6mQ0yqP6uNg1zpzPYkENEyLoDVlAYRijAYfC+dvWIa8A4aNcs0ixIKkrmMUZCACakBKaLuj6C9AYaWUWTbH6VBw9R8ZdSP3oIH4zsbGLdk589C3rcUkJ3WEqB36LEMGfr27iPUGLCayNx/RzQ/ThBCSd/J6wKkZiYWIUjaAKADQhDK2d7pZLNJTHmGlQwGr0WrlVMNGNcxiDkSW8cblzInZTq4KUPXmK5tKxX5fwzUE1JAw4n6iHEEcETf2lf3hBF6B2qO0Lqq24/Y5LhvMkrYzRo00RFFw0QnEX7Xi5yEqdOzBiaPYprPBZb48at3TvSe4eS+hQ/hGRbCqIkp6FeLPfFv0KJ3gpS9mzeuxbsEcB2h2dTPN5MEA3YodNaqZVsAYNU8jNiLpByN6FQ5691iUcEO5OaQjBHqR5GEx+rToVXxYlF6AoxuiNGbwefRMQgiGntsbiXsaJaAHAL2h7pzEIaRG2fGd8Uz2dMhdo1q13t88tPtUe+Lt9fBwdU3MNtkULNj+lD5eLLXvGjIqjoUYOCpLOgQDpLeREz3lpiVTcmnh/YF9uzX71Rr9uAlCpygdzWQ3u0p1ocoQJbNXHCga2hjEfIcLJMKyI25Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199015)(38070700005)(26005)(55016003)(33656002)(86362001)(41300700001)(76116006)(8676002)(9686003)(66946007)(66476007)(64756008)(66446008)(66556008)(4326008)(4744005)(186003)(71200400001)(8936002)(5660300002)(7696005)(478600001)(6506007)(316002)(110136005)(54906003)(122000001)(52536014)(38100700002)(2906002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7334
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39985229-0a93-48bf-e2c9-08dabe75c5dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	okVEi5RdLZjh4r/YtbTPcHs1YTOGTuqSfw3ZuDoQKHWqPLTJuxaum/QUS16GQa95jWn3inNIJzSmqipBK6W9ZozNTTGZXQVtXCgP2/H4gbH0MQiQuK4ZEWfZj6RCxRBtXFNwEHV+bN367J7gFjAb82VCwDk3ay7Pq18yk3n0+iVBAy1OWxEDMFb5hY0TwKFfegRZZTloGZrtihCtJh9Xs25xV+EdHbgMyJM33e+8zhilGTMnBND0/NeLZkDOnz/k6qrC2ASeyd8r8L4zjhFsSLxoL7lV0/wEMrIbYlwGMFu3MJtncJ9ed3SSm5YOgLJ5BREmijmgt/EemsTaMUZRIhGzbeDwL9QKJ+aNHvEYLX4QzG1zkhgvXlwnfanUsrz+/iz6eCq1pX9flS/gC9qBn9Rsy1YYKvEu5SC9bgO7t0wXumxQV3p9L4y5hjg02efqYja14AckbpWXTxUh3fEWrOaqc8h1iVGTdqMxV6Mu81JYWgwfF/DVqmmRZh6zT4MMaaWWfhYzglbKI6vhgcOLDq4qjC6IhX/QerG7JS7G3vuBs24e0rE6jFdNV52g+XobD2Eu8WJZcXpNbn4Z0mEvlkCYyYX42wclr2ocDYtqpgEszz2TZJbh5bOVcTTAB0fA5o13IJnLCnv0U7Ni0+fcKo0ABaaU0C8qGPl8DQiVtKb+hocwct3977KH39lxiMglU1tBmRZG2ANMDBseZ6HVoraPj4AMoJNxrWGFD4GhcAek8OUq5YFgWGI87MkQ4D8NjiLtmDoyn/KKw0DLXGeeGg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(110136005)(107886003)(316002)(54906003)(82740400003)(6506007)(4326008)(8676002)(7696005)(70586007)(70206006)(478600001)(33656002)(5660300002)(41300700001)(8936002)(40460700003)(52536014)(2906002)(47076005)(336012)(26005)(83380400001)(4744005)(186003)(9686003)(82310400005)(36860700001)(86362001)(356005)(40480700001)(55016003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 15:03:55.3805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e01ef8c-ca19-420b-827a-08dabe75cb23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8645

SGkgUm9nZXIsDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoZXMsDQoNCj4gU3ViamVjdDogW1BBVENI
IGZvci00LjE3IDAvMl0gdmFwaWM6IGZvbGxvd3VwIGZyb20gYXNzaXN0ZWQgQVBJQyBzZXJpZXMN
Cj4gDQo+IEhlbGxvLA0KPiANCj4gUGF0Y2ggMSBpcyBhIHBsYWluIGJ1Z2ZpeCBmb3IgYSBmZWF0
dXJlIHdlIGV4cG9zZSBpbiB2aXJpZGlhbiwgd2hpY2ggaXMNCj4ga2luZCBvZiB1bnJlbGF0ZWQg
dG8gdGhlIHNlcmllcyBidXQgcGF0Y2ggMiBpbiBpdHMgY3VycmVudCBmb3JtIGRlcGVuZHMNCj4g
b24gaXQuDQo+IA0KPiBQYXRjaCAyIGlzIHRoZSBhY3R1YWwgbWVhdCBhbmQgY2hhbmdlcyB3aGlj
aCBmZWF0dXJlcyBnZXQgcmVwb3J0ZWQgYXMNCj4gcGFydCBvZiB0aGUgeHsyLH1BUElDIGFzc2lz
dCBmbGFnLiAgVGhpcyBpcyBhbiBhdHRlbXB0IHRvIHJlcHVycG9zZSB0aGUNCj4gZmxhZ3Mgc28g
d2UgZG9uJ3QgcmVsZWFzZSBhIHZlcnNpb24gb2YgWGVuIHdpdGggYSBzZXQgb2YgZmxhZ3MgdGhh
dCB3ZQ0KPiB3aWxsIHRoZW4gZWl0aGVyIHJlbW92ZSBvciB1c2UgdG8gcmVwb3J0IGRpZmZlcmVu
dCBoYXJkd2FyZSBmZWF0dXJlcy4NCj4gDQo+IFRoYW5rcywgUm9nZXIuDQo+IA0KPiBSb2dlciBQ
YXUgTW9ubmUgKDIpOg0KPiAgIHZpcmlkaWFuOiBzdWdnZXN0IE1TUiBBUElDIGFjY2Vzc2VzIGlm
IE1TUiBhY2Nlc3NlcyBhcmUgYWNjZWxlcmF0ZWQNCj4gICBodm0vYXBpYzogcmVwdXJwb3NlIHRo
ZSByZXBvcnRpbmcgb2YgdGhlIEFQSUMgYXNzaXN0IG9wdGlvbnMNCg0KRm9yIHRoZSB3aG9sZSBz
ZXJpZXM6DQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+
DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg==

