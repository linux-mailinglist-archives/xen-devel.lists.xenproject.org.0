Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EF945457B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226756.391970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIvc-0003DV-Ls; Wed, 17 Nov 2021 11:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226756.391970; Wed, 17 Nov 2021 11:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIvc-0003Bj-IY; Wed, 17 Nov 2021 11:16:36 +0000
Received: by outflank-mailman (input) for mailman id 226756;
 Wed, 17 Nov 2021 11:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5X4Q=QE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mnIvb-0003Ar-KR
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:16:35 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe07::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d220558b-4797-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 12:16:34 +0100 (CET)
Received: from AM6P194CA0080.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::21)
 by DB6PR0801MB1829.eurprd08.prod.outlook.com (2603:10a6:4:39::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 11:16:31 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::71) by AM6P194CA0080.outlook.office365.com
 (2603:10a6:209:8f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 11:16:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Wed, 17 Nov 2021 11:16:31 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Wed, 17 Nov 2021 11:16:30 +0000
Received: from 8ba46ecb97b5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8BEC5A4-A2EB-4FD6-B241-09C43FBDA488.1; 
 Wed, 17 Nov 2021 11:16:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ba46ecb97b5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Nov 2021 11:16:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB5096.eurprd08.prod.outlook.com (2603:10a6:20b:ee::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 11:16:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 11:16:10 +0000
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
X-Inumbo-ID: d220558b-4797-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMFl5gcudJV3Vce7N08dDnYf7AE8Pe3mU55lTGwcpuY=;
 b=tB3qh2SrlwNVGs5jcGgkPkhkoxHA4NiFH+2Z/P/FSJQk6AD42NdAz+I466E5ay4xneYjZDYELs+oVnA/wu/IxyB1naJ85R7+3HZrWzjXN4WK+gs33wdClBWYPnD5U69KmaUB7HEiswFWPRCTNlUpRtOXVbLgLZdNLxJqdEHC4cg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee5fa50c64dbe183
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+fJOWOorM50CKQkJu7Dkj6UwsaJR2IIv6lFOAiNW+SS877u6lWLLl0Bjbi8tj1iVyFFKdqUD6n4wynnRD87lyzQ0OJbqhmaa2986RH5p6dZ0WYUeeuoJ5gkvQGbXYO8AVZ+r+eE6B6gziNNK3GB+G5Ziy2Mlql6jkeDzWzQAAJra7F4UMx+2LX+UFLGjq8zq4ghbH5AshvhsyQAu8tQagyjxL6Z6mQB/f003RiO6GZHSR0Xx+QTQvJYmkK14ZQwxAY3UuWbmcCaqdX5I0ZoPM+UyQXZxwB3D6zTkwTbevoISRNxY8UcpwrwPGdX5a6d5evat47YrzVh/oWkYXqMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMFl5gcudJV3Vce7N08dDnYf7AE8Pe3mU55lTGwcpuY=;
 b=gBLokkPrdQbbun+2cO0bSO60omllBD8qBDzUitj0vv7m1F6WDszBK+YMF0LyoCuchagEmXTAgtxC5BpddOnemoGNkzJ8fVcjTB4U+uc2zBclWvqtqKN9WriKCGKceT5y282o7zAWc35dWxvqE4Nwwu02nK42IZraVlmpuyq5rzzT6ZUTD12kMsJynP5+SC02qwesDsmiB7LQjUr3xi+/KBdH9FAEHi+rv12PSH+Pfz6O+SV0u9DJyMk7RUwlZ7/8wvyJeiU3wAatzlqKqtTJJAsJU72+jLFBu4xTfRhYnCG5nDAXg9EmWE194wV6g1x88M07GIGFxvFRYSFIhi51pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMFl5gcudJV3Vce7N08dDnYf7AE8Pe3mU55lTGwcpuY=;
 b=tB3qh2SrlwNVGs5jcGgkPkhkoxHA4NiFH+2Z/P/FSJQk6AD42NdAz+I466E5ay4xneYjZDYELs+oVnA/wu/IxyB1naJ85R7+3HZrWzjXN4WK+gs33wdClBWYPnD5U69KmaUB7HEiswFWPRCTNlUpRtOXVbLgLZdNLxJqdEHC4cg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
Thread-Topic: [RFC PATCH 0/2] Boot time cpupools
Thread-Index: AQHX25mOHH0z58pAdkqC6AziO7R1GqwHg+AAgAAN94A=
Date: Wed, 17 Nov 2021 11:16:10 +0000
Message-ID: <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
In-Reply-To: <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9323657b-052f-48b5-b0d3-08d9a9bbb50e
x-ms-traffictypediagnostic: AM6PR08MB5096:|DB6PR0801MB1829:
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB18290A4E6F0151F5355DD9349D9A9@DB6PR0801MB1829.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 utr7hkcez3AL9BMKFCiQMzXgDtwSDZLLumoLh4E0R+fE7+Gd8xNcVsTtL+QAy7wlz8QBfekFhFgD+pFMgZbWntfGkRZmg/n5BEqmqR+Uuq4hdDEPY/7DzhmHOC4yTck9nJS+hgVgGVV23OeFDJdaDhz9WM6mla/hC8WIzLdaEFT8LMhz2PJvIePylzrceNaAYkllB9GVLTx3Fy0hiyFKR5NqrFkPkXRnyGVHg4SuP/2N8j8EsCk/OwGGNOM2ouv7MF7oWqHo4OkXywnZ5+mUnXnCAGNR89m4d6UkL/1VdkqcGrrh8GRRp3rPsLYSGDzw0cwv7fKdwbJ1HdGGtcFQfvA0IjLz3TIxD4ymXG+oac5PaWaKRP0Om3xF/gx3Jm12DMqn0n/agtnMOymTDsc5AiDewhuSIaLM1fVr/u1tHtzs0jIgQOvG37M9FdrRBOzyTAjjshTbIIzWP6wH+Wq+/N0mwas0H6eo0U+mxlMHpFJtU43FjQp/15MappEx+knCWbipQwlztfK4lRm3bEXKJWkHuJuSU5k0O0cnCY6o43CyQC6hXWYVg3NaEMKaaXLIVEMlDV76YCqLWyrXt9jr64I/iqJHMNpKVteLBhvJE02J0BlT5loBCePvjCEyXh7dvDevMTawxbpe3S+INLrDgFfL5XJNecRfBPIp6mGHmvSI+X4fzxqlQ/TvxcuMSyB5UEwFkkY4Fb5+5+ZQnbnLljRO001ZcS/O/9/Pv/O5FmHVR4y0uX2RkxX8nabqVqUDsezGlpCRkqS0Np73usBz25NiWpGOxL83N8KmMskHlQ+cUfm+iDxsrZD8m/9sNe8OwIwTmtYT5WAvTZTGZPxUhA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(36756003)(54906003)(2906002)(4326008)(186003)(316002)(71200400001)(8676002)(6512007)(26005)(2616005)(6486002)(7416002)(8936002)(33656002)(6916009)(6506007)(53546011)(966005)(508600001)(86362001)(66556008)(66446008)(66946007)(76116006)(38100700002)(64756008)(38070700005)(91956017)(66476007)(122000001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A4937A79064CD40909732AB7F808689@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5096
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa3ff44e-9636-4e54-a611-08d9a9bba89f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zFELhoTSsS3xtOcuthRxZPfOSkzB5N4v3xNUFJvNEm9BxKaHlgrYXjTnkmHMrfQ1/LhIj6ZHhQ1FQL0KXft+ZSGfjPdkeF8KWRwYvzdBx1NHt+rsy8Hevnx9qbYPlBxjJT4FXRRZyTFZTI5ceomyb4+2D1nSYR2AiamY2R0Tzf17Qsd6Px2KiqRfBdGcNtQfKOQhRgdfC8sz7nLXQjIrzkiguN2Wlu+uXC0ZTrH4yNarfs69ijRXr8L3jGbwUDXv/uvyu2DhZCY8C+czGQcXkgFXyIG3g8RSTHDWdGJO+eTnmwDBXTJM8yPVdyYnG9I/lyJGK1OEyjSOU+MzG1Bj+RgsH3+R0ulJTQ+5dPtziCCrWdxKbDu0V7R17ey73zPJ0fQ4yBT9As4GmW8b9UoCZiCtKdgtbnaXwHU+ifbKt2yN1uiUsqxGPHCr2bks4flaqYYWw7uqarPG+PurjCMjVnNVIM6Zg9HyM9i43DdoIYDLl6N2IW3KSVu/57dd74WduPAxJfbsC2R+TNXczycexgHpDHwDL/KYzzcKY5587HRse0+jAvvsmjux4zqOWS94SWNmrezzBp00dH9jT5cF//1m9AnxuyNu3OEFtWdo7O57hW8c/TK7kxl1fcHTHxQGezr5a2lahwKhR73hZmjgKDU+9qRTsLf8vmChuC7THnC7rZJh8P+7Hz6ggcpRr46VmUE4RF5YGbIzJvSb+a6sIkl8N0Q3se7fHGY3H5prlLVMfZIbCTq8v1/hvaI0GlykYywDU/FsynCvc4zj/Y49dhx+VR9ibR3R6GOV7i0zKhU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(70586007)(316002)(186003)(81166007)(36756003)(47076005)(966005)(6512007)(70206006)(8676002)(356005)(6862004)(26005)(86362001)(2906002)(83380400001)(36860700001)(5660300002)(6506007)(4326008)(54906003)(33656002)(6486002)(8936002)(53546011)(508600001)(2616005)(107886003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 11:16:31.0193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9323657b-052f-48b5-b0d3-08d9a9bbb50e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1829

SGkgSnVsaWVuLA0KDQo+IE9uIDE3IE5vdiAyMDIxLCBhdCAxMDoyNiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMTcvMTEvMjAy
MSAwOTo1NywgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEN1cnJlbnRseSBYZW4gY3JlYXRlcyBh
IGRlZmF1bHQgY3B1cG9vbDAgdGhhdCBjb250YWlucyBhbGwgdGhlIGNwdSBicm91Z2h0IHVwDQo+
PiBkdXJpbmcgYm9vdCBhbmQgaXQgYXNzdW1lcyB0aGF0IHRoZSBwbGF0Zm9ybSBoYXMgb25seSBv
bmUga2luZCBvZiBDUFUuDQo+PiBUaGlzIGFzc3VtcHRpb24gZG9lcyBub3QgaG9sZCBvbiBiaWcu
TElUVExFIHBsYXRmb3JtLCBidXQgcHV0dGluZyBkaWZmZXJlbnQNCj4+IHR5cGUgb2YgQ1BVIGlu
IHRoZSBzYW1lIGNwdXBvb2wgY2FuIHJlc3VsdCBpbiBpbnN0YWJpbGl0eSBhbmQgc2VjdXJpdHkg
aXNzdWVzDQo+PiBmb3IgdGhlIGRvbWFpbnMgcnVubmluZyBvbiB0aGUgcG9vbC4NCj4gDQo+IEkg
YWdyZWUgdGhhdCB5b3UgY2FuJ3QgbW92ZSBhIExJVFRMRSB2Q1BVIHRvIGEgYmlnIHBDUFUuIEhv
d2V2ZXIuLi4NCj4gDQo+PiBGb3IgdGhpcyByZWFzb24gdGhpcyBzZXJpZSBpbnRyb2R1Y2VzIGFu
IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyB3YXkgdG8gY3JlYXRlDQo+PiBkaWZmZXJlbnQgY3B1cG9v
bCBhdCBib290IHRpbWUsIHRoaXMgaXMgcGFydGljdWxhcmx5IHVzZWZ1bCBvbiBBUk0gYmlnLkxJ
VFRMRQ0KPj4gcGxhdGZvcm0gd2hlcmUgdGhlcmUgbWlnaHQgYmUgdGhlIG5lZWQgdG8gaGF2ZSBk
aWZmZXJlbnQgY3B1cG9vbHMgZm9yIGVhY2ggdHlwZQ0KPj4gb2YgY29yZSwgYnV0IGFsc28gc3lz
dGVtcyB1c2luZyBOVU1BIGNhbiBoYXZlIGRpZmZlcmVudCBjcHUgcG9vbCBmb3IgZWFjaCBub2Rl
Lg0KPiANCj4gLi4uIGZyb20gbXkgdW5kZXJzdGFuZGluZywgYWxsIHRoZSB2Q1BVcyBvZiBhIGRv
bWFpbiBoYXZlIHRvIGJlIGluIHRoZSBzYW1lIGNwdXBvb2wuIFNvIHdpdGggdGhpcyBhcHByb2Fj
aCBpdCBpcyBub3QgcG9zc2libGU6DQo+ICAgMSkgdG8gaGF2ZSBhIG1peCBvZiBMSVRUTEUgYW5k
IGJpZyB2Q1BVcyBpbiB0aGUgZG9tYWluDQo+ICAgMikgdG8gY3JlYXRlIGEgZG9tYWluIHNwYW5u
aW5nIGFjcm9zcyB0d28gTlVNQSBub2Rlcw0KPiANCj4gU28gSSB0aGluayB3ZSBuZWVkIHRvIG1h
a2Ugc3VyZSB0aGF0IGFueSBzb2x1dGlvbnMgd2UgZ28gdGhyb3VnaCB3aWxsIG5vdCBwcmV2ZW50
IHVzIHRvIGltcGxlbWVudCB0aG9zZSBzZXR1cHMuDQoNClRoZSBwb2ludCBvZiB0aGlzIHBhdGNo
IGlzIHRvIG1ha2UgYWxsIGNvcmVzIGF2YWlsYWJsZSB3aXRob3V0IGJyZWFraW5nIHRoZSBjdXJy
ZW50IGJlaGF2aW91ciBvZiBleGlzdGluZyBzeXN0ZW0uDQoNClNvbWVvbmUgbm90IHVzaW5nIGNw
dXBvb2wgd2lsbCBrZWVwIHJ1bm5pbmcgb24gdGhlIHNhbWUgY29yZXMgYXMgYmVmb3JlLg0KU29t
ZW9uZSB3YW50aW5nIHRvIHVzZSB0aGUgb3RoZXIgY29yZXMgY291bGQgYXNzaWduIGEgZ3Vlc3Qg
dG8gdGhlIG90aGVyKHMpIGNwdXBvb2wgKGJpZy5MSVRUTEUgaXMganVzdCBhbiBleGFtcGxlIHdp
dGggMiBidXQgdGhlcmUgYXJlIG5vdyBjb3JlcyB3aXRoIDMgdHlwZXMgb2YgY29yZXMpLg0KU29t
ZW9uZSB3YW50aW5nIHRvIGJ1aWxkIHNvbWV0aGluZyBkaWZmZXJlbnQgY2FuIG5vdyBjcmVhdGUg
bmV3IGNwdXBvb2xzIGluIERvbTAgYW5kIGFzc2lnbiB0aGUgY29yZXMgdGhleSB3YW50IHRvIGlz
IHRvIGJ1aWxkIGEgZ3Vlc3QgaGF2aW5nIGFjY2VzcyB0byBkaWZmZXJlbnQgdHlwZXMgb2YgY29y
ZXMuDQoNClRoZSBwb2ludCBoZXJlIGlzIGp1c3QgdG8gbWFrZSB0aGUg4oCcb3RoZXLigJ0gY29y
ZXMgYWNjZXNzaWJsZSBhbmQgcGFyayB0aGVtIGluIGNwdXBvb2xzIHNvIHRoYXQgY3VycmVudCBi
ZWhhdmlvdXIgaXMgbm90IGNoYW5nZWQuDQoNCj4gDQo+IEkgY2FuIHNlZSB0d28gb3B0aW9ucyBo
ZXJlOg0KPiAgMSkgQWxsb3dpbmcgYSBkb21haW4gdkNQVXMgdG8gYmUgb24gYSBkaWZmZXJlbnQg
Y3B1cG9vbA0KPiAgMikgSW50cm9kdWNpbmcgQ1BVIGNsYXNzIChzZWUgWzFdKQ0KPiANCj4gSSBj
YW4ndCByZW1lbWJlciB3aHkgRGFyaW8gc3VnZ2VzdGVkIDIpIHJhdGhlciB0aGFuIDEpIGluIHRo
ZSBwYXN0LiBARGFyaW8sIGRvIHlvdSByZW1lbWJlciBpdD8NCg0KSSB0aGluayAxKSBpcyBkZWZp
bml0ZWx5IGludGVyZXN0aW5nIGFuZCBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZSBsb29rZWQgYXQg
aW4gdGhlIGZ1dHVyZS4NCg0KVGhpcyBzZXJpZSBqdXN0IGFpbXMgYXQgbWFraW5nIGFsbCBjb3Jl
cyBhdmFpbGFibGUgd2l0aG91dCBicmVha2luZyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdoaWNo
IGlzIGEgZ29vZCBpbXByb3ZlbWVudCBidXQgZG9lcyBub3QgY29udHJhZGljdCB0aGUgMiBvcHRp
b25zIHlvdSBhcmUgc3VnZ2VzdGluZy4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzE0ODExMzUz
NzkuMzQ0NS4xNDIuY2FtZWxAY2l0cml4LmNvbS8NCj4gDQo+PiBUbyB0ZXN0IHRoaXMgc2VyaWUs
IHRoZSBobXBfdW5zYWZlIFhlbiBib290IGFyZ3VtZW50IGlzIHBhc3NlZCB0byBhbGxvdyBYZW4N
Cj4+IHN0YXJ0aW5nIGRpZmZlcmVudCBDUFVzIGZyb20gdGhlIGJvb3QgY29yZS4NCj4+IEx1Y2Eg
RmFuY2VsbHUgKDIpOg0KPj4gICB4ZW4vY3B1cG9vbDogQ3JlYXRlIGRpZmZlcmVudCBjcHVwb29s
cyBhdCBib290IHRpbWUNCj4+ICAgdG9vbHMvY3B1cG9vbHM6IEdpdmUgYSBuYW1lIHRvIHVubmFt
ZWQgY3B1cG9vbHMNCj4+ICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3V0aWxzLmMgfCAxMyArKysr
LS0NCj4+ICB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgfCAxNSArKysrKysNCj4+ICB4
ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgfCAgMSArDQo+PiAgeGVuL2FyY2gvYXJtL2Nw
dXBvb2wuYyAgICAgICAgIHwgODQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4gIHhlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jICAgICB8ICA1ICstDQo+PiAgeGVuL2luY2x1
ZGUveGVuL2NwdXBvb2wuaCAgICAgIHwgMzAgKysrKysrKysrKysrDQo+PiAgNiBmaWxlcyBjaGFu
Z2VkLCAxNDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgeGVuL2FyY2gvYXJtL2NwdXBvb2wuYw0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4v
aW5jbHVkZS94ZW4vY3B1cG9vbC5oDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

