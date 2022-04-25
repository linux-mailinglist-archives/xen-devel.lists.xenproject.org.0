Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D1D50D988
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 08:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312382.529598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nisIq-0001O1-Jr; Mon, 25 Apr 2022 06:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312382.529598; Mon, 25 Apr 2022 06:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nisIq-0001Kw-GN; Mon, 25 Apr 2022 06:34:32 +0000
Received: by outflank-mailman (input) for mailman id 312382;
 Mon, 25 Apr 2022 06:34:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WklX=VD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nisIp-0001Kq-2V
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 06:34:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1ceb760-c461-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 08:34:28 +0200 (CEST)
Received: from AM6PR10CA0007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::20)
 by AS8PR08MB6040.eurprd08.prod.outlook.com (2603:10a6:20b:296::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 06:34:15 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::67) by AM6PR10CA0007.outlook.office365.com
 (2603:10a6:209:89::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17 via Frontend
 Transport; Mon, 25 Apr 2022 06:34:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Mon, 25 Apr 2022 06:34:14 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Mon, 25 Apr 2022 06:34:14 +0000
Received: from f0ccd9030bb6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A455389-9614-4B62-95B6-30FD964E1B5E.1; 
 Mon, 25 Apr 2022 06:34:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0ccd9030bb6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Apr 2022 06:34:08 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB4285.eurprd08.prod.outlook.com (2603:10a6:803:f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 06:34:05 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 06:34:04 +0000
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
X-Inumbo-ID: c1ceb760-c461-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkal6/YU0n5LBmLH7Yzxro58HxLEMfm0NgF34Y+Tx5k=;
 b=4Y4Hj4QtJbe7KGkCDaM/pNRZzN/1jvu9FJJleG0r76kmk2SY/NyX3RpxswKA3Wb7iSGHcZGggurl0d6ftna4KryPqiJeR6v5X0lyHol5btBafo7y7CxWa5ZaAMaFWj9VSeN57S2xn6jvL+OZ3TGrosViIb9p/k0EGC6xyo8D1RM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlBqES71IlnAFTFuVooyWu2iMMcRUu/a3zhqafQ7rnQHH/kN/Zw/TslBVKj5OBdzxcI8gjC1+vX5ThuEe/eXbG7Exy/TyoBbzKJELKZAAcmk9s9Lny44aHPqGMSZz53L91r7ooV9H7L2Xm0lDtvTnj+xGj2nUg6D0KBQr/P/wXMAX3T8q01M8NQ2TZXOO5fiqhbgg2pMyaWHFEByY/h4VBP/Z3SODSP+QVxLyMukfnOrITkrYiDNQz89pK3D9aW0T3C4YIoGPFm+PlNwGgULVMNAXdg+Toj+9JDug23nRiOa3Rd57VWAnHHR4W0gyyjdwe2EqX6Pgu9woLc8+r1sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkal6/YU0n5LBmLH7Yzxro58HxLEMfm0NgF34Y+Tx5k=;
 b=mtbyQTFCNomnbqgSQfv1dNbTdVxTGFFJBDlcEgmYOrAE/YxmPwduvUFlJ8M5YLFl8icaf1QDwzqaE3de/v2F91+U5YfDjqgr6xB4uTPG3eO/HzdPrrbcVbG5PmuMGQfPLadkHQekqtIHRChyqpDdd17PtSIiRy11Ut0Ekwu1spTzUO5xigL/MyQZkzWRoJM4Xx35P+nSrgYNCCwrCrh3fttvoXWE+sFwkkQFnp+DX7gAN7703mc8E9pFoCLmLKIn0vI5DjFWtAmXlnpzqeBXDu8kv4kudnf5wpnzrvv+xmobDQSM7do+0/iZaP+UJ0/dZw459Mr/ubHE6fNlMNl45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkal6/YU0n5LBmLH7Yzxro58HxLEMfm0NgF34Y+Tx5k=;
 b=4Y4Hj4QtJbe7KGkCDaM/pNRZzN/1jvu9FJJleG0r76kmk2SY/NyX3RpxswKA3Wb7iSGHcZGggurl0d6ftna4KryPqiJeR6v5X0lyHol5btBafo7y7CxWa5ZaAMaFWj9VSeN57S2xn6jvL+OZ3TGrosViIb9p/k0EGC6xyo8D1RM=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 5/6] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v2 5/6] xen/arm: unpopulate memory when domain is static
Thread-Index: AQHYUx8sjuusUaZZhUW8Wxz6RmBB9Kz29IIAgAk/PSA=
Date: Mon, 25 Apr 2022 06:34:04 +0000
Message-ID:
 <DU2PR08MB73253426B332CFF5358AB346F7F89@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
 <20220418122251.3583049-6-Penny.Zheng@arm.com>
 <b76b3207-4eb7-5236-6812-d64cd4dad17f@suse.com>
In-Reply-To: <b76b3207-4eb7-5236-6812-d64cd4dad17f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A58FCC2E272575478CF8F592BF4A41F4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d6f7b370-185c-487e-8bdc-08da26859dc7
x-ms-traffictypediagnostic:
	VI1PR08MB4285:EE_|VE1EUR03FT055:EE_|AS8PR08MB6040:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB604070DF2DA0D5CA5A9B86FEF7F89@AS8PR08MB6040.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 osPzJoGmmZkjz497HdFhYZtg/vEU1TSZNXXVl9K9C/i/uH3cQMbr7kHkdvyvYelmlnl1TZ9HWtC1yB6PzgtRGa7CanKLQ0UnRLGvfK/pJDBVJ1vah2Kar9ov+Tq5jj86nJpdOoO+ukpqFvxlrcH+GELbEIhDvPSh0xNfIXC4Qt5XooS46BkbC/LTpDuANFJ0BUy2rhNiwtcQ9G9nq+dUM2o/JfntL9d+g7YW6982NapXp4x/oM//Cm5BAGjwYpfxPG1MSXp8r6fCeboAchxDJDmCQWsZCDYk+qtrpya3yPoPIrdhS9ElIVTTfEV7tY3B08JBqC47n//XtEdQzkzOeCHedNL8dlTFu92zScCZIcPAOWcBze75zO4QKfjNLMlC40Mb4lzfDSWbLkEB8w3iNGteP5XnjXGBY8NnoHAf0QRNzaZqm596+FqKSaTBToM8XGbzzBQCAe41cDf6k8vG6ByGEidy3wzI367X9ws260+Av712a7MWXOLuTR1xx/lz0Qa82SjBN5pOVERbAr80L3G60OMydSRrD9DgFQG6PR2ohdipD9+fYdKHlllsJLWV0AAEkFBwjfVYTDr95R0g1SDJpJghDWL4RGAvmhkcR/04R6wMDP4lLBV28AKjhtRu4+5m4NKJq0s9L6F93nSpyJioQwI8D5gqKWHdh6K/5/4QGlc4HJ6tgcrpvWeLRKUxq/9orIQdwDoXQGrCVweisg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(66946007)(66446008)(64756008)(66556008)(66476007)(8676002)(76116006)(186003)(38100700002)(38070700005)(26005)(6506007)(7696005)(9686003)(53546011)(316002)(6916009)(5660300002)(54906003)(122000001)(86362001)(33656002)(55016003)(2906002)(83380400001)(508600001)(71200400001)(8936002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4285
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88bb452c-a22a-4a79-791b-08da26859802
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pEyCArpowSl8gKw/xw9j8MbOyh/O5fm13CnFxphGjGNO04b1HAh11AsrrjaKuVH6Dcxpk9j0HaOEGjO3nnXHxNUWknsA5+qVDXcOkMwmv0XNLIDTYP8LTvmznRu+iO0qvjdGBxPE26WQqHWTODBBrc8JISHQs1C5dYB7gpywUiM3OvyK3CtrIaqcgwL8dOsk7dhBo0ZE46I9vK6ryTu8PeIKKcucwlGWR6fj/QSYdka778egvqwp2Ik4IFfk5CjIDjp9uxnW9BbiMakWuHfLuPZXZAPAK5hqXM6c5gEggDDk25icSWSNPSEyH/EVVJnq/136pXliS5V8DBpyU+5laYtsrLXQilOspMv/zZzmNwpGYTV14alGW5WmL0TQPLmx5Tpg+VaFOP/7f9RigpgrsTuTqG29ILrneMDxJwk8DRHD4h7oo+qkr63LD8BAvyxmaZdzDMyjV/fRL7EzlbBLi7ZlyZn1QPNsZBlis+M0EinwiBtt+L3Efiu2TjXHUuIAxkqXa9GaU45bRymeNV3MEmxYN6k8/ArpsA9h54qF830++H0MasEMrPnYPRy7sI9QgNhmWokenSVqMMxxKp12Jjs26/rCfNQeu8c5da5ajhwD6TfdyxraMXuz4IbXw7huSnmq9MH+PmBvEpA480tEA+l21jlWrCyI2/pD4J6zC2lETY29QczjkoAT8JM3pcj1
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8936002)(52536014)(9686003)(83380400001)(26005)(54906003)(316002)(5660300002)(36860700001)(47076005)(336012)(33656002)(186003)(6506007)(53546011)(7696005)(82310400005)(2906002)(86362001)(508600001)(356005)(40460700003)(55016003)(70586007)(4326008)(6862004)(8676002)(70206006)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 06:34:14.4779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f7b370-185c-487e-8bdc-08da26859dc7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6040

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxOSwgMjAyMiA1
OjExIFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IEJlcnRyYW5k
IE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVr
DQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJp
eC5jb20+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNS82XSB4ZW4vYXJtOiB1bnBvcHVsYXRl
IG1lbW9yeSB3aGVuIGRvbWFpbiBpcw0KPiBzdGF0aWMNCj4gDQo+IE9uIDE4LjA0LjIwMjIgMTQ6
MjIsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9tbS5oDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgNCj4gPiBAQCAt
MzU4LDYgKzM1OCwyMyBAQCB2b2lkIGNsZWFyX2FuZF9jbGVhbl9wYWdlKHN0cnVjdCBwYWdlX2lu
Zm8NCj4gPiAqcGFnZSk7DQo+ID4NCj4gPiAgdW5zaWduZWQgaW50IGFyY2hfZ2V0X2RtYV9iaXRz
aXplKHZvaWQpOw0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIFB1dCBmcmVlIHBhZ2VzIG9uIHRoZSBy
ZXN2IHBhZ2UgbGlzdCBhZnRlciBoYXZpbmcgdGFrZW4gdGhlbQ0KPiA+ICsgKiBvZmYgdGhlICJu
b3JtYWwiIHBhZ2UgbGlzdCwgd2hlbiBwYWdlcyBmcm9tIHN0YXRpYyBtZW1vcnkgICovDQo+ID4g
KyNpZmRlZiBDT05GSUdfU1RBVElDX01FTU9SWQ0KPiA+ICsjZGVmaW5lIGFyY2hfZnJlZV9oZWFw
X3BhZ2UoZCwgcGcpIHsgICAgICAgICAgICAgICAgICAgIFwNCj4gPiArICAgIGlmICggKHBnKS0+
Y291bnRfaW5mbyAmIFBHQ19yZXNlcnZlZCApICAgICAgICAgICAgICBcDQo+ID4gKyAgICB7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICsg
ICAgICAgIHBhZ2VfbGlzdF9kZWwocGcsIHBhZ2VfdG9fbGlzdChkLCBwZykpOyAgICAgICAgIFwN
Cj4gPiArICAgICAgICBwYWdlX2xpc3RfYWRkX3RhaWwocGcsICYoZCktPnJlc3ZfcGFnZV9saXN0
KTsgICBcDQo+ID4gKyAgICAgICAgKGQpLT5yZXN2X3BhZ2VzKys7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KPiANCj4gVGhlcmUncyBubyBjb25zdW1lciBvZiB0aGlzIGNvdW50ZXIs
IHNvIEknZCBsaWtlIHRvIGFzayB0aGF0IGl0IGJlIGludHJvZHVjZWQNCj4gb25jZSBhIGNvbnN1
bWVyIGFwcGVhcnMuDQo+IA0KPiA+ICsgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwNCj4gPiArICAgIGVsc2UgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ID4gKyAgICAgICAgcGFnZV9saXN0X2Rl
bChwZywgcGFnZV90b19saXN0KGQsIHBnKSk7ICAgICAgICAgXA0KPiANCj4gSXMgdGhlcmUgYSBw
YXJ0aWN1bGFyIHJlYXNvbiB0byBoYXZlIHRoaXMgcGFnZV9saXN0X2RlbCgpIHR3aWNlLCBpbnN0
ZWFkIG9mIGp1c3QNCj4gb25jZSBhaGVhZCBvZiB0aGUgaWYoKT8NCj4gDQo+ID4gK30NCj4gDQo+
IEFsc28gdGhpcyBlbnRpcmUgY29uc3RydWN0IHdhbnQgdG8gYmUgYW4gZXhwcmVzc2lvbiwgbm90
IGENCj4gKGNvbXBvdW5kKSBzdGF0ZW1lbnQuIEFuZCBpdCBwcm9iYWJseSB3b3VsZCBiZXR0ZXIg
ZXZhbHVhdGUgaXRzIHBhcmFtZXRlcnMNCj4ganVzdCBvbmNlLg0KPiANCg0KI2RlZmluZSBhcmNo
X2ZyZWVfaGVhcF9wYWdlKGQsIHBnKSB7ICAgICAgICAgICAgICAgICAgICBcDQogICAgICAgIHBh
Z2VfbGlzdF9kZWwocGcsIHBhZ2VfdG9fbGlzdChkLCBwZykpOyAgICAgICAgICAgICBcDQogICAg
ICAgIGlmICggKHBnKS0+Y291bnRfaW5mbyAmIFBHQ19yZXNlcnZlZCApICAgICAgICAgICAgICBc
DQogICAgICAgICAgICAgcGFnZV9saXN0X2FkZF90YWlsKHBnLCAmKGQpLT5yZXN2X3BhZ2VfbGlz
dCk7ICAgXA0KfQ0KDQpJJ20gdHJ5aW5nIHRvIHJlZmluZSB0aGUgYXJjaF9mcmVlX2hlYXBfcGFn
ZSgpIGhlcmUsIGJ1dCBJJ20gYSBiaXQgY29uZnVzZWQNCmFib3V0IHRvIGxldCBpdCBiZSBhbiBl
eHByZXNzaW9uLCBub3QgYSBjb21wb3VuZCBzdGF0ZW1lbnQuICBEbyB5b3UgbWVhbiB0aGF0DQp5
b3UgcHJlZmVyIHRvIGxldCB0aGUgaWYtY2xhdXNlIG91dCBvZiB0aGUgYXJjaF9mcmVlX2hlYXBf
cGFnZSgpPw0KDQo+IEphbg0KDQo=

