Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD076D05D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575012.900757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRD4h-0006JT-25; Wed, 02 Aug 2023 14:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575012.900757; Wed, 02 Aug 2023 14:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRD4g-0006GY-VN; Wed, 02 Aug 2023 14:43:42 +0000
Received: by outflank-mailman (input) for mailman id 575012;
 Wed, 02 Aug 2023 14:43:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWG=DT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRD4f-00067Z-Cf
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:43:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f87db47f-3142-11ee-b261-6b7b168915f2;
 Wed, 02 Aug 2023 16:43:40 +0200 (CEST)
Received: from DUZPR01CA0208.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::6) by PAVPR08MB9187.eurprd08.prod.outlook.com
 (2603:10a6:102:30b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 14:43:06 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::1f) by DUZPR01CA0208.outlook.office365.com
 (2603:10a6:10:4b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Wed, 2 Aug 2023 14:43:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.44 via Frontend Transport; Wed, 2 Aug 2023 14:43:06 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Wed, 02 Aug 2023 14:43:06 +0000
Received: from e1c22c1a775c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48748ED1-619D-419B-B29F-09B0C87E4012.1; 
 Wed, 02 Aug 2023 14:42:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1c22c1a775c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Aug 2023 14:42:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBBPR08MB6298.eurprd08.prod.outlook.com (2603:10a6:10:1f7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 14:42:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 14:42:53 +0000
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
X-Inumbo-ID: f87db47f-3142-11ee-b261-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8rPRUL91NEXqFBgvQIvumIDzFRaE95Z0bjyHtDytK4=;
 b=qAvfpETCC3pYqW8j2+lV6tNZB+ZkrmUxbbjTvCne+gpBwDuhe5EO2lSs/+Zo5tZFrP3r+iMlal+mxhrPmgJetUkUZR1tNli4k9c+cbnA2BeDdAZPy9elXtzeuinNRfvogOZkAiC3icUjUUjq3oU22z/4ufVi3i6DQGRgDGK1+pk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5501f7eec9eea79d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oejz501g3Feek8NzGhNDM3XNvWeVf79TlZHXH1HfZtJXQ1LUwj1FpcMnGFfoLbYwnJrHQ1Z29TF515oA2cvB0yH4zX2bQYlvfPUdt8hbKfgjmPvKMx2C8OZUSkxbGf6VlRiJQHxg36wm0oj0ld64535PAdcOmQAAyOAPBwY/UfJuEEGKbKN1bmHBacSHqp7p44m7Agix/KM6Wgsj62rtJHyKXTcmnqFLN0arqD4p+taQY1LTKIA0ya020GgKwYNcxPGyr2UqVgrZMFARvF1lpFS8bViGGI5MA/RVrt1VFM0pMd4m2zo/Z3MlEoh3YCXb84Pore1eijAGlgNjVtFcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8rPRUL91NEXqFBgvQIvumIDzFRaE95Z0bjyHtDytK4=;
 b=jN05A8FeeIKvajFMWYBgBe3J0c6rSD8r6PrcgVBEg23E6mV9p37X/JP0JroZLS7+pdGWrxAZth34ppN4zyFYoekV2hJU7lPYvA1XtMC1MITz/wZnH1ZQtrFpKUepIsrGfUQtqg6hlfZRMp/8WrloopQVF99u9UQFTRa4ZLtExK/lAcIeM7++1O+hdu5zvETL8fDBSUS0D3wMegGoXoQ6vkft54+aWZXhVXb4trireTUoqlG4XKKKahSfBXaOKcGFKIFExnTmbjJNrpLGwUN/F0EKW5zERb7cFF8OlYAcM8NwfiKrMia2hk3iXUJxOSRPV91t2mxITEugr4w72zFg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8rPRUL91NEXqFBgvQIvumIDzFRaE95Z0bjyHtDytK4=;
 b=qAvfpETCC3pYqW8j2+lV6tNZB+ZkrmUxbbjTvCne+gpBwDuhe5EO2lSs/+Zo5tZFrP3r+iMlal+mxhrPmgJetUkUZR1tNli4k9c+cbnA2BeDdAZPy9elXtzeuinNRfvogOZkAiC3icUjUUjq3oU22z/4ufVi3i6DQGRgDGK1+pk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Topic: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Index: AQHZxUjDKmzjB69oo0mbnCqJ2MJvKa/XEDgAgAAEZQA=
Date: Wed, 2 Aug 2023 14:42:53 +0000
Message-ID: <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
In-Reply-To: <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBBPR08MB6298:EE_|DBAEUR03FT060:EE_|PAVPR08MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5128f7-8698-4488-9779-08db9366c8cc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Fh9xQdUu/4BtIn2iFG5OTuWMlD5Ge/pO7jN1+kmOpZGN/KKoSdMXO6Ou9Jx2kXTuqzI8JtOcYmDVFJoOJ+h0Naq7B8xgwtOdjg0pX4sFG0LtfDa/+mNbNyyRp+DovvSsSsS7J4LCcdrrIUMS9AeW1ME/QBlkkbu9X2R8mbVT/mUd83sSJ6cHBsbwLB6LoA2HDUT68T9tOuSLx4MsivnwDSTvtwp7pmTlr79lZa/wuY+SmU9NnSs5cqGijDcC9X6y+1FQ3mFHiDJPkdZ5aojxGEnxYEVdPSGzJf56xYBe/kwc9jPa7INAb/BSY1tV7FzIJWjrHx4/3h0yFf5y7pjMzEDwhb6bgWyQ72ZA43NnqV1PY+6SIn/5cRxXzhKojHUed46GYso0QASuOzTZUZA3+mOkYBNMqw6htc3cp4HRbiBiQNKry5zxI6bwbAOEtzTpdRAu3Gn6O5/+W5g6BbsnZP/bDihaZ/Ul1BlnzAPk07saHH5JQA2wenpGp5J2K60yRCCGvXsOVRJjZKI5aax/XFqBMggOA52JukHwPEFEE8riHcG0D5AW3/GegXK0vOig9iTGrTqt2yOpaoWYJtIz3Zl/OZuOt7YGL9ApHYe/23M1XDyMSOUcBKoXNMX8VMl9maHLBcicffz+vWfpPXYewg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(66899021)(2616005)(5660300002)(36756003)(38070700005)(122000001)(38100700002)(2906002)(33656002)(83380400001)(478600001)(26005)(186003)(53546011)(6506007)(8936002)(8676002)(6512007)(41300700001)(71200400001)(6486002)(86362001)(54906003)(6916009)(66946007)(66556008)(66476007)(91956017)(76116006)(66446008)(4326008)(64756008)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCB3817A0A40584688E7131B927422D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6298
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a46ba5e4-2990-41e7-c7ad-08db9366c0ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x0NfPCacsR6Ht8no/D1FNp4n71owBR+mWru4B0Ftzv7/J1eGCbv13+3kSKDkMOddvC/+E9b26G19/Pi7AnigcT427MNehRoezzfWSgp4gBmgIeJ/vncWCcHxXFGq+3fpGz1gwNl+5SBoXuwIvdNegAyIObwzbgVOzaHXFTB28OMq7EFDamKyYrMTXVZZBjKERwBMVnJqdOxLzN4gP7NlZ0O697WPAa9QRrKU1X+SZflhL0CVRlvSKD2jjZZl4lRct7yMzRNylr7pWhKDEfxvt6NqHNl2T/O5LI+RPASBwySUgdhhhT6AU/2mEj0XypvbtigRAVrjb7LzXClPlVduOXdEAUzcP1xk6fJfJCu7tbuox5w8MUIBqn5xEp+r0HxEvbMqqFXSE8G755syDJOAFdCfhJ6t2SZhNtyowfvBT9NE1HuUkojeNNEctW73nDUF5+bbaa9LZwNQ20UJ4lctVGh9sk7gppxM5DFRQN4eC3GaZns5RJj8LwV8uO+CG8IBkrDnCfMNKSNWvpCdxdUA5zdOUIGJZCZh9m+q85i8kjp56Hc4CEkn24i1ZzjfzjHmscXVYCdr3TxPz0O4zYKgrqqyQxUNh0c0BJzv4qbCCGWwoLJgMx4Pq+Mw2pMUw54dO8aPt/dukjRliWCvdPEnhaBRW0kV29L1baFqXAEH32CNdLpPNDbhESfezcqSUyVd0NIkf3LDyD6Dd097IXIP6Y6yZi9yzbT52tWb6/3X5eRM4G9k3BaS5ukWceRuJ9Ru
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(136003)(376002)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(6862004)(8676002)(5660300002)(41300700001)(107886003)(66899021)(2906002)(8936002)(83380400001)(47076005)(36860700001)(40460700003)(2616005)(40480700001)(186003)(336012)(86362001)(81166007)(478600001)(54906003)(316002)(53546011)(82740400003)(26005)(6506007)(33656002)(356005)(70586007)(70206006)(6486002)(4326008)(6512007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 14:43:06.7699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5128f7-8698-4488-9779-08db9366c8cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9187

DQoNCj4gT24gMiBBdWcgMjAyMywgYXQgMTU6MjYsIE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IE9uIDAyLzA4LzIwMjMgMTU6
NTMsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiANCj4+IA0KPj4gSW50cm9kdWNlIEtjb25maWcg
R0lDVjIgdG8gYmUgYWJsZSB0byBjb21waWxlIHRoZSBHSUN2MiBkcml2ZXIgb25seQ0KPj4gd2hl
biBuZWVkZWQsIHRoZSBvcHRpb24gaXMgYWN0aXZlIGJ5IGRlZmF1bHQuDQo+PiANCj4+IEludHJv
ZHVjZSBLY29uZmlnIFZHSUNWMiB0aGF0IGRlcGVuZHMgb24gR0lDVjIgb3IgR0lDVjMgYW5kIGNv
bXBpbGVzDQo+PiB0aGUgR0lDdjIgZW11bGF0aW9uIGZvciBndWVzdHMsIGl0IGlzIHJlcXVpcmVk
IG9ubHkgd2hlbiB1c2luZyBHSUNWMg0KPj4gZHJpdmVyLCBvdGhlcndpc2UgdXNpbmcgR0lDVjMg
aXQgaXMgb3B0aW9uYWwgYW5kIGNhbiBiZSBkZXNlbGVjdGVkDQo+PiBpZiB0aGUgdXNlciBkb2Vz
bid0IHdhbnQgdG8gb2ZmZXIgdGhlIHZHSUN2MiBpbnRlcmZhY2UgdG8gZ3Vlc3RzIG9yDQo+PiBt
YXliZSBpdHMgR0lDdjMgaGFyZHdhcmUgY2FuJ3Qgb2ZmZXIgdGhlIEdJQ3YyIGNvbXBhdGlibGUg
bW9kZS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxs
dUBhcm0uY29tPg0KPj4gLS0tDQo+PiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgfCAxMyAr
KysrKysrKysrKysrDQo+PiB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgfCAgNCArKy0tDQo+
PiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAgNCArKysrDQo+PiB4ZW4vYXJjaC9hcm0v
Z2ljLXYzLmMgICAgICAgfCAgNCArKysrDQo+PiB4ZW4vYXJjaC9hcm0vdmdpYy5jICAgICAgICAg
fCAgMiArKw0KPj4gNSBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJj
aC9hcm0vS2NvbmZpZw0KPj4gaW5kZXggZmQ1N2E4MmRkMjg0Li5kYzcwMmYwOGFjZTcgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL0tj
b25maWcNCj4+IEBAIC03OCw2ICs3OCwxNCBAQCBjb25maWcgQVJNX0VGSQ0KPj4gICAgICAgICAg
VUVGSSBmaXJtd2FyZS4gQSBVRUZJIHN0dWIgaXMgcHJvdmlkZWQgdG8gYWxsb3cgWGVuIHRvDQo+
PiAgICAgICAgICBiZSBib290ZWQgYXMgYW4gRUZJIGFwcGxpY2F0aW9uLg0KPj4gDQo+PiArY29u
ZmlnIEdJQ1YyDQo+IFNvLCBub3cgaXQgd291bGQgYmUgcG9zc2libGUgdG8gZGVzZWxlY3QgYm90
aCBHSUMgZHJpdmVycyBhbmQgWGVuIHdvdWxkIG5vdCBjb21wbGFpbiB3aGVuIGJ1aWxkaW5nLg0K
PiBUaGlzIG1lYW5zIHRoYXQgWGVuIHdvdWxkIGZhaWwgb24gYm9vdCB3aXRob3V0IGFueSBtZXNz
YWdlIGFzIGl0IGhhcHBlbnMgYmVmb3JlIHNlcmlhbCBkcml2ZXIgaW5pdGlhbGl6YXRpb24uDQo+
IFNpbmNlIGhhdmluZyBHSUMgZHJpdmVyIGJ1aWx0IGluIGlzIGEgbXVzdC1oYXZlIEkgdGhpbmsg
d2UgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBhdCBsZWFzdCBvbmUgaXMgZW5hYmxlZC4NCg0KSGkg
TWljaGFsLA0KDQpJIHRyaWVkIGFuZCBJIGhhZDoNCg0KU3RhcnRpbmcga2VybmVsIC4uLg0KDQot
IFVBUlQgZW5hYmxlZCAtDQotIEJvb3QgQ1BVIGJvb3RpbmcgLQ0KLSBDdXJyZW50IEVMIDAwMDAw
MDAwMDAwMDAwMDggLQ0KLSBJbml0aWFsaXplIENQVSAtDQotIFR1cm5pbmcgb24gcGFnaW5nIC0N
Ci0gWmVybyBCU1MgLQ0KLSBSZWFkeSAtDQooWEVOKSBDaGVja2luZyBmb3IgaW5pdHJkIGluIC9j
aG9zZW4NCihYRU4pIFJBTTogMDAwMDAwMDA4MDAwMDAwMCAtIDAwMDAwMDAwZmVmZmZmZmYNCihY
RU4pIFJBTTogMDAwMDAwMDg4MDAwMDAwMCAtIDAwMDAwMDA4ZmZmZmZmZmYNCihYRU4pDQooWEVO
KSBNT0RVTEVbMF06IDAwMDAwMDAwODQwMDAwMDAgLSAwMDAwMDAwMDg0MTVkMDAwIFhlbg0KKFhF
TikgTU9EVUxFWzFdOiAwMDAwMDAwMGZkNmM1MDAwIC0gMDAwMDAwMDBmZDZjODAwMCBEZXZpY2Ug
VHJlZQ0KKFhFTikgTU9EVUxFWzJdOiAwMDAwMDAwMDgwMDgwMDAwIC0gMDAwMDAwMDA4MTRmMWEw
MCBLZXJuZWwNCihYRU4pICBSRVNWRFswXTogMDAwMDAwMDA4MDAwMDAwMCAtIDAwMDAwMDAwODAw
MTAwMDANCihYRU4pICBSRVNWRFsxXTogMDAwMDAwMDAxODAwMDAwMCAtIDAwMDAwMDAwMTg3ZmZm
ZmYNCihYRU4pDQooWEVOKQ0KKFhFTikgQ29tbWFuZCBsaW5lOiBub3JlYm9vdCBkb20wX21lbT0x
MDI0TSBjb25zb2xlPWR0dWFydCBkdHVhcnQ9c2VyaWFsMCBib290c2NydWI9MA0KKFhFTikgUEZO
IGNvbXByZXNzaW9uIG9uIGJpdHMgMjAuLi4yMg0KKFhFTikgRG9tYWluIGhlYXAgaW5pdGlhbGlz
ZWQNCihYRU4pIEJvb3RpbmcgdXNpbmcgRGV2aWNlIFRyZWUNCihYRU4pIFBsYXRmb3JtOiBHZW5l
cmljIFN5c3RlbQ0KKFhFTikNCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioNCihYRU4pIFBhbmljIG9uIENQVSAwOg0KKFhFTikgVW5hYmxlIHRvIGZpbmQgY29t
cGF0aWJsZSBHSUMgaW4gdGhlIGRldmljZSB0cmVlDQooWEVOKSAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqDQooWEVOKQ0KKFhFTikgTWFudWFsIHJlc2V0IHJlcXVpcmVk
ICgnbm9yZWJvb3QnIHNwZWNpZmllZCkNCg0KV291bGRu4oCZdCBiZSBlbm91Z2ggdG8gc3VnZ2Vz
dCB0aGUgdXNlciB0aGF0IGF0IGxlYXN0IG9uZSBHSUMgbmVlZHMgdG8gYmUgc2VsZWN0ZWQ/IElu
IHRoZSBoZWxwIGl0DQphbHNvIHN0YXRlcyDigJxpZiB1bnN1cmUsIHNheSBZIg0KDQo+IA0KPiB+
TWljaGFsDQoNCg==

