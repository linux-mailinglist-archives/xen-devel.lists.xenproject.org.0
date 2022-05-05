Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ACA51BADE
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 10:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321847.542992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmX6Y-0003O0-5r; Thu, 05 May 2022 08:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321847.542992; Thu, 05 May 2022 08:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmX6Y-0003Lm-2e; Thu, 05 May 2022 08:44:58 +0000
Received: by outflank-mailman (input) for mailman id 321847;
 Thu, 05 May 2022 08:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxCF=VN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmX6V-0003Lg-Hz
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 08:44:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1e25c14-cc4f-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 10:44:53 +0200 (CEST)
Received: from AS9PR06CA0033.eurprd06.prod.outlook.com (2603:10a6:20b:463::25)
 by VE1PR08MB4958.eurprd08.prod.outlook.com (2603:10a6:803:108::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 08:44:44 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::be) by AS9PR06CA0033.outlook.office365.com
 (2603:10a6:20b:463::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 5 May 2022 08:44:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 08:44:44 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Thu, 05 May 2022 08:44:43 +0000
Received: from e84af41c3a1c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 01E5150F-E4CC-4BF3-852D-D2DE6C007F5D.1; 
 Thu, 05 May 2022 08:44:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e84af41c3a1c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 May 2022 08:44:38 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM0PR08MB5425.eurprd08.prod.outlook.com (2603:10a6:208:17d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 08:44:36 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 08:44:36 +0000
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
X-Inumbo-ID: a1e25c14-cc4f-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mWBQlAiDPlFGJUBIqVQ7QxKdPEvBIN0OStYWXhCyx/ol4Os6eQGs9uPgXiwjTigQWjXtpaEYEOJ1yZjbd3GwSl9qqtvMbWT7z5c+CW4WG8SJRnbbEOiaF9qF/J0s+ASqtQ/hV52lfqJL3ELANWWzS6X3E4nwF0f9mmNsVp7MJKvzVdOKgP9vN1TionXfm0Rvvm1JSKei+bBYxE8ex867dLKEWldDVuyxm0KIYlKwuIEhql4LhL7tNbdJlCbFzRK8piO5LQMNoPNtSlhJJQIHmUMlHTaRQMBeo32exQ2G6xCpUp53NfCB4WXWY9qwnd/F84XexHcQoZouqDDLsQEPlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePLn/19sws3bcmF/c0iOd8JtdJzzIJun04rnx3Ej+3U=;
 b=MzY2Jt+WQEN7ib+29m9qMX7odVEDkA1ga4AWUFlHNOkOee4pQNoGJHG00I0etfEILu9E+eq+Ii6bzmqkGDOLC7jn9nZJgwP/8sowaLWQddweYayPqKzTw1RsmfOZgXVrej1eS7WP97l61pdaL2PBdtTOKM/Q0zp4KfVHo9e37rQRvU8w9fAf40Pps28UqmEgvjV0icRTnCq+h6WvFk4IJnWesAHaYwK2BpKQeuEoq0SOI774Ag31TtIyOs/xaEjhFLlNxqTcfQbqjisGYQrIskoEOrdbJiJp4EQv8fcb8s25TyX89pZMheL1wb66nElF8inPQMPZuLcJRQa065CvxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePLn/19sws3bcmF/c0iOd8JtdJzzIJun04rnx3Ej+3U=;
 b=h6CXijfPuFryRyE/vSXdRu+UGNlcBwoUWSE8T1goi2Cmgp+gGmOljEX3tX5XZXvfiAe23KV0Ogq4JoVKtaPy+1HO3yF+1+Ncs306bNWXTbx9EtwHmmnlRubijkbp7VDOX1qxF9E/DR0pwqUv1CP5oW06l0o9dyKtx29o2D3G8OI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7nTc41WMlQTGxPGWxPwHSMzeKqYN+qkAQAR+zhaGKLwII+np+tUhQb7x5X9foRVs8NKtXhDp83mE8JxeURE0fXuNSsPkrXHLJpXPplSD8duv7gTZZW3zF0LbzM2eFZMyB8LsU7to2uHdeDHtcwIVci0pTJz8v0a/BblQcuB54/T64WJY5M6NtCVZV2gpRLxuQc4zp+o2KwXmizI7c3tteaSGhhAEJdkM5LNaLRR/dnnsh+5ifHDSqCsnc09IKdFuXI+OAC74fNmFZkmzObQpXx2epgeO/LVXkoxeoUYjCxbvBZw3pUQfwYmU5/Hm7cA9XFxJY+Ku41FXKnVbgirIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePLn/19sws3bcmF/c0iOd8JtdJzzIJun04rnx3Ej+3U=;
 b=B2qfUReRwk3aRbzlCmiM8QlcNQL+YGS3Nj8Wb2i/zal+vnW/bwVs/NRVGqfF9DVz5PR9+Djm9uiiNCedmGpeZ6eJ4keXbgVp4x1E2h7Slnb7h02WVED7+V+kZVxMJuCE1E8+mKVkyptIx/sjfroc/WsKos0vHCAkD25c8FiW239H5cCGKkpwRbEfrO1wVccwlpjq1smqmm9KhjXsXvsivMuNm+ORLoYubTNtCvMgdiZfWxgPMrUXTV+JZRWz1+Q9x3qXMD2mrzCttv/gyRLY04jDN4fBYCEbn7IPXBGip6Xupwhb55gtodst2a4n1OHTi5FAYZ/GLgb+BWFnwOjXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePLn/19sws3bcmF/c0iOd8JtdJzzIJun04rnx3Ej+3U=;
 b=h6CXijfPuFryRyE/vSXdRu+UGNlcBwoUWSE8T1goi2Cmgp+gGmOljEX3tX5XZXvfiAe23KV0Ogq4JoVKtaPy+1HO3yF+1+Ncs306bNWXTbx9EtwHmmnlRubijkbp7VDOX1qxF9E/DR0pwqUv1CP5oW06l0o9dyKtx29o2D3G8OI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYWhlFOdBlNRd7J0aYNs5h64D4UK0OxgEAgAEVjwCAABi4gIAAB8rg
Date: Thu, 5 May 2022 08:44:36 +0000
Message-ID:
 <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
In-Reply-To: <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E6186299A95C7F40ADFB8919A44ECAAE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a45636ef-b206-49a7-e40b-08da2e7380c1
x-ms-traffictypediagnostic:
	AM0PR08MB5425:EE_|AM5EUR03FT018:EE_|VE1PR08MB4958:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB49580E8EF8C9A38E8A0F6698F7C29@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8DGJ2irUgFQyHFEc4eSWcxFIzY9fVkBek7O0MHLhhzZD7bjnhn3AoMLFNI/izZ5MjIsgxut6Wr11xv5ZaAXMOcV/4EBshC0BfFJJ1MzofTDgTVqCy9j1gijb52WVr5Cqn/asOrmZL1xsbnmNi3Th+cD1hUJUFRm/2FkYVkSxkcrJfBIM5XkHynCy9Nw+HN8s2taCjeunQkE6Y1fe5QgtBsc9UxiTZEwIHLX40xvDFphuVLPWcHy5rM3lCL8+zxs+jgZmBV1e80HKvb0RkrN47x73lVN/egVtCOH/BilKrMd/DACc8I1GDgzx9x/oVnTadqGjb4ieqbEnHVPi42Ir9kU//qjRhxddUSS4CWS3QPK65eLV+RTd2PRGCOasPLvRtDFlfmPcFyjPDBaP/+5Fm8XOiZYLPNDROntd31TKFgAJm4pifzjhy5eBoehiX26lrXQ8rxbXjZOY7sc6lkEX2YnPLCiTKdCCDlhrUl4syonUfvezwBfcx5ihjsxl02eW94HzwYNJlQ9t0LA8ynz8lZe5DafmjG8MsJoPWiagKfH9asfqh46mo0UJP6dQJzhx1CxEXS852t8YTouuI03M6e5aGQ7xfJM83WVY7bwUqrQi3PJxqGbyMWzr+JO9mw+rys519b+sPboKXRsXNy9IFum54pfovTFBk06B4sOs5gsE0f4/utxiT/HC2fJoXz7IvPkZCWuIlYkAO34RA0d+zOZ5W4QNe3WQQ14p87wpyok=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(86362001)(6916009)(4326008)(122000001)(2906002)(8676002)(26005)(6506007)(53546011)(54906003)(508600001)(83380400001)(7696005)(9686003)(186003)(71200400001)(8936002)(66946007)(38100700002)(38070700005)(66556008)(66476007)(55016003)(33656002)(76116006)(52536014)(66446008)(64756008)(5660300002)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5425
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef146404-632e-4715-7cb0-08da2e737c33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Scrbveixekn6QxG9CILu/p4MiXct2iPiz7JQvuzw7KvTzxw+mSg3X83BmlbvagfM08GZ1MyMAsVWfZcmT1yOM2+5x+Y6GmXyrnwXsa6vTOIdYZMJG2erCRxvgnuqCt1b2dmtrbrM78+Wjwih8nX+Aj9k6S3x7O2ofl9OQ7PL1gK6EipBA5QBNMJ7GvzOTYwomPgsdqPXZMIKvO/B/nKtFv5TzhWqRRBrN90M8C3Yqi+nnVppO3ogcodYuLIcdm6IH38CLsIzBEHUBjwAGYQtUUKy9bR9FU2ZoVLR9t1SFNSLB6w8Z3GKK2GQIvpH/1DDNv8wh/FR1swPhp9zVAO5/Z8h1AoLZWoQJetuNUTFZwNpCrQV8dmFIDiQ3mc3lEbqnUgvWbmeYpqtvAQN0Z7F1kWtqK0jmTOVmQzFCg+0b4RUH0cXw2Z4KNMBfm41t021jASf8kqMaEemD+/KMYmJvzKf9YtPdOdRfDpJi6au6C21+43kDyfDHBziAurUxPzJNepV222f49nlhuToEzGMuF4C+q2UT7JMf6DMPQ4HAldJbZIiKQjKaY980IZ1mcGIrXsmgdXoPnBNtDDnGecJUKXlr8t67RtkmByaEJHJrEADYuGSC3I8xtKnvM0h8Um9Diw6Ebznmj4rbq6z8ONXe1cZ6eML1xqbDBUwcJxUJiwcrwN+GT8VFGkixdv6nnBRX6SL5pjyP213xHOP7W4kWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6506007)(9686003)(7696005)(26005)(316002)(54906003)(5660300002)(53546011)(8936002)(508600001)(186003)(55016003)(33656002)(336012)(70206006)(70586007)(8676002)(4326008)(6862004)(82310400005)(356005)(40460700003)(2906002)(81166007)(36860700001)(47076005)(83380400001)(52536014)(86362001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 08:44:44.1905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45636ef-b206-49a7-e40b-08da2e7380c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDUsIDIwMjIgMzo0
NyBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT47
DQo+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVu
bGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
V2VpIExpdSA8d2xAeGVuLm9yZz47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA2LzZdIHhlbjogcmV0cmlldmUgcmVzZXJ2ZWQgcGFn
ZXMgb24NCj4gcG9wdWxhdGVfcGh5c21hcA0KPiANCj4gT24gMDUuMDUuMjAyMiAwODoyNCwgUGVu
bnkgWmhlbmcgd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBNYXkgNCwgMjAyMiA5OjQ1IFBNDQo+ID4+DQo+ID4+
IE9uIDI3LjA0LjIwMjIgMTE6MjcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gICNlbHNlDQo+
ID4+PiAgdm9pZCBmcmVlX3N0YXRpY21lbV9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZvICpwZywgdW5z
aWduZWQgbG9uZw0KPiBucl9tZm5zLA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ym9vbCBuZWVkX3NjcnViKSAgew0KPiA+Pj4gICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4g
Pj4+ICB9DQo+ID4+PiArDQo+ID4+PiAraW50IF9faW5pdCBhY3F1aXJlX2RvbXN0YXRpY19wYWdl
cyhzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBzbWZuLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX21mbnMsIHVuc2lnbmVkDQo+ID4+PiAr
aW50DQo+ID4+PiArbWVtZmxhZ3MpIHsNCj4gPj4+ICsgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7
DQo+ID4+PiArfQ0KPiA+Pg0KPiA+PiBJIGNhbid0IHNwb3QgYSBjYWxsZXIgb2YgdGhpcyBvbmUg
b3V0c2lkZSBvZiBzdWl0YWJsZSAjaWZkZWYuIEFsc28NCj4gPj4gdGhlIF9faW5pdCBoZXJlIGxv
b2tzIHdyb25nIGFuZCB5b3UgbG9vayB0byBoYXZlIG1pc3NlZCBkcm9wcGluZyBpdCBmcm9tDQo+
IHRoZSByZWFsIGZ1bmN0aW9uLg0KPiA+Pg0KPiA+Pj4gK21mbl90IGFjcXVpcmVfcmVzZXJ2ZWRf
cGFnZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQNCj4gPj4+ICttZW1mbGFncykgew0K
PiA+Pj4gKyAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gPj4+ICt9DQo+ID4+PiAgI2VuZGlm
DQo+ID4+DQo+ID4+IEZvciB0aGlzIG9uZSBJJ2QgYWdhaW4gZXhwZWN0IENTRSB0byBsZWF2ZSBu
byBjYWxsZXJzLCBqdXN0IGxpa2UgaW4NCj4gPj4gdGhlIGVhcmxpZXIgcGF0Y2guIE9yIGFtIEkg
b3Zlcmxvb2tpbmcgYW55dGhpbmc/DQo+ID4+DQo+ID4NCj4gPiBJbiBhY3F1aXJlX3Jlc2VydmVk
X3BhZ2UsIEkndmUgdXNlIGEgZmV3IENPTkZJR19TVEFUSUNfTUVNT1JZLW9ubHkNCj4gPiB2YXJp
YWJsZXMsIGxpa2UNCj4gPiBkLT5yZXN2X3BhZ2VfbGlzdCwgc28gSSdkIGV4cGVjdCB0byBsZXQg
YWNxdWlyZV9yZXNlcnZlZF9wYWdlIGd1YXJkZWQNCj4gPiBkLT5ieSBDT05GSUdfU1RBVElDX01F
TU9SWQ0KPiA+IHRvbyBhbmQgcHJvdmlkZSB0aGUgc3R1YiBmdW5jdGlvbiBoZXJlIHRvIGF2b2lk
IGNvbXBpbGF0aW9uIGVycm9yDQo+IHdoZW4gIUNPTkZJR19TVEFUSUNfTUVNT1JZLg0KPiANCj4g
QSBjb21waWxhdGlvbiBlcnJvciBzaG91bGQgb25seSByZXN1bHQgaWYgdGhlcmUncyBubyBkZWNs
YXJhdGlvbiBvZiB0aGUNCj4gZnVuY3Rpb24uIEkgZGlkbid0IHN1Z2dlc3QgdG8gcmVtb3ZlIHRo
YXQuIEEgbWlzc2luZyBkZWZpbml0aW9uIHdvdWxkIG9ubHkgYmUNCj4gbm90aWNlZCB3aGVuIGxp
bmtpbmcsIGJ1dCBDU0Ugc2hvdWxkIHJlc3VsdCBpbiBubyByZWZlcmVuY2UgdG8gdGhlIGZ1bmN0
aW9uIGluDQo+IHRoZSBmaXJzdCBwbGFjZS4gSnVzdCBsaWtlIHdhcyBzdWdnZXN0ZWQgZm9yIHRo
ZSBlYXJsaWVyIHBhdGNoLiBBbmQgYXMgb3Bwb3NlZA0KPiB0byB0aGUgY2FsbCBzaXRlIG9wdGlt
aXphdGlvbiB0aGUgY29tcGlsZXIgY2FuIGRvLCB3aXRoIC1mZnVuY3Rpb24tc2VjdGlvbnMNCj4g
dGhlcmUncyBubyB3YXkgZm9yIHRoZSBsaW5rZXIgdG8gZWxpbWluYXRlIHRoZSBkZWFkIHN0dWIg
ZnVuY3Rpb24uDQo+IA0KDQpTdXJlLCBwbHogY29ycmVjdCBtZSBpZiBJIHVuZGVyc3RhbmQgd3Jv
bmdseToNCk1heWJlIGhlcmUgSSBzaG91bGQgdXNlICNkZWZpbmUgeHh4IHRvIGRvIHRoZSBkZWNs
YXJhdGlvbiwgYW5kIGl0IHdpbGwgYWxzbw0KYXZvaWQgYnJpbmdpbmcgZGVhZCBzdHViIGZ1bmN0
aW9uLiBTb21ldGhpbmcgbGlrZToNCiNkZWZpbmUgZnJlZV9zdGF0aWNtZW1fcGFnZXMocGcsIG5y
X21mbnMsIG5lZWRfc2NydWIpICgodm9pZCkocGcpLCAodm9pZCkobnJfbWZucyksICh2b2lkKShu
ZWVkX3NjcnViKSkNCkFuZA0KI2RlZmluZSBhY3F1aXJlX3Jlc2VydmVkX3BhZ2UoZCwgbWVtZmxh
Z3MpIChJTlZBTElEX01GTikNCg0KPiBKYW4NCg0K

