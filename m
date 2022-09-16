Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8668B5BA3FE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 03:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407757.650358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ09i-00069y-BR; Fri, 16 Sep 2022 01:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407757.650358; Fri, 16 Sep 2022 01:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ09i-00067I-8F; Fri, 16 Sep 2022 01:28:34 +0000
Received: by outflank-mailman (input) for mailman id 407757;
 Fri, 16 Sep 2022 01:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogj/=ZT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oZ09g-00067C-UY
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 01:28:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id def8a726-355e-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 03:28:30 +0200 (CEST)
Received: from AM6P191CA0065.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::42)
 by DBBPR08MB5881.eurprd08.prod.outlook.com (2603:10a6:10:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 01:28:26 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::1e) by AM6P191CA0065.outlook.office365.com
 (2603:10a6:209:7f::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14 via Frontend
 Transport; Fri, 16 Sep 2022 01:28:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 01:28:26 +0000
Received: ("Tessian outbound 8ec96648b960:v124");
 Fri, 16 Sep 2022 01:28:26 +0000
Received: from 0f65c7b16b00.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0740137-3EAB-4398-9B57-5CDE1FB12FB7.1; 
 Fri, 16 Sep 2022 01:28:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f65c7b16b00.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Sep 2022 01:28:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6679.eurprd08.prod.outlook.com (2603:10a6:20b:393::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14; Fri, 16 Sep
 2022 01:28:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::b46e:50dd:b6e2:5241]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::b46e:50dd:b6e2:5241%4]) with mapi id 15.20.5612.022; Fri, 16 Sep 2022
 01:28:18 +0000
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
X-Inumbo-ID: def8a726-355e-11ed-9761-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jsn57Vd0d5YqaKTE4os6tefSH4p0zjUu+Fgu5K3/b4V03INmxHCYz9JEdcviCuMJ63yGPeLso4rELsLI7teTQan3wClY4/9uam6Zr/iCkxlJtELa+AX35fqr/Zl7LwooGXZ5TZM55Yj4fgjeA2qNiGO6ePl6W6Rk5NwEYdEViAAN8QojilBG4ABjl3M8cqhqSeT+5jtRpawBGZuGUEUxhuurDck8F1k1l1iV2dozJnoBXdKTNhGdz2tXl1/Aevmqu7Nv+iPFhD+qtPiaYc0Ujt4UDigA92JPhzRyg4PbZKHCjCT3fUofsOagPFU2L0jTbvAtdWFXBwlEvfZtFwXUOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGJBZmrYN4//JR3hztF/NkGFo7HtMvqGf3BpixGCW4U=;
 b=mb1oGlRBfGFSBYamUQajfzurzuW9cDbIn1wo9whyJrrkekncbuJg6Yoal69A7afk46gHsmm7KIvjltqQa0+Og9Osj8W+KI0Nap/abOgV0r5RKHGVCJXmEmBkrrfB55nHThKa3naVKlpyVkY+V+a9kHn/TK+CE4icppvjcd0t4ekbZ96o6pl0pzpwLZwTMuUbqTKv/iwOTd7d7fF1tOOPLEnSx9cvHMzaNsNDLeLzAbZG/gDYaZd03siY2T45wrQT/GUFMeAH6mBTVhNlN4D/IpvwRnEwp+53STjftfp+ScpBjppj9MLDVpnRMC1sXv8ahbKfMY/NglzTTchRG4/Q4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGJBZmrYN4//JR3hztF/NkGFo7HtMvqGf3BpixGCW4U=;
 b=rl+/1uyC+0OE4p3oZtLz0j58ABG+gyNbHZDr7DMw4HQZALv1BBtSMQr4y6v9YdRE8C4JrlSDIuDIEjCFEn/DJaOX89spqMIBW2osq45i/9H1dX103oaDV+X2yTYvC4KOOBkFi5owtEs39meg4VafUp4RnttzsaeWOXlDoUKZyec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWTXWv4FeIb+poS2WZb5Pf7V0BszDTgw+pi2Fld0GLOST7nlshy+6Z5wI16vNiLVjYh/2qDsnqK53OuC+XE+aTnd8tEtK5q8q2X4Spd1JCszmjff023rSD2F7U2gXmOMYw+2OP4T5pBJPBJoat/kClJ4F/h3yqe1KB6hX/3ti+Rqisn52e6kTyRmfrMm8jX7vjj4ZCA4QNNmHASIu28l0BMla/dsguvMlzdB8Djtkw0tEaKxiBcJjNE7BkEuVzdZzOVrxu5BYCWLyTjq7EWIDqo65Q/kmQuseGRxqOD7+cZ28q6xsWjRh+yUb8/HjJr5nsemb9Eh9aPnS86T+JdUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGJBZmrYN4//JR3hztF/NkGFo7HtMvqGf3BpixGCW4U=;
 b=ZrkfrVdc+hICdIEh/uF8cU11Wm1aS4Vr0wiiu8a09dP/KJfKXf87Xo5aNUfavmzcaDRZKDsvIfwbqr/fpeAEPKTq/yPsqu8ZuL9ZShpXe89JoGE3vrqsOpVVO04+p5Jzep22vhT7pqCeX94RZb2zQEpAe1Tv9wU4ZdEErd9h6cDN4AsvlMk8mBWpULAMV5243XjR9tHvjpna1QJwTZLUcugMIeDAGhYJ+fCnFyt1FEE8Y4ddC4XSbL0r2XPJ/OapVkOKUACOKwv95gQau953MLKCfBLTiK+IRRySzTdjN12otEkP4LNzYv2k5UxAcTmvs5a+9uzBy4hwyFV7fwOTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGJBZmrYN4//JR3hztF/NkGFo7HtMvqGf3BpixGCW4U=;
 b=rl+/1uyC+0OE4p3oZtLz0j58ABG+gyNbHZDr7DMw4HQZALv1BBtSMQr4y6v9YdRE8C4JrlSDIuDIEjCFEn/DJaOX89spqMIBW2osq45i/9H1dX103oaDV+X2yTYvC4KOOBkFi5owtEs39meg4VafUp4RnttzsaeWOXlDoUKZyec=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Demi Marie
 Obenour <demi@invisiblethingslab.com>
Subject: RE: [PATCH for-4.17?] x86: support data operand independent timing
 mode
Thread-Topic: [PATCH for-4.17?] x86: support data operand independent timing
 mode
Thread-Index: AQHYyOqob1u+YVxpCE2QK+LaZq4Qxa3hRDCA
Date: Fri, 16 Sep 2022 01:28:18 +0000
Message-ID:
 <AS8PR08MB799162B46A8A57A54572A83892489@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
In-Reply-To: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 10295DA66DC7214D89E168760DBF730B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6679:EE_|AM7EUR03FT017:EE_|DBBPR08MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb89abf-ba73-4d72-00e2-08da9782c0fd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 s4UfP9epayFhNIgao3Fo39KkIkbfUVSdKNnwRsEP2c6D0z9MO29+RQS9QKwkkvKlrxaw5BPb9CCbuJmr2Ej8aXRPHMe2QbhPcqkJoWUgYKfOMwF4ij1EqNHb1nAAWQeFcxLzd5hrhAcpqVIrfklX0+PpygM2iHnPB7yMv6kw150skN1Q1YMIogFZ/j5Ox5VGB6FDTnyUe7AL8or+lzmT7MVlAN9VZQHOMK0Uz/XIZ/Wo84d7rLwoesaCrQGVV4UZyyxtm+lTjVwWvxyMkB4GN+uyApqUbXggXSkex2pNd+dOgBkpDCgPWIzKb2SX1hyEIKa1T4ucmfl6GWwXCjB8v7YmaG/oyRyLMh7Uq/yWH8dRjUNjODSB5NSzeXE9N1Bh1oarw31MijCC3kQuMB7QNMEzhxCaJlTP780Z5Q6vVZ5TaRshUZeEAQ8cG2a8HWVp4ppSp/IOeskTSjb93KN4OhI9eUVr0W5+sp7ofrsrqW+dSpoZzSnSqxU2d7zCLFAMu2tJW8QKPqHU4jX3Pq4d1vtHhpVO1AGUcT8CdLaCjU9LkTTXuI7ROwbISeZ1gYvWXn+f0R8B81VffsxJGEmF/fBGX+ypjtSmzEQ841l827pWhvy5yyplhTKazBv/asoYkc7oTqA1/t3AqapyuQ66HvEgRqT05VmP6YZ+IoEmiwNL97Z+n3jn56ni41vPO7qxnPVvLqVbdCLaxc9n/D4pUrRcuPmbTVGvnELIE9l3EtrtpwvboMPQPCD2p+a2jG1BQvoIOs1O+PPASrq8NHVcrDiMyk+55rfLPbBoTU5P4p4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199015)(66476007)(8936002)(64756008)(66946007)(76116006)(66556008)(4326008)(66446008)(2906002)(8676002)(52536014)(5660300002)(966005)(71200400001)(478600001)(38100700002)(122000001)(54906003)(6506007)(9686003)(41300700001)(26005)(55016003)(316002)(33656002)(110136005)(7696005)(86362001)(83380400001)(38070700005)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6679
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc602f11-6cc1-46f1-ff30-08da9782bc63
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NuT8TjcFq1oaQSP+f9hfrimE6e0I6JuwX638TYP1SOAJIJhpOibxpqZ3B9UCQbQ+iaSHzaCa+hIh0bExyuUoWIgRtBOIuS1SVrmNJt/U0/dhtvutp76sl0I21g4N33+7omYkIz/z8C13kRtbLVDb8nKRbnjVWu980E7yRCo3GsTbPV4qYLAfN7KKpcwRxRuHaJC47J689uUlJF//08T71dDjJBvJkAAnl6YIXHQK0aZvHe2QOjosBDZdvlicBBi+YKlzqgHsjyNMONJ6G/TGOjeid2CUUOi1tB9oyVmPxkaEoutK5LF3BaNz2L1lBWjiojExhuvH1W3fTc49tpc0xang2AyNYEycaWzYGcWsE0+e3q+fRt5eybZJgP29Cy8qTaEdfCSmaT4JuHh8JxyAe5V2xKx1q+2+8SJY4iOOWqW68UcvTbrepZDmqRTn83zrNWWfYgTSIB9Avc00/WIjhR10RnCj2l2WXvYM8SfAQRojipRUfeFd3XJC0u5jU/eqazEwWBCHtYRVcm0808XjuB2L92M2jGTZZaXP/UY20t/C/KCgPa/EnoT+0Rr5ZH+T1EQPIK6Tu1HfuKLx5EVsSoOYqEAAkScxpJFrmMVy5HJ09D+z2z1vdV81aPOGJVoNR+dMQh6pNW8WNCY6X27C2PXjUKJVCPghzJ7OnYrgvE4P4QbgC6LC04AWm6337O0LvqkY2aZ5SdGDmSEvqflcaTo+RBj9oiNQfk862xDXvOm1hRFSjqAnj97JdgBz8lt5ioB6sDOuwBh1lXE++Z4pYlSxhJPbvgGTVtX3Nq6fFsQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(81166007)(2906002)(356005)(5660300002)(40460700003)(82740400003)(33656002)(26005)(9686003)(40480700001)(966005)(41300700001)(478600001)(7696005)(86362001)(36860700001)(8936002)(52536014)(316002)(336012)(107886003)(83380400001)(6506007)(82310400005)(55016003)(186003)(8676002)(110136005)(4326008)(70206006)(70586007)(47076005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 01:28:26.5070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb89abf-ba73-4d72-00e2-08da9782c0fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5881

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFtQQVRD
SCBmb3ItNC4xNz9dIHg4Njogc3VwcG9ydCBkYXRhIG9wZXJhbmQgaW5kZXBlbmRlbnQgdGltaW5n
DQo+IG1vZGUNCj4gDQo+IFsxXSBzcGVjaWZpZXMgYSBsb25nIGxpc3Qgb2YgaW5zdHJ1Y3Rpb25z
IHdoaWNoIGFyZSBpbnRlbmRlZCB0byBleGhpYml0DQo+IHRpbWluZyBiZWhhdmlvciBpbmRlcGVu
ZGVudCBvZiB0aGUgZGF0YSB0aGV5IG9wZXJhdGUgb24uIE9uIGNlcnRhaW4NCj4gaGFyZHdhcmUg
dGhpcyBpbmRlcGVuZGVuY2UgaXMgb3B0aW9uYWwsIGNvbnRyb2xsZWQgYnkgYSBiaXQgaW4gYSBu
ZXcNCj4gTVNSLiBQcm92aWRlIGEgY29tbWFuZCBsaW5lIG9wdGlvbiB0byBjb250cm9sIHRoZSBt
b2RlIFhlbiBhbmQgaXRzDQo+IGd1ZXN0cyBhcmUgdG8gb3BlcmF0ZSBpbiwgd2l0aCBhIGJ1aWxk
IHRpbWUgY29udHJvbCBvdmVyIHRoZSBkZWZhdWx0Lg0KPiBMb25nZXIgdGVybSB3ZSBtYXkgd2Fu
dCB0byBhbGxvdyBndWVzdHMgdG8gY29udHJvbCB0aGlzLg0KPiANCj4gU2luY2UgQXJtNjQgc3Vw
cG9zZWRseSBhbHNvIGhhcyBzdWNoIGEgY29udHJvbCwgcHV0IGNvbW1hbmQgbGluZSBvcHRpb24N
Cj4gYW5kIEtjb25maWcgY29udHJvbCBpbiBjb21tb24gZmlsZXMuDQo+IA0KPiBbMV0NCj4gaHR0
cHM6Ly93d3cuaW50ZWwuY29tL2NvbnRlbnQvd3d3L3VzL2VuL2RldmVsb3Blci9hcnRpY2xlcy90
ZWNobmljYWwvc28NCj4gZnR3YXJlLXNlY3VyaXR5LWd1aWRhbmNlL2Jlc3QtcHJhY3RpY2VzL2Rh
dGEtb3BlcmFuZC1pbmRlcGVuZGVudC10aW1pbmctDQo+IGlzYS1ndWlkYW5jZS5odG1sDQo+IA0K
PiBSZXF1ZXN0ZWQtYnk6IERlbWkgTWFyaWUgT2Jlbm91ciA8ZGVtaUBpbnZpc2libGV0aGluZ3Ns
YWIuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IC0tLQ0KPiBUaGlzIG1heSBiZSB2aWV3ZWQgYXMgYSBuZXcgZmVhdHVyZSwgYW5kIGhlbmNl
IGJlIHRvbyBsYXRlIGZvciA0LjE3LiBJdA0KPiBtYXksIGhvd2V2ZXIsIGFsc28gYmUgdmlld2Vk
IGFzIHNlY3VyaXR5IHJlbGV2YW50LCB3aGljaCBpcyB3aHkgSSdkIGxpa2UNCj4gdG8gcHJvcG9z
ZSB0byBhdCBsZWFzdCBjb25zaWRlciBpdC4NCg0KQmFzZWQgb24gdGhlIGRpc2N1c3Npb24gaW4g
dGhpcyB0aHJlYWQgc28gZmFyLCBJIHRoaW5rIHBlb3BsZSB3b3VsZCB2aWV3DQp0aGlzIHBhdGNo
IGFzIGEgc2VjdXJpdHkgcmVsZXZhbnQgcGF0Y2gsIHNvIEkgZ3Vlc3Mgd2l0aG91dCBzdHJvbmcN
Cm9iamVjdGlvbiB0byBtZXJnZSB0aGlzIGluIDQuMTcsIGl0IGlzIGZpbmUgdG8gYWRkIHRoaXMg
aW4gdGhlIHJlbGVhc2UgKHdpdGgNCnByb3BlciByZXZpZXcsIG9mIGNvdXJzZSkuDQoNCktpbmQg
cmVnYXJkcywNCkhlbnJ5DQoNCg==

