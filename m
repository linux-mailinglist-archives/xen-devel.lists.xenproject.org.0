Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F149226F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 10:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258410.444963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kcp-0003u7-0m; Tue, 18 Jan 2022 09:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258410.444963; Tue, 18 Jan 2022 09:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kco-0003rw-Su; Tue, 18 Jan 2022 09:17:58 +0000
Received: by outflank-mailman (input) for mailman id 258410;
 Tue, 18 Jan 2022 09:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2vFr=SC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n9kcm-0003rq-Ej
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 09:17:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8416b8c6-783f-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 10:17:54 +0100 (CET)
Received: from DB9PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:10:1da::8)
 by AM6PR08MB5158.eurprd08.prod.outlook.com (2603:10a6:20b:ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 09:17:51 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::54) by DB9PR05CA0003.outlook.office365.com
 (2603:10a6:10:1da::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Tue, 18 Jan 2022 09:17:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 09:17:51 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Tue, 18 Jan 2022 09:17:51 +0000
Received: from fac997395aa3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21CBD0B1-235E-4A21-ADEF-20BB9EF0E045.1; 
 Tue, 18 Jan 2022 09:17:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fac997395aa3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jan 2022 09:17:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0802MB2401.eurprd08.prod.outlook.com (2603:10a6:203:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 09:17:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4888.013; Tue, 18 Jan 2022
 09:17:42 +0000
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
X-Inumbo-ID: 8416b8c6-783f-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9CEQQgRQs63+leoGkBBlg1QFh3RJgZmigbnjFZsIyk=;
 b=dbvX1dfKEJp5S1xf0ep00aJkmpGuVwb0QuL0O6QrDoYdspsYvcAVNbBY7c9i7Fye85vw53vTxN907SuJLB8RQDTtLKohAMEfnjnFpABvfGNiyHCQ5a9A81OMLLiy7Lr3WAXEsOng6vLQoPzNHaA3F2aqRFG/JgZfwPkMnH8Tfik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d7c0210b0ecf426
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHBSu0HJJ0eyLJAp5Er5NXs15tj0g9oHN985Q0EA7IkRBsrpRepreGph3ynSVIQNNHrhHU4Ie2oSQ8gk9hGg30Fxpc+ph00PFz6/WCNdYdZBt6BjbJUX1ZxKUAH4E6OaXUPKtLy+yp8TAapWB4+c9gul3tNL2jbw3uPLdPbX8gif40MFxnH2o1TvtgAfDvWJu/hg5CMNeejod4bNlv47/yUTLAQkFsKe+Fq0A6S1cA7qJxw0+ZK7sSrDCTPTpnwXiRiWpj2iijl3wvcIex4vtAOh8X/Sm7GhZ1y32wawBQkg7IYbs7EYteTEW3IWb2FfTo4dhK//BIkotyODwL3xbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9CEQQgRQs63+leoGkBBlg1QFh3RJgZmigbnjFZsIyk=;
 b=IvYzYMcaZoYrBDAG9+akuwfufNZ7RkLFYnvYmgDw7BB9gxR+TjXEpN0n3JPSoGvlkwKN95OtPjkRFOOiEZkRf25jahtpstOXtNd6tceglRy4zvaLUXgHgp3MjrdafP7cBPpRkOlpnxnDgCm9b1lmDR38/jMr+1YAhWecsI3CsTWzVFxWcLVE4ipDk2EJFhUdDpidQiJrqIsMYVuvpbV94NOAVD/7y1g8E8xs5ynMbsrw+Yo+ayrhWbuuNSL7ZArltw2P5sLeylWb1t6hwCKaXka6N8FlMgn1bVeCRiOs54J5F7XwJx6FOSLtv/1zuzpec44cS2lbaG4HWczMNex5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9CEQQgRQs63+leoGkBBlg1QFh3RJgZmigbnjFZsIyk=;
 b=dbvX1dfKEJp5S1xf0ep00aJkmpGuVwb0QuL0O6QrDoYdspsYvcAVNbBY7c9i7Fye85vw53vTxN907SuJLB8RQDTtLKohAMEfnjnFpABvfGNiyHCQ5a9A81OMLLiy7Lr3WAXEsOng6vLQoPzNHaA3F2aqRFG/JgZfwPkMnH8Tfik=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Dongjiu Geng <gengdongjiu1@gmail.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Topic: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Index: AQHYC20k2h7y374id02KJynAohV9hqxnQp6AgAE2BYCAAADaAIAAAqmAgAAFfIA=
Date: Tue, 18 Jan 2022 09:17:42 +0000
Message-ID: <A5AC5212-A9FD-4027-893D-24A5A8DFD825@arm.com>
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
 <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org>
 <CABSBigSOjoXABoYoe+SahQyX0P045YjgK3A=7yyxw_aX8nzTqg@mail.gmail.com>
 <9A7FAD16-3D4A-4C22-8288-A4719A993CDD@arm.com>
 <CABSBigSba0ENZ-AvDN7bPGNqS5zQKceL901BxhjR8pkRntgnrw@mail.gmail.com>
In-Reply-To:
 <CABSBigSba0ENZ-AvDN7bPGNqS5zQKceL901BxhjR8pkRntgnrw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 31ac384e-422a-4368-f688-08d9da63670d
x-ms-traffictypediagnostic:
	AM5PR0802MB2401:EE_|DB5EUR03FT053:EE_|AM6PR08MB5158:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB51581F5C4E5F9AE75C14B97F9D589@AM6PR08MB5158.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bVUglsoqwAGHthsDsAlmbV+tJvX4GG2znDDDBPdXRjwX2hmIgSXJf6/fNhXqftAETDCej6Imvkk3Uk63ZAydJo6OCSfsmMohWE+CPmg+r8pFyQCTAcsxFBDqhFWk7YYBh4H+xt0uNzU8fY7wNxuzMAF1ClKysX78FMQRPkF30nMcAulEnlQS7ePOEN+5XJC+VH9D2f5cRbbWrhFauHi/0qI7RYq6FyYIgilwDdZEh3dJDvAfiaPTv41XhDRkdEEzak08DX15wsKdQghDHzIvUGlQrCJl+5ST5T9z4OeqfxwPv4y2uHJflan7im3yhqGOGyKxLDwuAKAo8jiP6zokY7GPZEnt2+mPicHILHQfZFmAJBJDyBydpIqufRW8qPDgRS3927QVaeWBGShwGtAA26ljYoMT1RgkrjKb9cTnrm5vHEy6UsBdA9sPMgJiay3V/YoXNtQg6j1f3WKk+HWBc3niVE4jXdudxgxa7Ly8+HYcry30SDm2Xml+fBxRVJYBPdNs+cV2D1iivhqaVHmGVKwiV9i4C5B8XL0K10r6Yr8AUaUIAbWZZFNPU8vGjA5dB4unyY/ucpwHnGLciWrY0j69RqX0ijeHDMEhBKZcqkADfwywSKunOfWZ68AnAR+07ry7IwhjW2Ertp0LR8mj51YRGdX3cJRvbvz/OqqI+GnQHdRucMEpA9Dmd9KBHNHl8seN9UoMt8iBJNldhB6sUY9hfdoY2MJDZX2AignCt9pZm9PX+arZ1Jt/9nvY876s
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(4326008)(26005)(508600001)(316002)(186003)(54906003)(6916009)(86362001)(53546011)(6506007)(6512007)(38070700005)(2616005)(2906002)(6486002)(5660300002)(8936002)(33656002)(38100700002)(122000001)(36756003)(66446008)(66556008)(66476007)(64756008)(91956017)(66946007)(71200400001)(76116006)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34110B56117D544D8F544F3C173380CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2401
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc9acdba-0deb-4785-4782-08d9da636192
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VYNXEmQ474Zx2eA1cJxcPvIBD65cyqMXfludh7yso4XAtedvV4gk1k0sGNlZLWzZRND6NI3DoA8RhWVDjxGEGH3mXzOvoewaTPksPCG2G04oOlgd/Iv0UJHHY/gr+e0W3dCS4FldV5shr6X9ynutDB8l4TQBnJxuyvAC3sXpTen6wHZpCt6CUZnlKI6W6iH67pDsUkB7EX+lhGhgC1X7z8zyB27WgSrhbi/pUz2VozdEiswFfBU55HBkWvEUrSynNiGmHSUkVB4Th7VmW6yRC5l2++78Zux0hGjACReiO4VGDwvP1F1CCF4CLhGZ8cgWRjgzxizbuRfZV5UW7V6pLXTCELagOlyg8mXp/OFcCDw/BLTM0s48qZ4cq69fIkLXHeWM2m14dAsnlwbFhkIuvHDSRCRdqvfLRqEIFL5/27IhoAOgarCVxuDWuIjM/Id2nUHhayoG8oZQAr8Kqho3SiSF2Q490zwdK4ykcD0OOqM7c3DtfP7q5hILk6w4EwwXriHBTDJngvvZlQ+x3WJupx31gUkzrk41ifpeBHUwtog4kJhouUJY1w89s8M91xTAla3BjyduOZDz9OKlrZCvTgJviBILgRLN6j2xVkdRwfG+MENvmT7vJ2S+KkjjYCC3GdmP/i7Cmt9298kSdGQwgUS+CNiZWGeLJhsJQRCy1qqXLfcgxwotBF6Kw9sa/07RZhm6o5GsuyPWy4k0owoeix2mnIopEERWCxAR1Ak/r+IO1cKXZtnq313ODhPAwuNfp9+Az+uppZVCm8auD6K4Pg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(2616005)(47076005)(4326008)(356005)(2906002)(336012)(86362001)(6862004)(508600001)(82310400004)(40460700001)(36756003)(6486002)(186003)(6506007)(70586007)(53546011)(70206006)(316002)(8676002)(36860700001)(26005)(83380400001)(6512007)(8936002)(54906003)(81166007)(33656002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 09:17:51.5065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ac384e-422a-4368-f688-08d9da63670d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5158

SGkgRG9uZ2p1LA0KDQo+IE9uIDE4IEphbiAyMDIyLCBhdCAwODo1OCwgRG9uZ2ppdSBHZW5nIDxn
ZW5nZG9uZ2ppdTFAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEJlcnRyYW5kIE1hcnF1aXMgPEJl
cnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4g5LqOMjAyMuW5tDHmnIgxOOaXpeWRqOS6jCAxNjo0OOWG
memBk++8mg0KPj4gDQo+PiBIaSBEb25nanUsDQo+PiANCj4+PiBPbiAxOCBKYW4gMjAyMiwgYXQg
MDg6NDUsIERvbmdqaXUgR2VuZyA8Z2VuZ2RvbmdqaXUxQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4g
DQo+Pj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4g5LqOMjAyMuW5tDHmnIgxN+aXpeWR
qOS4gCAyMjoxNuWGmemBk++8mg0KPj4+PiANCj4+Pj4gSGksDQo+Pj4+IA0KPj4+PiBPbiAxNy8w
MS8yMDIyIDEwOjQwLCBEb25naml1IEdlbmcgd3JvdGU6DQo+Pj4+PiBJdCB0dXJucyBvdXQgdGhh
dCBRRU1VIGhhcyBiZWVuIHN1cHBvcnRpbmcgR0lDdjIgdmlydHVhbGl6YXRpb24gc2luY2UNCj4+
Pj4+IHYzLjEuMC4gU28gcmVtb3ZlIHRoZSBkZXBlbmRlbmNpZXMgb24gR0lDdjMuDQo+Pj4+IA0K
Pj4+PiANCj4+Pj4gVGVjaG5pY2FsbHksIHRoZSBjdXJyZW50IGZvcm0gb2YgQ09ORklHX1FFTVUg
YWxsb3dzIHRoZSBzYW1lIGJpbmFyeSB0bw0KPj4+PiBib290IG9uIFFFTVUgd2l0aCBHSUN2MiBv
ciBHSUN2My4NCj4+Pj4gDQo+Pj4+PiBJZiB3ZSB3YW50IHRvIHVzZSBHSUN2MywNCj4+Pj4+IHdl
IGNhbiBzZWxlY3QgdGhlIFFFTVVfTEVHQUNZIGNvbmZpZ3VyYXRpb24uDQo+Pj4+IA0KPj4+PiBB
RkFJSywgR0lDdjMgaXMgbm90IGEgbGVnYWN5IGZlYXR1cmUuLi4gU28gaXQgZmVlbHMgYSBiaXQg
b2RkIHRvIG5hbWUgaXQNCj4+Pj4gbGlrZSB0aGF0IChzZWUgbW9yZSBiZWxvdykuDQo+Pj4gDQo+
Pj4gTGVnYWN5IG1lYW5zIFFFTVUgcGxhdGZvcm0gb25seSBzdXBwb3J0cyBHSUNWMywgbm93IGl0
IGNhbiBzdXBwb3J0DQo+Pj4gYm90aCBHSUN2MiBhbmQgR0lDdjMuIFRoZSBzY29wZSBvZiBzdXBw
b3J0IGhhcyBiZWVuIGV4cGFuZGVkDQo+Pj4gTm90IG1lYW4gR0lDdjMgaXMgYSBsZWdhY3kgZmVh
dHVyZS4NCj4+IA0KPj4gWW91IG1pZ2h0IGJlIG1pc2xlYWRpbmcgYSBiaXQgaGVyZS4NCj4+IElu
IHRoZSBjdXJyZW50IGNvbmZpZ3VyYXRpb24sIFhlbiBzdXBwb3J0IEdJQ3YyLCBHSUN2MyBhbmQg
dmdpYy4NCj4+IFRoZSBvbmx5IHRoaW5nIG5vdCBzdXBwb3J0ZWQgaXMgYWN0dWFsbHkgdGhlIG5l
dyBWR0lDIGJ1dCB0aGlzIGlzIGFuIHVuc3VwcG9ydGVkIGZlYXR1cmUgbm90IGZ1bGx5IGZ1bmN0
aW9uYWwgd2hpY2ggc2hhbGwgYmUgdXNlZCB3aXRoIGNhdXRpb24uDQo+PiANCj4+IFdoYXQgaXNz
dWUgZXhhY3RseSBkbyB5b3UgaGF2ZSBpbiBRZW11IGNvbmZpZ3VyZWQgZm9yIGdpY3YyIHdoZW4g
eW91IHVzZSB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uID8NCj4gDQo+IEkgd2FudCB0byB1c2Ug
TkVXX1ZHSUMgd2l0aCBHSUN2MiwgYnV0IFFFTVUgb25seSBzZWxlY3QgR0lDVjMsICB3aGVuDQo+
IEdJQ3YzIGlzIHNlbGVjdCwgdGhlIE5FV19WR0lDIGNhbiBub3QgYmUgdXNlZC4gICBJIHRyeSB0
aGUgTkVXX1ZHSUMNCj4gd2l0aCBHSUN2Miwgbm90IGZvdW5kIGlzc3VlLiBzbyBJIHdhbnQgdG8g
cmVtb3ZlIHRoaXMgbGltaXRhdGlvbi4NCj4gSWYgIHlvdSB0aGluayB3ZSBzaG91bGQgbm90IHN1
cHBvcnQgTkVXX1ZHSUMgZmVhdHVyZSwgIHdlIGNhbiBpZ25vcmUNCj4gdGhpcyBwYXRjaC4gIHRo
YW5rcyENCg0KU3VwcG9ydGluZyBHSUN2MiBtYWtlcyBzZW5zZSBidXQgdXNpbmcgTkVXX1ZHSUMg
aW4gWGVuIG1pZ2h0IG5vdCBhcyBpdCBpcyBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkIGFuZCBkb2Vz
IG5vdCBzdXBwb3J0IElUUyBhbmQgTVNJcy4NCg0KRG8geW91IGhhdmUgYSByZWFzb24gdG8gdXNl
IHRoZSBORVdfVkdJQyBpbXBsZW1lbnRhdGlvbiBpbnN0ZWFkIG9mIHRoZSBzdGFuZGFyZCBvbmUg
Pw0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+PiANCj4+IENoZWVycw0KPj4gQmVydHJhbmQN
Cj4+IA0KPj4+IA0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRG9uZ2ppdSBH
ZW5nIDxnZW5nZG9uZ2ppdTFAZ21haWwuY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiB4ZW4vYXJjaC9h
cm0vcGxhdGZvcm1zL0tjb25maWcgfCAxMCArKysrKysrKystDQo+Pj4+PiAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+PiANCj4+Pj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vcGxhdGZv
cm1zL0tjb25maWcNCj4+Pj4+IGluZGV4IGM5M2E2YjI3NTYuLjQxZTgyYTQyZWUgMTAwNjQ0DQo+
Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcNCj4+Pj4+ICsrKyBiL3hl
bi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZw0KPj4+Pj4gQEAgLTEzLDcgKzEzLDE1IEBAIGNv
bmZpZyBBTExfUExBVA0KPj4+Pj4gICAgIGF1dG9tYXRpY2FsbHkgc2VsZWN0IGFueSBvZiB0aGUg
cmVsYXRlZCBkcml2ZXJzLg0KPj4+Pj4gDQo+Pj4+PiBjb25maWcgUUVNVQ0KPj4+Pj4gLSAgICAg
Ym9vbCAiUUVNVSBhYXJjaCB2aXJ0IG1hY2hpbmUgc3VwcG9ydCINCj4+Pj4+ICsgICAgIGJvb2wg
IlFFTVUgYWFyY2ggdmlydCBtYWNoaW5lIHN1cHBvcnQgPj0gdjMuMS4wIg0KPj4+PiANCj4+Pj4g
VGhpcyBpcyBhIGJpdCBtaXNsZWFkaW5nLiBBIHVzZXIgbWF5IHNlbGVjdCB0aGlzIHRoaW5raW5n
IHRoYXQgdGhpcyB3aWxsDQo+Pj4+IHNlbGVjdCBHSUN2My4gSG93ZXZlciwgdGhpcyB3aWxsIG5v
dC4NCj4+Pj4gDQo+Pj4+IFRoaXMgYWxzbyByYWlzZXMgdGhlIHF1ZXN0aW9uIG9mIHdoYXQgaXMg
dGhlIGRlZmF1bHQgR0lDIHZlcnNpb24gaW4gUUVNVQ0KPj4+PiAoaS5lLiBpZiB5b3UgZG9uJ3Qg
cGFzcyBhbnl0aGluZyBvbiB0aGUgY29tbWFuZCBsaW5lKT8gSWYgdGhpcyBpcyBHSUN2MywNCj4+
Pj4gdGhlbiBJIGFtIGFmcmFpZCB0aGF0IHRoaXMgcGF0Y2ggd291bGQgYmUgYSBuby1nbyBmb3Ig
bWUuDQo+Pj4+IA0KPj4+PiBMb29raW5nIGF0IG92ZXJhbGwgZGlzY3Vzc2lvbiwgeW91IHNlZW0g
dG8gcHVzaCB0aGUgcGF0Y2ggb25seSB0byBhbGxvdw0KPj4+PiBidWlsZGluZyBhIHRpbnkgWGVu
IGZvciBRRU1VIGFuZCB0aGUgbmV3IHZHSUMuDQo+Pj4+IA0KPj4+PiBUaGUgZGVmYXVsdCBYZW4g
KGkuZS4gbWFrZSBkZWZjb25maWcpIHdpbGwgYWxzbyB3b3JrIG9uIFFFTVUuIEdpdmVuIHRoYXQN
Cj4+Pj4gdGhlIG5ldyB2R0lDIGlzIGEgc3RpbGwgaW4gZGV2ZWxvcG1lbnQsIEkgYW0gc2VyaW91
c2x5IGNvbnNpZGVyaW5nIHRvDQo+Pj4+IHNheSB0aGF0IGlmIHlvdSB3YW50IHRvIHRyeSBpdCB0
aGVuIHlvdSBoYXZlIHRvIHVzZSB0aGUgZGVmYXVsdA0KPj4+PiBjb25maWd1cmF0aW9uLg0KPj4+
PiANCj4+Pj4gQERvbmdqaXUsIGlzIHRoZXJlIGFueSByZWFzb24gd2h5IHlvdSB3YW50IHRvIHVz
ZSB0aGUgdGlueSBRRU1VIGNvbmZpZw0KPj4+PiByYXRoZXIgdGhhbiB0aGUgZGVmYXVsdCBjb25m
aWd1cmF0aW9uPw0KPj4+IA0KPj4+IEhpIEp1bGllbiwgdGhhbmtzIGZvciB0aGUgcmVwbHksIEkg
ZG8gbm90IHVzZSB0aGUgdGlueSBRRU1VIGNvbmZpZy4gSQ0KPj4+IHVzZWQgdGhlIGRlZmF1bHQg
Y29uZmlndXJhdGlvbiBhbmQgc2VsZWN0ZWQgdGhlIHBsYXRmb3JtIGFzIFFFTVUuDQo+Pj4gQnV0
IFFFTVUgcGxhdGZvcm0gb25seSBzbGVjdHMgR0lDVjMsIHNvIEkgc3VibWl0IHRoaXMgcGF0Y2gg
dG8gcmVtb3ZlDQo+Pj4gdGhlIGxpbWl0YXRpb24gYmVjYXVzZSBJIHdhbnQgdG8gdXNlIFZHSUMu
IFZHSUMgY2FuIGFscmVhZHkgc3VwcG9ydA0KPj4+IEdJQ3YyIG5vdy4NCj4+PiANCj4+Pj4gDQo+
Pj4+IEBCZXJ0cmFuZCwgQFN0ZWZhbm8sIHdoYXQgZG8geW91IHRoaW5rPw0KPj4+PiANCj4+Pj4g
Q2hlZXJzLA0KPj4+PiANCj4+Pj4gLS0NCj4+Pj4gSnVsaWVuIEdyYWxsDQoNCg==

