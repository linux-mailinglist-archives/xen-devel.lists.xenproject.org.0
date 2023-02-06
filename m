Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A868BD3C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:49:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490376.759032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0vK-0006xZ-DD; Mon, 06 Feb 2023 12:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490376.759032; Mon, 06 Feb 2023 12:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0vK-0006vC-A7; Mon, 06 Feb 2023 12:48:42 +0000
Received: by outflank-mailman (input) for mailman id 490376;
 Mon, 06 Feb 2023 12:48:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzyl=6C=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pP0vJ-0006v6-J3
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:48:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93bf3234-a61c-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 13:48:39 +0100 (CET)
Received: from AM6PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:20b:2e::25)
 by AM7PR08MB5366.eurprd08.prod.outlook.com (2603:10a6:20b:10b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:48:33 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::28) by AM6PR05CA0012.outlook.office365.com
 (2603:10a6:20b:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 12:48:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 12:48:33 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Mon, 06 Feb 2023 12:48:32 +0000
Received: from e22ce6136302.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DA50412-637A-47F9-B844-0182AB5AD441.1; 
 Mon, 06 Feb 2023 12:48:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e22ce6136302.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Feb 2023 12:48:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8064.eurprd08.prod.outlook.com (2603:10a6:20b:54d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:48:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 12:48:17 +0000
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
X-Inumbo-ID: 93bf3234-a61c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq5ePRHFEkRDZNX3ott0OvteXRN/5GjcPlXRQpT5hAE=;
 b=RPWGlQ/3Hdgwj0oePiMaEw/OXVbleXmKzQFLF4BbY2y2faL4A3aImcD1kzjGjzFnyDcXrcEjNwHvrlz659yzPYChlBRU33sIPJwZ31OY3gEq6nT4kg5lmUNRINwuwW4IPnrFshqu+crEjipW+gCcOJID051FyGlJU3CLYRu23NY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b44765ba3a844d4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC1pAYoe1DW/4DEsyXyJla87fP7GkwcuejV1Iqxy2c5/ZJJ0gKTvSBgZ/d9OgD0oi6T6rRWL4MqDmxm6SdcE+MTnjtvdDAKc0/k0Lc0QEZlrhUDsnYF/8n1nlPlONxsMWJz7klGrptyFiaViTId2zfLQ0QMtvx4Wu38FFyvbx8z0jV1cylCJKGyCK5RaxMXZfH94K2oJ4OGZ5/HA5fQiHFP/1FxwOwlr17mjVT8Mhq8tG5NI/Gv/Nff6vqoi9wU3T3UdJxdQp8di+TXM7vOpUV9mhhaQTNO1STUE56XQg3AvoHWGcd9F66ctlTZ1cpCBgn4nghNah7QFLHhqINi4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq5ePRHFEkRDZNX3ott0OvteXRN/5GjcPlXRQpT5hAE=;
 b=n50dUs4cdo5KPR5QB46F1CgFLisASSvB1ogmJeI5LphEgG+hn2VktB+cJdfs7di4UzNMKgYenHI8Dw/423uiSQJi8BUP/WSS5mBrieqYpU0gUmpi2xZhizPVMRnFjaNRvyol/bclJTW0ENYCkmN1pRaIKrq/IvSfYCk26vDFl1+VjX7U4QTHcoC49Cwvz3UbNcUrR3i7ZJHlCMrkoOUMmeSHT7uUWSMUS19kFPe3/qFE3s8DWoRnXt+Ag8BS5b9A4ocWsISQhD9G8dF7/cdVRQy7qJpAJyO/5CFq4/dENZJf9G9pHyUtVeISKxzvCxEJb9q+sXPqimg1uIaUXFNaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq5ePRHFEkRDZNX3ott0OvteXRN/5GjcPlXRQpT5hAE=;
 b=RPWGlQ/3Hdgwj0oePiMaEw/OXVbleXmKzQFLF4BbY2y2faL4A3aImcD1kzjGjzFnyDcXrcEjNwHvrlz659yzPYChlBRU33sIPJwZ31OY3gEq6nT4kg5lmUNRINwuwW4IPnrFshqu+crEjipW+gCcOJID051FyGlJU3CLYRu23NY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Proposal: List files in Xen originated from external sources
Thread-Topic: Proposal: List files in Xen originated from external sources
Thread-Index: AQHZN7IkxuQrtwTv+0WBDKkxqc3Ztq7BtLQAgAAnBYCAAASlAIAAAsKA
Date: Mon, 6 Feb 2023 12:48:17 +0000
Message-ID: <5AF7E2CA-216E-4E16-8542-2E7DF7ADB77E@arm.com>
References: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
 <005b7fa3-0f64-b15d-38d5-8135b0da06d2@suse.com>
 <9EDE6823-A6EB-4ECF-BFFA-2FE896C076AD@arm.com>
 <d945bbf1-69a5-8ffb-9a3f-2965864de9c2@suse.com>
In-Reply-To: <d945bbf1-69a5-8ffb-9a3f-2965864de9c2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8064:EE_|AM7EUR03FT040:EE_|AM7PR08MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1f7a19-e600-4ef4-fff1-08db084074a3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8n1mHQnJ+6TYOJbHfI11axqp+Dfrsf8F+0lohUvJba4LZaU8s9HAGyKjjIcgGe/H2YUAy68AxufBicTBzVfyTwB85KZGX8gOQj5gcSeoyroZ0VbX5jWc+6ps5LtpES48MlE76P2Un34R2OHGq4nAnPFrZMUO39C0Xi/aAjD/yjJCsrgNmjWtJoeQgg/Rl/FCf/xluyr9eNChc2IJcfCHY3xHIckVUNolFbPcdqXBm5vgZDKtNTu2TUCG88hMLukoN/OQMEd3BM9cqe6Cf9WZIXhQADk+scz8y9TiEQ4PHkwNmWCFs1D+xcoVtNOKcaFkEH7Ur2ez6Bis28iJMhTwQikcc42b7DGsr4QIcrS4tsQHSbuj0H8yKE4GFPbgTrNfLg12/MVdr68kEmU2aBVINVq5lcB2s0TdstDNCRMHfszXiEVHu+qkRj8q9ILDx+ORgkY5iByWolgTW8aa8kw4zPH9S7waX6k3yeXHjLotXPRz3vkhuN8d1P4IH9Q6BdseryCgpvc0fbUrWbgm0XEoLArT/MtuPXbfmiRMXummjGUQaIzhQVE6OArPZ4bWYIy6CNBNGWIWeS274BmvDX7vTZ1UF0B9gtom2ZCvB2JtqQ8e7sB6zg7a76fGwIGCWZrgpRTRsZ3LgJ/MJB+l4VyPyYQZZtrLC5Xcic2J5bBtDfAOQ6vnEFH9QHOKdjR0sZJo2uNGUHNGZtzwFXrooJRdDr/VT6+xuDEmrOMRcaywJj0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199018)(2906002)(41300700001)(8936002)(5660300002)(6486002)(36756003)(478600001)(6506007)(53546011)(91956017)(26005)(186003)(6512007)(2616005)(83380400001)(86362001)(33656002)(38070700005)(122000001)(38100700002)(66556008)(66476007)(6916009)(8676002)(64756008)(4326008)(66946007)(66446008)(71200400001)(76116006)(316002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D26380D207CA2E4EBF39E14896F59AF8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8064
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e323b118-8f7f-4c8b-7405-08db08406b79
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s4xlQ/47+NUXHpQyVX9z6MIITxAlwZCdajWO8YcLvWZ5dEM0nIaSLp+S1FPBLD6MKK1zLDFtHmmakvDH2yAPiJwQH5uAJjyXOYrBLXfKWBxIJRlFrVn2Cuk+Dg51B/1tCXYX05taLygCxE36TDNfCkZBwqLxQyQPVNe6fSNbFxlYtjRqXfkvtdRHi8R1pXguOy0sdw1h7ILB6xGg/fANzFKl9aYtK7djGEQD9LC8Y702mQBrrNUEiyWFilZ0RDkO++PlTj7LDucGj9CViUMe4fDNOnFckAFmTfGuILA1gmKfV8Io42d4bbjQWIBnijb0t4i+3d01Cfk2axETiRHqHFxAUznDaGqHM6fFonIV8YZmliecJUHWGxDrnyVjGJhqmyhHXaopUCeD9fZKdQEtJjDVhiW+P9hQc2AYHZNF7LH6k51MlzlNE7VmAzGla0U/3zRsq5XvEYccb9kXo2Isy1i4lEJzFFnsubNz5igmeDrzCpk2rCgnP/DjAK93PdFUqAnIKDs5HMZnkGIGu73W2wAVPgxUU2U5Q3yyII5BSbZKkc0octCUbkA+0mIoXxQaSUZgPViMjX5S34t806c1EB+3afmZsqgiQtSMbEGYmnlH4QKBbkUcqE3FTaXqlr56n+sSI+AdguFI4UU26UkU5AcRAR+1p4dd6KMVxGeYudA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199018)(46966006)(36840700001)(33656002)(82740400003)(86362001)(36860700001)(81166007)(36756003)(356005)(316002)(4326008)(41300700001)(70206006)(8676002)(70586007)(8936002)(6862004)(54906003)(40480700001)(82310400005)(5660300002)(2906002)(47076005)(336012)(83380400001)(478600001)(6486002)(6512007)(53546011)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:48:33.0422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1f7a19-e600-4ef4-fff1-08db084074a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5366

KyBhZGRpbmcgQmVydHJhbmQgaW4gdGhlIENDLCBhcG9sb2dpZXMgZm9yIGZvcmdldHRpbmcgeW91
IGluIHRoZSBmaXJzdCBtYWlsDQoNCj4gT24gNiBGZWIgMjAyMywgYXQgMTI6MzgsIEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNi4wMi4yMDIzIDEzOjIx
LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDYgRmViIDIwMjMsIGF0IDEwOjAxLCBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IE9uIDAzLjAyLjIwMjMgMTA6
MzAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IG9yaWdpbl9wYXRoOiByZWxhdGl2ZSBwYXRo
IGluIHRoZSBvcmlnaW5hbCBwcm9qZWN0LCBtb3N0bHkgbGlua2VkIHRvIHRoZSBvcmlnaW5hbF9y
ZXZpc2lvbiBmaWVsZA0KPj4+PiANCj4+Pj4gb3JpZ2luX3JldmlzaW9uOiByZXZpc2lvbiBvZiB0
aGUgY2hhbmdlcyBpbiB0aGUgcmVwb3NpdG9yeSB3aGVuIHRoaXMgZmlsZSB3YXMgdGFrZW4uDQo+
Pj4gDQo+Pj4gSSBndWVzcyB0aGlzIG5lZWRzIGNsYXJpZnlpbmc6IFdoYXQgcmV2aXNpb24gaXMg
bWVhbnQgaGVyZT8gVGhlIG9uZSBvcmlnaW5hbGx5DQo+Pj4gaW1wb3J0ZWQsIHRoZSBvbmUgbGFz
dCB1cGRhdGVkIGZyb20sIG9yIHlldCBzb21ldGhpbmcgZWxzZT8gS2VlcCBpbiBtaW5kIHRoYXQN
Cj4+PiB3ZSBtYXkgYWxzbyBiZSBzZWxlY3RpdmVseSBpbXBvcnRpbmcgY2hhbmdlcywgaW4gd2hp
Y2ggY2FzZSBhbnkgcGFydGljdWxhcg0KPj4+ICJyZXZpc2lvbiIgY2FuIGVhc2lseSBlbmQgdXAg
bWlzbGVhZGluZy4gVGhlIGZvcm1hdCBsaWtlbHkgYWxzbyB3YW50cw0KPj4+IHNwZWNpZnlpbmcs
IGUuZy4gKGxpa2Ugd2UgZG8gZm9yIEZpeGVzOiB0YWdzKSB0aGUgZmlyc3QgMTIgZGlnaXRzIG9m
IGEgY29tbWl0DQo+Pj4gaGFzaC4gRm9yIHNhaWQgc2VsZWN0aXZlIHVwZGF0aW5nIHRoaXMgbWln
aHQgdGhlbiBhbGxvdyBmb3Igc29tZXRoaW5nIGxpa2UNCj4+PiA8YmFzZS1oYXNoPis8Y2hlcnJ5
LXBpY2s+Ky4uLg0KPj4gDQo+PiBUaGlzIGlzIGEgZ29vZCBwb2ludCwgd2hhdCB3b3VsZCBpdCBi
ZSB0aGUgYmVzdCBmb3JtYXQgaW4geW91ciBvcGluaW9uPw0KPj4gTWF5YmUgd2Ugc2hvdWxkIGhh
dmUgdGhlIGZpZWxkIGFzIGFuIGFycmF5IG9mIHJldmlzaW9ucz8NCj4+IA0KPj4gIm9yaWdpbl9y
ZXZpc2lvbiI6IFsNCj4+ICAgIlJldmlzaW9uIG9mIGxhdGVzdCBiYWNrcG9ydOKAnSwNCj4+ICAg
Wy4uLl0NCj4+ICAgIm9yaWdpbmFsbHkgaW1wb3J0ZWQgcmV2aXNpb27igJ0sDQo+PiBdDQo+PiAN
Cj4+IFdoYXQgc2hvdWxkIGJlIHRoZSBiZXN0IHRvIGNhcHR1cmUgdGhlIGhpc3Rvcnkgb2YgdGhl
IGZpbGU/DQo+IA0KPiBUaGF0IHdvdWxkIGJlIHRha2luZyB0aGUgMm5kIHN0ZXAgYmVmb3JlIHRo
ZSAxc3Qgb25lLiBGb3Igbm93IHdlIG5lZWQgdG8NCj4gZGV0ZXJtaW5lIF93aGF0XyBpbmZvcm1h
dGlvbiB3ZSB3YW50IHRvIHJlY29yZC4gVGhlbiB3ZSBjYW4gZGV0ZXJtaW5lIGhvdw0KPiB0byBi
ZXN0IHJlcHJlc2VudCBpdC4NCg0KWWVzIHlvdSBhcmUgcmlnaHQsIHdoYXQgaW5mb3JtYXRpb25z
IG1ha2VzIHNlbnNlIHRvIHRyYWNrIGZvciBhIGZpbGUsIG15IGZpcnN0IHRob3VnaHQNCmlzIGNs
ZWFybHkgdGhlIHJldmlzaW9uIHdoZXJlIHRoZSBmaWxlIHdhcyB0YWtlbiwgYXQgZmlyc3QgSSB0
aG91Z2h0IHRoYXQgdXBkYXRpbmcgdGhlIHJldmlzaW9uDQp0byB0aGUgbGF0ZXN0IG9uZSBiYWNr
IHBvcnRlZCB3b3VsZCBoYXZlIGJlZW4gZW5vdWdoLCBidXQgZnJvbSB5b3VyIGNvbW1lbnQgSSBz
ZWUgdGhhdA0KaXQncyBub3Qgc28gc2ltcGxlLg0KDQoNCg0KPiANCj4gSmFuDQoNCg==

