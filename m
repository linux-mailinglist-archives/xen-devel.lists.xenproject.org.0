Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C2416B04
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:35:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194880.347238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcvX-0006Mj-H9; Fri, 24 Sep 2021 04:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194880.347238; Fri, 24 Sep 2021 04:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcvX-0006Ko-D1; Fri, 24 Sep 2021 04:35:11 +0000
Received: by outflank-mailman (input) for mailman id 194880;
 Fri, 24 Sep 2021 04:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTcvW-0006Kh-HA
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:35:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfa9576b-e26c-477f-a6ba-a69718dbcbb4;
 Fri, 24 Sep 2021 04:35:08 +0000 (UTC)
Received: from DB6PR0201CA0003.eurprd02.prod.outlook.com (2603:10a6:4:3f::13)
 by AM0PR08MB4161.eurprd08.prod.outlook.com (2603:10a6:208:134::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 04:35:03 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::b5) by DB6PR0201CA0003.outlook.office365.com
 (2603:10a6:4:3f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 04:35:03 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:35:02 +0000
Received: ("Tessian outbound 173d710607ad:v103");
 Fri, 24 Sep 2021 04:35:01 +0000
Received: from 2269cab4da01.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CB02BDC-C2A7-4F28-8FFC-88242D302714.1; 
 Fri, 24 Sep 2021 04:34:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2269cab4da01.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:34:49 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com (2603:10a6:102:132::14)
 by PAXPR08MB6493.eurprd08.prod.outlook.com (2603:10a6:102:15a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 04:34:26 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be]) by PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be%6]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:34:26 +0000
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
X-Inumbo-ID: bfa9576b-e26c-477f-a6ba-a69718dbcbb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbxhEwLcYaFANGdHa6f541Zk8Gg8706fzHfZtEIl7r4=;
 b=bbX5SKM0njKyc1VypDWCAtw4xmvjsy/TWkPQvu3BExo12cx6XKOkFy3XAgPceydRLyGFr8G0WwHXJHN9WDK+kEeYFKVe290YaQw3zLqju6ENOZm5F6nnnr3HPmOh/qCx45DRFDFJjwnvDUk1/eES0n0+TzXgs8hSuZxbePShgSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oq+cm7MyXGl3aR90QcBxZHqUWOj4B9VMgPNnjFa6D9UlDhTfIl4aIi4g2iVWsVQz6f03afd8NwRsnyuWdZ7LdNstKNZHqv6HcPNJcqBY0L4EArjhCPl54buqAmXyrJkq8mY6W4B61oSb+e9rFL6NOAQTbYkjaH1d66WqLq8Gak5O9hkLo7yRWLnjuyJehogHKm3hRqUgLxCyKN8OSoK1mQyB1Poo4osQMtNGFnCDWgJ2ik1uxTpSUqyGB034dRSwGwqIRb2oDqLxlcN61oejQcZ0Bh9fGcKl2Chuxt5hECxXU8LmJYWqnXrB4+5li6mTqea1zeaZdFdo8bPWzpec/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kbxhEwLcYaFANGdHa6f541Zk8Gg8706fzHfZtEIl7r4=;
 b=Yf/0OsRJV1z4RadadI+pEkYC7zmokTB6jqv0UPAKbT+IMhnl2s7cdpty02UEOSUCXs2Tkt/TGoLv9Xw6JoK4Lls+1UgdLJ/lnSCgUCbKOrO+guQgeKNsmZ/DptJoNq38kripM7/ORsxrFdst+Ft3ojcEXh1XevDFTtvWeNJuekT4S4AbrMs5dwbS3UCfcvm6+LU2bOlkUXpczhGYHU/7EYDwm1oCk3ddTg9JHrbSZJ2dYPdrDUQEUfrWZtEl4t86jGUnY74y7RRVgm7gCnqV/Dvnexea1CwJN9dW7z83vC0HKfSIiBVrr+4/Wzjg+wcJBVWzIvJfMGbwn/SpmbXlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbxhEwLcYaFANGdHa6f541Zk8Gg8706fzHfZtEIl7r4=;
 b=bbX5SKM0njKyc1VypDWCAtw4xmvjsy/TWkPQvu3BExo12cx6XKOkFy3XAgPceydRLyGFr8G0WwHXJHN9WDK+kEeYFKVe290YaQw3zLqju6ENOZm5F6nnnr3HPmOh/qCx45DRFDFJjwnvDUk1/eES0n0+TzXgs8hSuZxbePShgSY=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index: AQHXsHMtR+l18+MmpE6rl/RjSXTBgquyYmkAgAA2xQA=
Date: Fri, 24 Sep 2021 04:34:26 +0000
Message-ID:
 <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 81D3082093BE4F4C9C52CF9AD266759E.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1a5503b8-64e6-4ea5-82b9-08d97f14ac9b
x-ms-traffictypediagnostic: PAXPR08MB6493:|AM0PR08MB4161:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4161743AB1F73A0A75CB5A0E9EA49@AM0PR08MB4161.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6VyYTR4qB5THRHBcua1V8Ppsjq+6xS7zuXdwgeDSDUMwVV9MTLQaQnBoMBMVsKhru2H0m62I+yyKg5CHiEzXUKMUDSS4DzBzmTOjKqjSgOPS6vH0VERD94SYZuFeq0P0b8G6H4Kb1n5f2V3WRVrlCG873VorQas0wLue+ceA438DAvwNKXHumnRJEN1daepfkGjebNd1NiQWrC28sgw/Ib8nA0DTkiTE4zKwzVj+Agq5PccvTVshf8v1Y/C0juLZKhpB7mUsy6llKdPEJuF38jBKjp2KgLBCqk6jyvXHQJNIG3D3mx5kH2pVv/nYGCZuc87AYJGSrgYaOQVYHSKlqLQKPiID4gLu5iq/wnOmwALt4Y4I2dwhMFOAD958oTt8zxMqSyo35g8TyskjlwPBeCf1fiVX8wht7yOQ8mCNIZZn8P6xH76ATi4uFQ67+kMQ6bDJWUcgVAzOm/DSGcgAdEB41cMeDSP7diXJOEPYFOYEcmnNQqmbyQbPB5xxMeLT/b+ftryalMyWNLWCRb9L5ELzDzb38C2zkW46bdX9nWNWdd1PbPscSOpipHSyvbe0WD178VKVlIr5NoIHgcTcHan057gGvunfQy4nHF+zF4imd92ySEfZPOzbhH8fHXjhVoAmsOjCMYBvFaDC4Rzp75eQFO1X5MOznOiPCrb9+zbFj6Ult9SAYYyRTA/MqM6rDumhzrGBkRUIelqM7YkHOA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6864.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(52536014)(6916009)(76116006)(38100700002)(2906002)(54906003)(26005)(7696005)(66446008)(122000001)(66556008)(66476007)(5660300002)(66946007)(64756008)(316002)(38070700005)(53546011)(6506007)(83380400001)(55016002)(186003)(71200400001)(4326008)(86362001)(8676002)(9686003)(33656002)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6493
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	feac45ae-4107-4dc3-8667-08d97f149756
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lA8ChsIPtNdPjPX42a5ktL2w4xj3UHIZsUmIgBATdTNju/rusgWhbF3zNXqOyI+JZNGWzRcnGJj0uixViNpfi9ktBQy49nsyao9qhagvyGiHqC0KMIpRbNGgku9S9PjUO8FI/Woj0qthVEAPeKcqC5DvSJB1iCka0jZZhxuCBPCLQ/JxtFLrB1lRkulGMP3NTBim4KykWEL/1A96zaI4GAw/HlwFPIrshCNeqnYHqauUD7D++L25QM8O4xY/4zQ8KAgwdI4W+D9+2mkqprigK1bKkWIr7j5SFbUdvL2/R0E9t9CZQZIlAf6VgXyZeRR2Vbvsiv6NNoX408aQve4KMgZbYh+h6VVUNNPy29FMEB8wav5yvkwzntrq/0WLQO2f9meZ8+GpobFs+T3MDFfS/V18/+zPulPJvp5xluxcQw+Ktu9nHXGL/SU7rbhj056qTKQ6wp0XPYn0JaAGDxrkFiEaPdv3Ox0w4Qvn1Ymgy6Y6VwlPUhb6rp1c+UKhbimzXM5JbN0odGyKkt3JLCU20O9DHnG1sWf0hvaZgNqB0M9CgCbpFloEBknPrJRSo4V91NiAwgipyLd/vDQvyVaKQhjSaMWu7GyL2K15baJs2hUsD1iZ74GVr4N/AHuyoE7UPPSnjH52GUz8EB5z/vZAeadKp/5jMwf5l+LKD7s3XbVDYMoMRavePiGz6TDKPNnTS+8HTfd9M0k3x1zHD+EN+g==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(8936002)(54906003)(55016002)(2906002)(33656002)(6506007)(336012)(7696005)(53546011)(36860700001)(82310400003)(52536014)(9686003)(47076005)(316002)(4326008)(186003)(508600001)(26005)(356005)(83380400001)(86362001)(81166007)(70206006)(70586007)(6862004)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:35:02.1532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5503b8-64e6-4ea5-82b9-08d97f14ac9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4161

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgOToxNQ0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMjAvMzddIHhlbjogaW50cm9kdWNlIENPTkZJR19FRkkg
dG8gc3R1YiBBUEkgZm9yIG5vbi0NCj4gRUZJIGFyY2hpdGVjdHVyZQ0KPiANCj4gT24gVGh1LCAy
MyBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gU29tZSBhcmNoaXRlY3R1cmVzIGRvIG5v
dCBzdXBwb3J0IEVGSSwgYnV0IEVGSSBBUEkgd2lsbCBiZSB1c2VkDQo+ID4gaW4gc29tZSBjb21t
b24gZmVhdHVyZXMuIEluc3RlYWQgb2Ygc3ByZWFkaW5nICNpZmRlZiBBUkNILCB3ZQ0KPiA+IGlu
dHJvZHVjZSB0aGlzIEtjb25maWcgb3B0aW9uIHRvIGdpdmUgWGVuIHRoZSBhYmlsaXR5IG9mIHN0
dWJpbmcNCj4gPiBFRkkgQVBJIGZvciBub24tRUZJIHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4g
LS0tDQo+ID4gIHhlbi9hcmNoL2FybS9LY29uZmlnICB8ICAxICsNCj4gPiAgeGVuL2FyY2gvYXJt
L01ha2VmaWxlIHwgIDIgKy0NCj4gPiAgeGVuL2FyY2gveDg2L0tjb25maWcgIHwgIDEgKw0KPiA+
ICB4ZW4vY29tbW9uL0tjb25maWcgICAgfCAxMSArKysrKysrKysrKw0KPiA+ICB4ZW4vaW5jbHVk
ZS94ZW4vZWZpLmggfCAgNCArKysrDQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9L
Y29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPiBpbmRleCBlY2ZhNjgyMmU0Li44NjVh
ZDgzYTg5IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ID4gKysrIGIv
eGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPiBAQCAtNiw2ICs2LDcgQEAgY29uZmlnIEFSTV82NA0K
PiA+ICAJZGVmX2Jvb2wgeQ0KPiA+ICAJZGVwZW5kcyBvbiAhQVJNXzMyDQo+ID4gIAlzZWxlY3Qg
NjRCSVQNCj4gPiArCXNlbGVjdCBFRkkNCj4gPiAgCXNlbGVjdCBIQVNfRkFTVF9NVUxUSVBMWQ0K
PiA+DQo+ID4gIGNvbmZpZyBBUk0NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL01ha2Vm
aWxlIGIveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+ID4gaW5kZXggM2QzYjk3YjViNC4uYWU0ZWZi
Zjc2ZSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4gPiArKysgYi94
ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4gPiBAQCAtMSw2ICsxLDYgQEANCj4gPiAgb2JqLSQoQ09O
RklHX0FSTV8zMikgKz0gYXJtMzIvDQo+ID4gIG9iai0kKENPTkZJR19BUk1fNjQpICs9IGFybTY0
Lw0KPiA+IC1vYmotJChDT05GSUdfQVJNXzY0KSArPSBlZmkvDQo+ID4gK29iai0kKENPTkZJR19F
RkkpICs9IGVmaS8NCj4gPiAgb2JqLSQoQ09ORklHX0FDUEkpICs9IGFjcGkvDQo+ID4gIGlmbmVx
ICgkKENPTkZJR19OT19QTEFUKSx5KQ0KPiA+ICBvYmoteSArPSBwbGF0Zm9ybXMvDQo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25maWcNCj4g
PiBpbmRleCAyOGQxM2I5NzA1Li5iOWVkMTg3ZjZiIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9LY29uZmlnDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcNCj4gPiBAQCAtMTAs
NiArMTAsNyBAQCBjb25maWcgWDg2DQo+ID4gIAlzZWxlY3QgQUxURVJOQVRJVkVfQ0FMTA0KPiA+
ICAJc2VsZWN0IEFSQ0hfU1VQUE9SVFNfSU5UMTI4DQo+ID4gIAlzZWxlY3QgQ09SRV9QQVJLSU5H
DQo+ID4gKwlzZWxlY3QgRUZJDQo+ID4gIAlzZWxlY3QgSEFTX0FMVEVSTkFUSVZFDQo+ID4gIAlz
ZWxlY3QgSEFTX0NPTVBBVA0KPiA+ICAJc2VsZWN0IEhBU19DUFVGUkVRDQo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+IGluZGV4IDll
YmIxYzIzOWIuLmY5OTg3NDZhMWEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmln
DQo+ID4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnDQo+ID4gQEAgLTExLDYgKzExLDE2IEBAIGNv
bmZpZyBDT01QQVQNCj4gPiAgY29uZmlnIENPUkVfUEFSS0lORw0KPiA+ICAJYm9vbA0KPiA+DQo+
ID4gK2NvbmZpZyBFRkkNCj4gPiArCWJvb2wNCj4gDQo+IFdpdGhvdXQgdGhlIHRpdGxlIHRoZSBv
cHRpb24gaXMgbm90IHVzZXItc2VsZWN0YWJsZSAob3IgZGUtc2VsZWN0YWJsZSkuDQo+IFNvIHRo
ZSBoZWxwIG1lc3NhZ2UgYmVsb3cgY2FuIG5ldmVyIGJlIHNlZW4uDQo+IA0KPiBFaXRoZXIgYWRk
IGEgdGl0bGUsIGUuZy46DQo+IA0KPiBib29sICJFRkkgc3VwcG9ydCINCj4gDQo+IE9yIGZ1bGx5
IG1ha2UgdGhlIG9wdGlvbiBhIHNpbGVudCBvcHRpb24gYnkgcmVtb3ZpbmcgdGhlIGhlbHAgdGV4
dC4NCj4gDQo+IA0KDQpPSywgaW4gY3VycmVudCBYZW4gY29kZSwgRUZJIGlzIHVuY29uZGl0aW9u
YWxseSBjb21waWxlZC4gQmVmb3JlDQp3ZSBjaGFuZ2UgcmVsYXRlZCBjb2RlLCBJIHByZWZlciB0
byByZW1vdmUgdGhlIGhlbHAgdGV4dC4NCg0KPiANCj4gPiArCS0tLWhlbHAtLS0NCj4gPiArICAg
ICAgVGhpcyBvcHRpb24gcHJvdmlkZXMgc3VwcG9ydCBmb3IgcnVudGltZSBzZXJ2aWNlcyBwcm92
aWRlZA0KPiA+ICsgICAgICBieSBVRUZJIGZpcm13YXJlIChzdWNoIGFzIG5vbi12b2xhdGlsZSB2
YXJpYWJsZXMsIHJlYWx0aW1lDQo+ID4gKyAgICAgIGNsb2NrLCBhbmQgcGxhdGZvcm0gcmVzZXQp
LiBBIFVFRkkgc3R1YiBpcyBhbHNvIHByb3ZpZGVkIHRvDQo+ID4gKyAgICAgIGFsbG93IHRoZSBr
ZXJuZWwgdG8gYmUgYm9vdGVkIGFzIGFuIEVGSSBhcHBsaWNhdGlvbi4gVGhpcw0KPiA+ICsgICAg
ICBpcyBvbmx5IHVzZWZ1bCBmb3Iga2VybmVscyB0aGF0IG1heSBydW4gb24gc3lzdGVtcyB0aGF0
IGhhdmUNCj4gPiArICAgICAgVUVGSSBmaXJtd2FyZS4NCj4gPiArDQo+ID4gIGNvbmZpZyBHUkFO
VF9UQUJMRQ0KPiA+ICAJYm9vbCAiR3JhbnQgdGFibGUgc3VwcG9ydCIgaWYgRVhQRVJUDQo+ID4g
IAlkZWZhdWx0IHkNCj4gPiBAQCAtMTk2LDYgKzIwNiw3IEBAIGNvbmZpZyBLRVhFQw0KPiA+DQo+
ID4gIGNvbmZpZyBFRklfU0VUX1ZJUlRVQUxfQUREUkVTU19NQVANCj4gPiAgICAgIGJvb2wgIkVG
STogY2FsbCBTZXRWaXJ0dWFsQWRkcmVzc01hcCgpIiBpZiBFWFBFUlQNCj4gPiArICAgIGRlcGVu
ZHMgb24gRUZJDQo+ID4gICAgICAtLS1oZWxwLS0tDQo+ID4gICAgICAgIENhbGwgRUZJIFNldFZp
cnR1YWxBZGRyZXNzTWFwKCkgcnVudGltZSBzZXJ2aWNlIHRvIHNldHVwIG1lbW9yeQ0KPiBtYXAg
Zm9yDQo+ID4gICAgICAgIGZ1cnRoZXIgcnVudGltZSBzZXJ2aWNlcy4gQWNjb3JkaW5nIHRvIFVF
Rkkgc3BlYywgaXQgaXNuJ3QNCj4gc3RyaWN0bHkNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUveGVuL2VmaS5oIGIveGVuL2luY2x1ZGUveGVuL2VmaS5oDQo+ID4gaW5kZXggOTRhN2U1NDdm
OS4uNjYxYTQ4Mjg2YSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vZWZpLmgNCj4g
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZWZpLmgNCj4gPiBAQCAtMjUsNiArMjUsOCBAQCBleHRl
cm4gc3RydWN0IGVmaSBlZmk7DQo+ID4NCj4gPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18NCj4gPg0K
PiA+ICsjaWZkZWYgQ09ORklHX0VGSQ0KPiA+ICsNCj4gPiAgdW5pb24geGVucGZfZWZpX2luZm87
DQo+ID4gIHVuaW9uIGNvbXBhdF9wZl9lZmlfaW5mbzsNCj4gPg0KPiA+IEBAIC00NSw2ICs0Nyw4
IEBAIGludCBlZmlfcnVudGltZV9jYWxsKHN0cnVjdCB4ZW5wZl9lZmlfcnVudGltZV9jYWxsICop
Ow0KPiA+ICBpbnQgZWZpX2NvbXBhdF9nZXRfaW5mbyh1aW50MzJfdCBpZHgsIHVuaW9uIGNvbXBh
dF9wZl9lZmlfaW5mbyAqKTsNCj4gPiAgaW50IGVmaV9jb21wYXRfcnVudGltZV9jYWxsKHN0cnVj
dCBjb21wYXRfcGZfZWZpX3J1bnRpbWVfY2FsbCAqKTsNCj4gPg0KPiA+ICsjZW5kaWYgLyogQ09O
RklHX0VGSSovDQo+ID4gKw0KPiA+ICAjZW5kaWYgLyogIV9fQVNTRU1CTFlfXyAqLw0KPiA+DQo+
ID4gICNlbmRpZiAvKiBfX1hFTl9FRklfSF9fICovDQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0K

