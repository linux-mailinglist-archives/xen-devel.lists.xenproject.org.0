Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6D36BA54A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 03:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509871.786522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcH1x-0002PE-6K; Wed, 15 Mar 2023 02:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509871.786522; Wed, 15 Mar 2023 02:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcH1x-0002MX-3H; Wed, 15 Mar 2023 02:38:21 +0000
Received: by outflank-mailman (input) for mailman id 509871;
 Wed, 15 Mar 2023 02:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LVlP=7H=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pcH1u-0002MR-UZ
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 02:38:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70212844-c2da-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 03:38:16 +0100 (CET)
Received: from AS9PR06CA0164.eurprd06.prod.outlook.com (2603:10a6:20b:45c::15)
 by PAWPR08MB10134.eurprd08.prod.outlook.com (2603:10a6:102:35d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 02:38:12 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::8c) by AS9PR06CA0164.outlook.office365.com
 (2603:10a6:20b:45c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Wed, 15 Mar 2023 02:38:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Wed, 15 Mar 2023 02:38:11 +0000
Received: ("Tessian outbound fcd8b5fba459:v135");
 Wed, 15 Mar 2023 02:38:11 +0000
Received: from beb5372c9aa8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C5EC4CC-406E-4008-BAD6-27DD3488AF9C.1; 
 Wed, 15 Mar 2023 02:38:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id beb5372c9aa8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Mar 2023 02:38:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5808.eurprd08.prod.outlook.com (2603:10a6:800:1a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 02:37:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03%4]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 02:37:52 +0000
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
X-Inumbo-ID: 70212844-c2da-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJP7X43HNn1jZpB6Y/TAvlGfOwNZ6sf84ereNuxkoWQ=;
 b=fR3HGfU4QaWBSaJM9PNEFGcQzrNI2YxKmka35yMckMqKhY2Od9LgOY9IYIk7SArBtEfmef8WilTMz2FFkwL+Iq3JujEwKT8Z4mlWgAxRwA6V3QFWhcR8csxj3F4B7otodQi3wEwhEtCHJ3UW1nM5F2i4UT84enDjWB+NIybIRBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCJJ3CoBIZDnVTnAxYcOisW1C2VKNuMMkdHG3vH09WWchiGArEpkcoHnQYt+ivh1TZV6gqtSw9Uvfqfa79zDT3GJyizNAwQzEKmU25SJIWZO0TicFhYSI+3q36Tkh8E3FsAk/Nn0tWoY3kOdBm9beLu6issbZ6dYgpsdhSczJC9DiXPQlvc9b+dH8Uuyhv1AYI5YjJNNTP0C2FkQvNZQo/eVV7xwLP9dMIvp8u+XJFVVUu8hFtQAx/argLS4pz+TOqMVRDnjsZrLyYe2kD6uhXF40yrSfpEQbKwoy91LX3ajWzaECNaWiSbWmATcTEL8CsvNr2b5YkEw3zxyYO9HmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJP7X43HNn1jZpB6Y/TAvlGfOwNZ6sf84ereNuxkoWQ=;
 b=Hbs6dNtb6HB3b6oc3arrKCFj66D9cVjTMOXdczHHDX+w07JVyuhou3BSumqql9pheY6pH8UpIdgpVCGDDFGPRHx91UhidnvmDei4eZV0rjrXa0L018btmPGUJ4KPKL3312CLKnJZDnJrLjgDZBpILIctCubkDvNenF52B7G961HTLAXerJPDqMuv/UzBC3x2lWEvNXQ9mymRxbPXVN3wUqIgsOmzZbmutr4EQbJCxc3yYYd+SBOI8iUqujnv1z9wUslDPDw1UNbVpnzjhmoqw8+6En0OHrFKaj6eY8BdUWR0ySNWUjOp6W9LO8Les/MMw2r1oT7J8BBxVA4zlSoIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJP7X43HNn1jZpB6Y/TAvlGfOwNZ6sf84ereNuxkoWQ=;
 b=fR3HGfU4QaWBSaJM9PNEFGcQzrNI2YxKmka35yMckMqKhY2Od9LgOY9IYIk7SArBtEfmef8WilTMz2FFkwL+Iq3JujEwKT8Z4mlWgAxRwA6V3QFWhcR8csxj3F4B7otodQi3wEwhEtCHJ3UW1nM5F2i4UT84enDjWB+NIybIRBY=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
Thread-Topic: [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
Thread-Index: AQHZVn94bmlKOjNAyUuA0aR+vFdjl677IL/Q
Date: Wed, 15 Mar 2023 02:37:51 +0000
Message-ID:
 <AS8PR08MB799113346BAA19CAF5CE0BF292BF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 892AD2A9D8D7584B966341338DEF9767.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5808:EE_|AM7EUR03FT025:EE_|PAWPR08MB10134:EE_
X-MS-Office365-Filtering-Correlation-Id: 2527c37d-0457-4ba0-c0ee-08db24fe5203
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HhcXxozZSSt/hzezzWVewDwbPs+1Hrl/lOn+UGvB0WsIelk4QSN+nudDWW3dp2WJH5YpfHrn8XfIkKLABH5LN8xK85dgcR3ca/gkZfL9rpgvDMOY0+rIT2MXyNyoyMgxTG+0lGGpC3WO0pM5EhFPuLcTIzB98wEYSx4QPHQiZMgrRJPppn05y0Gg2zHrDsP6cpkF++F2EzMMC1dY2NKwpcMSjo7vi/k6SD4ccnA6DydtHcJ10qF+KqFeAOdv5mxFOIRvQsACPcv+nO4+hvtpO0JNCYrMLCCHBgFoO8QH3aNdusF3G8Cpv+409MNLDe3W0oX1+RZsEcEEIOKa83VDv+Yr1q3LbHLIp6VApIDyVYiiB7H24LSxFwQchlpadrDpyLWg2f/YC7evEBSVT6Nz924HklvwhY+Iq5eMSVyG8pepikA2oXDuzTIUkUWzWsJTbd1V6LEdfsB0/kcqzd4t43Cw/KSwQU0FqyEo9pbJqXmE4wSIv+AOQad1zz3QTIjZhE4h3PRynm1hy/SwqTrQFvzl4ha5URpDDbfgLtezuMKvjiDN9WmFGRuD6AsW18+AO2II+ozOHVbF/W4gn1N5tZuwmYRn6r5WL0ZXfjUowgP1bnAKDJTrNOsa6pOWfKgBSnHY1Ndnc8ywd6Bi0p1LEy1P0cMLw7KJ0XsjWy4DlXRH02uzYMHp0JLdJTAdu6SDZWZuKzAtFBoY91+IDeIZyA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199018)(4744005)(8936002)(5660300002)(7416002)(4326008)(41300700001)(8676002)(52536014)(38070700005)(86362001)(33656002)(55016003)(122000001)(2906002)(83380400001)(478600001)(6506007)(38100700002)(7696005)(71200400001)(66946007)(66556008)(316002)(76116006)(110136005)(66476007)(9686003)(64756008)(66446008)(26005)(186003)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5808
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf55250d-2c1e-42dc-8bd7-08db24fe45e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X/C1vPLk6dBjAL3jp7WHJuBfygziJU941fZ2715AAQK82AuBLBBwZ6WDqs1VAyFkIcjTODvt/5Zl0Vrm4QALQ48H2jcIdaeEzUX+WSIVKGIu8oxL9gYf20VXEtgQ/vEK9qISW6+NMDcObKR6Fd9rSps2ktZ7EXMPDc+i9hAN0ayA7xz/TxbNNbsnqMiTYzmMtwQ64JcPiH3LtlVzmjfbcGTGu1KQaNFEK+yua6w3BZCh2tGnJsPEKBqu2K75WR3tU5E66aqcSNztc8opD+QOrgg0t+NE3YicDYNiyJgbg/e2kBU74qaF1DPC2uqbEW90verJUC27AQlxvQQ1Ga1miA0GEJKkFIkaFNmLCjEQlyPrZ61U2ig8QBVMrUSM2/7ybcZpAgLiascPu66+YJrdhKHZMU7HQImMl0EwKa2lLNIVAjrAw3gsg3t3SdLwOyC0S9XWrBIk51793kVWv3ZujQUvRay9I02BMmCr2elorw51mNDHzOuuHbHkIwQu190XNW2v7ag7XAmMYv7Z2uwt5nVXDLpuef8O6J/EKt3siNnS94/fIvBKJWd7x48rO3gBdrioeA+HifzN9Bbp+Wt/r6ZvN5MeoGFEB6jKXYr8DMx9z67/YKbWHRDQJfvucpdPU2Wt+E0hTwSz0zj9gi3PWPu6d0N+4soidpoQjhS/kpwKvf/kgHZn7SuoCN/zZShkQZPq+FY7h4l4I6lzhA5SQw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199018)(40470700004)(36840700001)(46966006)(4744005)(5660300002)(40460700003)(83380400001)(41300700001)(82310400005)(47076005)(7696005)(107886003)(478600001)(336012)(6506007)(186003)(26005)(4326008)(356005)(55016003)(8936002)(33656002)(70206006)(40480700001)(86362001)(52536014)(70586007)(54906003)(9686003)(8676002)(82740400003)(36860700001)(316002)(2906002)(110136005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 02:38:11.8859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2527c37d-0457-4ba0-c0ee-08db24fe5203
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10134

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAw
LzddIHRvb2xzOiBNb3JlIFB5dGhvbiAzIGZpeGVzIChwYXJ0IDEgb2YgTikNCj4gDQo+IFJlbGF0
ZWRseSwgYW5kIGEgY3JpdGljYWwvYmxvY2tlciBmb3IgWGVuIDQuMTguICBQeXRob24gMy4xMiwg
d2hpY2ggd2lsbCBiZQ0KPiByZWxlYXNlZCBhaGVhZCBvZiB0aGUgWGVuIDQuMTggcmVsZWFzZSwg
aXMgZGVsZXRlaW5nIGRpc3R1dGlscyAocmVjb21tZW5kaW5nDQo+IHNldHVwdXRpbHMgYXMgdGhl
IHJlcGxhY2VtZW50KSwgc28gc29tZW9uZSBpcyBnb2luZyB0byBoYXZlIHRvIHJld29yayBhbGwg
b3VyDQo+IHNldHVwLnB5J3MgdG8gYmUgY29tcGF0aWJsZS4NCg0KVGhhbmtzIGZvciBub3Rpbmcg
dGhpcywgSSd2ZSB0YWtlbiBhIG5vdGUgb2YgdGhpcyBpc3N1ZSBpbiBteSA0LjE4IHJlbGVhc2Ug
YmxvY2tlciBsaXN0Lg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeSANCg==

