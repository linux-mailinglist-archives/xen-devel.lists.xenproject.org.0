Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB736417067
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195277.347905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTia1-00042s-UE; Fri, 24 Sep 2021 10:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195277.347905; Fri, 24 Sep 2021 10:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTia1-000404-QD; Fri, 24 Sep 2021 10:37:21 +0000
Received: by outflank-mailman (input) for mailman id 195277;
 Fri, 24 Sep 2021 10:37:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTia0-0003zy-8R
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:37:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64441348-1d23-11ec-babb-12813bfff9fa;
 Fri, 24 Sep 2021 10:37:19 +0000 (UTC)
Received: from DU2PR04CA0337.eurprd04.prod.outlook.com (2603:10a6:10:2b4::35)
 by VE1PR08MB5598.eurprd08.prod.outlook.com (2603:10a6:800:1a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 10:37:17 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::5) by DU2PR04CA0337.outlook.office365.com
 (2603:10a6:10:2b4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Fri, 24 Sep 2021 10:37:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:37:17 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Fri, 24 Sep 2021 10:37:17 +0000
Received: from 9cc27ec6097c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F98A5DFB-0504-4CC3-A116-712A8CE4C00D.1; 
 Fri, 24 Sep 2021 10:37:05 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cc27ec6097c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 10:37:05 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBAPR08MB5559.eurprd08.prod.outlook.com (2603:10a6:10:1a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 10:37:05 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:37:05 +0000
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
X-Inumbo-ID: 64441348-1d23-11ec-babb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0elbpzxYorW87yCM8WsQtWw5QXTwy1oDV/rL89rzRo=;
 b=OA7QbL01mk/vXpiZeyFFrH6lecgBnsFuLLCG6KbUxcF9+3G6Pgelb/s9Ea53omlSqRuiepwd3zbYrRrIHa2iTAW4iyc163l7Ebuno8m0fvme6pYs+zdZENyhpjir0pNAFQqMysq4alP2MbqycsTSzuezTKAfXoonapoo7ISSnJg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4Tc9A0JHxgKbbwUY5x36opJBfk65B0dNg6vTKMNcNgUYwOKK2G97wknBXw7b8Y9izsjJrb4quXZEuyCj5Utvq5v2rLKZx2HGoSapMWhXo82In7wAPx8/QoN2m51NCpBcZlKPxLPQ7f0y1dLEMriXL303ebwVMEc10wtIW5oDMd/lzlfj5bNkCTzwM/b8P/HNn70uOgvF5I9mJTlH5UW9JZ/4wbu6NXvajcTSc+9j/qbWOKcrDsKv6zaGwLdZvLmzJlD6OKMF4VUEf/bXXroMao4QvxWSvBm+hjfKIZ3nFCGj+y2bPiNdMD7uT4dOjznnB+6nCT1KBpnjwPOYPSoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=B0elbpzxYorW87yCM8WsQtWw5QXTwy1oDV/rL89rzRo=;
 b=CC+Kr1IZvrfCt4f01sd1yrALPz6IUtRtHKxTD80Pe+zwjCIPGxiFt6PnoXedDEedLw8ukPVAxgNNxyaMkZvowcBoaRlode2/ZhuxbdGPfTy0t7bh4dmNnmMlcAMcZgKBYtWhp8kXJAoQSSFAu9HdA7NCxMy3GLxG7F8GnSuM7pkq/Yvicavu0rqRKBvlxbAYBlP9/D8Ck6u31H4rHybtSAgklFnbTFlUv3kLjAcVR9/1IGMww8YxFqEBT9IGICRRq13jDJysMDIcsVWwLhGhKgBZDns94vfP8ThCiCErwaoGz1q8w7Ss0qZrvWJ93ONP42jK3erX6U4JqderYij9XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0elbpzxYorW87yCM8WsQtWw5QXTwy1oDV/rL89rzRo=;
 b=OA7QbL01mk/vXpiZeyFFrH6lecgBnsFuLLCG6KbUxcF9+3G6Pgelb/s9Ea53omlSqRuiepwd3zbYrRrIHa2iTAW4iyc163l7Ebuno8m0fvme6pYs+zdZENyhpjir0pNAFQqMysq4alP2MbqycsTSzuezTKAfXoonapoo7ISSnJg=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
Thread-Topic: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
Thread-Index: AQHXsHM4CZyvsR6BnEO/IHEJe48Inquy/CcAgAADDZA=
Date: Fri, 24 Sep 2021 10:37:04 +0000
Message-ID:
 <DB9PR08MB6857B7C19C333E03397F762A9EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-37-wei.chen@arm.com>
 <a3d3db98-420a-79a2-97a7-d332aee5b531@suse.com>
In-Reply-To: <a3d3db98-420a-79a2-97a7-d332aee5b531@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6B42B8AECBE203488B7B327700F11857.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 028caed2-35ac-4560-b41a-08d97f4747da
x-ms-traffictypediagnostic: DBAPR08MB5559:|VE1PR08MB5598:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB55982DBA16EA00E173E3DFD69EA49@VE1PR08MB5598.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VCTTitALY0+iS9YbEHbLoQvf8XnhkeA2fX+Ru5vguRd89I3dQkjp9xsWaqaofaWvd6Q1Pj+yB10dQbL+KBD8os27frqLhzR+ueuprViPVazdte9HlqibsaAGR0hYZ/SlanBBmgDlcjXWBIXFrAIsU9RgM3ejAFpT7Ek4VM3HJM+lqBZU7tkbP+g0KMFsB7owcHRJnC8sI6JFPh3v1J1aL3wVmdz5Kp3vFncI2jibYA3q98AQ82fkTiQplWgy+AWlR7tzafEAHHZpDLS7h9YhJkfF96TnWWtVf7Ko6QOFIZxZqExEYcS+1aIC9s+9jqdm/wqbDTd7QQBvns14MhY3ZlAkvtwrTnULi2+p8ePAgOgq47mTVIm6bOxa3Nnf21YcyreKZh2LD3tbBznfqcSpVsckI7vhl4Xar6AjQTuojWVwqfcMKT9nknbKYuGwjbAEFXokMKXOr9Bkx6iUrtc1KelvF3KNcHfke2T3eFIOsvZlG4BUc1eVKW/59GrsjAUdW2SjJy+xHVM6qbOTDUjUmygLgS1pBN9Fb0/MKgI2eZ8EKgyVtLvDRpCbwLTL4F+Lvfbzdaym4BvaPZylj860KI9RJM6iia226WpoWLWgMVAKuZLg0qoz7oaysoOm3yAOFXohMPc3DT3/3FM5yMzTGR9jFDwj1ZlcW4yI0TZubSgUjTI7ru+/tt6Gic4AnLSWn4J7xvtFP5CbuUJD5mucTQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(4326008)(38070700005)(508600001)(66476007)(83380400001)(26005)(8676002)(186003)(2906002)(38100700002)(71200400001)(6916009)(6506007)(54906003)(7696005)(8936002)(55016002)(86362001)(316002)(33656002)(52536014)(66446008)(53546011)(5660300002)(9686003)(66556008)(66946007)(76116006)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5559
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5d78897-f733-490a-9437-08d97f47407a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	doqRvpmUzhxM4Qq3Q1Sz8IT0/iFv15/1hYN16dTBImseUGoAvT6rEgCPHNkaADRU+8JPbq7ysY9BaDhH35zKDV8tKMj9MNa6+pfBM9HdPwJku/w35Gp/KQXn+6I3omm61kCmfzix2G+4pkswsj5qnT5hnYFtg/R58yyQPkoIDt9yfjOuKVE2bSx4VcPlhTBCPsxBOKD5RRmDsW1KDVZnsIeYM5cBTu0IwwJRLKPLTDsEN9V5Ii8ic13Y1E9gdw8D81ae8HOv3xjtoiyjhIUJ5tcg2XS3N4V+VHXvNouEO/31ZbQXLje1UcvGOCLsB/M22l1l3CQXN83L4I4/lJWTqpIrkhhWhxWjF3IZQyiK39ZG93xXaSk/lUcmYpsg8NG2GIPayM4QPtjyH3PE3OIcpqpr+ZGWGMGNC8KHm8cO+CC5HkAUdBigWAnYCN4kwsI7vkCIb77JrwqnNrhXaYTDXlEFeoS0uqwUcj70odI+Ly22rpcy2AdDhnELRb9rVHfFDECcSjFiTgJXmR1lC++5eH4be7ThlWmb5gVzn5LgHcmE2PLx11yVDw72ehBir5cXbxgkGmHe4yneqnfjzY10VYirU2Bo9a09tZivSVdVHtduG2GJoeqSy1gHxvauYbAMIsuWbmrrK4+Ooa6RDtsoskOKZ21VtrmaKi52Nm9HmiI6o5hnvpNtWD+Uz1JjNZ+Sj2r997cOPBL4A2tyr0D0JQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(53546011)(81166007)(6506007)(47076005)(7696005)(70586007)(33656002)(508600001)(4326008)(6862004)(52536014)(9686003)(8676002)(70206006)(336012)(5660300002)(26005)(82310400003)(186003)(356005)(316002)(54906003)(83380400001)(2906002)(86362001)(36860700001)(8936002)(55016002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:37:17.4486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 028caed2-35ac-4560-b41a-08d97f4747da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5598

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDnmnIgyNOaXpSAxODoyNg0KPiBUbzogV2Vp
IENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBz
c3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDM2LzM3XSB4ZW4vYXJtOiBQcm92aWRlIEtjb25maWcgb3B0aW9ucyBmb3IgQXJtIHRvDQo+
IGVuYWJsZSBOVU1BDQo+IA0KPiBPbiAyMy4wOS4yMDIxIDE0OjAyLCBXZWkgQ2hlbiB3cm90ZToN
Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9L
Y29uZmlnDQo+ID4gQEAgLTM0LDYgKzM0LDE3IEBAIGNvbmZpZyBBQ1BJDQo+ID4gIAkgIEFkdmFu
Y2VkIENvbmZpZ3VyYXRpb24gYW5kIFBvd2VyIEludGVyZmFjZSAoQUNQSSkgc3VwcG9ydCBmb3Ig
WGVuDQo+IGlzDQo+ID4gIAkgIGFuIGFsdGVybmF0aXZlIHRvIGRldmljZSB0cmVlIG9uIEFSTTY0
Lg0KPiA+DQo+ID4gKyBjb25maWcgREVWSUNFX1RSRUVfTlVNQQ0KPiA+ICsJZGVmX2Jvb2wgbg0K
PiA+ICsJc2VsZWN0IE5VTUENCj4gDQo+IFR3byBuaXRzIGhlcmU6IFRoZXJlJ3MgYSBzdHJheSBi
bGFuayBvbiB0aGUgZmlyc3QgbGluZSwgYW5kIHlvdQ0KPiBhcHBlYXIgdG8gbWVhbiBqdXN0ICJi
b29sIiwgbm90ICJkZWZfYm9vbCBuIiAodGhlcmUncyBubyBwb2ludA0KPiBpbiBoYXZpbmcgZGVm
YXVsdHMgZm9yIHNlbGVjdC1vbmx5IG9wdGlvbnMpLg0KPiANCg0KT2sNCg0KPiA+ICtjb25maWcg
QVJNX05VTUENCj4gPiArCWJvb2wgIkFybSBOVU1BIChOb24tVW5pZm9ybSBNZW1vcnkgQWNjZXNz
KSBTdXBwb3J0IChVTlNVUFBPUlRFRCkiIGlmDQo+IFVOU1VQUE9SVEVEDQo+ID4gKwlzZWxlY3Qg
REVWSUNFX1RSRUVfTlVNQSBpZiBIQVNfREVWSUNFX1RSRUUNCj4gPiArCS0tLWhlbHAtLS0NCj4g
DQo+IEFuZCBhbm90aGVyIG5pdCBoZXJlOiBXZSB0cnkgdG8gbW92ZSBhd2F5IGZyb20gIi0tLWhl
bHAtLS0iLCB3aGljaA0KPiBpcyBubyBsb25nZXIgc3VwcG9ydGVkIGJ5IExpbnV4J2VzIG5ld2Vy
IGtjb25maWcuIFBsZWFzZSB1c2UganVzdA0KPiAiaGVscCIgaW4gbmV3IGNvZGUuDQo+IA0KDQpU
aGFua3MsIEkgd2lsbCBkbyBpdC4NCg0KPiBKYW4NCg0K

