Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986F06922B4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 16:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493452.763382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQVjY-0003NS-PG; Fri, 10 Feb 2023 15:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493452.763382; Fri, 10 Feb 2023 15:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQVjY-0003K4-Ip; Fri, 10 Feb 2023 15:54:44 +0000
Received: by outflank-mailman (input) for mailman id 493452;
 Fri, 10 Feb 2023 15:54:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nct=6G=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pQVjX-0003Jy-48
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 15:54:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a62fe50-a95b-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 16:54:40 +0100 (CET)
Received: from DU2PR04CA0221.eurprd04.prod.outlook.com (2603:10a6:10:2b1::16)
 by DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 15:54:29 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::e1) by DU2PR04CA0221.outlook.office365.com
 (2603:10a6:10:2b1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.20 via Frontend
 Transport; Fri, 10 Feb 2023 15:54:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.19 via Frontend Transport; Fri, 10 Feb 2023 15:54:28 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Fri, 10 Feb 2023 15:54:28 +0000
Received: from 9f58a4ada647.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F301EAC-E4C7-45DD-9466-A95A731D4384.1; 
 Fri, 10 Feb 2023 15:54:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f58a4ada647.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Feb 2023 15:54:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7389.eurprd08.prod.outlook.com (2603:10a6:10:32d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Fri, 10 Feb
 2023 15:54:20 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f0e7:5f67:ed2f:a70a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f0e7:5f67:ed2f:a70a%2]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 15:54:19 +0000
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
X-Inumbo-ID: 3a62fe50-a95b-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98taQzGah3ofEajGEbOVk4UyDCJzptUQSk2tUKtT1iY=;
 b=M8GXyvRBAdB48KM/mxcuZ72s7hKDtREZSxjp5zY38ktSEotlurmSe1IeEoY3dk25zR+Z7VZrJRy/wqM7zBINDPDOTU2sGXE5VFK2ZzRzSC7dapLIPsZYjdauMnYKAaf0wgybS7lmg54DCCGMRP2JdCz/Tmg0f2owyUJODokljvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 263af402050996e0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqS1Odk+uOm6+InbbQ+4zQcakyvcPh4qpBN9Q8MT2K5XwhtUEW0dxuqzcD5Mus0FFK/pKgm+j0HIFITCSpgoYGjkQP2Cl4PBR4jMZkotlZ/a6twQUNgWLH12Jccquo/vMaB43x0yBNFgoGHAeRf+OGBnFXll5iTeCVvC/sAc2J/vNHj47ToA1Ny5BGqfzR84Aga6Q8VFLPlJR01hwuRWDpfQl4TSg3i806a0rrRlAK401J34wrEw3GO5yFoaGPEnrXrvifeof+g9CHPsBQB3E4WdODI/LQ4iQaw5gX92BFJZt1PwPBiBTjH3jPxIl5mx3jIKnhDe6zOBsoJ7MRP/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98taQzGah3ofEajGEbOVk4UyDCJzptUQSk2tUKtT1iY=;
 b=bLA56P0vuo82Uea0xABkkTUPbKlgFg47vPTx8NnzqqTF+F+GNIOh244mtasDYFjzlGxXH3f6QBIS1k8DA51VV4HqRgiFR7KEWc1ytQf3a00vaSGpaeH+96/x+mvn5rbJKVk7DgjUoBpfdWiblDxH9R7uuHLxnJPEMSpGsPoqEzh6YtT2ul1Q6A4mZzr0wPs6pE1dyULYI2B296EKSMFUh+in1KEmoraHK4B8ZXPtdX/PxR6Yh6krpco259JKwuVg4my87tA9mqhllkOl6V77mIi4VXKmTB5z6kLIcopzbtpL32q3GqesHcTLE4JleOWEmeDmr6KMORuCzGWiayCzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98taQzGah3ofEajGEbOVk4UyDCJzptUQSk2tUKtT1iY=;
 b=M8GXyvRBAdB48KM/mxcuZ72s7hKDtREZSxjp5zY38ktSEotlurmSe1IeEoY3dk25zR+Z7VZrJRy/wqM7zBINDPDOTU2sGXE5VFK2ZzRzSC7dapLIPsZYjdauMnYKAaf0wgybS7lmg54DCCGMRP2JdCz/Tmg0f2owyUJODokljvc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/10] xen/physinfo: add arm SVE arch capability and
 vector length
Thread-Topic: [PATCH 07/10] xen/physinfo: add arm SVE arch capability and
 vector length
Thread-Index: AQHZNvbF5ObUISPUqkWspwE0cSOTMa67j3YAgAzSeIA=
Date: Fri, 10 Feb 2023 15:54:19 +0000
Message-ID: <781EDC8B-B24C-431F-AB08-F2ACF64E4D4E@arm.com>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
 <20230202110816.1252419-8-luca.fancellu@arm.com>
 <f1673cb6-6f4f-be53-ef82-2ea2045533fa@suse.com>
In-Reply-To: <f1673cb6-6f4f-be53-ef82-2ea2045533fa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7389:EE_|DBAEUR03FT031:EE_|DU0PR08MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2629d8-9029-4c97-31c7-08db0b7f176e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LhOKZSbYhDEwaHQxDTV4ZGyIdRIMpYEwLS3s+op0C7L79k1AxO/RsZvMboNrEaZEsyxvdxss/r0rKoGhoj3Hgro+b2799VOWcJsdcPN1EdDTo6+RHKTYi02cBRSlBgasYwFcI23cs/rGPDyLiJGhLnXysq93ifgPV7S/YJtrJcGxn3ysIvBxaTj8EkSvi1+ugkII9+ihOvtqKrPwynVwmqIAwqDMD9hxuZVEIFp1JFMRMN7GoTxW23e3ExyLrlxq/bbukXVFFUC44MdBUfIB4BQO61nafwZCJorb7kpmKtst04Sv5iArMtzScjOuZoT/7pd8VPyHinnnOgp0bjASVwMRUVH8Bg7AlhR8Z6DtK3t+rBha9DrR0bkyBEEjrl5U+HGVNlNxSEfiBwkRLaPiuWMrgADAph2KkNPosCh3wCrd0dHhVyy4sDlYm8tJnsgY+BM88A79NrlrntOazmmM73hvOnBjqE/aPoa121pGLKLBbFL+b0qdERtilPZiU/SKJphCJnf8sereX/YPw8SCnsGvjLAkwnDnBOf3FhlYzxobHTmDjY1mn5krAioaCylQrbNa4SNSNWEs+HxSdxoD8eI8l7+i5pCh98gQjv30a/+aV6hJ1ejojbglTu0kkdZTP94bPUnotZqIsls2XaSSynGurOgOhQx6I+avP86CfeMeL5wrROdgUkKW0/VUPBmlxDKBHBM+RCqGVslSza9kxO3FfQr0QbsXDWB9+yg2o00=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199018)(6512007)(5660300002)(186003)(26005)(478600001)(122000001)(8936002)(83380400001)(53546011)(2616005)(6506007)(2906002)(71200400001)(8676002)(36756003)(41300700001)(6486002)(4326008)(6916009)(38100700002)(76116006)(66556008)(33656002)(66946007)(66476007)(66446008)(64756008)(38070700005)(91956017)(316002)(54906003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EAAC0AB52B7D140BEAE1F534F818AD6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7389
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	83f523bb-5435-43d0-4534-08db0b7f120e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O3ulop5o5+q1j5YK0mafpdkqYrb/ibFT3b6Eud2l0wKCzHSJfEv0Eyro96I/5Z2ZQBewfs8YAtbWhJg6zZKq4Ey7xViGUTG6U8t5PVd1qKRfO2TELk7nEYJj+Z9UiwayXjrx5hEZr8YDBUtPlsr65NsMTzc2LHslkPq96XLnLC8hlx57t0EMs+ZEnkRojElfxPN4jOjcWASExNv8qoUuojlJhkIZG0medg0xmaiQCtWd1FFM3XSisnHFa88zocGrXKKyqMMJOnvlAf1It1ewn+WFIUh8jtg9vgjHxAK562tE4YyhECySEHITQVcgoHKlbOr1wqRU5l1THbRygTz1XAgplyyfFDkQYlvM6r7ArK9NBxCcqdqkP1JvW/lItOI499KDm3F7oNlql26o+81593EqbuhMlcQgIBcDhUUg+LLmZvwqeLp/pYLtnsCE92ViIAck3/E0CuEWg7O1wZ+sgl2av6OL/z5wAk7C4dOgipYKT3eiJgauJj6V5TJMtFCPyNl/Icw2c/kuKz95oZoI2lQ/v1VFV/cu4jKytlt41m6M9PhkZZ6/wB+6kMcl3mdhWcYcMzajYG4FSry+NisjR3CjymST86doFEoTm0JhZXHgjKLEP7KoyeQ2UyCFWGo0LgPrL8rkJFOknKpxNNtyco3lBvoCBbzyzcgHKUTaWEiJanyY6DqC/nlR2ArCRmu3P014fMyAZMnQ/NlXxy4GRg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199018)(40470700004)(46966006)(36840700001)(6506007)(83380400001)(47076005)(5660300002)(2906002)(36756003)(26005)(186003)(40460700003)(86362001)(478600001)(53546011)(33656002)(41300700001)(6512007)(6486002)(36860700001)(81166007)(40480700001)(336012)(82310400005)(82740400003)(70206006)(4326008)(70586007)(54906003)(8936002)(8676002)(316002)(6862004)(356005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 15:54:28.4750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2629d8-9029-4c97-31c7-08db0b7f176e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9155

DQoNCj4gT24gMiBGZWIgMjAyMywgYXQgMTI6MDUsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMi4wMi4yMDIzIDEyOjA4LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gV2hlbiB0aGUgYXJtIHBsYXRmb3JtIHN1cHBvcnRzIFNWRSwgYWR2ZXJ0aXNlIHRo
ZSBmZWF0dXJlIGJ5IGEgbmV3DQo+PiBmbGFnIGZvciB0aGUgYXJjaF9jYXBhYmlsaXRpZXMgaW4g
c3RydWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gYW5kIGFkZA0KPj4gYSBuZXcgZmllbGQgImFybV9z
dmVfdmxfYml0cyIgd2hlcmUgb24gYXJtIHRoZXJlIGNhbiBiZSBzdG9yZWQgdGhlDQo+PiBtYXhp
bXVtIFNWRSB2ZWN0b3IgbGVuZ3RoIGluIGJpdHMuDQo+PiANCj4+IFVwZGF0ZSB0aGUgcGFkZGlu
Zy4NCj4+IA0KPj4gQnVtcCBYRU5fU1lTQ1RMX0lOVEVSRkFDRV9WRVJTSU9OIGZvciB0aGUgY2hh
bmdlcy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxs
dUBhcm0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGZyb20gUkZDOg0KPj4gLSBuZXcgcGF0Y2gN
Cj4+IC0tLQ0KDQpIaSBKYW4sDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcsDQoNCj4+IEhlcmUg
SSBuZWVkIGFuIG9waW5pb24gZnJvbSBhcm0gYW5kIHg4NiBtYWludGFpbmVyLCBJIHNlZSB0aGVy
ZSBpcyBubyBhcmNoDQo+PiBzcGVjaWZpYyBzdHJ1Y3R1cmUgaW4gc3RydWN0IHhlbl9zeXNjdGxf
cGh5c2luZm8sIGh3X2NhcCBpcyB1c2VkIG9ubHkgYnkgeDg2DQo+PiBhbmQgbm93IGFyY2hfY2Fw
YWJpbGl0aWVzIGFuZCB0aGUgbmV3IGFybV9zdmVfdmxfYml0cyB3aWxsIGJlIHVzZWQgb25seSBi
eSBhcm0uDQo+PiBTbyBob3cgc2hvdWxkIHdlIHByb2NlZWQgaGVyZT8gU2hhbGwgd2UgY3JlYXRl
IGEgc3RydWN0IGFyY2ggZm9yIGVhY2gNCj4+IGFyY2hpdGVjdHVyZSBhbmQgZm9yIGV4YW1wbGUg
bW92ZSBhcmNoX2NhcGFiaWxpdGllcyBpbnNpZGUgaXQgKHJlbmFtaW5nIHRvDQo+PiBjYXBhYmls
aXRpZXMpIGFuZCBldmVyeSBhcmNoIHNwZWNpZmljIGZpZWxkIGFzIHdlbGw/DQo+IA0KPiBDb3Vu
dGVyIHF1ZXN0aW9uOiBXaHkgZG9uJ3QgeW91IHVzZSAocGFydCBvZikgYXJjaF9jYXBhYmlsaXRp
ZXMgKGFuZCBub3QNCj4ganVzdCBhIHNpbmdsZSBiaXQpPyBJdCBsb29rcyB0byBiZSBlbnRpcmVs
eSB1bnVzZWQgYXQgcHJlc2VudC4gVmVjdG9yDQo+IGxlbmd0aCBiZWluZyB6ZXJvIHdvdWxkIHN1
ZmZpY2llbnRseSBpbmRpY2F0ZSBhYnNlbmNlIG9mIHRoZSBmZWF0dXJlDQo+IHdpdGhvdXQgYSBz
ZXBhcmF0ZSBib29sZWFuLg0KDQpZZXMgSSBjb3VsZCBoYXZlIHVzZWQganVzdCB0aGUgdmFsdWUg
dG8gZGV0ZXJtaW5lIGlmIHRoZSBwbGF0Zm9ybSBpcyBTVkUgY2FwYWJsZQ0Kb3Igbm90LCBidXQg
c2luY2UgdGhpcyBmaWVsZCB3YXMgdGhlcmUgKGV2ZW4gaWYgd2l0aCBubyB1c2VyKSBJIHdhcyB1
bnN1cmUgYWJvdXQNCnJlbmFtaW5nIGl0IGFuZCB1c2UgaXQgZm9yIHRoaXMgcHVycG9zZS4NCklu
IHRoZSBlbmQgSSBkaWQgd2hhdCB3YXMgbW9yZSBsb2dpYyB0byBtZSBhdCB0aGUgbW9tZW50LCBh
bmQgSSByZXNlcnZlZCBhIGZsYWcNCmluIGl0IGZvciBTVkUuDQoNCj4gDQo+IA0KPj4gKGlzIGh3
X2NhcCBvbmx5IGZvciB4ODY/KQ0KPiANCj4gSSBzdXBwb3NlIGl0IGlzLCBidXQgSSBhbHNvIGV4
cGVjdCBpdCB3b3VsZCBiZXR0ZXIgZ28gYXdheSB0aGFuIGJlIG1vdmVkLg0KPiBJdCBkb2Vzbid0
IGhvbGQgYSBjb21wbGV0ZSBzZXQgb2YgaW5mb3JtYXRpb24sIGFuZCBpdCBoYXMgYmVlbiBzdXBl
cnNlZGVkLg0KPiANCj4gUXVlc3Rpb24gaXMgKGFuZCBJIHRoaW5rIEkgZGlkIHJhaXNlIHRoaXMg
YmVmb3JlLCBwZXJoYXBzIGluIGRpZmZlcmVudA0KPiBjb250ZXh0KSB3aGV0aGVyIEFybSB3b3Vs
ZG4ndCB3YW50IHRvIGZvbGxvdyB4ODYgaW4gaG93IGhhcmR3YXJlIGFzIHdlbGwNCj4gYXMgaHlw
ZXJ2aXNvciBkZXJpdmVkIC8gdXNlZCBvbmVzIGFyZSBleHBvc2VkIHRvIHRoZSB0b29sIHN0YWNr
DQo+IChYRU5fU1lTQ1RMX2dldF9jcHVfZmVhdHVyZXNldCkuIEkgZ3Vlc3MgdGhlcmUncyBub3Ro
aW5nIHJlYWxseSBwcmVjbHVkaW5nDQo+IHRoYXQgZGF0YSB0byBjb25zaXN0IG9mIG1vcmUgdGhh
biBqdXN0IGJvb2xlYW4gZmllbGRzLg0KDQpZZXMgSSBndWVzcyB0aGF0IGluZnJhc3RydWN0dXJl
IGNvdWxkIHdvcmssIGhvd2V2ZXIgSSBkb27igJl0IGhhdmUgdGhlIGJhbmR3aWR0aCB0bw0KcHV0
IGl0IGluIHBsYWNlIGF0IHRoZSBtb21lbnQsIHNvIEkgd291bGQgbGlrZSB0aGUgQXJtIG1haW50
YWluZXJzIHRvIGdpdmUgbWUgYQ0Kc3VnZ2VzdGlvbiBvbiBob3cgSSBjYW4gZXhwb3NlIHRoZSB2
ZWN0b3IgbGVuZ3RoIHRvIFhMIGlmIHB1dHRpbmcgaXRzIHZhbHVlIGhlcmUNCm5lZWRzIHRvIGJl
IGF2b2lkZWQNCg0KPiANCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaA0KPj4g
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oDQo+PiBAQCAtMTgsNyArMTgsNyBAQA0K
Pj4gI2luY2x1ZGUgImRvbWN0bC5oIg0KPj4gI2luY2x1ZGUgInBoeXNkZXYuaCINCj4+IA0KPj4g
LSNkZWZpbmUgWEVOX1NZU0NUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDE1DQo+PiArI2Rl
ZmluZSBYRU5fU1lTQ1RMX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMTYNCj4gDQo+IFdoeT8g
WW91IC4uLg0KPiANCj4+IEBAIC0xMDQsNyArMTEwLDggQEAgc3RydWN0IHhlbl9zeXNjdGxfcGh5
c2luZm8gew0KPj4gICAgIHVpbnQzMl90IGNwdV9raHo7DQo+PiAgICAgdWludDMyX3QgY2FwYWJp
bGl0aWVzOy8qIFhFTl9TWVNDVExfUEhZU0NBUF8/Pz8gKi8NCj4+ICAgICB1aW50MzJfdCBhcmNo
X2NhcGFiaWxpdGllczsvKiBYRU5fU1lTQ1RMX1BIWVNDQVBfe1g4NixBUk0sLi4ufV8/Pz8gKi8N
Cj4+IC0gICAgdWludDMyX3QgcGFkOw0KPj4gKyAgICB1aW50MTZfdCBhcm1fc3ZlX3ZsX2JpdHM7
DQo+PiArICAgIHVpbnQxNl90IHBhZDsNCj4+ICAgICB1aW50NjRfYWxpZ25lZF90IHRvdGFsX3Bh
Z2VzOw0KPj4gICAgIHVpbnQ2NF9hbGlnbmVkX3QgZnJlZV9wYWdlczsNCj4+ICAgICB1aW50NjRf
YWxpZ25lZF90IHNjcnViX3BhZ2VzOw0KPiANCj4gLi4uIGFkZCBubyBuZXcgZmllbGRzLCBhbmQg
dGhlIG9ubHkgcHJvZHVjZXIgb2YgdGhlIGRhdGEgemVyby1maWxscyB0aGUNCj4gc3RydWN0IGZp
cnN0IHRoaW5nLg0KDQpZZXMgdGhhdCBpcyByaWdodCwgSSB3aWxsIHdhaXQgdG8gdW5kZXJzdGFu
ZCBob3cgSSBjYW4gcHJvY2VlZCBoZXJlOg0KDQoxKSByZW5hbWUgYXJjaF9jYXBhYmlsaXRpZXMg
dG8gYXJtX3N2ZV92bF9iaXRzIGFuZCBwdXQgdmVjdG9yIGxlbmd0aCB0aGVyZS4NCjIpIGxlYXZl
IGFyY2hfY2FwYWJpbGl0aWVzIHVudG91Y2hlZCwgbm8gZmxhZyBjcmVhdGlvbi9zZXR0aW5nLCBj
cmVhdGUgdWludDMyX3QgYXJtX3N2ZV92bF9iaXRzIGZpZWxkIHJlbW92aW5nIOKAnHBhZOKAnSwN
CiAgICBVc2UgaXRzIHZhbHVlIHRvIGRldGVybWluZSBpZiBTVkUgaXMgcHJlc2VudCBvciBub3Qu
DQozKSA/Pw0KDQpUaGFuayB5b3UNCg0KQ2hlZXJzLA0KTHVjYQ0KDQo+IA0KPiBKYW4NCg0KDQo=

