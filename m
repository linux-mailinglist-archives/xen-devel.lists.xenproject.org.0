Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D368A7B7D92
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 12:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612484.952396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnzVd-0003Y0-Td; Wed, 04 Oct 2023 10:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612484.952396; Wed, 04 Oct 2023 10:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnzVd-0003Vq-Qf; Wed, 04 Oct 2023 10:53:41 +0000
Received: by outflank-mailman (input) for mailman id 612484;
 Wed, 04 Oct 2023 10:53:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAsU=FS=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qnzVc-0003T6-MC
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 10:53:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ac16fa-62a4-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 12:53:39 +0200 (CEST)
Received: from DU2PR04CA0238.eurprd04.prod.outlook.com (2603:10a6:10:2b1::33)
 by GV2PR08MB8148.eurprd08.prod.outlook.com (2603:10a6:150:7c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 10:52:59 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::c8) by DU2PR04CA0238.outlook.office365.com
 (2603:10a6:10:2b1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.25 via Frontend
 Transport; Wed, 4 Oct 2023 10:52:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Wed, 4 Oct 2023 10:52:58 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Wed, 04 Oct 2023 10:52:58 +0000
Received: from a2c42a330716.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EB505B37-4C3B-484C-9436-E3F3C3E9C23D.1; 
 Wed, 04 Oct 2023 10:52:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a2c42a330716.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Oct 2023 10:52:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB9376.eurprd08.prod.outlook.com (2603:10a6:150:d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Wed, 4 Oct
 2023 10:52:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 10:52:09 +0000
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
X-Inumbo-ID: 46ac16fa-62a4-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGZw3uCAXhMR0FbnKuWrpcAvNv+ZkLAdFK5p1GdQEpQ=;
 b=D9lI+VjbY0QukQdvTRqkskN+U8AYshFr9xzN+XUqKHYV8l+VieAEC7cwYIL6TxPSlav3C7ZCEH8y7GgCIM0L91nmvkOItE0vK1Yi+aJvmGZHyws+w2A4S/jUKufyB0QUMCZucQ8GMOFSXNPCGcn+wnF4m/YAnWAKoNeacrOGziE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0acb77ca21072cec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPOe8kTzOkjiMFvp/mE6/4M3nVlUho31uMc4nx+krOonT5s34IqSz6CFOcatbixT5yJaray7nOXRBks/F5wit3RGq2DBQfidOyiIqqyBuNQ6QpE2xPqGxfnVAIvgyZNKiEBPnojVJXZ256VG/sypD2L4KNRszs4kzqNVPNldP/G+7/lJCcMUXrwM7aG79u5tVP7gptSFBZdlH+P52UOF3C3NZgfr6RB+vlxztTJBYRqvG+7Mne2V/trGcW81sI67//9MVFFOFt341cn3+lR0ss0mLsevMVdgRF8WSN93uxjPE6Nbabz2Ca2q1yoQFwitmB9QYDwa6I1OfMAS59XZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGZw3uCAXhMR0FbnKuWrpcAvNv+ZkLAdFK5p1GdQEpQ=;
 b=gStUZ+6P7Wa2b2ygGI4bBR9IBapm+G0uquh9+zsB3rXm8fNKuHl9cuajby4uaAwKNTd5CjpB6+C/A0awTRODSFiZqviS/KhKzOYh0xeGWuT3R/0r+f36GdnmfDFiqRXv6V6YZTAioHod10jP7rRD8dKqVL68P4mN/NGCTjR8cus+2Q+5duxkNnf6urB7t5Xj07ozGyyr3oHqpAtNffemOEp4T4YEhQq+fR6QCSlbK/kDTxaYke+52qLq6VTNjECiD1wyRA+7mSsc0g+R7cw1BZ9DnXh7dQ43W7iUXo+cllCBvHUZM4g9U82+QLttCcwGh3n44UprfLj3rDUrDWlbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGZw3uCAXhMR0FbnKuWrpcAvNv+ZkLAdFK5p1GdQEpQ=;
 b=D9lI+VjbY0QukQdvTRqkskN+U8AYshFr9xzN+XUqKHYV8l+VieAEC7cwYIL6TxPSlav3C7ZCEH8y7GgCIM0L91nmvkOItE0vK1Yi+aJvmGZHyws+w2A4S/jUKufyB0QUMCZucQ8GMOFSXNPCGcn+wnF4m/YAnWAKoNeacrOGziE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Topic: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Index: AQHZ9qj87vFsnMRst0ybMa+ffKOLU7A5Z4mAgAAGhgCAAAYzgA==
Date: Wed, 4 Oct 2023 10:52:06 +0000
Message-ID: <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
References:
 <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
In-Reply-To: <2894008e8f612296da84267346ae4240@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB9376:EE_|DBAEUR03FT022:EE_|GV2PR08MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: ed76c803-de1e-4e19-a462-08dbc4c8126c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xW7zsO/3xfwsGqcYsNVims61r5zuaQJwSSs0+P7pikJ6f0wRy2mT49eMAZQu4NZQvV51tvZhyb3r/A0YpDQnQjLq+k00OJKl1ISLZlqTkbwvbqwX6IN3uBRuC8qBVLU6wfgERyuvrG5Jpr8Dd+ijtnwfTLgB9QXfooClckUcbiWFo9+BDQMPN7OLBI+kB8IYl2L61qnQvxKXA5g3LtT/tyhQ9KKDEfXeqaOhHPhNN+GzCAyQJo7pF7RY/8rOdgRTDXW1v/DczKVuKPBuktvRWCINiO3EnXO+SujUNxUxn5B1eUY+c1ETYZ9YRPPegfx6MEcjo6Odtgv8UpY2XKKeFtb5HiQfDcEgchOMj2PU0pxQTpe2yj9C6f3BPwIUxn+IHPC08mEz/jqYqExg3ygNyeg6v28GdlBLich79crnwccwBxf2zWLDHWQm1RnPFhonfYWgPdeEcClGvdu+57fRbz2pdEyWLZ41mK7lmU1kQBYNmndz+p8tHHynxwOMQHuRgJaEFEHcpWCae+mEk0gMzSPkOrQ7Cso1HA4rnAe3Vv10h7i717GdRL85a76RF+aVuWbnNaXNuCSi7XHjZQjYIZFmBKdMvjhhzVJoMsytNOtxnzYKoOis+e8skVOfKCUp4URgZL0wgeYD6LxygNjL9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(36756003)(26005)(122000001)(2616005)(6486002)(6506007)(53546011)(71200400001)(33656002)(6666004)(6512007)(86362001)(8676002)(4326008)(8936002)(5660300002)(2906002)(478600001)(7416002)(316002)(41300700001)(91956017)(6916009)(66946007)(66556008)(66476007)(64756008)(54906003)(66446008)(76116006)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2902A9B149E8B4A96CB2E444B87E1B2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9376
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3dbc968c-47c8-4352-9089-08dbc4c7f38d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7svjKzZIG8xnmj63ZDk27lvoPxH9SrEHFsULp6nqkZKjxW5K2qSXq0eGOPhyd6Wsm5ru7HxzqoWLsFv3paK5JKUTT++jICnRnY8RCp7fN9Nz+27c2KV1b18bGGhwzn3Hma1a8SCnfaGnAWiDMPwNlU/zj+ffdEUTpw9v9+t68NkOlowbUO8qVl15vnXAaqpB/uLS1BIVMBJq0XLp7LzW3cqIxwFLTur+y9XBnb9o6FIb1/MVGoV/UWYnmPFSsF5ijD7cq0+v3Rdae1tysBKwb+OcbvQfAz5dp1I/Cx6SkOwNA108XBKtNlOq3Dv44R1yVAW2zDqvov1ExAub9jOKWgs/JQUvN5hbYznpfWADzHUeTiR30KQkS1vrs1qjrZtysKVBOKIxbNpHRBoz26D8QO9tx+kuF8iFXB2IgvEoNIstRpFe+70HYc8QQZj8I9vQcQQl0hE5/0YtEO/Pa3XjdgQ4ifXrxE2+yo4DE8x2ZoJBpImLCBZfbUNJLdCmvUdJ/VyiWWO2tU9ZY9FgDapGlPdhjNOvkvM9g03U1FQ8XJJg4c9yTh0ABdiLfp5RQE3fPtjGexwOwn2U3yLeXaok2QzeTyuLSH6tlspLvIRalQ9FI8tXcSzwL5lOTeti69SDsiU7ncTAOnZs55fJQ6LQfHyIhE69F8yqN74B1R5+rXiLOWKlE2pnRN3ruRfRGtv+2og8+AsGSx/KuGRmHr/m9g2/4KFZ6UMyWJK/oKmFpKgQNnJ/2MAjLP2caUoxcbPG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(336012)(40460700003)(2616005)(107886003)(26005)(36860700001)(81166007)(356005)(82740400003)(86362001)(36756003)(40480700001)(33656002)(47076005)(316002)(4326008)(54906003)(6862004)(8936002)(8676002)(5660300002)(41300700001)(70586007)(70206006)(2906002)(6486002)(6666004)(53546011)(6506007)(478600001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 10:52:58.4514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed76c803-de1e-4e19-a462-08dbc4c8126c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8148

DQoNCj4gT24gNCBPY3QgMjAyMywgYXQgMTE6MjksIE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0
cmluaUBidWdzZW5nLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNC8xMC8yMDIzIDEyOjA2LCBMdWNh
IEZhbmNlbGx1IHdyb3RlOg0KPj4gSGkgTmljb2xhLA0KPj4+IE9uIDQgT2N0IDIwMjMsIGF0IDEw
OjU2LCBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tIHdyb3RlOg0KPj4+IE9uIDAzLzEwLzIwMjMg
OTo0NiBwbSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBUdWUsIDMgT2N0IDIw
MjMsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPj4+Pj4gQXMgc3BlY2lmaWVkIGluIHJ1bGVzLnJz
dCwgdGhlc2UgY29uc3RhbnRzIGNhbiBiZSB1c2VkDQo+Pj4+PiBpbiB0aGUgY29kZS4NCj4+Pj4+
IFRoZWlyIGRldmlhdGlvbiBpcyBub3cgYWNjb21wbGlzaGVkIGJ5IHVzaW5nIGEgU0FGIGNvbW1l
bnQsDQo+Pj4+PiByYXRoZXIgdGhhbiBhbiBFQ0xBSVIgY29uZmlndXJhdGlvbi4NCj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4N
Cj4+Pj4gIlNBRiIgZGlzY3Vzc2lvbiBhc2lkZSB0aGF0IGNhbiBiZSByZXNvbHZlZCBlbHNld2hl
cmU6DQo+Pj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+DQo+Pj4gV2VsbCBuby4gICJTQUYiIGFzaWRlIChhbmQgU0FGIGRvZXMgbmVlZCBm
aXhpbmcgYmVmb3JlIHJlcG9zdGluZyB0aGlzIHBhdGNoLCBvdGhlcndpc2UgaXQncyBqdXN0IHVu
bmVjZXNzYXJ5IGNodXJuKSwgLi4uDQo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS9zdm0vc3ZtLmggYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uaA0KPj4+Pj4gaW5kZXggZDJh
NzgxZmMzZmI1Li5kMDYyM2I3MmNjZmEgMTAwNjQ0DQo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL3N2bS9zdm0uaA0KPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmgNCj4+
Pj4+IEBAIC01NywxNCArNTcsMjMgQEAgc3RhdGljIGlubGluZSB2b2lkIHN2bV9pbnZscGdhKHVu
c2lnbmVkIGxvbmcgbGluZWFyLCB1aW50MzJfdCBhc2lkKQ0KPj4+Pj4gI2RlZmluZSBJTlNUUl9J
TlQzIElOU1RSX0VOQyhYODZFTVVMX09QQyggMCwgMHhjYyksIDApDQo+Pj4+PiAjZGVmaW5lIElO
U1RSX0lDRUJQIElOU1RSX0VOQyhYODZFTVVMX09QQyggMCwgMHhmMSksIDApDQo+Pj4+PiAjZGVm
aW5lIElOU1RSX0hMVCBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoIDAsIDB4ZjQpLCAwKQ0KPj4+Pj4g
Ky8qIFNBRi0yLXNhZmUgKi8NCj4+Pj4+ICNkZWZpbmUgSU5TVFJfWFNFVEJWIElOU1RSX0VOQyhY
ODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMyMSkNCj4+Pj4+ICsvKiBTQUYtMi1zYWZlICovDQo+
Pj4+PiAjZGVmaW5lIElOU1RSX1ZNUlVOIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAx
KSwgMDMzMCkNCj4+Pj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4+PiAjZGVmaW5lIElOU1RSX1ZN
Q0FMTCBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzMzEpDQo+Pj4+PiArLyog
U0FGLTItc2FmZSAqLw0KPj4+Pj4gI2RlZmluZSBJTlNUUl9WTUxPQUQgSU5TVFJfRU5DKFg4NkVN
VUxfT1BDKDB4MGYsIDB4MDEpLCAwMzMyKQ0KPj4+Pj4gKy8qIFNBRi0yLXNhZmUgKi8NCj4+Pj4+
ICNkZWZpbmUgSU5TVFJfVk1TQVZFIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwg
MDMzMykNCj4+Pj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4+PiAjZGVmaW5lIElOU1RSX1NUR0kg
SU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEpLCAwMzM0KQ0KPj4+Pj4gKy8qIFNBRi0y
LXNhZmUgKi8NCj4+Pj4+ICNkZWZpbmUgSU5TVFJfQ0xHSSBJTlNUUl9FTkMoWDg2RU1VTF9PUEMo
MHgwZiwgMHgwMSksIDAzMzUpDQo+Pj4+PiArLyogU0FGLTItc2FmZSAqLw0KPj4+Pj4gI2RlZmlu
ZSBJTlNUUl9JTlZMUEdBIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMzNykN
Cj4+Pj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4+PiAjZGVmaW5lIElOU1RSX1JEVFNDUCBJTlNU
Ul9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzNzEpDQo+Pj4+PiAjZGVmaW5lIElOU1RS
X0lOVkQgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDgpLCAwKQ0KPj4+Pj4gI2RlZmlu
ZSBJTlNUUl9XQklOVkQgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDkpLCAwKQ0KPj4+
IC4uLiB0aGlzIGhhcyBicm9rZW4gYSB0YWJ1bGF0ZWQgc3RydWN0dXJlIHRvIGhhdmUgY29tbWVu
dHMgYWhlYWQgb2YgbGluZXMgd2l0aCBvY3RhbCBudW1iZXJzLCB3aGlsZSAuLi4NCj4+Pj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMgYi94ZW4vYXJjaC94ODYv
aHZtL3N2bS9lbXVsYXRlLmMNCj4+Pj4+IGluZGV4IGFhMmM2MWM0MzNiMy4uYzVlMzM0MWM2MzE2
IDEwMDY0NA0KPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jDQo+Pj4+
PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMNCj4+Pj4+IEBAIC05MCw5ICs5
MCw5IEBAIHVuc2lnbmVkIGludCBzdm1fZ2V0X2luc25fbGVuKHN0cnVjdCB2Y3B1ICp2LCB1bnNp
Z25lZCBpbnQgaW5zdHJfZW5jKQ0KPj4+Pj4gaWYgKCAhaW5zdHJfbW9kcm0gKQ0KPj4+Pj4gcmV0
dXJuIGVtdWxfbGVuOw0KPj4+Pj4gLSBpZiAoIG1vZHJtX21vZCA9PSBNQVNLX0VYVFIoaW5zdHJf
bW9kcm0sIDAzMDApICYmDQo+Pj4+PiAtIChtb2RybV9yZWcgJiA3KSA9PSBNQVNLX0VYVFIoaW5z
dHJfbW9kcm0sIDAwNzApICYmDQo+Pj4+PiAtIChtb2RybV9ybSAmIDcpID09IE1BU0tfRVhUUihp
bnN0cl9tb2RybSwgMDAwNykgKQ0KPj4+Pj4gKyBpZiAoIG1vZHJtX21vZCA9PSBNQVNLX0VYVFIo
aW5zdHJfbW9kcm0sIDAzMDApICYmIC8qIFNBRi0yLXNhZmUgKi8NCj4+Pj4+ICsgKG1vZHJtX3Jl
ZyAmIDcpID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDA3MCkgJiYgLyogU0FGLTItc2FmZSAq
Lw0KPj4+Pj4gKyAobW9kcm1fcm0gJiA3KSA9PSBNQVNLX0VYVFIoaW5zdHJfbW9kcm0sIDAwMDcp
ICkgLyogU0FGLTItc2FmZSAqLw0KPj4+Pj4gcmV0dXJuIGVtdWxfbGVuOw0KPj4+Pj4gfQ0KPj4+
IC4uLiB0aGlzIGhhcyBjb21tZW50cyBhdCB0aGUgZW5kIG9mIGxpbmVzIHdpdGggb2N0YWwgbnVt
YmVycy4NCj4+PiBTbyB3aGljaCBpcyBpdD8NCj4+IEkgYWdyZWUgd2l0aCBBbmRyZXcgaGVyZSBp
biB0aGlzIHNlbnNlOiB0aGUgaW4tY29kZSBjb21tZW50IGlzDQo+PiBzdXBwb3NlZCB0byBiZSBv
biB0aGUgbGluZSAqYmVmb3JlKiB0aGUgdmlvbGF0aW9uLA0KPj4gbm90IG9uIHRoZSBzYW1lIGxp
bmUsIHNvIEnigJltIGFsc28gd29uZGVyaW5nIGhvdyBpdCBpcyBmaXhpbmcgdGhlIHZlcnkNCj4+
IGZpcnN0IHZpb2xhdGlvbi4NCj4+IENoZWVycywNCj4+IEx1Y2ENCj4gDQoNCkhpIE5pY29sYSwN
Cg0KPiBBY3R1YWxseSBpdCBqdXN0aWZpZXMgd2hhdCBpcyBvbiBlaXRoZXIgdGhlIHByZXZpb3Vz
IGxpbmUgb3IgdGhlIHNhbWUgYmVjYXVzZSBpdCdzDQo+IHRyYW5zbGF0ZWQgdG8gLyogLUU+IHNh
ZmUgTUMzUjEuUjcuMSAxICovLCB3aGVyZSB0aGUgbGFzdCBudW1iZXIgaXMgaG93IG1hbnkgbGlu
ZXMgYmVzaWRlcw0KPiB0aGUgY3VycmVudCBvbmUgYXJlIHRvIGJlIGRldmlhdGVkIChlLmcuIHlv
dSBjYW4gaGF2ZSAwIGRldmlhdGUgb25seSB0aGUgY3VycmVudCBsaW5lKS4NCg0KSnVzdCB0byB1
bmRlcnN0YW5kLCBkb2VzIHRoaXMgd2F5Og0KDQo8bGluZSBBPg0KLyogLUU+IHNhZmUgTUMzUjEu
UjcuMSAxICovDQo8bGluZSBCPg0KDQpKdXN0aWZpZXMgb25seSBsaW5lIEI/IEJlY2F1c2UgSSB0
aG91Z2h0IHNvLCBidXQgbm93IEkgd2FudCB0byBiZSBzdXJlLCBvdGhlcndpc2UgaXQgZG9lc27i
gJl0IGFjdA0KYXMgaW50ZW5kZWQuDQoNCg0KPiBNb3N0IG9mIHRoZSB0aW1lcyB0aGUgY3VycmVu
dCBmb3JtIGlzIHdoYXQncyBuZWVkZWQsIGFzIHlvdSB3b3VsZCBwdXQgdGhlIGNvbW1lbnQgb24g
YSBsaW5lDQo+IG9mIGl0cyBvd24uIEluIHRoZSBjYXNlIG9mIHRoZSBpZiB0aGF0IHdvdWxkIGJy
ZWFrIHRoZSBmb3JtYXR0aW5nLiBUaGUgZG93bnNpZGUgb2YgZG9pbmcgdGhlIHNhbWUgdGhpbmcg
b24gdGhlIHRhYmxlIGlzIHRoYXQgdGhlIGZpcnN0IGVudHJ5IG5vdCB0byBiZSBkZXZpYXRlZCB3
b3VsZCBhY3R1YWxseSBiZSBkZXZpYXRlZC4NCj4gDQo+ICNkZWZpbmUgSU5TVFJfSU5WRCBJTlNU
Ul9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwOCksIDApDQo+IA0KPiBUaGlzIG1heSBub3QgYmUg
cHJvYmxlbWF0aWMsIHNpbmNlIDAgY291bGQgYmUgY29uc2lkZXJlZCBhbiBvY3RhbCBjb25zdGFu
dCwgYnV0IGlzIGFuDQo+IGV4Y2VwdGlvbiBleHBsaWNpdGx5IGxpc3RlZCBpbiB0aGUgTUlTUkEg
cnVsZS4NCj4gRm9yIHRoZSBzYW1lIHJlYXNvbiB0aGUgbGluZQ0KPiANCj4gcmV0dXJuIGVtdWxf
bGVuOw0KPiANCj4gaXMgZGV2aWF0ZWQgYnkgdGhlIGFib3ZlIGNvbW1lbnQsIGJ1dCBwdXR0aW5n
IGFuIG9jdGFsIGNvbnN0YW50IHRoZXJlIHdvdWxkIGZvciBzdXJlDQo+IGJlIHRoZSByZXN1bHQg
b2YgYSBkZWxpYmVyYXRlIGNob2ljZS4gVGhlcmUncyB0aGUgYWx0ZXJuYXRpdmUgb2Y6DQo+IA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgLyogU0FGLTItc2FmZSAqLw0KPiAgIGlmICggbW9k
cm1fbW9kICAgICAgPT0gTUFTS19FWFRSKGluc3RyX21vZHJtLCAwMzAwKSAmJg0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgLyogU0FGLTItc2FmZSAqLw0KPiAgICAgICAobW9kcm1fcmVnICYg
NykgPT0gTUFTS19FWFRSKGluc3RyX21vZHJtLCAwMDcwKSAmJg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgLyogU0FGLTItc2FmZSAqLw0KPiAgICAgICAobW9kcm1fcm0gJiA3KSAgPT0gTUFT
S19FWFRSKGluc3RyX21vZHJtLCAwMDA3KSApDQo+IA0KPiB0byBtYWtlIGl0IGNvbnNpc3RlbnQg
d2l0aCB0aGUgdGFibGUgYW5kIGF2b2lkIGFueSAiaGlkZGVuIiBkZXZpYXRlZCBsaW5lIG9yLCBh
Z2FpbiwNCj4gdGhlIG1vZGlmaWNhdGlvbiBvZiB0aGUgdHJhbnNsYXRpb24gc2NyaXB0IHNvIHRo
YXQgaXQgZG9lc24ndCB1c2UgYSBmaXhlZCAiMSIgb2Zmc2V0LCB3aGljaA0KPiBpcyBtb3RpdmF0
ZWQgYnkgd2hhdCB5b3Ugd3JvdGUgb24gdGhlIHRocmVhZCBvZiB0aGUgbW9kaWZpY2F0aW9uIG9m
IHhlbl9hbmFseXNpcy5weS4NCg0KRnJvbSB0aGUgZG9jdW1lbnRhdGlvbjoNCg0KICAgIEluIHRo
ZSBYZW4gY29kZWJhc2UsIHRoZXNlIHRhZ3Mgd2lsbCBiZSB1c2VkIHRvIGRvY3VtZW50IGFuZCBz
dXBwcmVzcyBmaW5kaW5nczoNCg0KICAgIC0gU0FGLVgtc2FmZTogVGhpcyB0YWcgbWVhbnMgdGhh
dCB0aGUgbmV4dCBsaW5lIG9mIGNvZGUgY29udGFpbnMgYSBmaW5kaW5nLCBidXQNCiAgICAgIHRo
ZSBub24gY29tcGxpYW5jZSB0byB0aGUgY2hlY2tlciBpcyBhbmFseXNlZCBhbmQgZGVtb25zdHJh
dGVkIHRvIGJlIHNhZmUuDQoNCkkgdW5kZXJzdGFuZCB0aGF0IEVjbGFpciBpcyBjYXBhYmxlIG9m
IHN1cHByZXNzaW5nIGFsc28gdGhlIGxpbmUgaW4gd2hpY2ggdGhlIGluLWNvZGUgc3VwcHJlc3Np
b24NCmNvbW1lbnQgcmVzaWRlcywgYnV0IHRoZXNlIGdlbmVyaWMgWGVuIGluLWNvZGUgc3VwcHJl
c3Npb24gY29tbWVudCBhcmUgbWVhbnQgdG8gYmUgdXNlZA0KYnkgbXVsdGlwbGUgc3RhdGljIGFu
YWx5c2lzIHRvb2xzIGFuZCBtYW55IG9mIHRoZW0gc3VwcHJlc3Mgb25seSB0aGUgbGluZSBuZXh0
IHRvIHRoZSBjb21tZW50DQooQ292ZXJpdHksIGNwcGNoZWNrKS4NCg0KU28gSeKAmW0gaW4gZmF2
b3VyIG9mIHlvdXIgYXBwcm9hY2ggYmVsb3csIGNsZWFybHkgaXQgZGVwZW5kcyBvbiB3aGF0IHRo
ZSBtYWludGFpbmVycyBmZWVkYmFjayBpczoNCg0KPiANCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIFNBRi0yLXNhZmUgKi8NCj4gICBpZiAoIG1vZHJtX21vZCAgICAgID09IE1BU0tfRVhU
UihpbnN0cl9tb2RybSwgMDMwMCkgJiYNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFNB
Ri0yLXNhZmUgKi8NCj4gICAgICAgKG1vZHJtX3JlZyAmIDcpID09IE1BU0tfRVhUUihpbnN0cl9t
b2RybSwgMDA3MCkgJiYNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFNBRi0yLXNhZmUg
Ki8NCj4gICAgICAgKG1vZHJtX3JtICYgNykgID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDAw
NykgKQ0KDQoNCkNoZWVyLA0KTHVjYQ0KDQoNCg0K

