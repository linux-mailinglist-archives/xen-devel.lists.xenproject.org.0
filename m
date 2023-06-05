Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C47722373
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 12:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543634.848772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67Sy-0003oN-M6; Mon, 05 Jun 2023 10:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543634.848772; Mon, 05 Jun 2023 10:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67Sy-0003lE-J6; Mon, 05 Jun 2023 10:29:36 +0000
Received: by outflank-mailman (input) for mailman id 543634;
 Mon, 05 Jun 2023 10:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xfSY=BZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q67Sw-0003ko-Hw
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 10:29:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db24ad43-038b-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 12:29:31 +0200 (CEST)
Received: from DB7PR05CA0058.eurprd05.prod.outlook.com (2603:10a6:10:2e::35)
 by AS2PR08MB9917.eurprd08.prod.outlook.com (2603:10a6:20b:55f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 10:29:24 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::9a) by DB7PR05CA0058.outlook.office365.com
 (2603:10a6:10:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 10:29:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.18 via Frontend Transport; Mon, 5 Jun 2023 10:29:24 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Mon, 05 Jun 2023 10:29:24 +0000
Received: from e7377f1e8559.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52FC8C4E-2310-4592-A808-3B132A613F04.1; 
 Mon, 05 Jun 2023 10:29:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7377f1e8559.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jun 2023 10:29:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB10265.eurprd08.prod.outlook.com (2603:10a6:20b:62c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 10:29:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 10:29:14 +0000
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
X-Inumbo-ID: db24ad43-038b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKq8+07ExRSA2xea1BXtN/n8cB6r10q4EkwGt/WfaNw=;
 b=ysns4R6YfdK9PsZVZZ/Z+3LORL/qgrB6tuZczY+gCEWOxcBYsE6LLprYbxD3viBehST3B4uueYBCBY5Bjz7v4+T7EAjjCjNORD0pzXFP66WWbHaGOkFP77D25FKlr4kXbFyBrl4BbJLiGSeq5YOJ0JLLh7IZxy1AH6dHpOz6qdU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74f2cd6ef4f48062
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoCxC3RvnDKvHtlgASVI+5Sq5bp89xjE6LKbVah48nJLJWA+sLfSzlZnMSPsXwXP3XwmgHdE5GVeuDGbFyPxvftUw++Sq9QGUg6Cd1ePgckHvkUkUP0PrLofMxabyWCXNz/73uk0oHj3Rc4vc0kSpIJkL0G6Rvd6vTFjuuYDK506nDUQb4SuDCIkUz2kmQnGKQp6pEzdwvXy/hVA5tdfJ+7s6aG2wG348ld2GGnvIjzxU+tooocWJbT+lMjiZqM4NQZvbthOMJC3YQ5Bhd6Dtx+uyLr2MtYf7QNr1aDV9fX1NQYcrqt5Cyk9903aB9CpHzpJDqnQTEC1UhjqQ49jdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKq8+07ExRSA2xea1BXtN/n8cB6r10q4EkwGt/WfaNw=;
 b=iXyzb4c+mMuP4jLySKxAaTfUfhtBaVkGGHBKZrmWcQnqnz9/x5ul0d1RoeFi8+U/51cZgRy7evhOwO+lIdZArnWKMkRCC0/h0a5khWvVyO0MQMPRvs/V3rnrJ+lzw3QugFz33Ctzk71fxEhMpx0QFL9FZeah4S9JlK4dl85uSIZlrzhev8c0mWVGoPSJtOcueHYYNJXYMdXKLhLzx7E1Z03mZPFKvOCTesilLun4vOwUZ35c24PiTukbaYlt84kMfKe6zkpi8zBeu22CCjxnWHHbWbhtSyVK/y8TLGa+oCmerhWw+7mb/g9XIBHU2WWzcXwJptTa6uyx8dm3FVPczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKq8+07ExRSA2xea1BXtN/n8cB6r10q4EkwGt/WfaNw=;
 b=ysns4R6YfdK9PsZVZZ/Z+3LORL/qgrB6tuZczY+gCEWOxcBYsE6LLprYbxD3viBehST3B4uueYBCBY5Bjz7v4+T7EAjjCjNORD0pzXFP66WWbHaGOkFP77D25FKlr4kXbFyBrl4BbJLiGSeq5YOJ0JLLh7IZxy1AH6dHpOz6qdU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen: Fix incorrect taint constant
Thread-Topic: [PATCH] xen: Fix incorrect taint constant
Thread-Index: AQHZl5VEGEwt80GVFUeB/y+61w4aBa98Ae8A
Date: Mon, 5 Jun 2023 10:29:14 +0000
Message-ID: <AE08DC3F-BE5B-4345-8FEA-29E618D3EB97@arm.com>
References: <20230605100512.1748007-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230605100512.1748007-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB10265:EE_|DBAEUR03FT041:EE_|AS2PR08MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: a4bafc82-1919-4765-83e6-08db65afbb6c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xyNWPE7PMRbYwIRpdKj/PW8sJ7lCxi2GLj2LOztP6zfwnfWjl4gGMZBs47JaskqADw/Yx4j6nZ8xcIglfmg/ZHJArBvPA2vzkfEvPWNg29+bsSjqCRTZaMCSwE8KSdwa+vkgCEuuUUjfZat/OuquoMiBf98tA1XTnrpeTpQtQoRaJb/sW8thuSObhV7JC0Jl6sfyRNLCyLJ059viW8ttY09YTpxwX1PQTKrAVIqeTYWWI7oJJiu5ovv/Qy1pBY33ZIYfYphXA8BOxutS/eksQS5yfTzGNnqbhQlR4iip1Lh5tSXfKkS9VGd2ij94MoGIbz9ks6KxrQGxw5+y6mJAnJXFB+/Xlx5sxJoxQ6bssFznsRm83OCM7pYpXPUctx2EoNpVo6EazXWBt5Wu/qLyRpw3RQOnn+49a/G9wAVu8xrpBLMJJzfFLCPYUVBPd/MtwaFF67y9InUbAd+dGouZi9ekixoDVUW8FY9h0OVF/ISUWaPLUlMWrR3NnjkaQ6Hb8FR1NOJxSiHQ5rEMYR6I4LxrdgTxca/tsV0/S8ZrOjOChX06DKS760qvOodXfMzTDlpojt2t9rTUUZZvc284kUyk4MFQU919dKJZzIjkq3/BKg6+2iDxuf9wDGofPCBknJy+IMDzaGQz2pb9r7isvA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(54906003)(478600001)(91956017)(6916009)(8936002)(8676002)(4326008)(76116006)(66946007)(66556008)(66476007)(64756008)(122000001)(316002)(38100700002)(66446008)(41300700001)(2616005)(186003)(83380400001)(71200400001)(6486002)(53546011)(6512007)(26005)(6506007)(33656002)(86362001)(5660300002)(38070700005)(2906002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A4422803FA18441AB3A64D937008EE0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10265
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19bc3425-63fa-4154-53a6-08db65afb5d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mz009dudKYe7blBIxMu+ls6sc51aTjdMpURhni4SFGhTxmko/uE0f7gFEEfX0c1iNh3O3IrEDxhHnD8kgRFECR4fTEZxmDbYNQaZTOl1PvCZeegeJ9Y9vWGkBiBalqQX0GcG8+dmEHIXGrksuAgVSPv3hJwnJ/bSKO9YJ5I1BmKnzX1Pg3SjIAd5jkmn+1wHcKPzQfyaBLEnIsEk5kFETh+hnQL61p2rADOlkf1XpQw/Nz2nfjT8QxHDWFGjG9QvjtEZlaE8yLVBDfQgbihOKg3unquMHPNZldQBc9seLpXEX6s4xZBve5l3X9es8HAE06+pxOwNkeLHjPnPWF2VO7vVn97XA8K4tbboCr+wZVwytwuR2mWxJBzmgbt2BfOQ4YHS1f6/C9FwrOPQOXIBWGxR0Yr0W8DlQDPATBT/ShjdBCnIjAwt+Sj+gbWBwgs9Qzc8jRXQ8vVxuyWFKnMWRrX24l7rFhRdQQBjdPU1aM01ycyBPLkAXNulDFoQ2Ioc09aZ3cPacyvH4wjkb5f9jlI7pRFkKxwDkG/5nud8SL4Z8BblrAr5A20ANePBnLmh6Z1oOYb7yPiX8Ls7C6No1ixbmrOz5qYDeSUKEw1faGxwLFf32gMjPicRJJJo0fOSd9dIlvFVZgLQ9fCl6HyFg1EGBYY1snTKbVzWpev4f2wjzi9dVfbA0nWFIdE6vbZWEST1dstAcEzQF0cOrSVZFBzUNGGTBYj3IQgoHrOBkncnPXqNFSdzvmN3D2W9/6B0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(41300700001)(316002)(54906003)(356005)(81166007)(82740400003)(5660300002)(2906002)(4326008)(70586007)(70206006)(6862004)(8676002)(8936002)(478600001)(40460700003)(6486002)(82310400005)(86362001)(186003)(36756003)(2616005)(107886003)(53546011)(336012)(33656002)(36860700001)(40480700001)(26005)(6506007)(47076005)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 10:29:24.1190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bafc82-1919-4765-83e6-08db65afbb6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9917

SGkgQW5kcmV3LA0KDQo+IE9uIDUgSnVuIDIwMjMsIGF0IDEyOjA1LCBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEluc2VjdXJlIHRoZSB3b3Jk
IGJlaW5nIGxvb2tlZCBmb3IgaGVyZS4gIEVzcGVjaWFsbHkgZ2l2ZW4gdGhlIG5hdHVyZSBvZiB0
aGUNCj4gc29sZSBjYWxsZXIsIGFuZCB0aGUgKGNvcnJlY3QpIGNvbW1lbnQgbmV4dCB0byBpdC4N
Cg0KR29vZCBmaW5kaW5nLg0KDQo+IA0KPiBJJ3ZlIGxlZnQgdGhlIHRhaW50IGNvbnN0YW50IGFz
ICdVJyBhcyBpdCdzIGEgcmF0aGVyIG1vcmUgdXNlci12aXNpYmxlLg0KDQpJIHdvdWxkIHZvdGUg
dG8gY2hhbmdlIHRoZSBVIGluIEkgaGVyZSBhcyBpdCB3aWxsIG1ha2UgaXQgbW9yZSBjb2hlcmVu
dA0Kd2l0aCB0aGUgZG9jIGFmdGVyIHlvdXIgYWRkZWQgZml4IGZvciBpdC4NCg0KPiANCj4gRml4
ZXM6IDgyYzBkM2Q0OTFjYyAoInhlbjogQWRkIGFuIHVuc2VjdXJlIFRhaW50IHR5cGUiKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
PiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4NCj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4N
Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENDOiBWb2xvZHlteXIgQmFi
Y2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IENDOiBCZXJ0cmFuZCBNYXJxdWlz
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+IA0KPiBJJ20gaGFwcHkgdG8gY2hhbmdlICdV
JyB0byAnSScgaWYgd2UgdGhpbmsgdGhhdCBuby1vbmUgaXMgZ29pbmcgdG8gYmUgaW1wYWN0ZWQN
Cj4gYnkgaXQuICBJIGp1c3Qgd2Fzbid0IHN1cmUuDQoNCkhlcmUgaSBkbyBub3QgdGhpbmsgbWFu
eSB3aWxsIGJlIGltcGFjdGVkIHNvIEkgd291bGQgcmF0aGVyIG1ha2UgdGhpcyBjb2hlcmVudC4N
Cg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQoNCj4gLS0tDQo+IHhlbi9hcmNoL2FybS9jcHVlcnJhdGEu
YyB8IDIgKy0NCj4geGVuL2NvbW1vbi9rZXJuZWwuYyAgICAgIHwgMiArLQ0KPiB4ZW4vaW5jbHVk
ZS94ZW4vbGliLmggICAgfCAyICstDQo+IDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVlcnJh
dGEuYyBiL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYw0KPiBpbmRleCAxYWJhY2ZlNWJiNjcuLmQw
NjU4YWVkYjZhYSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jDQo+ICsr
KyBiL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYw0KPiBAQCAtNjk1LDcgKzY5NSw3IEBAIHZvaWQg
X19pbml0IGVuYWJsZV9lcnJhdGFfd29ya2Fyb3VuZHModm9pZCkNCj4gICAgICAgICAgICAgICAg
ICAgICAiKioqKiBPbmx5IHRydXN0ZWQgZ3Vlc3RzIHNob3VsZCBiZSB1c2VkLiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKioqKlxuIik7DQo+IA0KPiAgICAgICAgIC8qIFRhaW50IHRoZSBt
YWNoaW5lIGhhcyBiZWluZyBpbnNlY3VyZSAqLw0KPiAtICAgICAgICBhZGRfdGFpbnQoVEFJTlRf
TUFDSElORV9VTlNFQ1VSRSk7DQo+ICsgICAgICAgIGFkZF90YWludChUQUlOVF9NQUNISU5FX0lO
U0VDVVJFKTsNCj4gICAgIH0NCj4gI2VuZGlmDQo+IH0NCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24va2VybmVsLmMgYi94ZW4vY29tbW9uL2tlcm5lbC5jDQo+IGluZGV4IGY3YjFmNjVmMzczYy4u
MTRjZTZiNDBjZTA2IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL2tlcm5lbC5jDQo+ICsrKyBi
L3hlbi9jb21tb24va2VybmVsLmMNCj4gQEAgLTM1NCw3ICszNTQsNyBAQCBjaGFyICpwcmludF90
YWludGVkKGNoYXIgKnN0cikNCj4gICAgIGlmICggdGFpbnRlZCApDQo+ICAgICB7DQo+ICAgICAg
ICAgc25wcmludGYoc3RyLCBUQUlOVF9TVFJJTkdfTUFYX0xFTiwgIlRhaW50ZWQ6ICVjJWMlYyVj
JWMlYyIsDQo+IC0gICAgICAgICAgICAgICAgIHRhaW50ZWQgJiBUQUlOVF9NQUNISU5FX1VOU0VD
VVJFID8gJ1UnIDogJyAnLA0KPiArICAgICAgICAgICAgICAgICB0YWludGVkICYgVEFJTlRfTUFD
SElORV9JTlNFQ1VSRSA/ICdVJyA6ICcgJywNCj4gICAgICAgICAgICAgICAgICB0YWludGVkICYg
VEFJTlRfTUFDSElORV9DSEVDSyA/ICdNJyA6ICcgJywNCj4gICAgICAgICAgICAgICAgICB0YWlu
dGVkICYgVEFJTlRfU1lOQ19DT05TT0xFID8gJ0MnIDogJyAnLA0KPiAgICAgICAgICAgICAgICAg
IHRhaW50ZWQgJiBUQUlOVF9FUlJPUl9JTkpFQ1QgPyAnRScgOiAnICcsDQo+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vbGliLmggYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgNCj4gaW5kZXgg
ZTkxNGNjYWRlMDk1Li43NWFlNzQ4OWI5ZjAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9saWIuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgNCj4gQEAgLTIwMSw3ICsyMDEs
NyBAQCB1aW50NjRfdCBtdWxkaXY2NCh1aW50NjRfdCBhLCB1aW50MzJfdCBiLCB1aW50MzJfdCBj
KTsNCj4gI2RlZmluZSBUQUlOVF9NQUNISU5FX0NIRUNLICAgICAgICAgICAgICgxdSA8PCAxKQ0K
PiAjZGVmaW5lIFRBSU5UX0VSUk9SX0lOSkVDVCAgICAgICAgICAgICAgKDF1IDw8IDIpDQo+ICNk
ZWZpbmUgVEFJTlRfSFZNX0ZFUCAgICAgICAgICAgICAgICAgICAoMXUgPDwgMykNCj4gLSNkZWZp
bmUgVEFJTlRfTUFDSElORV9VTlNFQ1VSRSAgICAgICAgICAoMXUgPDwgNCkNCj4gKyNkZWZpbmUg
VEFJTlRfTUFDSElORV9JTlNFQ1VSRSAgICAgICAgICAoMXUgPDwgNCkNCj4gI2RlZmluZSBUQUlO
VF9DUFVfT1VUX09GX1NQRUMgICAgICAgICAgICgxdSA8PCA1KQ0KPiBleHRlcm4gdW5zaWduZWQg
aW50IHRhaW50ZWQ7DQo+ICNkZWZpbmUgVEFJTlRfU1RSSU5HX01BWF9MRU4gICAgICAgICAgICAy
MA0KPiANCj4gYmFzZS1jb21taXQ6IDY3ZmRmZmVmOTI0NmM4MmNlY2Q4ZGIyODgzOGVkMDllNzll
MjUyOGENCj4gLS0gDQo+IDIuMzAuMg0KPiANCg0K

