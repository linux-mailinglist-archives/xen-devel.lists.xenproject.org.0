Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82212490484
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:00:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258030.443867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9NsC-0005gr-PJ; Mon, 17 Jan 2022 09:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258030.443867; Mon, 17 Jan 2022 09:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9NsC-0005e6-LP; Mon, 17 Jan 2022 09:00:20 +0000
Received: by outflank-mailman (input) for mailman id 258030;
 Mon, 17 Jan 2022 09:00:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSOx=SB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n9NsB-0005e0-BA
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:00:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3bc235c-7773-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 10:00:17 +0100 (CET)
Received: from DU2PR04CA0229.eurprd04.prod.outlook.com (2603:10a6:10:2b1::24)
 by DB6PR08MB2887.eurprd08.prod.outlook.com (2603:10a6:6:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 09:00:12 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::5d) by DU2PR04CA0229.outlook.office365.com
 (2603:10a6:10:2b1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Mon, 17 Jan 2022 09:00:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 09:00:11 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Mon, 17 Jan 2022 09:00:11 +0000
Received: from 0a2cee3ee893.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 65E19168-1B47-473D-AE95-61C2008B3395.1; 
 Mon, 17 Jan 2022 09:00:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a2cee3ee893.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Jan 2022 09:00:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6714.eurprd08.prod.outlook.com (2603:10a6:10:2a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 09:00:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 09:00:04 +0000
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
X-Inumbo-ID: e3bc235c-7773-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsZfkdvA8kBRNbmaABERT3xwEZUZOrcVcPJhY73joag=;
 b=mF+uGzq3PQoi6sSfcGaIFOXhEdaIbN3t5NwIkxk/URSrRQXzmDSZM2Xt88/MPnldc5B5dqwN4fpbXisiPBodkyFfD/DfwbXIbhL/ZNtkyTau8J9rkIwBRKRE7fFGubCmfUGeYBPxeoxGdG1awEtfcDDzdBots1w7vkKcTfwq1Sw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7fccb473c355e57d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2uSh5vdyFgQPkjUs3B6EbX0buIG+v2lQLJ3RO1PiKAHQA5DwjQDeUk0DmKpawcUFBqQtkQ9ZUgv6s83ydlk9gYf68UVv7lZH+ZGHwKACDPUSLkyKXfreG9iZzw0qiPkq0MEE6IlIDZQT6QGGYutjRvXur0lTyDkCl+PvtgVVGkSoGASsQyxDTOlpQL5SD6cyh6nyBvmeU0m8JJwuM5QozTKxpXr64ruQg/5VCByLpkvcNbmihYPXCL66Yski2cSg5uTigg7xT69FQbkWga64L0BqfBIrZVtoHRxpYtPLmfYs8snuboTa+D/5evUmx7lD3FyYyyovn6Z5uO3go28vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsZfkdvA8kBRNbmaABERT3xwEZUZOrcVcPJhY73joag=;
 b=RoJ2qxyoKpsy06vlwlYwxIR0mP59MLLQxtDYAJzHZfeAl54hf9iFcLdnkLUDVVLcUZpwCGzB1lZCzyC3Yh0OsykdL8WPB9KUpED5NUwzFj858dvDYBrQQUoRxGrUic3Bx2Jm+rEblFGeDyOZOvAxrjxDvG1IEHZh+fIN8mJ0o0ViuYTabEx9huKwZ6D5tgLilhhe5xfc/0WCl+gUxV7Ikx2zwErw6vhbbH+ONypdAb75l68VCKIUnxwvH4FsYL0GyW0aMtcbTgpacZQClfxgRJbFFPxo0OXfD0+xcQVD79yT3946TIdqBnj82eU4KYi2YrUDlU9rWmkK+N0mJ8IZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsZfkdvA8kBRNbmaABERT3xwEZUZOrcVcPJhY73joag=;
 b=mF+uGzq3PQoi6sSfcGaIFOXhEdaIbN3t5NwIkxk/URSrRQXzmDSZM2Xt88/MPnldc5B5dqwN4fpbXisiPBodkyFfD/DfwbXIbhL/ZNtkyTau8J9rkIwBRKRE7fFGubCmfUGeYBPxeoxGdG1awEtfcDDzdBots1w7vkKcTfwq1Sw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Dongjiu Geng <gengdongjiu1@gmail.com>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Topic: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Index: AQHYC20k2h7y374id02KJynAohV9hqxm6mCA
Date: Mon, 17 Jan 2022 09:00:03 +0000
Message-ID: <94945C70-A608-47E9-890E-8CA6882D7379@arm.com>
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
In-Reply-To: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ea0160c3-3fb4-45f9-95dd-08d9d997c505
x-ms-traffictypediagnostic:
	DB9PR08MB6714:EE_|DB5EUR03FT052:EE_|DB6PR08MB2887:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB2887E2725A42AB9BA43C1BBE9D579@DB6PR08MB2887.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FWgMYV7g6Jcud/BBzP9wJ4IVqCVR5xdXYZYLboN7H5Dom6bQ63JoyteaobzdYrAzWr4C92phIhKOQJXfIlaFTCw6wErGRqQAppPQEZoH0DXWWxlhJqQU1VvQVMImbtEeppkw1fOMXbkZ3xzcITK3NCwUzKVh/jJP9zjjRKyqtFhAcygCWgY8WBOBOyl+CMFTlPnm2g+nl8Hzo0kFUIEKI+QXp7GmQ/0BzQ/Ri/Wy8bz2uqJtss+FjMXz6/2l9AaUIaT57Kq3MHWSPmmg5cEJcBJNrbuAKroyt+5z8aEjNMNF5/vYD0YXZCsEvk7f+X0G7KqsVXRVGXeGdlWCYUgG50tbSRSxTDsTXEHv5p/IE7G9oWq/QLfT6u/qOvw/W2eV5HtWBJVJmk+gDBsxA/NRzfbdC6Tzm7lAvy00j4mvyJ4SkYmso6+bDQMnLDgteAcXsANI/lYo3tCjTpNukongepJCO5V9l0RP4sIIVLZhLRhsUYMCvbdznngAK1JMSJFNvSMfeg6xK+tmwyLAcfXeqUnJhSVmnclYXIO7qi8wgK8jGUss++jOwiiKhvNYxLUcMgPR1u2CJDAWc8NyEYvPVfVlAXcvoMPL8hd0GkAsFPppLf2yHbBqEmoh1X1ENFCSiZy476OWu09X4Nv9M6nsgogEu3MoSFfGMxr8JSqOKphOEH75eqgBmJjFOw32PfouGsuXP2a7lVse1QFy3QJqv8fIlLq61fQywraSQUo7pGypqzKoqeBbCGmESjXDsTBU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(71200400001)(76116006)(91956017)(8936002)(508600001)(2616005)(6916009)(316002)(5660300002)(6486002)(54906003)(66946007)(66446008)(66556008)(33656002)(38070700005)(6506007)(38100700002)(122000001)(86362001)(53546011)(2906002)(186003)(26005)(83380400001)(6512007)(4326008)(66476007)(8676002)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <809AECB0A4B0BF4EAFD91DCE4C280B2A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6714
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd2904c1-d6f6-4107-ba46-08d9d997c05d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OA4eACoKhv+647Xx9NMawx+R2ZWSXpmN7nZH7CJ56Uh1DQhzvXa7v7FChxICGZwYH1lm1A1IlJO/cfmmXjcqgvN1xqOI5CJf+hpCXMPzTyv+sn+LjI9zBS2KgJmXMl6mFbig3aH75RaQyBO6T4UiZBhnlN8z7ZJaVcSQkzCd5ojGQTTYSni2WDKnw7PU+3jAPAgkZSCJpN49WSmYhE301cB4ih3EnBBk+HuPzMSVcXeTEVcpNWEPgGO0meg8wtT89zuxquJKNPRL/sgDYjMtIXSvxWqSbvXVLGUzF/78YtVpCWy3MEkp00yPu/Y4qiFs7Pkz2REmnyQxOmIJpEJQe69Tj6FpPIwcA69XvqLC/wUqXLyY1axh1142+Sfe4Dx+CgQ7L86OMlZwOQP+xKq/G4fuwUclo4Kpz5KjIKrdhqpqBcZ+aV2QOgi3ddFPpL+vxIzs2NWY0mIrBNwRirp9Zz/xS+3AF7GiIIABuA2N2Rnc/gK6j4CsQj3TsgtSCwGTJJu8yA9rw6xOwyt+jyzs0h+CVK3hWtnlXfx6jCSgT/TKf82mbI/5nV94SsWa6bR1bnxzBVlfKk7+9NINXTM3sPYOFgedQVNinufflKNHvWrIcVytLUzU/XBli9fSwJsgE0+eFQKjR16h0fys3hyrfLAdd514/Ribb9Ve9VTNjiunQXE3kxbrmoSW/BY5swyZUNP3UAOFJwuw3vVCOVZk0g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(6506007)(6512007)(8676002)(336012)(83380400001)(33656002)(4326008)(36756003)(86362001)(508600001)(356005)(70206006)(82310400004)(54906003)(316002)(8936002)(47076005)(70586007)(6486002)(2616005)(81166007)(53546011)(36860700001)(6862004)(186003)(5660300002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:00:11.8402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0160c3-3fb4-45f9-95dd-08d9d997c505
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2887

SGksDQoNCj4gT24gMTcgSmFuIDIwMjIsIGF0IDA2OjQwLCBEb25naml1IEdlbmcgPGdlbmdkb25n
aml1MUBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gSXQgdHVybnMgb3V0IHRoYXQgUUVNVSBoYXMg
YmVlbiBzdXBwb3J0aW5nIEdJQ3YyIHZpcnR1YWxpemF0aW9uIHNpbmNlDQo+IHYzLjEuMC4gU28g
cmVtb3ZlIHRoZSBkZXBlbmRlbmNpZXMgb24gR0lDdjMuIElmIHdlIHdhbnQgdG8gdXNlIEdJQ3Yz
LA0KPiB3ZSBjYW4gc2VsZWN0IHRoZSBRRU1VX0xFR0FDWSBjb25maWd1cmF0aW9uLg0KDQpJIGFt
IGJpdCBwdXp6bGVkIGJ5IHRoaXMgY2hhbmdlIGludHJvZHVjaW5nIGEgbGVnYWN5IG9wdGlvbiBh
Y3R1YWxseSBzZWxlY3RpbmcgdGhlIG5ld2VzdCBHSUMgaW50ZXJmYWNlLg0KDQpDYW7igJl0IHdl
IGRvIHRoZSBvcHBvc2l0ZSBhbmQgaW50cm9kdWNlIGEgUUVNVV9HSUNWMiBpbnN0ZWFkID8NCg0K
QWxzbyB3aHkgZG8gd2UgbmVlZCB0byByZW1vdmUgZ2ljLXYzIHN1cHBvcnQgPyBUaGUgY29kZSBz
aG91bGQgYWN0dWFsbHkgc2VsZWN0IHdoaWNoIGdpYyB0byB1c2UgZGVwZW5kaW5nIG9uIHRoZSBk
ZXZpY2UgdHJlZS4NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
RG9uZ2ppdSBHZW5nIDxnZW5nZG9uZ2ppdTFAZ21haWwuY29tPg0KPiAtLS0NCj4geGVuL2FyY2gv
YXJtL3BsYXRmb3Jtcy9LY29uZmlnIHwgMTAgKysrKysrKysrLQ0KPiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmln
DQo+IGluZGV4IGM5M2E2YjI3NTYuLjQxZTgyYTQyZWUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNo
L2FybS9wbGF0Zm9ybXMvS2NvbmZpZw0KPiArKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tj
b25maWcNCj4gQEAgLTEzLDcgKzEzLDE1IEBAIGNvbmZpZyBBTExfUExBVA0KPiAJYXV0b21hdGlj
YWxseSBzZWxlY3QgYW55IG9mIHRoZSByZWxhdGVkIGRyaXZlcnMuDQo+IA0KPiBjb25maWcgUUVN
VQ0KPiAtCWJvb2wgIlFFTVUgYWFyY2ggdmlydCBtYWNoaW5lIHN1cHBvcnQiDQo+ICsJYm9vbCAi
UUVNVSBhYXJjaCB2aXJ0IG1hY2hpbmUgc3VwcG9ydCA+PSB2My4xLjAiDQo+ICsJZGVwZW5kcyBv
biBBUk1fNjQNCj4gKwlzZWxlY3QgSEFTX1BMMDExDQo+ICsJLS0taGVscC0tLQ0KPiArCUVuYWJs
ZSBhbGwgdGhlIHJlcXVpcmVkIGRyaXZlcnMgZm9yIFFFTVUgYWFyY2g2NCB2aXJ0IGVtdWxhdGVk
DQo+ICsJbWFjaGluZS4NCj4gKw0KPiArY29uZmlnIFFFTVVfTEVHQUNZDQo+ICsJYm9vbCAiUUVN
VSBhYXJjaCB2aXJ0IG1hY2hpbmUgc3VwcG9ydCA8IHYzLjEuMCINCj4gCWRlcGVuZHMgb24gQVJN
XzY0DQo+IAlzZWxlY3QgR0lDVjMNCj4gCXNlbGVjdCBIQVNfUEwwMTENCj4gLS0gDQo+IDIuMjUu
MQ0KPiANCg0K

