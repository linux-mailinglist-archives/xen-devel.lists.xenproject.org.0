Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ADF669DF6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 17:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477477.740194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGMt6-0005pf-DY; Fri, 13 Jan 2023 16:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477477.740194; Fri, 13 Jan 2023 16:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGMt6-0005n3-AD; Fri, 13 Jan 2023 16:26:40 +0000
Received: by outflank-mailman (input) for mailman id 477477;
 Fri, 13 Jan 2023 16:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Kou=5K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pGMt4-0005mx-Ro
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 16:26:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d1c8853-935f-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 17:26:37 +0100 (CET)
Received: from AM6PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:20b:2e::35)
 by DBAPR08MB5575.eurprd08.prod.outlook.com (2603:10a6:10:1a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 16:26:32 +0000
Received: from VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::ea) by AM6PR05CA0022.outlook.office365.com
 (2603:10a6:20b:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT027.mail.protection.outlook.com (100.127.144.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 16:26:31 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Fri, 13 Jan 2023 16:26:30 +0000
Received: from c07ecf60950f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E0AB64B-D8A1-4DB7-A1A2-92EFAFE1BD74.1; 
 Fri, 13 Jan 2023 16:26:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c07ecf60950f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 16:26:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9540.eurprd08.prod.outlook.com (2603:10a6:10:451::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:26:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 16:26:16 +0000
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
X-Inumbo-ID: 0d1c8853-935f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaFig45RHzspCsEkQFelcF4LE8EvQLogngsVM32N+RU=;
 b=YgRGVKO1nKw1D6BpurIpbPTPsg3fDI6w4ahe0My5VlhebsaKVl6aKM6XIb5xOodex5RZMeMWtv+Qwn9JGsgdQNdXBy9a2twPF6lK3j9fLbKkNocZlvz3y5OBD406u0YYb/t5gfh0iIHGmrAXTSvHd5AEqanQQLkQFZbmdeJejak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58e900f2ef7e89df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/9kuoAUBPzFWSuSHK5+v7PW64sjuKqyfPdSzJRaRKQ1z6buN9nQawkvFBg4FqFBigtysuhG3uFMMx98mjvZTCwue3yaQ2O4h0/MF57MR+XVL9eQ4s9jSqdsUDtrnSp4yiQN/wfydGGQXy12ZBPSRzqcMrMW2xPgW20Ajp2hhzLtWO2743QFupILR/cRPP7SvoPZYioslGoigo6C98xkigsV53GgTgc5JxhMWljmYSzsj4ZU1THHVQCOI1U422kC++uFWWNKMG5aM7zyO9pPYkAHUoW0Zq4PVOj//YXz9uyh4zdkAuLieylsXtsQIdzeBDwbQbxJRFk7F15WO6y8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaFig45RHzspCsEkQFelcF4LE8EvQLogngsVM32N+RU=;
 b=KEywhFIONAWXj70Q6Nx3tGmnZsaSGG36RF8pW/lx6lGWHuWWWJ6mUpBs3z/Ysrt1Zu+H5pZs3fsonhmnXUAizSFbKkUP8dKj9xRkpKb9C3/CnBY65qYx8yHP811wfr99dFLf3WDJFQlrPmafwDYWL/7uVgjhMmW0/nOeE5VsJvuuRWWP0YU7l+OB+LInzjwY4TRtaOTcjgACmB7Nl76ZH7pkLm7XwNEW6OtHWwZ4BAcACpRCQSrFu4JuR7sYbw2w/wAVssCiGejkXGi/0cFQWR9B0nnLMGS4I5wXvjnJIK5ldRKlrA6UUHr9MaTjodjYmc5FYu+zkk/QRstcfnwgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaFig45RHzspCsEkQFelcF4LE8EvQLogngsVM32N+RU=;
 b=YgRGVKO1nKw1D6BpurIpbPTPsg3fDI6w4ahe0My5VlhebsaKVl6aKM6XIb5xOodex5RZMeMWtv+Qwn9JGsgdQNdXBy9a2twPF6lK3j9fLbKkNocZlvz3y5OBD406u0YYb/t5gfh0iIHGmrAXTSvHd5AEqanQQLkQFZbmdeJejak=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 12/14] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Topic: [PATCH v4 12/14] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Index: AQHZJzoTvCUimx3Q2EmG6peGw8mIYK6ciQOA
Date: Fri, 13 Jan 2023 16:26:16 +0000
Message-ID: <F2BF5056-664C-40E5-B7DD-AE158DE3CF67@arm.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-13-julien@xen.org>
In-Reply-To: <20230113101136.479-13-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB9540:EE_|VI1EUR03FT027:EE_|DBAPR08MB5575:EE_
X-MS-Office365-Filtering-Correlation-Id: c794fc00-f2f5-4971-11be-08daf582ede1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uHBMuWAkk0ltysbE4SViU0REp6zsT4G7rcuHPLS06bHVdq5dIHyFNxjpOw6C/wserEd9Ei4gnouyxmuD2P1+ji73zyjGxpVXrE0bPO3yC2u3We5B4Mz/kKnPhENm4H0r4/k2YNeMQQE7a+txJT6wfNDv5nlItEHqjI8AkkHLfT1kdtqg9muGfVO+hc6Pn7VevGgXesfTGppkTuzKz2dRkojaPY8K6ur3PoYXasEDCCWoCn6kXeqJ5BAyfLzUGUKlUdLVjEAyahRiVPPLUVPGZuG5OBR368iQXL/cuNI1+FIngPHG1C3Hh097730i7m7/pclnYhXzYaL/yAoQobFQK/W0agLowNG77A4B9t5SKZl/LhC2zlLcMXl8jtDZ9cVBvN8cGHOWd4iGd4NOl/ZMPuzjdtR94jeBrIRvFxZqfjr6fRofsHttLvJ30V6QoLQUMEoEKM1bYmryBwLgsuWhOjKQQYUSWPQqCpmkD4xvrashfmHhJ4kKbBgjeiFfhPMVXxnFPcjA0JmTiZG80l87G1fbkbSuSIb3+nqP+z4fsLTzk2fSnOt1BFgAtW1cRMN1J/NojC4XAssU/abpV0bGZvkH62DkQDWPMqJQqZyahh6DddY0vMUxETdJr2aqMYO7iHa39fi1YmUy6E3hZqAwlvAII6s41hH9n10rvFcyl12xORSBVwLljn+r62Y7Zmrme5uj8H9QnVCgr4DguRdKqN4m0H5ukUB79ryVr+mqbUQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199015)(122000001)(64756008)(83380400001)(38100700002)(8936002)(86362001)(66476007)(2906002)(5660300002)(66446008)(66556008)(66946007)(8676002)(76116006)(4326008)(2616005)(26005)(41300700001)(6486002)(186003)(53546011)(6506007)(71200400001)(478600001)(316002)(91956017)(6916009)(54906003)(33656002)(6512007)(38070700005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBACC3ED31B5D74BAA43ADB9CF9EB56F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9540
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52702472-b9b9-4d45-4756-08daf582e4ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vA40R2FPMvyFWRlvi6rTb8HlV3W5/chmHuGJTrtYQ6OW+QWr41U3g50uQVoV6vAyTP+hy2f6HuXkwVDBcVI7/Ei6pMX3JC15ZeLEuIw8+padhFny4gifnjNPP2bb9BCiJPZd3blKx/7SYOOMnFZu/rICsJh3kTlJNELRm7igmx9BTIeoi3u9wN+LWOs83BICOXPJlqDtk7zJa4BkXrzSo5FZ4Hg4X/JnGUV4BMVUV9wYnK5/8JG6XM5Qlb2antwhoYkpXth32y2KRr5hEuOKQA6NWsSaHYn3ZK5NUTAsZpWHRSg3qAvS7kiZodem7gGSz7PKuvKDGGiKZyqJTfPtbVkUxE4/BiW/cPJ2oKt0LT9GPXKACgpOvo0EmS6QP9IA6uoO8hxFenNF/2P8jauzPomEwQuYIZo+tkzt0S0vgPZp+se1d2vFDzZyY2LrlexRVeWkD/4PEqXC6CtcDR+dOL3AH0bAb1uJ9gGofYOmS/K2E4Yh0o0S2SmtKPTx8H8TCJpIMlj/LkYUMJTpbHS9zk5UxIkgbBslbvDKWlKREiws9f/JX6ACkrTbejF4/lsyCJe0EJQJ9LU8L3BxtIUjtWgK3LjwlPS3a3tXd+EQoyg/MyfdxFV4ixRk0NZPCsuQrBjGkWxVqq7lphoDofGnNUaiV4HGQwMaF+i9cYNEhgKnzBj9MOFgH4DcijpMyaeXWMz3k47Y028iu06SB1GUSA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(86362001)(316002)(40480700001)(478600001)(41300700001)(5660300002)(82310400005)(40460700003)(36860700001)(36756003)(54906003)(2616005)(6862004)(6486002)(8936002)(6512007)(2906002)(6506007)(47076005)(356005)(70206006)(8676002)(70586007)(83380400001)(107886003)(53546011)(336012)(4326008)(33656002)(82740400003)(186003)(81166007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:31.0756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c794fc00-f2f5-4971-11be-08daf582ede1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5575

DQoNCj4gT24gMTMgSmFuIDIwMjMsIGF0IDEwOjExLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBJbiBmb2xsb3ctdXAgcGF0Y2hlcyB3ZSB3aWxsIG5lZWQgdG8gaGF2ZSBwYXJ0IG9m
IFhlbiBpZGVudGl0eSBtYXBwZWQgaW4NCj4gb3JkZXIgdG8gc2FmZWx5IHN3aXRjaCB0aGUgVFRC
Ui4NCj4gDQo+IE9uIHNvbWUgcGxhdGZvcm0sIHRoZSBpZGVudGl0eSBtYXBwaW5nIG1heSBoYXZl
IHRvIHN0YXJ0IGF0IDAuIElmIHdlIGFsd2F5cw0KPiBrZWVwIHRoZSBpZGVudGl0eSByZWdpb24g
bWFwcGVkLCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd291bGQgbGVhZCB0bw0KPiBhY2Nlc3Mg
dG8gdmFsaWQgbWFwcGluZy4NCj4gDQo+IEl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIHJlbG9jYXRl
IFhlbiB0byBhdm9pZCBjbGFzaGluZyB3aXRoIGFkZHJlc3MgMC4NCj4gSG93ZXZlciB0aGUgaWRl
bnRpdHkgbWFwcGluZyBpcyBvbmx5IG1lYW50IHRvIGJlIHVzZWQgaW4gdmVyeSBsaW1pdGVkDQo+
IHBsYWNlcy4gVGhlcmVmb3JlIGl0IHdvdWxkIGJlIGJldHRlciB0byBrZWVwIHRoZSBpZGVudGl0
eSByZWdpb24gaW52YWxpZA0KPiBmb3IgbW9zdCBvZiB0aGUgdGltZS4NCj4gDQo+IFR3byBuZXcg
ZXh0ZXJuYWwgaGVscGVycyBhcmUgaW50cm9kdWNlZDoNCj4gICAgLSBhcmNoX3NldHVwX3BhZ2Vf
dGFibGVzKCkgd2lsbCBzZXR1cCB0aGUgcGFnZS10YWJsZXMgc28gaXQgaXMNCj4gICAgICBlYXN5
IHRvIGNyZWF0ZSB0aGUgbWFwcGluZyBhZnRlcndhcmRzLg0KPiAgICAtIHVwZGF0ZV9pZGVudGl0
eV9tYXBwaW5nKCkgd2lsbCBjcmVhdGUvcmVtb3ZlIHRoZSBpZGVudGl0eSBtYXBwaW5nDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCj4g
LS0tLQ0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29t
Pg0KDQpJ4oCZdmUgYWxzbyBidWlsdCBmb3IgYXJtMzIvNjQgYW5kIHRlc3QgdGhpcyBwYXRjaCBv
biBmdnAsIGJvb3RpbmcgRG9tMA0KYW5kIGNyZWF0aW5nL3J1bm5pbmcvZGVzdHJveWluZyBzb21l
IGd1ZXN0cw0KDQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNv
bT4NCg0KDQoNCg==

