Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DEB5AEB57
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 16:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399907.641308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVZH5-0001wm-Qu; Tue, 06 Sep 2022 14:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399907.641308; Tue, 06 Sep 2022 14:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVZH5-0001uM-Nl; Tue, 06 Sep 2022 14:09:59 +0000
Received: by outflank-mailman (input) for mailman id 399907;
 Tue, 06 Sep 2022 14:09:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Bts=ZJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVZH4-0001uG-Kp
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 14:09:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9650d26a-2ded-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 16:09:57 +0200 (CEST)
Received: from AM6PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:20b:2e::25)
 by GV1PR08MB8644.eurprd08.prod.outlook.com (2603:10a6:150:85::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 14:09:52 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::f) by AM6PR05CA0012.outlook.office365.com
 (2603:10a6:20b:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Tue, 6 Sep 2022 14:09:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 14:09:51 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 06 Sep 2022 14:09:50 +0000
Received: from 7935866243d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 43F65E42-6CBF-4687-A809-D154610BB888.1; 
 Tue, 06 Sep 2022 14:09:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7935866243d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 14:09:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB5930.eurprd08.prod.outlook.com (2603:10a6:10:200::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 14:09:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 14:09:44 +0000
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
X-Inumbo-ID: 9650d26a-2ded-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=clBx5H1/ykbqBsGObriM849E8XZP3FVRPC2mNIaLY65DoF59foN1VP3zxRNE0gSvcp2IqPc1XDuIwktLDx1w9nlHmetEW+tHMC+ApB1XlrVLex/rYRKXbLRqLFlmOm4RV0fWkLPgjKbWEzdtvyUFPZjjb8jYFBwuqmP/9eBgLdeDIavqshCPAWV1p6gQ0NYO3y6qF4tk0LuegK/vRAbdOeSl7yLvGUcW3Q2NVf8P7p9R/BoB+XdYVsSHkQf0/FLOkmh2BWA5mxEGpByry4bRNYr+Ey2KzU/IBCGw7oJ2MGvyBFiPDfZZGQplqvHC2SMOH+CjcnMXyWfTUz43tHTmPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bxu96chCDBqaYjLX/zGg2u2uo2j5PR2UXkDDmkdqWNU=;
 b=PDHvtD2Q1xzabuTyTwSmir4ZqIIjg2S5lUXzOdA9E6p7+NALwhmjrrAzBFAgDZCYqW+GG00d468hsXIPJ3ctGncBRsiQVcaWfeVZH+lv6aRa4hzqZEOVWBqajuaF2kSY/wwUk8VoFlzvqnV9MM9mYhck7LUhbX/cNzEryov20DM+Id7vLpaJKYwQMG2CUGJY5kx2sdO6/KZyqyiZQaFtzjZqS8sWipFhSzoWpxI/N1iT86ATvi9lrdFCcaipTTC8Z8aUC3l3/b4BwD59ti14dNyJ0b2Z0fIMunQx77BbUsS7EXKIRFAkU0CEBwoiHhdwqjVR5fI8n8APFWHklodBYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bxu96chCDBqaYjLX/zGg2u2uo2j5PR2UXkDDmkdqWNU=;
 b=Y+mZlwZt0NVx7lKfViY5IG0nske0vxUEP5XoDWUntEWGtX9x1cvPTtKAZpO9Vzg+NQ69Pny/ZC8RSmsCv1JI0ntLMs6SpsvXjjQFTFuo4iY5JeCItloSuzYSslHdPlEe5vyebgGYrzIA54xXlyfi0SXUxeQAIZT7cxU1hPPv0gI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtUY7Mql4NoYgUdxyFLz2eklmnraDEFn6KZzEYODlQkAjUKVwkmsq5pepFqpuRFCZyp8+scAXGKLv7DPPVqH+lY7ZO6wkIWr7Wltu7l2ZsC1dt0g80GiIfbcb6iFH3YeP9NxGYS44YI2doHe/PuUqSiIXCMmOmCpvJekplV/KDVs33vZr/mStftu/dsr06VD0TXOJo4MdPKb94whJZjufU8/N3bYFlyNFdVeca5TcDldsRDsayzfIq7liZyd8M9k9MPJZof9nbuuGeanWGskyKGNRe+pmo6n0SCl/NuJivVNxnmxQrCprd9LR9jDxToaZ1RUb20vqYYBtgxQ8Z16gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bxu96chCDBqaYjLX/zGg2u2uo2j5PR2UXkDDmkdqWNU=;
 b=l/e6WBDMLYT5gwinC8+G7T6JrrmmBxBYbbiOuDI1uan7Ulk3KaKZk9/4Q1ZbwcCLkQNTXamska51ThU+kG7YalYPyYVTWRGCIQTOXw3cduM2wRtK2rvsx41M+c8P57PqaYEYREwDzclfwrHy03yocfzOv0TcehwlBhJ63jWshb+Bkr3Euryp0P2s+jBbbt52PElmMOgpTZqTFOzCKylhq7satblR5iIel0PdJ/tNt+4FXqup7ghTb/Ke57wKZ7CwAgeIvVwLtAc8A7IGDYjglWF7RJ2VC7RF48RJxq5QVP0I0RsY6vMXDxpVSZPIfxgot2il4PitVhQcwb8f8keZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bxu96chCDBqaYjLX/zGg2u2uo2j5PR2UXkDDmkdqWNU=;
 b=Y+mZlwZt0NVx7lKfViY5IG0nske0vxUEP5XoDWUntEWGtX9x1cvPTtKAZpO9Vzg+NQ69Pny/ZC8RSmsCv1JI0ntLMs6SpsvXjjQFTFuo4iY5JeCItloSuzYSslHdPlEe5vyebgGYrzIA54xXlyfi0SXUxeQAIZT7cxU1hPPv0gI=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH v2] x86/public: move XEN_ACPI_ in a new header
Thread-Topic: [PATCH v2] x86/public: move XEN_ACPI_ in a new header
Thread-Index: AQHYuGftYa+h04RcYEK+Oaks92E1n62/YK6AgAdDISCAC99TAIAAAF8A
Date: Tue, 6 Sep 2022 14:09:43 +0000
Message-ID:
 <AS8PR08MB7991E4668ECCDD6C7C44462A927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <c869f79901968de2d71ab56e1bbb5d43048baf5d.1661420219.git.bertrand.marquis@arm.com>
 <7dbef184-7e55-51d7-27e1-93153b5f0bc9@suse.com>
 <AS8PR08MB7991B63FCB602B85E3E0618C92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9af0809d-ab7f-09d0-3fa4-5b73fb605fd6@suse.com>
In-Reply-To: <9af0809d-ab7f-09d0-3fa4-5b73fb605fd6@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C1978315DF4C45418D3CF74C9698E3FB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e41a67a1-9d1c-448c-f385-08da90117717
x-ms-traffictypediagnostic:
	DBBPR08MB5930:EE_|AM7EUR03FT059:EE_|GV1PR08MB8644:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cFdB90B1sk2737YvQ/AEJ60jX5oRuDwyWRR9r4q0gzspVhdGv+gVie6e8/b0dNFA/A0Zuhi4KtOEMulZvAtWc30IzjZ67lHBj0RTiZv1vDBN0WvdPk9Xip3B1Pk/TDtMwJW/TRRDwwgwn2PGK53M+DuY1/fgYZE0RubYFbm5wWQ8oERNCkAP4VRrVxogqsEIae9OGmTY8IOPA8cEN0rVzpkD8cvliXAdS3pZMY1u2KsjjzYQbW9143cevSibOsxR+1jSLP22Q3Ryt9P9ADVnX0PNNlP4SIkc8V+dDbI0zj0p89XNiZP5irtnx0pPdDGK5vv08KWvxE/FowJQffLHFkE9v+SqtR2NXDVXIqhOyuWxVhQlydpwIDRNbJx8X9qSXWhFqEP2N8lYc4wX3ezduKUwmXCry7JYo2GU4qg1xWMI9LAu/5bYzGBomWRQJEUBRErDbwTa008K+my614zFwclbkpEovaiD2VHXAHr5oXdeuzEZ2m6SvyBVH5x9+PJXbElenRQtxuG2nqr9IzBCwG4fmTfh33bzw4SyokoDQuaz5mXmUnrg7oiY21aDsy29d+YkvQ6/EMLBd4vTurE6YxTNruPrk1Kyer1oYHYmiGXBHjNRwP+DzPPU1eAj3frGrWpFetnYYCK1tWIvvHvSM+hb17L+CENy1P6GAwCY+LbuIA2IlaHZPwSJKJQR33dMTHahS5+Os8pT5nTk83BjuRSMivKGoFZEqcElMn3tbkA+HGBlYYjNmQhSd2iLz5WTI237yI8Nljv7qomhIjhH0Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(316002)(33656002)(5660300002)(83380400001)(4326008)(66946007)(66476007)(66446008)(8936002)(76116006)(2906002)(6916009)(52536014)(54906003)(64756008)(8676002)(478600001)(71200400001)(41300700001)(55016003)(558084003)(26005)(9686003)(66556008)(186003)(86362001)(7696005)(6506007)(38070700005)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5930
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1151b19-dd31-4caa-e1e1-08da901172bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WLL4nrI0e5kSd9C4C4tMOLXC7792o2RH2C4q38xRLiQiuNvOk7zvAtsCJFC7mzaNcQmYxVPygnsiiQqb8cxFAkS3WAJRkWiUXFe1GHENp8mzkc5mIDn7ct3oB2UMprtmDVXmqJg+xdtnjMLPYlcJNQqPD81WfMJbWXVpSCkrGwp45CBF67Zd+Ucf21fLt/N9k5W3PXeMTw7IjBZfRFeTl+w9V/2vcKiK/MnfGSt5m85+Iz9GUuzQxBrsidEIKXZoBT7gjzn8rDABb5ZsB5gJU8XCeIRz+3CAGUSxjGViT+tKnD14iIAx9xdrafc1htDnvPmPk4YvuoEALJt9NCh5ySGgFzGoFxd3s3vjzSDY6UU/WU60EUlbiZwnelu5abq8bJvRgNi61iZQrcjKb8IUpk9yKm0A5QLdQjkoOEBCX+lsaP9AOHGPO4Lp+CXQ5O7WlLuY6xtRSEzr0JgMt4eCySjy/fQA+gvHR+vcjpIetFl4QhHFi6HkDy4RKh9P27d1ezo33FjL2z9auSMd4zs8PqMCHVgUNiyRHBAPdNlyUsqihIgBnV+mLFzVIQocT2hV2Mh2cYLYq3ONYC6bhPzwfP5aSQJ5Rs3psbE7ZjxPvJNAiW5obu6tLyDSVdqgDBzgoFbyNhWxvXLJ7vNGFB052GKxIlPyUIIyVEBXqHFSQ/eOnIlQ2ne2YTlUjoFOSV5xbJ4Kwk7wryMyQx2GaJsYqh8J2lWxxmVe9rujTtdSAr0AvyU6jhmuXXSUR4vV+NlwU6HI2+V44kKf6xu5LHJ30w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(346002)(36840700001)(46966006)(40470700004)(70586007)(70206006)(55016003)(36860700001)(336012)(47076005)(83380400001)(40480700001)(8676002)(316002)(54906003)(4326008)(478600001)(52536014)(9686003)(26005)(86362001)(2906002)(6506007)(41300700001)(186003)(5660300002)(4744005)(33656002)(6862004)(8936002)(356005)(81166007)(82310400005)(40460700003)(82740400003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:09:51.2623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e41a67a1-9d1c-448c-f385-08da90117717
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8644

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBBY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnku
V2FuZ0Bhcm0uY29tPiAjIEZvciB0aGUgNC4xNyByZWxlYXNlDQo+IA0KPiBJJ3ZlIHRyYW5zbGF0
ZWQgdGhpcyB0byBSZWxlYXNlLWFja2VkLWJ5OiAoYXMgd2FzIHVzZWQgZm9yIGVhcmxpZXIgcmVs
ZWFzZXMpLg0KDQpUaGFua3MgZm9yIGxldHRpbmcgbWUga25vdyB0aGlzISBJIHdpbGwga2VlcCBp
biBtaW5kIGFuZCB1c2UgdGhpcyBpbiB0aGUgZnV0dXJlLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5y
eQ0KDQoNCj4gDQo+IEphbg0K

