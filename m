Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4E4567FFF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361870.591629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zby-0008Gp-3D; Wed, 06 Jul 2022 07:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361870.591629; Wed, 06 Jul 2022 07:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zby-0008EU-0A; Wed, 06 Jul 2022 07:38:14 +0000
Received: by outflank-mailman (input) for mailman id 361870;
 Wed, 06 Jul 2022 07:38:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zVX-0004kS-BI
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:31:35 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150047.outbound.protection.outlook.com [40.107.15.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a98a22a3-fcfd-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 09:31:34 +0200 (CEST)
Received: from AS9PR06CA0316.eurprd06.prod.outlook.com (2603:10a6:20b:45b::25)
 by PAXPR08MB6560.eurprd08.prod.outlook.com (2603:10a6:102:12d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 07:31:33 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::3d) by AS9PR06CA0316.outlook.office365.com
 (2603:10a6:20b:45b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 07:31:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:31:31 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Wed, 06 Jul 2022 07:31:31 +0000
Received: from d1992e24f0f4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA05B18E-897A-4CB4-9AAD-5B92C76D8FE5.1; 
 Wed, 06 Jul 2022 07:31:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1992e24f0f4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:31:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5815.eurprd08.prod.outlook.com (2603:10a6:10:1ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 07:31:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:31:23 +0000
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
X-Inumbo-ID: a98a22a3-fcfd-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WrT5Oeo+YmyW5AVln73GmbVxBfknq+7b+7JzyAcFvQgOOLN5LBJqyqKn5rgpuYOguaZvg72aPXIsADKjt7EH25f5OPDKIYLNhLMVJcWh95jqC2vkYk+5rY0VT6/8siPJFyFKqSmPc12WBEGnw0JXpBi8Svnj2hPRgmaro22UPRq6/8LHfmMZHpyR7MPe1f1dIW7OMFEiV5pyx+Oo4hU2bzcDrAi0rkmpk+7RZT1E0K5LK5kTdKO+CXk5/ApqJGjG+tVWGWbvLR8FqZNA1NeKNrI3kahXCCqiQbZWTTf2r7GNR/Eo7lh07gbSh7KMOO6ffhpyQM8iv34iivXUXr8pow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mHbNVx+Un0Ik5RuG8EjPbpZ0HrPLz5hsyKRWCcf1Es=;
 b=e8vEhE2JpoQkLBhKW11Kahf5v7kJN/GOZ4u3iQb8z35BiiAKq8ANVbhu9D1yZKKdtTfiOd41rQ5LW7bTzf7khH3U91N9zrWCLltShOmVvfrrOJiJcoSAZ1bO6kDSJg4kBXhf+LVmLP827GyKzbzxXbHc3nRiWBAYmCGJ+ZObPhrjDUaJPznBmpBXFyMVv1Q0cYrh3bv7/bKEEr27aiMXsj1/m6OOHsy8pzHUeQ36mIqVww0q6ehf3pqn5b8034mNZeTG/FG1fixXuwo8dkwDUPovMGpFWhKpa7gYsd4Z+tm4C7f2ZegLalV7qiZMZuMDsslDH4c66lmDuJo0SU5u6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mHbNVx+Un0Ik5RuG8EjPbpZ0HrPLz5hsyKRWCcf1Es=;
 b=FHPHy8cBvuuFQWeMc+NGnS5GY4HrfwNaXA+r3ziKRgL+CfIo25ZdBdM0Zqvh0XAg4U96Wg5C28V0Y9zsyOwRXZTi56vjyRLItM/T7pOLbhRD9sakBRNeaMK1iNh20qIbywCKzvT6iqkFngKPjGjsMHemQkGvwzsKCc8mGEN8ekw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFFSKD/541fYeaC5hetTQdi6djhoBqkpHcE5ZX5sHhvkWRLxaYlbfma5godrDs7nJHxgcX8QtJlAY0R9Q5CdH5OkxCdsl9Ka5UZDjn7bSl0HDwhuWlrJ3Nmi8Pa4oXLvCTYcECJFx8nNorug1vEDk9IV8x71R5zBplP19iHZxXZ9bi1DTvZR2um/tJBfH6ynF+QGc3MW3QVNLR98sJT8tQHVoBCLNDcPAFIR5yZU/oa6XQ1boeEyMnDe4dLPFC8N5NlwcyKAWY+NhkSkiZ4Y7I/fD/DuFSxbbWa2KklPtJ3NMvtNyb1KCh9Wpp/8d6vAlXYob2/g6XvDG/RC0Tt41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mHbNVx+Un0Ik5RuG8EjPbpZ0HrPLz5hsyKRWCcf1Es=;
 b=WZugPG2YF5Yn0m2bkTq4omTmucV8lTZhNMpwElgwQ8246OlwFFI8Gs/8OfEALHXygPq2b62h/6c0LFkpr8O+u6imiH87EtOLCiaHXh8gN/0dpFH/R5/1LzGKdbvhfXZj9GthSdB3i3BqwiDFWfDXpavZ/whoj3g+N3q4trN5GBT9SHU9k+CBjHXiTUAATmcI9Dl2ROd3bUaPJmZc7oaHiGIJ0op/+U6HDWlbpd/kAitZ8aH6N1QjtmFshTtZAYFAt+N/8gBnOzZMuLANM9nj2rwDm4RtltIdld9wBDOrLFiLtdj7nI2BFdOY77fDaY4IHUuTl6PsRN9aR4zlI9KT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mHbNVx+Un0Ik5RuG8EjPbpZ0HrPLz5hsyKRWCcf1Es=;
 b=FHPHy8cBvuuFQWeMc+NGnS5GY4HrfwNaXA+r3ziKRgL+CfIo25ZdBdM0Zqvh0XAg4U96Wg5C28V0Y9zsyOwRXZTi56vjyRLItM/T7pOLbhRD9sakBRNeaMK1iNh20qIbywCKzvT6iqkFngKPjGjsMHemQkGvwzsKCc8mGEN8ekw=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: RE: [PATCH 00/11] x86: support AVX512-FP16
Thread-Topic: [PATCH 00/11] x86: support AVX512-FP16
Thread-Index: AQHYgKKUofTsu/ArMEqHlGqkL58nDK1xEjhA
Date: Wed, 6 Jul 2022 07:31:23 +0000
Message-ID:
 <AS8PR08MB79913DC051A822B82336C38592809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 00AF7A5FE3BCE9409F9D5F719378AC01.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a3e6169b-1631-4319-dd46-08da5f218c67
x-ms-traffictypediagnostic:
	DBAPR08MB5815:EE_|VE1EUR03FT003:EE_|PAXPR08MB6560:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D3r5haFif2a9x44qZ4wyTxBpk2azIHhu5UMjS4vwGT1kTAcCfqt7jHAikjyXV/XXXWtxYfLlc9IYXYBUfnzzTR+usYRDMxI74GJ9DgaDnxr+V7pqss64+gRNaxX6vVptrLBwikWmNYOFQGuKnF9/tXct5KhwhrqdY5BkdPIC5iBIAStlve9T9a+0QzWkQ9OwcTuzOhJ5jRt5TqtbgRlgmdaswPAGqjhsY1lnF++QLgAxq7FdrAw3SQ4aFidkE3jbrC1JsA+Riyh2004aUQnIKzLeCVZWkpSMk/Fuwagb/wJyg7LH8jZet2AB1IYuJBjO97O5PYHruSENs6PxAXKpj/JYEWziaggHPHtESaHR0QRODsTWWR1QD87ByXs8GV/R9KeUgbjkKagPqsNYH7o9zRihT2DmWBPqlIB9JklFljocJkHfjOBgyj1a6xIS18yzQKo+1lgTsSYarGQPp0rFFn0Ady7H5c7oeXakUCgvz1dEl6/HycsG6vWoXGzQkVsfxZZ1EUiXfCe4pPC/nborxYdLCO8S2lLYAjvpDE6ncGunnGMJ+HslLWI00TcXtPaFbNeGebThRJAeCx7UYo2ZbN6tcCUqSnf6iLqdbA55fZVOyAFwz8VTe6A+IYM9nr2Oru3lTn0TAslBKQIRt1xLAtX3tZBXN4SndtDjk6Du19ejUM09V3uqlS4aZSgAMK3Pk1Rgq0cMKHtDikCBYBzwY544Pdu4WdadfipkQodHQIY+3LnvCF7td4UiuLml87e6YMwXtiUdej7ey9kfCiWeidFOZoQOOVwa2Y9jGqWOznnNAOYPBXV2riTfl32XsuQJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(478600001)(54906003)(41300700001)(71200400001)(9686003)(55016003)(26005)(316002)(52536014)(122000001)(6916009)(8936002)(5660300002)(38070700005)(86362001)(186003)(8676002)(66556008)(4326008)(66476007)(66446008)(64756008)(66946007)(76116006)(38100700002)(7696005)(2906002)(6506007)(33656002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5815
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a0a04b7-5665-433d-d4e0-08da5f21872a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kSEM78kcEAQWPlhACdrCalJjVl+G13Rn5O/PlYFOd04epFUi6tAdaLa0eSa9IYiHIdjQm0tKI2mgbYO69BIhJZq/P2KgNHwA7SJmaUM8B9jVEkowdES/NY2oezz7L+SSyTbRgUVFoSnMlPiEEZZLAPeXTnY1iXq8BFEqiT/GdclLLmGVa4DXahQQXVRZpT4CDlUinsM79+5fTZAssjz7I/jfhdbzqw0JXjWypm/a6SSYKCxEhT3kvUd3YEJOyUPpio2vYICPj9PF63D1a1GpKyIETCy1T1nMt+oH5huQtk8VJ0kxsTjTcNlNvn3h1yGuUmPFz9IUgMBcm8vQzeCT9wNOUWJhlkyimdbQuet0lI+FYh0zFURlIp+bBM120ODGDCawEprJ4+ABWYsstyNpPsE5eh67i7UxcH3gznEIdh4Cb4HqF+7x0xH74CZK/qxiITRczy6IZkp0GFQXETr/s2CPn/KLjOqfGOlGlb7w38VJ115YdLhHCOiZyrqCVQ6MMErGKKUazoseHR8SRe3YKR8pnZKdGncLt5aoCZIjeN6CBRV/SciygTQYulB8fjLLABxdPjjmRIL6OuHmNjcM7VYr7yIDJ1rdXNYZpLeJQAOrGHsUoiPK+gnZOd98o8flnZ7x4qiXmU4nm4K2cw4yMkMLHnQHuF9vucBaieJPeu6CDyYEcNA1KTEeK1Q+dojV/q5uCdirH0RMjOlEwZjcekRd0/Z+aMWAiAg/4lN4s7P0GOa5S1jWWlFGwjmKD985qpu8M4uuPvM5qWagnCCxkfN957qET4W3fljvf3FkXIVaKohPGBQ/T2G4Xyjb4iUV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(40470700004)(46966006)(36840700001)(36860700001)(86362001)(8936002)(5660300002)(83380400001)(107886003)(186003)(336012)(33656002)(356005)(81166007)(47076005)(82740400003)(6506007)(7696005)(478600001)(6916009)(316002)(9686003)(26005)(41300700001)(54906003)(70206006)(2906002)(70586007)(52536014)(8676002)(4326008)(55016003)(40480700001)(40460700003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:31:31.9273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e6169b-1631-4319-dd46-08da5f218c67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6560

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBzZXJpZXMgaGFzIGJlZW4gc3RhbGUgZm9yIG5lYXJs
eSBhIG1vbnRoLCB3aXRoIG5vdGhpbmcgaGVhcmQNCmZyb20gbWFpbnRhaW5lcnMuIFNvIEkgYW0g
c2VuZGluZyB0aGlzIGVtYWlsIGFzIGEgZ2VudGxlIHJlbWluZGVyIGZvciBtYWludGFpbmVycy4N
ClRoYW5rcyENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBTdWJqZWN0OiBbUEFUQ0ggMDAvMTFdIHg4Njogc3VwcG9ydCBBVlg1MTItRlAx
Ng0KPiANCj4gV2hpbGUgSSAocXVpdGUgb2J2aW91c2x5KSBkb24ndCBoYXZlIGFueSBzdWl0YWJs
ZSBoYXJkd2FyZSwgSW50ZWwncw0KPiBTREUgYWxsb3dzIHRlc3RpbmcgdGhlIGltcGxlbWVudGF0
aW9uLiBBbmQgc2luY2UgdGhlcmUncyBubyBuZXcNCj4gc3RhdGUgKHJlZ2lzdGVycykgYXNzb2Np
YXRlZCB3aXRoIHRoaXMgSVNBIGV4dGVuc2lvbiwgdGhpcyBzaG91bGQNCj4gc3VmZmljZSBmb3Ig
aW50ZWdyYXRpb24uDQo+IA0KPiAwMTogQ1BVSUQ6IEFWWDUxMi1GUDE2IGRlZmluaXRpb25zDQo+
IDAyOiBoYW5kbGUgQVZYNTEyLUZQMTYgaW5zbnMgZW5jb2RlZCBpbiAwZjNhIG9wY29kZSBtYXAN
Cj4gMDM6IGhhbmRsZSBBVlg1MTItRlAxNiBNYXA1IGFyaXRobWV0aWMgaW5zbnMNCj4gMDQ6IGhh
bmRsZSBBVlg1MTItRlAxNiBtb3ZlIGluc25zDQo+IDA1OiBoYW5kbGUgQVZYNTEyLUZQMTYgZm1h
LWxpa2UgaW5zbnMNCj4gMDY6IGhhbmRsZSBBVlg1MTItRlAxNiBNYXA2IG1pc2MgaW5zbnMNCj4g
MDc6IGhhbmRsZSBBVlg1MTItRlAxNiBjb21wbGV4IG11bHRpcGxpY2F0aW9uIGluc25zDQo+IDA4
OiBoYW5kbGUgQVZYNTEyLUZQMTYgY29udmVyc2lvbiB0by9mcm9tIChwYWNrZWQpIGludDE2IGlu
c25zDQo+IDA5OiBoYW5kbGUgQVZYNTEyLUZQMTYgZmxvYXRpbmcgcG9pbnQgY29udmVyc2lvbiBp
bnNucw0KPiAxMDogaGFuZGxlIEFWWDUxMi1GUDE2IGNvbnZlcnNpb24gdG8vZnJvbSAocGFja2Vk
KSBpbnR7MzIsNjR9IGluc25zDQo+IDExOiBBVlg1MTItRlAxNiB0ZXN0aW5nDQo+IA0KPiBXaGls
ZSBJJ3ZlIHJlLWJhc2VkIHRoaXMgYWhlYWQgb2YgdGhlIGFsc28gcGVuZGluZyBBTVggc2VyaWVz
IChhbmQsDQo+IG9idmlvdXNseSwgYWhlYWQgb2YgdGhlIG5vdCBldmVuIHN1Ym1pdHRlZCB5ZXQg
S2V5TG9ja2VyIG9uZSksIHRoaXMNCj4gc2VyaWVzIGlzIGludGVudGlvbmFsbHkgYnVpbHQgb24g
dG9wIG9mICJ4ODZlbXVsOiBhIGZldyBzbWFsbCBzdGVwcw0KPiB0b3dhcmRzIGRpc2ludGVncmF0
aW9uIiwgd2hpY2ggaGFzIGFscmVhZHkgYmVlbiBwZW5kaW5nIGZvciBmYXIgdG9vDQo+IGxvbmcu
DQo+IA0KPiBKYW4NCg0K

