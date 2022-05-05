Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17951BC29
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 11:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321886.543029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmXnX-0000qH-6e; Thu, 05 May 2022 09:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321886.543029; Thu, 05 May 2022 09:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmXnX-0000oM-2M; Thu, 05 May 2022 09:29:23 +0000
Received: by outflank-mailman (input) for mailman id 321886;
 Thu, 05 May 2022 09:29:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxCF=VN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmXnU-0000oG-W9
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 09:29:21 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe05::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6e3c519-cc55-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 11:29:19 +0200 (CEST)
Received: from AM5PR1001CA0050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::27) by AM0PR08MB2962.eurprd08.prod.outlook.com
 (2603:10a6:208:5b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 09:29:17 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::8) by AM5PR1001CA0050.outlook.office365.com
 (2603:10a6:206:15::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Thu, 5 May 2022 09:29:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 09:29:16 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Thu, 05 May 2022 09:29:16 +0000
Received: from 7392b9c90a74.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD3DCFFB-BFAF-42D3-BE1E-F68DFFF9AA5E.1; 
 Thu, 05 May 2022 09:29:06 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7392b9c90a74.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 May 2022 09:29:06 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR0801MB1886.eurprd08.prod.outlook.com (2603:10a6:800:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 09:29:03 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 09:29:03 +0000
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
X-Inumbo-ID: d6e3c519-cc55-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BCnt22bYRygT46cOYbbJcg4S+2GMvreb2x4JCECUX75bkwpufhJ+bNW1itas2eOUbGrOERqmVN6cdwZbi4en+w350JGyEmHLVOG3Bn0C54ZXDnXVz0lZtWAvr7xp4rY1K+aTUMamzKR32yPSpBcenwgQA9XLxCcMhFOlH/Mwhoe0g6EGZfqu4gtbBH31dLeoVeTyT/fFBrKcjuriD/hCThlyh9Nb1fxHe+0kI3Dnl8lu7cViGWkr5qaV34Gh3BFqlbtv7XYuIhfDQnh84Ha2h+3jv2BoYaNYgTEsQLGVS7O6GOjVbaJ3vSlhIzVhyrcz4B77SuT78THMeJa2LMV3Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uNSsv0Xm/N7smwIAHAnezWvsSLYubikA8hEGczJDgA=;
 b=GtQEtbkBKNScZfQlJq2tLnZq8TQY+eLOwTzleJOiJ55BTSMrTgrxGDOQGmiKecDd4yEbsEBhvzSVEMxWt6V5Xd0w61i1HJQO2rzDrpxGHAMUg4LshmiLDfFiDaxAITcXtCa1qh/6FDrgxbUxGrtcHG/CFAcIz766ZBaV+6CWoqjnAbBeoUeIDVRhCG7zTyepATJy9YF/5JjSy+5djqJwOMmiIvXsLq78sPVctLqYv0yuJZB/R4aQYvhgMFwE57x8fiSsSEZRidCJBuf17ooF10nItftN/LHMx9jKo9sftHg8OCilUfG1DsVLMhutFAXOZF81sjUqPs4k1mdIswftvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uNSsv0Xm/N7smwIAHAnezWvsSLYubikA8hEGczJDgA=;
 b=pm3PLBwBkO8yDpdp9DaGBmlUu2KOx2Ls3y44Y6BF2y93VXioLUMUeHoDo8CXgaC6+Meo+V0SDtefdzGoj7PsfYjR2IemQgowiIYpAXORaY8GSJI/Ni4YAYLXIhOHK1zAgtJQTVBYWqnL33SZZk8NIO4s1I05GF7yh5oMyHHo908=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhZ7wG4aeuIXx2NnrrvqmoWl4+mTR8b6TUT/GjEKJexEP6+TCMy9fEW6OoOJJOC9FkjFdoGjbtTDBspTVYEaJIyeQHsDr6E3Z5TQNuj9SUxDo2AzOSojzGjJ+6OLVyuP/q6muzpx/vGYladzU6FQlE3RRfqifdTWyhDnA8VTAUqrlFNUjWIemTOZEGW5HMtqADeR4PRg4nJY9kK/i9MS2ejcBnY3eoeEIJELAVxA47S5HdhQ/7CKF57fu6KKgQN0BDUooMt3L22yEs63SzKPaC7DZdYjnYec1LSXIPkWXSaAwvknedAbqto+3ZEbdH7TzSrD8cduhWjiz+lHAZJ4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uNSsv0Xm/N7smwIAHAnezWvsSLYubikA8hEGczJDgA=;
 b=aF4UPWM0urbRt631Of9r2V4p5qdlfohaogv2kwpK0OHC5XJa5ROYtWIssipWGdH9UUcdGYnN7YfqiWwB6pwqZ/pKT1AyIGldnSfelaRsltOODZ5Cz76wb92LMGX3LjdKyb5txleXPy78DVbljPonWVqc0EQtcLzai3ivattUc6RRDuAdTqk4U4386xeuTBLmmglhLj7oxgiSd1n8JNKbezi0DbWG4PGqoasRMeSbq/cK+F5XqAJ4G6rCT+phSNp/Npv3bgHqLCnWqwEwc6lOZ9MRNxckAK4beXqJHaQL2Gx+kxUNgzXDYiGIt60ijS31yH+TeixWI/dgU66gVwLwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uNSsv0Xm/N7smwIAHAnezWvsSLYubikA8hEGczJDgA=;
 b=pm3PLBwBkO8yDpdp9DaGBmlUu2KOx2Ls3y44Y6BF2y93VXioLUMUeHoDo8CXgaC6+Meo+V0SDtefdzGoj7PsfYjR2IemQgowiIYpAXORaY8GSJI/Ni4YAYLXIhOHK1zAgtJQTVBYWqnL33SZZk8NIO4s1I05GF7yh5oMyHHo908=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Index:
 AQHYWhlFOdBlNRd7J0aYNs5h64D4UK0OxgEAgAEVjwCAABi4gIAAB8rggAAKIYCAAAcaUA==
Date: Thu, 5 May 2022 09:29:03 +0000
Message-ID:
 <DU2PR08MB732544E17B308416A77C97E0F7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
 <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <03430522-16cb-5ad3-272a-ca0cee79c7e3@suse.com>
In-Reply-To: <03430522-16cb-5ad3-272a-ca0cee79c7e3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1976E5EF62171C40A3B2D53E034770FB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e87da999-821e-45d1-bc85-08da2e79b9d4
x-ms-traffictypediagnostic:
	VI1PR0801MB1886:EE_|VE1EUR03FT055:EE_|AM0PR08MB2962:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB2962A18C4825FCD61C7BDDD4F7C29@AM0PR08MB2962.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c6vmgTjslyjEp2YnFvmPmx8YnB4JTHMMHw4VSaG6D4zipcd0JynM2iWNFxH/XK2+8bIwDoRQCRNSBjHolY1KQI3ni7KaRkEAXB8xYTlfykgZHlODVZ5iiFjkADOESd2rBk6lB+AOtoejY1SNCbjEetbp6MGJqQv+wSHTnXO6DNI13opZkuJLu/d4Og9OEnJnowggxX5FV2xQIG/ji1uicjz8CRq9mD1XkPrZpl5oPmOyaUc5QoW2Xbw/IZn/60BTucQvBK5asCPM4qmfrh677hVE402wJOjQVt4iqmPd3pkEVej0IvjJopQBh9gtsoO8sBIueyzj9WgYLyEOs11GVm0WU5LMjqUYgeYSqVl6bVuXnmgHTFzaKbpeDqp5iIug8kItNxas3waiTthHT9uOy5H3GvRWp4JoGM1wX84LHWGzt+gS/84YYWBQ4bh1aohvLg880e7JHBORfK8Od3ynqc58wVeoPYIoS+LddOMDYXijxrLsUzdToEF1zGxqWi64x4htMRGrhc9GTyl/4YrHmHDE1fJ2DnqoDoaXA3GXbimdOA6DrIcFH/KLpvz8yzmUb8qRaIN7hUbuuWBefyyBDN4RJsijlNKEZ2ORuuqtxzkhmOWgY581cZd927uNoobCqW9i/YI5Rfy1HAp9Qb8420U6DT2nM8Stv3WXoOhwQo0CfLqDjXyCirxwMEwTZfyk+mgge4UAL/8aBkUXuvlOaVWLGsbTS3ffUJLmrV+UAcE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(66946007)(66476007)(66556008)(66446008)(8676002)(76116006)(4326008)(71200400001)(38070700005)(86362001)(508600001)(186003)(6916009)(316002)(54906003)(53546011)(83380400001)(26005)(7696005)(122000001)(6506007)(9686003)(55016003)(8936002)(52536014)(33656002)(2906002)(5660300002)(38100700002)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1886
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14d9e41c-57a2-402a-f026-08da2e79b1b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lbzUP6toL+BE+aEnG/QHSlVNOcUsgZBAzTPICTkEzwVGahlBWQcIOAOSPuLSO10wQNHWVdEqshMGLemm/m3GWzzmLRVw8gDHdRIWvA2rcwo7XSOIUSCoI/Cyk5ru/6Wvzt0FIptRZUfMduaGJJ4x7FAQs3Ie+BnUa/PpyIHEt2V2Wzr8esmmLDYG2hFLiXgdNrUZQf9K+FvQ5QZwwCMKpzOeOn34DS/rnh4HXIxufEzd230MLL1JJYBexr8+JOjGYLhrBAj91b/X/yfe1bCA2oI8kfUQK07RxlIda2H5MJr8n9jd08xyVXs5FmLYXLwmI7p1uWP92B5Y8ovGXIW8gkqvgGgWd+9PBvKpIxDWo4HXpAsCk8HbhRcaq4h/Sah2S6wZS0rxwYa+qmQefVSlVJVYxVqKe4NsZCjTP2BaMLT9lC3i7MSr8bM2AU891GPC/wD/qMW+YybfMHfloUcu6YrIrE5M2rwKf+pYbmUVcVxuc/aKvmfJ/BwXU03O2vcvxRvRVgjCXZGZx0TMtLlXVoBTKmpz/eqXgszygFm+2KzUZxuWcAQHap5m/z3OV+Rrz02xl43XktiYWSsXk3P3opWxShFKzADDYjpxx3cdhCj1A4Qzwe8ah0CbD5PnScL/Xl00n3Eft38Sc5rGxsedVmbrPNTkjhK5L+U8w8cwNUyxEO5FvZHslZZ82lAznZ+Spn+WlhQ0PB+WviIXzyzJPA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(9686003)(2906002)(83380400001)(70206006)(70586007)(33656002)(40460700003)(4326008)(6862004)(8676002)(81166007)(36860700001)(82310400005)(54906003)(55016003)(356005)(186003)(26005)(53546011)(6506007)(316002)(7696005)(5660300002)(8936002)(336012)(52536014)(508600001)(86362001)(47076005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 09:29:16.8743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e87da999-821e-45d1-bc85-08da2e79b9d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2962

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDUsIDIwMjIgNDo1
MSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT47
DQo+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVu
bGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
V2VpIExpdSA8d2xAeGVuLm9yZz47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA2LzZdIHhlbjogcmV0cmlldmUgcmVzZXJ2ZWQgcGFn
ZXMgb24NCj4gcG9wdWxhdGVfcGh5c21hcA0KPiANCj4gT24gMDUuMDUuMjAyMiAxMDo0NCwgUGVu
bnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgamFuDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+
PiBTZW50OiBUaHVyc2RheSwgTWF5IDUsIDIwMjIgMzo0NyBQTQ0KPiA+PiBUbzogUGVubnkgWmhl
bmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+ID4+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJt
LmNvbT47IEhlbnJ5IFdhbmcNCj4gPEhlbnJ5LldhbmdAYXJtLmNvbT47DQo+ID4+IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwDQo+ID4+IDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsg
U3RlZmFubw0KPiA+PiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz47IHhlbi0NCj4gPj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4g
Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA2LzZdIHhlbjogcmV0cmlldmUgcmVzZXJ2ZWQgcGFn
ZXMgb24NCj4gPj4gcG9wdWxhdGVfcGh5c21hcA0KPiA+Pg0KPiA+PiBPbiAwNS4wNS4yMDIyIDA4
OjI0LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+ID4+Pj4gU2VudDogV2VkbmVzZGF5LCBNYXkgNCwgMjAyMiA5OjQ1IFBN
DQo+ID4+Pj4NCj4gPj4+PiBPbiAyNy4wNC4yMDIyIDExOjI3LCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4gPj4+Pj4gICNlbHNlDQo+ID4+Pj4+ICB2b2lkIGZyZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVj
dCBwYWdlX2luZm8gKnBnLCB1bnNpZ25lZCBsb25nDQo+ID4+IG5yX21mbnMsDQo+ID4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgbmVlZF9zY3J1YikgIHsNCj4gPj4+Pj4gICAg
ICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gPj4+Pj4gIH0NCj4gPj4+Pj4gKw0KPiA+Pj4+PiAr
aW50IF9faW5pdCBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBtZm5f
dCBzbWZuLA0KPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgbnJfbWZucywgdW5zaWduZWQNCj4gPj4+Pj4gK2ludA0KPiA+Pj4+PiArbWVtZmxh
Z3MpIHsNCj4gPj4+Pj4gKyAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gPj4+Pj4gK30NCj4g
Pj4+Pg0KPiA+Pj4+IEkgY2FuJ3Qgc3BvdCBhIGNhbGxlciBvZiB0aGlzIG9uZSBvdXRzaWRlIG9m
IHN1aXRhYmxlICNpZmRlZi4gQWxzbw0KPiA+Pj4+IHRoZSBfX2luaXQgaGVyZSBsb29rcyB3cm9u
ZyBhbmQgeW91IGxvb2sgdG8gaGF2ZSBtaXNzZWQgZHJvcHBpbmcgaXQNCj4gPj4+PiBmcm9tDQo+
ID4+IHRoZSByZWFsIGZ1bmN0aW9uLg0KPiA+Pj4+DQo+ID4+Pj4+ICttZm5fdCBhY3F1aXJlX3Jl
c2VydmVkX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50DQo+ID4+Pj4+ICttZW1m
bGFncykgew0KPiA+Pj4+PiArICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiA+Pj4+PiArfQ0K
PiA+Pj4+PiAgI2VuZGlmDQo+ID4+Pj4NCj4gPj4+PiBGb3IgdGhpcyBvbmUgSSdkIGFnYWluIGV4
cGVjdCBDU0UgdG8gbGVhdmUgbm8gY2FsbGVycywganVzdCBsaWtlIGluDQo+ID4+Pj4gdGhlIGVh
cmxpZXIgcGF0Y2guIE9yIGFtIEkgb3Zlcmxvb2tpbmcgYW55dGhpbmc/DQo+ID4+Pj4NCj4gPj4+
DQo+ID4+PiBJbiBhY3F1aXJlX3Jlc2VydmVkX3BhZ2UsIEkndmUgdXNlIGEgZmV3IENPTkZJR19T
VEFUSUNfTUVNT1JZLW9ubHkNCj4gPj4+IHZhcmlhYmxlcywgbGlrZQ0KPiA+Pj4gZC0+cmVzdl9w
YWdlX2xpc3QsIHNvIEknZCBleHBlY3QgdG8gbGV0IGFjcXVpcmVfcmVzZXJ2ZWRfcGFnZQ0KPiA+
Pj4gZC0+Z3VhcmRlZCBieSBDT05GSUdfU1RBVElDX01FTU9SWQ0KPiA+Pj4gdG9vIGFuZCBwcm92
aWRlIHRoZSBzdHViIGZ1bmN0aW9uIGhlcmUgdG8gYXZvaWQgY29tcGlsYXRpb24gZXJyb3INCj4g
Pj4gd2hlbiAhQ09ORklHX1NUQVRJQ19NRU1PUlkuDQo+ID4+DQo+ID4+IEEgY29tcGlsYXRpb24g
ZXJyb3Igc2hvdWxkIG9ubHkgcmVzdWx0IGlmIHRoZXJlJ3Mgbm8gZGVjbGFyYXRpb24gb2YNCj4g
Pj4gdGhlIGZ1bmN0aW9uLiBJIGRpZG4ndCBzdWdnZXN0IHRvIHJlbW92ZSB0aGF0LiBBIG1pc3Np
bmcgZGVmaW5pdGlvbg0KPiA+PiB3b3VsZCBvbmx5IGJlIG5vdGljZWQgd2hlbiBsaW5raW5nLCBi
dXQgQ1NFIHNob3VsZCByZXN1bHQgaW4gbm8NCj4gPj4gcmVmZXJlbmNlIHRvIHRoZSBmdW5jdGlv
biBpbiB0aGUgZmlyc3QgcGxhY2UuIEp1c3QgbGlrZSB3YXMgc3VnZ2VzdGVkDQo+ID4+IGZvciB0
aGUgZWFybGllciBwYXRjaC4gQW5kIGFzIG9wcG9zZWQgdG8gdGhlIGNhbGwgc2l0ZSBvcHRpbWl6
YXRpb24NCj4gPj4gdGhlIGNvbXBpbGVyIGNhbiBkbywgd2l0aCAtZmZ1bmN0aW9uLXNlY3Rpb25z
IHRoZXJlJ3Mgbm8gd2F5IGZvciB0aGUgbGlua2VyDQo+IHRvIGVsaW1pbmF0ZSB0aGUgZGVhZCBz
dHViIGZ1bmN0aW9uLg0KPiA+Pg0KPiA+DQo+ID4gU3VyZSwgcGx6IGNvcnJlY3QgbWUgaWYgSSB1
bmRlcnN0YW5kIHdyb25nbHk6DQo+ID4gTWF5YmUgaGVyZSBJIHNob3VsZCB1c2UgI2RlZmluZSB4
eHggdG8gZG8gdGhlIGRlY2xhcmF0aW9uLCBhbmQgaXQgd2lsbA0KPiA+IGFsc28gYXZvaWQgYnJp
bmdpbmcgZGVhZCBzdHViIGZ1bmN0aW9uLiBTb21ldGhpbmcgbGlrZToNCj4gPiAjZGVmaW5lIGZy
ZWVfc3RhdGljbWVtX3BhZ2VzKHBnLCBucl9tZm5zLCBuZWVkX3NjcnViKSAoKHZvaWQpKHBnKSwN
Cj4gPiAodm9pZCkobnJfbWZucyksICh2b2lkKShuZWVkX3NjcnViKSkgQW5kICNkZWZpbmUNCj4g
PiBhY3F1aXJlX3Jlc2VydmVkX3BhZ2UoZCwgbWVtZmxhZ3MpIChJTlZBTElEX01GTikNCj4gDQo+
IE5vLCBJIGRvbid0IHNlZSB3aHkgeW91IHdvdWxkIG5lZWQgI2RlZmluZS1zLiBZb3Ugd2FudCB0
byBoYXZlIG5vcm1hbA0KPiBkZWNsYXJhdGlvbnMsIGJ1dCBubyBkZWZpbml0aW9uIHVubGVzcyBT
VEFUSUNfTUVNT1JZLiBJZiB0aGF0IGRvZXNuJ3Qgd29yaywNCj4gcGxlYXNlIHBvaW50IG91dCB3
aHkgKGkuZS4gd2hhdCBJIGFtIG92ZXJsb29raW5nKS4NCj4gDQoNCkkgd2FzIHRyeWluZyB0byBh
dm9pZCBkZWFkIHN0dWIgZnVuY3Rpb24sIGFuZCBJIHRoaW5rICNkZWZpbmUtcyBpcyB0aGUgd3Jv
bmcgcGF0aC4uLg0KU28sIEkgZ3Vlc3MgSWYgSSByZW1vdmUgdGhlIEFTU0VSVF9VTlJFQUNIQUJM
RSgpIHBhcnQgYW5kIG9ubHkgbGVhdmUgdGhlIGVtcHR5DQpmdW5jdGlvbiBib2R5IHRoZXJlLCB0
aGUgQ1NFIGNvdWxkIGRvIHRoZSBvcHRpbWl6YXRpb24gYW5kIHJlc3VsdCBpbiBubyByZWZlcmVu
Y2UuDQoNCj4gSmFuDQoNCg==

