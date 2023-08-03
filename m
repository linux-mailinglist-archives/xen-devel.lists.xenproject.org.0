Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2BE76E771
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 13:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576280.902240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWtR-0008O3-DF; Thu, 03 Aug 2023 11:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576280.902240; Thu, 03 Aug 2023 11:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWtR-0008LV-AU; Thu, 03 Aug 2023 11:53:25 +0000
Received: by outflank-mailman (input) for mailman id 576280;
 Thu, 03 Aug 2023 11:53:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G/A=DU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRWtP-0008LP-Qt
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 11:53:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 574d587a-31f4-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 13:53:20 +0200 (CEST)
Received: from DB7PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:10:36::35)
 by AS8PR08MB9020.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 11:53:17 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::b9) by DB7PR05CA0022.outlook.office365.com
 (2603:10a6:10:36::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Thu, 3 Aug 2023 11:53:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.44 via Frontend Transport; Thu, 3 Aug 2023 11:53:16 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Thu, 03 Aug 2023 11:53:16 +0000
Received: from e434bc8d1354.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2B5327BC-9E21-44B9-BD14-C39F036650B0.1; 
 Thu, 03 Aug 2023 11:52:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e434bc8d1354.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Aug 2023 11:52:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6133.eurprd08.prod.outlook.com (2603:10a6:20b:298::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 11:52:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 11:52:34 +0000
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
X-Inumbo-ID: 574d587a-31f4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOgLIG2ymWt56P5HO3TD91hHwe6zt9JbXfvELR5x7gg=;
 b=6h/tgrMRY1qtZaNmaReyIq8sezZruk6VW8zOpjIbPtk7ntBdo4nrYUE/duj6YhS6d3dMPlapSXhdqzEdJnpnrJWE0WGGyCQrL6VKCYlQWh6HdEm0/pscXOMtdGiQB6AXtgzxXShknpmTONGgp8uXlMfG9iqUO4WTSLxU5PmKFgw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12ca26ff7673410d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtQ1qgFMZy4l3pIJITyJaUAIEI5Wu2M0l9gWOODnTCPI0prIe+JXiBo/cwKzAP7pmQQDukLE3VheK4CjtTyQP5ID22ObHLlZwPWbbyoLh0NZUwpc5onlI2EX/X8PuQCx+WY5Ov3NfOK0OChmaHYCeVRnG7tHbpYixXGWRAJxlhv5kmgopsfwGzEok1IMfOatE5mVkpFnvIMPMECzgAI3OZnNo7AbQsVK/J/U/M4GGHfKIFT+yqonc0dHMLgkSKAm7d2DBXFHJ55XYy7UUS2zrWOn9xEB1SmI2D5XSQYF3sd48gQm8rYa2CXUVjTw7ZB5KdYAK9MPhsZgRj7ccw/DLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOgLIG2ymWt56P5HO3TD91hHwe6zt9JbXfvELR5x7gg=;
 b=NsuJ1qcCW0kdK0PTO8z9sXB21AsepAIAN+DrJgGWlpOy9N7mD75Vgt04fZA10Nn1sAOp3oMuNQcnZRWg17l3idi0uWbxD5RITjp3+e0mO9w1e+IVC7ScVX4LDtrQRs5qmzEedfmtqRF9gTRvnB6Fnj0M3ZhklDoEIMYsVNsneKgnCfsTvVhAkYXyT0KkhLncNcR3qReRmCbcX9rxpJwvaoXdzU/SrEY1wZOQR75zZepUPgOyq0Kl5eh3m3roGeDiNWzlwQ+LCWe8SzJ4GFk3bhO2UjB4ARGrS+p57wyJ6LuUAWFsXFXSsev2XyAUKGwS2HAXWdckz38nEfVFbN1thg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOgLIG2ymWt56P5HO3TD91hHwe6zt9JbXfvELR5x7gg=;
 b=6h/tgrMRY1qtZaNmaReyIq8sezZruk6VW8zOpjIbPtk7ntBdo4nrYUE/duj6YhS6d3dMPlapSXhdqzEdJnpnrJWE0WGGyCQrL6VKCYlQWh6HdEm0/pscXOMtdGiQB6AXtgzxXShknpmTONGgp8uXlMfG9iqUO4WTSLxU5PmKFgw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] xen/string: add missing parameter names
Thread-Topic: [XEN PATCH v2] xen/string: add missing parameter names
Thread-Index: AQHZxeRL9pSVXV1k9k69k8jE/HqUO6/YXqGAgAAVuwCAAAHJgA==
Date: Thu, 3 Aug 2023 11:52:34 +0000
Message-ID: <4FE67D84-A5AC-4EA1-BCF4-212E4B916BD2@arm.com>
References:
 <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com>
 <B1F3B24C-15FC-4A0F-BFB9-8C3C33E8FEB5@arm.com>
 <e2ab464c-f14a-4d7e-ba25-c88fad9c5d23@xen.org>
In-Reply-To: <e2ab464c-f14a-4d7e-ba25-c88fad9c5d23@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6133:EE_|DBAEUR03FT028:EE_|AS8PR08MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: d8238770-2e36-41d3-b35d-08db9418399e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OMtRxY3PmtFUk8x/26LsMcgkJMSM3w7wU497EfmkogEalaW0BYSyFh/xrT9nUSrlgkbLdFiageES36a6XI/4H2VRO1JymDbHePWt2sIkrcSXRNsV7/dowh8/nhj+uHl2+xalvY8WZrhxQM1ABXsVrhf88qVEeaID5baaHTgaogaNfnYH8VqUeTwVNY5HN6vjpDkgNR7XvRsei4k4U3Vscq2OBOjR6sFB1lGVcmmv4nDcqUhrBLwJu9UWvS2wT9j0riMeQ61aNe4qC9wtM1Awrw3JMk0UK7AQ2DjvI8jL1tq6oylJlHneXnfbxpmAewjJYVreIlnMa41rt+itDXhcwQBQiMWui4ElgiED+xtNZozwhwVRnsg459/yG+eCG6lqNxIpWgVvzgyoU/nKnPWk/BNd87Yujvv/AZjser+q1V3sHAv+V4VA4goyInzIH1TCuiv9AadU/joJxXD8EKhjH70KD2e6SkfigpclHZC0VR0al4vfgkS96GEFI6THS2RXZS0rR6neaGxcMjZbmtPoibikdEC1nXlfFKVvpiZuOqwP+rN3UtNwAM608bELgIr4bxJNl2/e2Tx9k7KVHKZsxoLKVRLvO51uRmL4KsHsWYI7Jx22EoOWVaJZwuu5Gclaj2Hc9uzepzw3lUqUUSqQtQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(2616005)(53546011)(83380400001)(6506007)(26005)(186003)(41300700001)(2906002)(91956017)(66946007)(76116006)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(316002)(8676002)(8936002)(6486002)(71200400001)(6512007)(478600001)(54906003)(38100700002)(122000001)(33656002)(86362001)(36756003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2177AE1F55BEF46A76F0EE4632FD464@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6133
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b977345-9476-4407-1f31-08db94182024
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bfOdzeNqtgx1YVnG8JSdp3wbYKMvAhZKLv5QwCe/JyzGaKlVX17XIq7Z56HkuvX/oujWb6Y0kaLqpDvP57EH0EW2q1TYhtFLaekbqZFPzTkl2SrRt5pFkC5Non71T4itUav+wdaaAvU9ZWs+8dEFO8A4SCnLW0+GK2/5JfvQMakHGvWcpvhieE7TGZuPI9M/SpBVozrkmyvEIBVvK4Cp+RLrDDF2WYvjR9jS6/l4PDRZJPoeogFrZRPjDGFE4bT1kNRccEjy7KnC62EKAFeXAdSJqBb5Gmv6fMqfvFJ2cUIyHutb3UJHxz8SftFMaiH9WkkdEP3havmWEy9iUxvP026hgBTiqnc5TNrGUVibDxrdopqE2rT8J4oxO9P7wsPf/F20gDe5dluHIUwZL+syuT9RUcOpGzgrj/UjUd+gjfPior2T4waAGAADZN8nUmNqUjaBPST91wZ3tkiiC9sARs4eANPk7uMFC/YGnLcLiZCTKGiiWQpU1cVCy+Hljm5VpCMbKU/r6a6Kxm7e8urbg0EOuuDr2YGRivovUOE/M0BLO4Z/C7v4EtFu1h4cr2ktIcOA2U1NUBaXoV7SXbYHp2gNJk+P1WUPpPzirSGoQdEKU4WjOUMhp9fZGT97pbr/wDuznC/mieslY/QpNy7BKhfNFD9qhmYDR3axJJNoqxfn2HOjgVFxx0W4TNjpk408V/e8bkzlZ5hezgO0jIXtb9NB8861EptZXLtG8rDGOAEHonqHOfIqhdCogfIMIHAx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(36756003)(86362001)(33656002)(82740400003)(40460700003)(40480700001)(54906003)(478600001)(356005)(81166007)(47076005)(2616005)(6506007)(336012)(186003)(26005)(83380400001)(53546011)(8676002)(8936002)(6862004)(41300700001)(6512007)(6486002)(316002)(36860700001)(5660300002)(4326008)(70586007)(2906002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 11:53:16.9572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8238770-2e36-41d3-b35d-08db9418399e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9020

DQoNCj4gT24gMyBBdWcgMjAyMywgYXQgMTI6NDYsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IE9uIDAzLzA4LzIwMjMgMTE6MjgsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gMyBBdWcgMjAyMywgYXQgMDk6MjYsIEZlZGVyaWNv
IFNlcmFmaW5pIDxmZWRlcmljby5zZXJhZmluaUBidWdzZW5nLmNvbT4gd3JvdGU6DQo+Pj4gDQo+
Pj4gQWRkIG1pc3NpbmcgcGFyYW1ldGVyIG5hbWVzIHRvIGFkZHJlc3MgdmlvbGF0aW9uIG9mIE1J
U1JBIEM6MjAxMg0KPj4+IHJ1bGUgOC4yICgiRnVuY3Rpb24gdHlwZXMgc2hhbGwgYmUgaW4gcHJv
dG90eXBlIGZvcm0gd2l0aCBuYW1lZA0KPj4+IHBhcmFtZXRlcnMiKS4NCj4+PiANCj4+PiBObyBm
dW5jdGlvbmFsIGNoYW5nZXMuDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogRmVkZXJpY28gU2Vy
YWZpbmkgPGZlZGVyaWNvLnNlcmFmaW5pQGJ1Z3NlbmcuY29tPg0KPj4+IC0tLQ0KPj4+IENoYW5n
ZXMgaW4gdjI6DQo+Pj4gIC0gbWVtc2V0KCkgYWRqdXN0ZWQuDQo+Pj4gLS0tDQo+Pj4geGVuL2lu
Y2x1ZGUveGVuL3N0cmluZy5oIHwgNDIgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPj4+IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlv
bnMoLSkNCj4+PiANCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3N0cmluZy5oIGIv
eGVuL2luY2x1ZGUveGVuL3N0cmluZy5oDQo+Pj4gaW5kZXggYjRkMjIxN2E5Ni4uZTkxZTMxMTJl
MCAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3RyaW5nLmgNCj4+PiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vc3RyaW5nLmgNCj4+PiBAQCAtMTIsMjcgKzEyLDI3IEBADQo+Pj4gI2Rl
ZmluZSBzdHJuY3B5IF9feGVuX2hhc19ub19zdHJuY3B5X18NCj4+PiAjZGVmaW5lIHN0cm5jYXQg
X194ZW5faGFzX25vX3N0cm5jYXRfXw0KPj4+IA0KPj4+IC1zaXplX3Qgc3RybGNweShjaGFyICos
IGNvbnN0IGNoYXIgKiwgc2l6ZV90KTsNCj4+PiAtc2l6ZV90IHN0cmxjYXQoY2hhciAqLCBjb25z
dCBjaGFyICosIHNpemVfdCk7DQo+Pj4gLWludCBzdHJjbXAoY29uc3QgY2hhciAqLCBjb25zdCBj
aGFyICopOw0KPj4+IC1pbnQgc3RybmNtcChjb25zdCBjaGFyICosIGNvbnN0IGNoYXIgKiwgc2l6
ZV90KTsNCj4+PiAtaW50IHN0cmNhc2VjbXAoY29uc3QgY2hhciAqLCBjb25zdCBjaGFyICopOw0K
Pj4+IC1pbnQgc3RybmNhc2VjbXAoY29uc3QgY2hhciAqLCBjb25zdCBjaGFyICosIHNpemVfdCk7
DQo+Pj4gLWNoYXIgKnN0cmNocihjb25zdCBjaGFyICosIGludCk7DQo+Pj4gLWNoYXIgKnN0cnJj
aHIoY29uc3QgY2hhciAqLCBpbnQpOw0KPj4+IC1jaGFyICpzdHJzdHIoY29uc3QgY2hhciAqLCBj
b25zdCBjaGFyICopOw0KPj4+IC1zaXplX3Qgc3RybGVuKGNvbnN0IGNoYXIgKik7DQo+Pj4gLXNp
emVfdCBzdHJubGVuKGNvbnN0IGNoYXIgKiwgc2l6ZV90KTsNCj4+PiAtY2hhciAqc3RycGJyayhj
b25zdCBjaGFyICosIGNvbnN0IGNoYXIgKik7DQo+Pj4gLWNoYXIgKnN0cnNlcChjaGFyICoqLCBj
b25zdCBjaGFyICopOw0KPj4+IC1zaXplX3Qgc3Ryc3BuKGNvbnN0IGNoYXIgKiwgY29uc3QgY2hh
ciAqKTsNCj4+PiAtDQo+Pj4gLXZvaWQgKm1lbXNldCh2b2lkICosIGludCwgc2l6ZV90KTsNCj4+
PiAtdm9pZCAqbWVtY3B5KHZvaWQgKiwgY29uc3Qgdm9pZCAqLCBzaXplX3QpOw0KPj4+IC12b2lk
ICptZW1tb3ZlKHZvaWQgKiwgY29uc3Qgdm9pZCAqLCBzaXplX3QpOw0KPj4+IC1pbnQgbWVtY21w
KGNvbnN0IHZvaWQgKiwgY29uc3Qgdm9pZCAqLCBzaXplX3QpOw0KPj4+IC12b2lkICptZW1jaHIo
Y29uc3Qgdm9pZCAqLCBpbnQsIHNpemVfdCk7DQo+Pj4gLXZvaWQgKm1lbWNocl9pbnYoY29uc3Qg
dm9pZCAqLCBpbnQsIHNpemVfdCk7DQo+Pj4gK3NpemVfdCBzdHJsY3B5KGNoYXIgKmRlc3QsIGNv
bnN0IGNoYXIgKnNyYywgc2l6ZV90IHNpemUpOw0KPj4+ICtzaXplX3Qgc3RybGNhdChjaGFyICpk
ZXN0LCBjb25zdCBjaGFyICpzcmMsIHNpemVfdCBzaXplKTsNCj4+PiAraW50IHN0cmNtcChjb25z
dCBjaGFyICpjcywgY29uc3QgY2hhciAqY3QpOw0KPj4+ICtpbnQgc3RybmNtcChjb25zdCBjaGFy
ICpjcywgY29uc3QgY2hhciAqY3QsIHNpemVfdCBjb3VudCk7DQo+Pj4gK2ludCBzdHJjYXNlY21w
KGNvbnN0IGNoYXIgKnMxLCBjb25zdCBjaGFyICpzMik7DQo+Pj4gK2ludCBzdHJuY2FzZWNtcChj
b25zdCBjaGFyICpzMSwgY29uc3QgY2hhciAqczIsIHNpemVfdCBsZW4pOw0KPj4+ICtjaGFyICpz
dHJjaHIoY29uc3QgY2hhciAqcywgaW50IGMpOw0KPj4+ICtjaGFyICpzdHJyY2hyKGNvbnN0IGNo
YXIgKnMsIGludCBjKTsNCj4+PiArY2hhciAqc3Ryc3RyKGNvbnN0IGNoYXIgKnMxLCBjb25zdCBj
aGFyICpzMik7DQo+Pj4gK3NpemVfdCBzdHJsZW4oY29uc3QgY2hhciAqcyk7DQo+Pj4gK3NpemVf
dCBzdHJubGVuKGNvbnN0IGNoYXIgKnMsIHNpemVfdCBjb3VudCk7DQo+Pj4gK2NoYXIgKnN0cnBi
cmsoY29uc3QgY2hhciAqY3MsIGNvbnN0IGNoYXIgKmN0KTsNCj4+PiArY2hhciAqc3Ryc2VwKGNo
YXIgKipzLCBjb25zdCBjaGFyICpjdCk7DQo+Pj4gK3NpemVfdCBzdHJzcG4oY29uc3QgY2hhciAq
cywgY29uc3QgY2hhciAqYWNjZXB0KTsNCj4+PiArDQo+Pj4gK3ZvaWQgKm1lbXNldCh2b2lkICpz
LCBpbnQgYywgc2l6ZV90IGNvdW50KTsNCj4+PiArdm9pZCAqbWVtY3B5KHZvaWQgKmRlc3QsIGNv
bnN0IHZvaWQgKnNyYywgc2l6ZV90IGNvdW50KTsNCj4+IFRoZXJlIGlzIGEgY29tbWVudCBpbiBh
cmNoL2FybS9ybTMyL2xpYi9tZW1jcHkuUyB3aXRoIHRoaXM6DQo+PiAvKiBQcm90b3R5cGU6IHZv
aWQgKm1lbWNweSh2b2lkICpkZXN0LCBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBuKTsgKi8NCj4+
PiArdm9pZCAqbWVtbW92ZSh2b2lkICpkZXN0LCBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBjb3Vu
dCk7DQo+PiBUaGVyZSBpcyBhIGNvbW1lbnQgaW4gYXJjaC9hcm0vcm0zMi9saWIvbWVtbW92ZS5T
IHdpdGggdGhpczoNCj4+ICAqIFByb3RvdHlwZTogdm9pZCAqbWVtbW92ZSh2b2lkICpkZXN0LCBj
b25zdCB2b2lkICpzcmMsIHNpemVfdCBuKTsNCj4+PiAraW50IG1lbWNtcChjb25zdCB2b2lkICpj
cywgY29uc3Qgdm9pZCAqY3QsIHNpemVfdCBjb3VudCk7DQo+Pj4gK3ZvaWQgKm1lbWNocihjb25z
dCB2b2lkICpzLCBpbnQgYywgc2l6ZV90IG4pOw0KPj4+ICt2b2lkICptZW1jaHJfaW52KGNvbnN0
IHZvaWQgKnMsIGludCBjLCBzaXplX3Qgbik7DQo+PiBAU3RlZmFubzogd291bGQgaXQgbWFrZSBz
ZW5zZSB0byByZW1vdmUgaXQgYXMgcGFydCBvZiB0aGlzIHBhdGNoIG9yIG1heWJlIG5vdD8NCj4g
DQo+IFRoZXkgYXJlIGEgdmVyYmF0aW0gY29weSBvZiB0aGUgTGludXggY29kZS4gU28gSSB3b3Vs
ZCByYXRoZXIgbm8gdG91Y2ggaXQuDQoNCk9oIEkgc2VlISBUaGFuayB5b3UgZm9yIHBvaW50aW5n
IHRoYXQgb3V0LCB0aGVuIEnigJltIHdvbmRlcmluZyBpZiBpdOKAmXMgdGhlcmUgYSByZWFzb24g
d2h5IHdlDQphcmUgdXNpbmcg4oCYY291bnTigJkgaW5zdGVhZCBvZiDigJlu4oCZIGFzIHRoaXJk
IHBhcmFtZXRlciBuYW1lLCBJIGtub3cgU3RlZmFubyBzdWdnZXN0ZWQgdGhhdCwgc28NCkl04oCZ
cyBqdXN0IGEgY3VyaW9zaXR5LiBNYXliZSBpdOKAmXMgZm9yIGNsYXJpdHk/DQoNCj4gDQo+IENo
ZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

