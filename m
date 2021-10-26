Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07D43AFA2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 12:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216335.375902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfJFR-0007D3-7P; Tue, 26 Oct 2021 10:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216335.375902; Tue, 26 Oct 2021 10:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfJFR-0007B7-4D; Tue, 26 Oct 2021 10:00:01 +0000
Received: by outflank-mailman (input) for mailman id 216335;
 Tue, 26 Oct 2021 09:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TejW=PO=arm.com=Jiamei.Xie@srs-us1.protection.inumbo.net>)
 id 1mfJFO-0007Az-Vx
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 09:59:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20d66c3f-603b-41b1-81c7-e75b7233dfbb;
 Tue, 26 Oct 2021 09:59:55 +0000 (UTC)
Received: from DB6P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::28) by
 HE1PR0802MB2491.eurprd08.prod.outlook.com (2603:10a6:3:de::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.20; Tue, 26 Oct 2021 09:59:42 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::d1) by DB6P192CA0018.outlook.office365.com
 (2603:10a6:4:b8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 26 Oct 2021 09:59:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 09:59:42 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Tue, 26 Oct 2021 09:59:42 +0000
Received: from fd2e5854a14c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6BB2F10-D3FA-492B-8EAE-FACCFC483AE9.1; 
 Tue, 26 Oct 2021 09:59:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd2e5854a14c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Oct 2021 09:59:36 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28)
 by VI1PR08MB3773.eurprd08.prod.outlook.com (2603:10a6:803:bb::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 09:59:34 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::9528:d287:4b41:1ccc]) by VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::9528:d287:4b41:1ccc%4]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 09:59:34 +0000
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
X-Inumbo-ID: 20d66c3f-603b-41b1-81c7-e75b7233dfbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Cm63ANI/4WQOOYL0nfpEe0BCVUOgAcGdQS0zt2itOs=;
 b=UoORpYaYtQ55FWo8bxXNNVN4yPLWHmzkXZmy5LO9d5GiSY3AHZivTC/KaefkZDrA2CcaF+YJFXAwkPiWEjhMLvpDoy8AJiX5WsULsKml1afEx6tPN2H27hiPZKONVR7koYvCBxZ9PPRUK7ZP6YQwnpdcAtSLnNUzWDYFnNkYbHw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBNuaObu/dVDJ1wihGLYfTQPvbL7cA4WxPdGQEQjiSJhMtt6VY8d/yj2VEY06fMxk/Xzi35REFaz3YrBlXjAS0qxHIE5gE61XVonfnD1Wz2vsfTQ3H15YRRPg5A4oEK/y6LMUyTJHLGGj69s0e7StNqao0MXzHSc48rjAHoWLe9xf2LIpLkzwjRepzptMaX/CesDxUtIiogSZVbVKCNRB4uNdzXdcGw4oNY2s95xzSu/HBDOrEJk5WMFJMnwOHPymCp8+M5vK08ZOBPJC2MBYHp+RrqXYL8KD73fm30WBUrSROGpK7OF6aABrdbj6mufpLUnZE1Kzx9/GtLrMFN7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Cm63ANI/4WQOOYL0nfpEe0BCVUOgAcGdQS0zt2itOs=;
 b=VrQ+7iXJqx0l845Ybw104crtBEQsl+uOqPbAbGmeNJYz1jzkRKjRTXdYx+Dpc/r29dIkX+hd08MASKdxSNjhjrArVMWPqqtMjZ4+DshuvtgM+P4V5/WYxUuVuVBEd9fCx3n+N5C9MzIMVGhJ1wdd/kAYhnEgIAcBHxhfLDixRnSapslklGJbrOMOAi7LMbCVf+g0P36wN4ecSH5267VucUmZY71SMy5Sqi0kVOQSBRPZ6+paWgQczNK8bCHnIDtybZt+rl1NAKI3aDQGqtgjxnXoFf1jKjOHtTlydo1iqBQWpkbEuilAzLlzM6guHEeHURfnhi9IENmNvpZoR6vGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Cm63ANI/4WQOOYL0nfpEe0BCVUOgAcGdQS0zt2itOs=;
 b=UoORpYaYtQ55FWo8bxXNNVN4yPLWHmzkXZmy5LO9d5GiSY3AHZivTC/KaefkZDrA2CcaF+YJFXAwkPiWEjhMLvpDoy8AJiX5WsULsKml1afEx6tPN2H27hiPZKONVR7koYvCBxZ9PPRUK7ZP6YQwnpdcAtSLnNUzWDYFnNkYbHw=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Juergen Gross <jgross@suse.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] xen: Fix implicit type conversion
Thread-Topic: [PATCH v2] xen: Fix implicit type conversion
Thread-Index: AQHXyjurcY7tN33IlE6GkuPKa9q2jKvk4+KAgAAnZaA=
Date: Tue, 26 Oct 2021 09:59:34 +0000
Message-ID:
 <VI1PR08MB30564CABD02DBB0F17BBDCDD92849@VI1PR08MB3056.eurprd08.prod.outlook.com>
References: <1635233531-2437704-1-git-send-email-jiasheng@iscas.ac.cn>
 <01fd083e-e9a6-c019-0a74-bf28b2982412@suse.com>
In-Reply-To: <01fd083e-e9a6-c019-0a74-bf28b2982412@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EA29A9CC81D4E14583D764E12361A4D9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 58abb677-8382-4020-c225-08d9986754d0
x-ms-traffictypediagnostic: VI1PR08MB3773:|HE1PR0802MB2491:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB249182065BB3CA2C4188442292849@HE1PR0802MB2491.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uPAuM4Rgqb9FxKHTU4H2zurBOk2TCXHxY9Q86L58nGp0WTBRS0cXOAXPUNYzJuwOtOkZ2xwbF7mdcWtCYtFlXxaqCJQPzj+P9Ngx8sCvfTGXL3MqoRG6+4Z7q3EISFrFuuc52pGfnU4+04AQ2zaJGOhduQxThGmwqLNMPYoJWhqqW8MiWWliXrKvlK+6RqpdbYQfrQnC1Zqv4hZPUpNA4gKm4BaVks9IoSDeM1iY0GRoafBLq9XGHMskCh4HIEiQN+VjV7xYy+I2UCTPABOiQjiY7ae/PhZQw/JBs3IEEEm7N5DznZnFVwKxm8jOHj1VycWboJJsrizGPHtCKeAav+lKtgYX2vF08CeUOuEjEpt8Ozpd/ipSJWM5JIy6swWGDnoI1smSbhltRVdtO5fHKAB4PIdNRxDHbpZvXk5NmQWrTTrS+tjZyBM2g0zroEiqcslvMJCT5ygWJ/ohPtg0bx4x8/SsVu4WkxHodnHGUcOE4kl7YiDantXrgQ3hB2kMz95Lx9rMfFMheKXdAKCZ05s+YbKjGwhxIsGPKa2kRjLR1ej7Cbs7OCgkRycUG6FIMS0QUIomki9n/5pirm3SclZtuQHivDYeLkPWW0KfPPvdd2LnuW8VRs0ne4T7suJ5xTsaMcs4WJNbGY6c+Iqp2AGdUodgshygY0b96mvVfQ2JaaXeD1N//aBUi4N2LuW0LVP+SPqGRJxHv864oJ5S9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3056.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(38070700005)(55016002)(64756008)(54906003)(86362001)(9686003)(8936002)(66476007)(38100700002)(8676002)(110136005)(2906002)(76116006)(71200400001)(5660300002)(7696005)(52536014)(33656002)(508600001)(186003)(122000001)(66446008)(316002)(83380400001)(6506007)(26005)(66946007)(4326008)(53546011);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3773
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2fdcc41-aa2e-4e07-bf96-08d998675076
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rn8wOK8l8zO0x1qnXsTsHsm5HHUVM++Q7OZryVoBsOl5ssPIr/fzE94kkzOc6g7A+X7EuWT5ISVeSxxCdssBwFmSvm7pzvLt89zMg5R5n0toFzjA1qKgtIFGSD+uEO+AFKzRcwih2PVRO2aKu189wokY3vrX8pEv5Hj8snRNSLXo/izH/oYYSECP3aP7weECaiaxJIFzm9v14lJSzoEjuRLe7w2gaCZkbwJAtoEFnjvY7y31WnQBD7gVnd4Zfe46UI6YB54xISUaTYBHt4wqt06DU/VDm9fBaLk74XTOAD29Ue2bUTvUM+Cb/v1Tqbdm9ArXs6LZTxohBmupu2+dyjpOKMJpqPjkDq2IbQOdGmpzs+e5trJqfTEAt03n9RZpiGjVtm9xE4abeOjLeHyL1otVse+xcDQgHgYya73Y8jtQfnMz2WU9dS3+Xt4fc5aoeUvS2ROz66TszCEPReh4yTasl2GNfi5rK4MYruLwIJPYqQ9tGfGGZsB6pynAy5tqukvSXR3xRm+zFmYVyRJTmevx4G/Ga94XnSHDGyGImAFZDRVuLI5nqYvqtJx0uFlLNK2gKKDvTdGOgvWLfxuUo9rvxLiWK0Fma1XGX+m4+RYg1NhKF9h+1mcrAJE+Mcs5ELkR78hAw+SHpV1fFt/ReFpzKcrLEMaXGjIDAAq0UikO5G3YXNskvXO63NqGpEgZhrlF5fnRDooc0ZPLVKlqNw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(107886003)(86362001)(36860700001)(33656002)(83380400001)(82310400003)(47076005)(356005)(316002)(81166007)(52536014)(336012)(110136005)(7696005)(186003)(2906002)(53546011)(6506007)(26005)(4326008)(508600001)(70206006)(8676002)(8936002)(9686003)(70586007)(54906003)(55016002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 09:59:42.1586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58abb677-8382-4020-c225-08d9986754d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2491

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4ZW4t
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IEp1ZXJn
ZW4gR3Jvc3MNCj4gU2VudDogMjAyMeW5tDEw5pyIMjbml6UgMTU6MzYNCj4gVG86IEppYXNoZW5n
IEppYW5nIDxqaWFzaGVuZ0Bpc2Nhcy5hYy5jbj47IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
Ow0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2Ml0geGVuOiBGaXggaW1wbGljaXQgdHlwZSBjb252ZXJzaW9uDQo+IA0KPiBPbiAyNi4x
MC4yMSAwOTozMiwgSmlhc2hlbmcgSmlhbmcgd3JvdGU6DQo+ID4gVGhlIHZhcmlhYmxlICdpJyBp
cyBkZWZpbmVkIGFzIFVJTlQuDQo+ID4gSG93ZXZlciBpbiB0aGUgZm9yX2VhY2hfcG9zc2libGVf
Y3B1LCBpdHMgdmFsdWUgaXMgYXNzaWduZWQgdG8gLTEuDQo+ID4gVGhhdCBkb2Vzbid0IG1ha2Ug
c2Vuc2UgYW5kIGluIHRoZSBjcHVtYXNrX25leHQoKSBpdCBpcyBpbXBsaWNpdGx5DQo+ID4gdHlw
ZSBjb252ZXJzZWQgdG8gSU5ULg0KPiA+IEl0IGlzIHVuaXZlcnNhbGx5IGFjY2VwdGVkIHRoYXQg
dGhlIGltcGxpY2l0IHR5cGUgY29udmVyc2lvbiBpcw0KPiA+IHRlcnJpYmxlLg0KPiA+IEFsc28s
IGhhdmluZyB0aGUgZ29vZCBwcm9ncmFtbWluZyBjdXN0b20gd2lsbCBzZXQgYW4gZXhhbXBsZSBm
b3INCj4gPiBvdGhlcnMuDQo+ID4gVGh1cywgaXQgbWlnaHQgYmUgYmV0dGVyIHRvIGNoYW5nZSB0
aGUgZGVmaW5pdGlvbiBvZiAnaScgZnJvbSBVSU5UDQo+ID4gdG8gSU5ULg0KPiA+DQo+ID4gRml4
ZXM6IDNmYWMxMDEgKCJ4ZW46IFJlLXVwbG9hZCBwcm9jZXNzb3IgUE0gZGF0YSB0byBoeXBlcnZp
c29yIGFmdGVyIFMzDQo+IHJlc3VtZSAodjIpIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFzaGVu
ZyBKaWFuZyA8amlhc2hlbmdAaXNjYXMuYWMuY24+DQo+IA0KPiBSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gDQo+IEp1ZXJnZW4NCg0KW0ppYW1laSBY
aWVdIA0KUmV2aWV3ZWQtYnk6IEppYW1laSBYaWUgPGppYW1laS54aWVAYXJtLmNvbT4NCg0K

