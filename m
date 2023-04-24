Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC946ED0CB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525465.816681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxdJ-0007Na-7w; Mon, 24 Apr 2023 14:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525465.816681; Mon, 24 Apr 2023 14:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxdJ-0007KL-4e; Mon, 24 Apr 2023 14:57:37 +0000
Received: by outflank-mailman (input) for mailman id 525465;
 Mon, 24 Apr 2023 14:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhGg=AP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pqxdH-0007KD-9Z
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:57:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56d7dff7-e2b0-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 16:57:32 +0200 (CEST)
Received: from DU2PR04CA0312.eurprd04.prod.outlook.com (2603:10a6:10:2b5::17)
 by PAXPR08MB6751.eurprd08.prod.outlook.com (2603:10a6:102:136::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:57:19 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::b4) by DU2PR04CA0312.outlook.office365.com
 (2603:10a6:10:2b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 14:57:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 14:57:18 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Mon, 24 Apr 2023 14:57:18 +0000
Received: from 9433716bb5b8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02792C05-A91B-44A4-AE31-323E3B7FAF8F.1; 
 Mon, 24 Apr 2023 14:57:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9433716bb5b8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Apr 2023 14:57:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7883.eurprd08.prod.outlook.com (2603:10a6:10:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:57:05 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 14:57:04 +0000
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
X-Inumbo-ID: 56d7dff7-e2b0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKD+Fyz15gU9iw9drqZOddrYVIxIps9dxcfAe7g8E+g=;
 b=nspMgTzQ79M+oDqijfDt+Cq9V3lJHxuPJKe8ORTxnKPCA6Tui7WUL8gUnRSiglmHEXqaUek3GO9kReSpMjUgVqh33n2pc+/qWmzS28i+OwZqz0cV2QOvvWfpKoOiQ4JSnN1DOYBBLaJ1QsSoNGyax8TZXDNmJGfHGqhGoQ2KSUA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d83dcacbb1f3a013
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3UbRblaaS77f8/KRVbZigMDycp6R7x9N4sn2Gn8TTmUhp19b6pZKpPNdQn0ps/2NMboOk722dM36ui9J2LBsCiRVsJAPYlMj+2BzLCWsz1zXyRgOyGCFSgU994oh7MF6/pihe6BYxoF8Mt3fAuAfuMvxiXVPbpx2x4+lGqExf8tyMQ15xLKl/bGnZPJKqgbi2//2E12lQ0kvFS8D9kxNrNGYBpO2F5kfmIOCQCGzkX3Ml2Yc0mDEKVNFUvDpqIDvNFX5Ku+LVPCQpZI63+Rw0T0mEybXCD7Ib4fHbstrqcmW/ql63CrJulmoIILy6jxDNfKnPkuWVfZc4Nhr2iLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKD+Fyz15gU9iw9drqZOddrYVIxIps9dxcfAe7g8E+g=;
 b=cgQOu8dQEaYLpfDAfn/7rlMidiiVVjJF2+BvJo3zdNutLL2Ph9gyWmG3qSFvaNaMu0UNnSWWGkELuq8rWJQMBIZxnSxkzEFtFj+qYJ8LawZlrcB5DxXX53g/92HmLh/3WDGFbyaef0+sjWKZlEpNy879o8/jKX1be0QG6huz7Xh5Xb4P5p0vUmCLBrp85gZD4OEnfE8HjmU2rSgnqKHeXxYHi8pEa4VJqvsqbGfOLh2PZN1XGW4lrYUXoZW4rm/0Fq/shs2hkqI/G0phuAY6u8vhz8WwzCMy0TMWXXyNfMSjCx43jy/PCLyzqDIXeEongXl0Mz1b1rBbWRljKhI65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKD+Fyz15gU9iw9drqZOddrYVIxIps9dxcfAe7g8E+g=;
 b=nspMgTzQ79M+oDqijfDt+Cq9V3lJHxuPJKe8ORTxnKPCA6Tui7WUL8gUnRSiglmHEXqaUek3GO9kReSpMjUgVqh33n2pc+/qWmzS28i+OwZqz0cV2QOvvWfpKoOiQ4JSnN1DOYBBLaJ1QsSoNGyax8TZXDNmJGfHGqhGoQ2KSUA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZdnKG11PjGcmQuE2MpJrElBiS3686VJGAgAAo1ICAAAFsAIAADk4A
Date: Mon, 24 Apr 2023 14:57:04 +0000
Message-ID: <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
In-Reply-To: <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7883:EE_|DBAEUR03FT019:EE_|PAXPR08MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c44874-e59d-46b8-d195-08db44d4333d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xhycLgOuB+sQaMI+UGMGxKnRObd3AaeiXTtD4ZlRmrYsT1pZfgiIlGXUCFgHAiuBd7kvOf+cG0n3avSJ6z6tQ5M4cbQZrrb+jTji0wP6va7kZYzFOfBOotoQDwQVE/tBwGNhFkvtkZ2fq0FQMy7EFgCJyk0cmlY1yhhYxyyBbRDwwRg4OzPsW2o4GodVHZjSbiG1NyT+EXAGmi7P06I7WFmRpSpeeRhEtsnjW9qfv3/B+eHuJbcE2qCqXNulZvXDJdVZ+16lLL/9QkULA9Bufk+JZ6UKYwPC8zx2UGijfjQXyVvPiFRu1A5g7U8orXGHAmXqRQGGQml3E1tkddmQQ9DTauSCZjku2WV+Nes1ycavF5UTyf1U6xD2RaVpGdJGc2+6COGA9K4LcjbaggUcQ4oGvXH/X3UUa3CIBzIJHSphywECO1Kw04JmI+kkqgb4xP4PrAjSyCXjiJhfdlZRltc+6vxGnvJjqb8XqNRB2NJvJiDQXu/Uu+Hfvg9dnqdCA8TZOx9ZeRSAq8aGs8mpMVgA/RPANWh7yywInK8X/upfTwZ99TVEN8HXHrEP+RU/Zb6RdP3pdAU6zqlf4a1guOiOPk1i/L/Ahd6b+qassYgmAG84UvWTQkrm221vWDs/xxpyPjEd1M+IwaeaKdp33A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(36756003)(8676002)(8936002)(38070700005)(54906003)(478600001)(66446008)(66476007)(66556008)(64756008)(4326008)(6916009)(66946007)(76116006)(91956017)(122000001)(316002)(41300700001)(2906002)(38100700002)(5660300002)(2616005)(86362001)(186003)(26005)(6506007)(6512007)(33656002)(53546011)(6486002)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <23D2DBA80F2E33488FF6E9CDB86A0926@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7883
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fc1d2238-3088-41ef-f527-08db44d42b07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LLpfzk5PseqLaCFw8FUWTWUbxCyjIMTgNNosMHIJMFf59uSb6Tyhn3YBw8Y51b/TJzgAc2TeiNrLwm7snWR/p26zKXv6USB/OCmy405Jt3mZAUC4C85MHfBt/NIpSVtia4zF2C/v+AUQTQY7CBO8dWwi/h4czfVEOE7ZABH+QUMLiKfoCHjbiwxAXeO8aJBmj+5fDmtXoqjWbFj51xhe3DI0OXgd0tP3IWaEWn/upy9CI9wx7IpbqmQCpNabUh/IPwncJWQMyb8sCrRLj04fs+yH4BE6Oexhg15PQBTXo/zmcA3o4CiAi4I0RzOww1VElyA5Vhvaby4Sp3oQ3SFq8mbph6GrVg34VbwlWOaBCAlX/XNhufmC4sjQEB1j0jrVxw5+cmQ/LDPR9KYFdLzyvz6Jsvzd3BhhZn202Gvo4i8kB6S/XublrjJFfdsUxtw7WEb+GvNEt4WirlfdxKb6QDvcICcmWKOnjgN+QAQfzYblzgjoUASQGImudTga/j+so+aE/ziqYZC3a6lHW3cfJLOvjDVLVkPankL9cdPdftgUZiFvuTVcH5jeLvo+ZWOPV4rAAQcU9UDDfH/RSsZgpz6ot+9ZwDjcYOUIhgnr29sf0CFVP66/73UU7c5JYQ7x46j0JJcUYO7nX9F/OonirZqFmfuao8+rVfG3VxN+aJ15tYhWIe+x1yAiCo3kwyAivpsQuIoJmtLxXK/t2NPodA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(478600001)(40460700003)(54906003)(86362001)(36756003)(186003)(53546011)(6486002)(26005)(82310400005)(6506007)(6512007)(40480700001)(33656002)(4326008)(316002)(82740400003)(83380400001)(70206006)(70586007)(36860700001)(2906002)(336012)(356005)(41300700001)(81166007)(8676002)(6862004)(8936002)(5660300002)(47076005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 14:57:18.6345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c44874-e59d-46b8-d195-08db44d4333d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6751

DQoNCj4gT24gMjQgQXByIDIwMjMsIGF0IDE1OjA1LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMDQuMjAyMyAxNjowMCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyNCBBcHIgMjAyMywgYXQgMTI6MzQsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjQuMDQuMjAyMyAwODowMiwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4gQEAgLTMwLDkgKzM3LDExIEBAIGludCBzdmVfY29udGV4dF9pbml0KHN0
cnVjdCB2Y3B1ICp2KTsNCj4+Pj4gdm9pZCBzdmVfY29udGV4dF9mcmVlKHN0cnVjdCB2Y3B1ICp2
KTsNCj4+Pj4gdm9pZCBzdmVfc2F2ZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdik7DQo+Pj4+IHZvaWQg
c3ZlX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpOw0KPj4+PiArYm9vbCBzdmVfZG9tY3Rs
X3ZsX3BhcmFtKGludCB2YWwsIHVuc2lnbmVkIGludCAqb3V0KTsNCj4+Pj4gDQo+Pj4+ICNlbHNl
IC8qICFDT05GSUdfQVJNNjRfU1ZFICovDQo+Pj4+IA0KPj4+PiArI2RlZmluZSBvcHRfZG9tMF9z
dmUgICAgICgwKQ0KPj4+PiAjZGVmaW5lIGlzX3N2ZV9kb21haW4oZCkgKDApDQo+Pj4+IA0KPj4+
PiBzdGF0aWMgaW5saW5lIHJlZ2lzdGVyX3QgY29tcHV0ZV9tYXhfemNyKHZvaWQpDQo+Pj4+IEBA
IC01OSw2ICs2OCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3ZlX2NvbnRleHRfZnJlZShzdHJ1
Y3QgdmNwdSAqdikge30NCj4+Pj4gc3RhdGljIGlubGluZSB2b2lkIHN2ZV9zYXZlX3N0YXRlKHN0
cnVjdCB2Y3B1ICp2KSB7fQ0KPj4+PiBzdGF0aWMgaW5saW5lIHZvaWQgc3ZlX3Jlc3RvcmVfc3Rh
dGUoc3RydWN0IHZjcHUgKnYpIHt9DQo+Pj4+IA0KPj4+PiArc3RhdGljIGlubGluZSBib29sIHN2
ZV9kb21jdGxfdmxfcGFyYW0oaW50IHZhbCwgdW5zaWduZWQgaW50ICpvdXQpDQo+Pj4+ICt7DQo+
Pj4+ICsgICAgcmV0dXJuIGZhbHNlOw0KPj4+PiArfQ0KPj4+IA0KPj4+IE9uY2UgYWdhaW4gSSBk
b24ndCBzZWUgdGhlIG5lZWQgZm9yIHRoaXMgc3R1Yjogb3B0X2RvbTBfc3ZlIGlzICNkZWZpbmUt
ZA0KPj4+IHRvIHBsYWluIHplcm8gd2hlbiAhQVJNNjRfU1ZFLCBzbyB0aGUgb25seSBjYWxsIHNp
dGUgbWVyZWx5IHJlcXVpcmVzIGENCj4+PiB2aXNpYmxlIGRlY2xhcmF0aW9uLCBhbmQgRENFIHdp
bGwgdGFrZSBjYXJlIG9mIGVsaW1pbmF0aW5nIHRoZSBhY3R1YWwgY2FsbC4NCj4+IA0KPj4gSeKA
mXZlIHRyaWVkIHRvIGRvIHRoYXQsIEnigJl2ZSBwdXQgdGhlIGRlY2xhcmF0aW9uIG91dHNpZGUg
dGhlIGlmZGVmIHNvIHRoYXQgaXQgd2FzIGFsd2F5cyBpbmNsdWRlZA0KPj4gYW5kIEkgcmVtb3Zl
ZCB0aGUgc3R1YiwgYnV0IEkgZ290IGVycm9ycyBvbiBjb21waWxhdGlvbiBiZWNhdXNlIG9mIHVu
ZGVmaW5lZCBmdW5jdGlvbi4NCj4+IEZvciB0aGF0IHJlYXNvbiAgSSBsZWZ0IHRoYXQgY2hhbmdl
IG91dC4NCj4gDQo+IEludGVyZXN0aW5nLiBJIGRvbid0IHNlZSB3aGVyZSB0aGUgcmVmZXJlbmNl
IHdvdWxkIGJlIGNvbWluZyBmcm9tLg0KDQpDb3VsZCBpdCBiZSBiZWNhdXNlIHRoZSBkZWNsYXJh
dGlvbiBpcyB2aXNpYmxlLCBvdXRzaWRlIHRoZSBpZmRlZiwgYnV0IHRoZSBkZWZpbml0aW9uIGlz
IG5vdCBjb21waWxlZCBpbj8gDQoNCj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9rZXJuZWwuYw0KPj4+
PiArKysgYi94ZW4vY29tbW9uL2tlcm5lbC5jDQo+Pj4+IEBAIC0zMTQsNiArMzE0LDMxIEBAIGlu
dCBwYXJzZV9ib29sZWFuKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnMsIGNvbnN0IGNo
YXIgKmUpDQo+Pj4+ICAgIHJldHVybiAtMTsNCj4+Pj4gfQ0KPj4+PiANCj4+Pj4gK2ludCBfX2lu
aXQgcGFyc2Vfc2lnbmVkX2ludGVnZXIoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqcywg
Y29uc3QgY2hhciAqZSwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9u
ZyBsb25nICp2YWwpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgc2l6ZV90IHNsZW4sIG5sZW47DQo+Pj4+
ICsgICAgY29uc3QgY2hhciAqc3RyOw0KPj4+PiArICAgIGxvbmcgbG9uZyBwdmFsOw0KPj4+PiAr
DQo+Pj4+ICsgICAgc2xlbiA9IGUgPyAoeyBBU1NFUlQoZSA+PSBzKTsgZSAtIHM7IH0pIDogc3Ry
bGVuKHMpOw0KPj4+IA0KPj4+IEFzIHBlciB0aGlzICJlIiBtYXkgY29tZSBpbiBhcyBOVUxMLCBt
ZWFuaW5nIHRoYXQgLi4uDQo+Pj4gDQo+Pj4+ICsgICAgbmxlbiA9IHN0cmxlbihuYW1lKTsNCj4+
Pj4gKw0KPj4+PiArICAgIC8qIENoZWNrIHRoYXQgdGhpcyBpcyB0aGUgbmFtZSB3ZSdyZSBsb29r
aW5nIGZvciBhbmQgYSB2YWx1ZSB3YXMgcHJvdmlkZWQgKi8NCj4+Pj4gKyAgICBpZiAoIChzbGVu
IDw9IG5sZW4pIHx8IHN0cm5jbXAocywgbmFtZSwgbmxlbikgfHwgKHNbbmxlbl0gIT0gJz0nKSAp
DQo+Pj4+ICsgICAgICAgIHJldHVybiAtMTsNCj4+Pj4gKw0KPj4+PiArICAgIHB2YWwgPSBzaW1w
bGVfc3RydG9sbCgmc1tubGVuICsgMV0sICZzdHIsIDApOw0KPj4+PiArDQo+Pj4+ICsgICAgLyog
TnVtYmVyIG5vdCByZWNvZ25pc2VkICovDQo+Pj4+ICsgICAgaWYgKCBzdHIgIT0gZSApDQo+Pj4+
ICsgICAgICAgIHJldHVybiAtMjsNCj4+PiANCj4+PiAuLi4gdGhpcyBpcyBhbHdheXMgZ29pbmcg
dG8gbGVhZCB0byBmYWlsdXJlIGluIHRoYXQgY2FzZS4gKEkgZ3Vlc3MgSSBjb3VsZA0KPj4+IGhh
dmUgc3BvdHRlZCB0aGlzIGVhcmxpZXIsIHNvcnJ5LikNCj4+PiANCj4+PiBBcyBhIG5pdCwgSSdk
IGFsc28gYXBwcmVjaWF0ZSBpZiBzdHlsZSBoZXJlIChwYXJlbnRoZXNpemF0aW9uIGluIHBhcnRp
Y3VsYXIpDQo+Pj4gY291bGQgbWF0Y2ggdGhhdCBvZiBwYXJzZV9ib29sZWFuKCksIHdoaWNoIGRv
ZXNuJ3QgcHV0IHBhcmVudGhlc2VzIGFyb3VuZA0KPj4+IHRoZSBvcGVyYW5kcyBvZiBjb21wYXJp
c29uIG9wZXJhdG9ycyAoYSBmZXcgbGluZXMgdXAgZnJvbSBoZXJlKS4gV2l0aCB0aGUNCj4+PiBv
dGhlciBmdW5jdGlvbiBpbiBtaW5kLCBJJ20gdGhlbiBub3QgZ29pbmcgdG8gcGljayBvbiB0aGUg
c2VlbWluZ2x5DQo+Pj4gcmVkdW5kYW50ICh3aXRoIHRoZSBzdWJzZXF1ZW50IHN0cm5jbXAoKSkg
InNsZW4gPD0gbmxlbiIsIHdoaWNoIGhhcyBhbg0KPj4+IGVxdWl2YWxlbnQgdGhlcmUgYXMgd2Vs
bC4NCj4+IA0KPj4gWW91IGFyZSByaWdodCwgZG8geW91IHRoaW5rIHRoaXMgd2lsbCBiZSBvazoN
Cj4gDQo+IEl0J2xsIGRvLCBJIGd1ZXNzLg0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24va2VybmVs
LmMNCj4+ICsrKyBiL3hlbi9jb21tb24va2VybmVsLmMNCj4+IEBAIC0zMjQsMTEgKzMyNCwxNCBA
QCBpbnQgX19pbml0IHBhcnNlX3NpZ25lZF9pbnRlZ2VyKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0
IGNoYXIgKnMsIGNvbnN0IGNoYXIgKmUsDQo+PiAgICAgc2xlbiA9IGUgPyAoeyBBU1NFUlQoZSA+
PSBzKTsgZSAtIHM7IH0pIDogc3RybGVuKHMpOw0KPj4gICAgIG5sZW4gPSBzdHJsZW4obmFtZSk7
DQo+PiANCj4+ICsgICAgaWYgKCAhZSApDQo+PiArICAgICAgICBlID0gcyArIHNsZW47DQo+PiAr
DQo+PiAgICAgLyogQ2hlY2sgdGhhdCB0aGlzIGlzIHRoZSBuYW1lIHdlJ3JlIGxvb2tpbmcgZm9y
IGFuZCBhIHZhbHVlIHdhcyBwcm92aWRlZCAqLw0KPj4gLSAgICBpZiAoIChzbGVuIDw9IG5sZW4p
IHx8IHN0cm5jbXAocywgbmFtZSwgbmxlbikgfHwgKHNbbmxlbl0gIT0gJz0nKSApDQo+PiArICAg
IGlmICggc2xlbiA8PSBubGVuIHx8IHN0cm5jbXAocywgbmFtZSwgbmxlbikgfHwgc1tubGVuXSAh
PSAnPScgKQ0KPj4gICAgICAgICByZXR1cm4gLTE7DQo+PiANCj4+IC0gICAgcHZhbCA9IHNpbXBs
ZV9zdHJ0b2xsKCZzW25sZW4gKyAxXSwgJnN0ciwgMCk7DQo+PiArICAgIHB2YWwgPSBzaW1wbGVf
c3RydG9sbCgmc1tubGVuICsgMV0sICZzdHIsIDEwKTsNCj4+IA0KPj4gICAgIC8qIE51bWJlciBu
b3QgcmVjb2duaXNlZCAqLw0KPj4gICAgIGlmICggc3RyICE9IGUgKQ0KPj4gDQo+PiANCj4+IFBs
ZWFzZSBub3RlIHRoYXQgSeKAmXZlIGFsc28gaW5jbHVkZWQgeW91ciBjb21tZW50IGFib3V0IHRo
ZSBiYXNlLCB3aGljaCBJIGZvcmdvdCB0byBhZGQsIGFwb2xvZ2llcyBmb3IgdGhhdC4NCj4+IA0K
Pj4gc2xlbiA8PSBubGVuIGRvZXNu4oCZdCBzZWVtcyByZWR1bmRhbnQgdG8gbWUsIEkgaGF2ZSB0
aGF0IGJlY2F1c2UgSeKAmW0gYWNjZXNzaW5nIHNbbmxlbl0gYW5kIEkgd291bGQgbGlrZQ0KPj4g
dGhlIHN0cmluZyBzIHRvIGJlIGF0IGxlYXN0ID4gbmxlbg0KPiANCj4gUmlnaHQsIGJ1dCBkb2Vz
bid0IHN0cm5jbXAoKSBndWFyYW50ZWUgdGhhdCBhbHJlYWR5Pw0KDQpJIHRob3VnaHQgc3RybmNt
cCgpIGd1YXJhbnRlZXMgcyBjb250YWlucyBhdCBsZWFzdCBubGVuIGNoYXJzLCBtZWFuaW5nIGZy
b20gMCB0byBubGVuLTEsIGlzIG15IHVuZGVyc3RhbmRpbmcgd3Jvbmc/DQoNCj4gDQo+IEphbg0K
DQoNCg==

