Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A304B508411
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 10:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309001.524953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh645-0004Ba-FD; Wed, 20 Apr 2022 08:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309001.524953; Wed, 20 Apr 2022 08:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh645-00049j-Bh; Wed, 20 Apr 2022 08:51:57 +0000
Received: by outflank-mailman (input) for mailman id 309001;
 Wed, 20 Apr 2022 08:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcYK=U6=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nh642-00049Z-UF
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 08:51:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f707463-c087-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 10:51:52 +0200 (CEST)
Received: from DU2PR04CA0073.eurprd04.prod.outlook.com (2603:10a6:10:232::18)
 by DB8PR08MB5244.eurprd08.prod.outlook.com (2603:10a6:10:e6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 08:51:50 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::8d) by DU2PR04CA0073.outlook.office365.com
 (2603:10a6:10:232::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 20 Apr 2022 08:51:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 08:51:50 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Wed, 20 Apr 2022 08:51:50 +0000
Received: from f76dc26750c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75A265C8-E52E-4A11-92B1-A846EC45A04D.1; 
 Wed, 20 Apr 2022 08:51:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f76dc26750c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Apr 2022 08:51:44 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB4429.eurprd08.prod.outlook.com (2603:10a6:803:100::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 08:51:42 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%7]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 08:51:42 +0000
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
X-Inumbo-ID: 1f707463-c087-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag9sMdIW+eSpTefTYnIcUxUWvT7sMU2kL25E7VpC+jg=;
 b=qA1Lhoqy/LHowgGJFjIbaHtf49fgbW1u+2kI1gXbeOfp4QdchyOKr3uvQEic0uHc/HUwGPTLii8+dhwzIQoZqH/HIr6LqPmhgxHXQXEWlLfrpOU+d1vE+8Pdd+joqSAnyRZXYoMKwGK5Pf5XjZrRPAIAyYAl0v+bXTWiYoxwLYw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY/JQC14i9/cedOFIamqvWiFdXJDyvAY80gSUQciC8ThhJ6TnW/Zuj524ZaqEmeyg972ZZLiZw0IRXO35tgRTLHpWGGvAbHWrXMx0hmO04qJLCsFB6YfixpQFmSOUmqRXvnYu85LoFbUOJKseWqbvTpqI48Zobise63D+WzNPxIz380ZxELcRwa3GZceMX7e9eZh7tkaAf2N/aVMzFWd9kJNgOokE3ifC9jLIC3/nACq3OfS6DxXKpguZU/toTesNpXRqzMvfIygInlTRMMDxO/5myKKVwdzpHhG0Jjz3pt8WdK5SmRke0Z88rLW8tm92+TS0oIW2SEs7TLTY9Cevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag9sMdIW+eSpTefTYnIcUxUWvT7sMU2kL25E7VpC+jg=;
 b=XklvlfJvAgupJblcMzsCSwytOPyLkh4Q8RjzI3iQRO529ybJgEDHEsOGZuN3I9N9m037PKV9OJ3QB0Gqu0EI0pyxBgbss4ljYkwAZWDNVXUmx2lhcs2hqXRx4//VUYSNDAG9xBMkoFNixgs3x0/0WTD60/atDhXX2j97alw95Hc00S2ZW+US8bigL3LTSNIJNfWDdcsDYL8p8UgXugtgE7IswLIuDlclnm20EYwjX1ApzEGZEJwJ5I0OjOeXgQ7MeeHrOyGHgAGN2gxI3yXAMBnDJ2cw3DwWYEYGd6E5KmhWFc3gRJHa1RZAczvKUvx2074bykGQmnQPdEwhb9aHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag9sMdIW+eSpTefTYnIcUxUWvT7sMU2kL25E7VpC+jg=;
 b=qA1Lhoqy/LHowgGJFjIbaHtf49fgbW1u+2kI1gXbeOfp4QdchyOKr3uvQEic0uHc/HUwGPTLii8+dhwzIQoZqH/HIr6LqPmhgxHXQXEWlLfrpOU+d1vE+8Pdd+joqSAnyRZXYoMKwGK5Pf5XjZrRPAIAyYAl0v+bXTWiYoxwLYw=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
Thread-Topic: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
Thread-Index: AQHYNQ8JUHwL/QpeQ0iCIDnkwGGL/6zmznEAgBHpDbA=
Date: Wed, 20 Apr 2022 08:51:41 +0000
Message-ID:
 <DU2PR08MB73254E135A19B413CDC14DCFF7F59@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-7-Penny.Zheng@arm.com>
 <c4a3fb77-1cab-aacf-a2a5-3702f9c4ab97@xen.org>
In-Reply-To: <c4a3fb77-1cab-aacf-a2a5-3702f9c4ab97@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 400414F15EB49247AB5163A93FD79E88.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a4dd8eeb-c449-4420-806d-08da22ab0282
x-ms-traffictypediagnostic:
	VI1PR08MB4429:EE_|DB5EUR03FT014:EE_|DB8PR08MB5244:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB524445FA5A2DD078DC50E855F7F59@DB8PR08MB5244.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WPITMJaUAlYL5f1r6wh1fcw/jUBDQtQvyud0EQl9xEU5/Gr3E9bfvzdUOeFQTpg/TU/T7wqOTI0WARWhm4+Pd5ZWwrwZmckxtebuXiGg/CENFCcUjWPYwR90c5JIYhD26REFLnY8B8mjD3eitFNWwd9mdTtsuFopkw+DOCafSPJxYBEa2VTd6f92KbMom27M0OKCqew57lFo8A2MWCCM6vifKyWmyUzOpNSnjXPlFhVKHZLomruM1RsrrWrPsgyv+fmakKs19D4TJgAUTeHGvhM3lL8gP0Dn+lLfe3pD+6QYMwUn8W0tWA+WoiU7+kXZMeiwlVgNZnEjve6iTbVbURBDuEKtoqHVlCkY+F5xRstHKReV/g7j3DYqFyXvMySCpgzxDHvQjv3JxpTu3fvcMZxYTqmN56QN/39eMqHa+/bTLTZN/z/4MQYXNh/tpiGW2IbobGYYIJzOtSz/FdocX6Qtl/C4dHI4IELPCTmmWW4xUh8Y1KGBQghxWRCS1FdA1WIGOOO93z0Ot4hiebkLCqUqNuUm8CvkpyllDIG2eRHYc94nm9lFx1Nb4kxPTHn6HqXIpDG22HNZPop7JDbQ8FMAkcAjN2/t3zFFgFqmA5jqvFrJ4C7Vs7ZsTqb3mmtqaWEuxqdBSPadbV8zU9VDU7Zy2Wd8H0B+KEOCMF96lAk+hZuSvn9AJ0ZepeGtpccoJTzFNG/m5A0ak2FqTUabcQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38070700005)(38100700002)(508600001)(71200400001)(52536014)(5660300002)(7696005)(8676002)(86362001)(8936002)(55016003)(4326008)(9686003)(53546011)(64756008)(122000001)(33656002)(6506007)(66556008)(66946007)(76116006)(186003)(110136005)(54906003)(26005)(83380400001)(66476007)(316002)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4429
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ee2328f-2e35-436b-6d2b-08da22aafd96
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnEgzwgTw+5p5HsvOK9irG8RecE21IkNInC4XODYtnIyHzrN7gBOjVq2QqRfPxZEk7I0tl/Fkes2NEl65Jz2Lwhqc03Ij3tIlkTsPKUKUF6f2lyGQQTWTAfNQDkgrbNSAWP0f5w7Dn24aUfINC6k7fOnUKuXMkjNgxLfQhG4c7jnFaCMTXimdhekHxQgu+ICmRjIwPNLbMcEnD/SkVcdynnTLznXYnsvu6M+Rrfv5Bf7KeODE1vX0dPnzQ6/FRnBbH6OleboiMJ+RLz/lbO4kM8ZTK/LoDH2MyFFYDAMInaBN1tL5zMc8jhJUbrpKeYBYGuvSlV6m4e+eOllqFx/Kt8RXCrhaHzr+qX77VTuVCHGilvVnboHkiJygqHp46tB8IWHorD6nvZKXgSwSIadqneWgTb+oIkcoe+QK9JbOWt+OUSVB/kx5gfCmeJxHSWYL5xLR56IfxaptJSU69dF3aWlJ+Sz2rwJAtYiECQE4ivJO0w9hxKwOL7we4+M0r90KaATfDrrje8lxop0ZQzp93FwjN2IAliVwqwYLG9ddYngCcWWib5Lnv3Eghk8HtvkfJBBAyoxB61dfbHK3xfvfxK1ZAaSW3AeWaf25uEMc7b1YmghtnhSPCkg7zIlvBC2SwS5BMrF42JkyRR5e9GcIs9b9E33a0J1JOstpI/MJetLda996f/CSaQ89y0Uak/Z
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(81166007)(4326008)(8676002)(70586007)(8936002)(186003)(26005)(7696005)(86362001)(9686003)(53546011)(52536014)(5660300002)(33656002)(36860700001)(6506007)(55016003)(2906002)(336012)(508600001)(47076005)(54906003)(110136005)(107886003)(316002)(356005)(40460700003)(82310400005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 08:51:50.3049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4dd8eeb-c449-4420-806d-08da22ab0282
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5244

SGkganVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIEFwcmlsIDksIDIwMjIg
Njo1OSBBTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQNCj4gTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15
cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDA2LzEzXSB4ZW4v
YXJtOiBzZXQgdXAgc2hhcmVkIG1lbW9yeSBmb3JlaWduDQo+IG1hcHBpbmcgZm9yIGJvcnJvd2Vy
IGRvbWFpbg0KPiANCj4gSGkgUGVubnksDQo+IA0KPiBPbiAxMS8wMy8yMDIyIDA2OjExLCBQZW5u
eSBaaGVuZyB3cm90ZToNCj4gPiBGcm9tOiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNv
bT4NCj4gPg0KPiA+IFRoaXMgY29tbWl0cyBpbnRyb2R1Y2VzIGEgbmV3IGhlbHBlciBndWVzdF9w
aHlzbWFwX2FkZF9zaG0gdG8gc2V0IHVwDQo+ID4gc2hhcmVkIG1lbW9yeSBmb3JlaWduIG1hcHBp
bmcgZm9yIGJvcnJvd2VyIGRvbWFpbi4NCj4gPg0KPiA+IEZpcnN0bHkgaXQgc2hvdWxkIGdldCBh
bmQgdGFrZSByZWZlcmVuY2Ugb2Ygc3RhdGljYWxseSBzaGFyZWQgcGFnZXMNCj4gPiBmcm9tIG93
bmVyIGRvbV9zaGFyZWQuIFRoZW4gaXQgd2lsbCBzZXR1cCBQMk0gZm9yZWlnbiBtZW1vcnkgbWFw
IG9mDQo+ID4gdGhlc2Ugc3RhdGljYWxseSBzaGFyZWQgcGFnZXMgZm9yIGJvcnJvd2VyIGRvbWFp
bi4NCj4gPg0KPiA+IFRoaXMgY29tbWl0cyBvbmx5IGNvbnNpZGVycyBvd25lciBkb21haW4gaXMg
dGhlIGRlZmF1bHQgZG9tX3NoYXJlZCwNCj4gPiB0aGUgb3RoZXIgc2NlbmFyaW8gd2lsbCBiZSBj
b3ZlcmVkIGluIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNTINCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMNCj4gPiBpbmRleCA5ODRlNzBlNWZjLi44Y2VlNWZmYmQxIDEwMDY0
NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+ICsrKyBiL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+IEBAIC03OTgsNiArNzk4LDQ4IEBAIHN0YXRpYyBp
bnQgX19pbml0IGFsbG9jYXRlX3NoYXJlZF9tZW1vcnkoc3RydWN0DQo+IGRvbWFpbiAqZCwNCj4g
PiAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgX19pbml0
IGd1ZXN0X3BoeXNtYXBfYWRkX3NobShzdHJ1Y3QgZG9tYWluICpvZCwgc3RydWN0IGRvbWFpbg0K
PiAqYmQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIG9fZ2ZuLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBiX2dmbiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfZ2Zucykgew0KPiA+ICsgICAgc3RydWN0
IHBhZ2VfaW5mbyAqKnBhZ2VzID0gTlVMTDsNCj4gPiArICAgIHAybV90eXBlX3QgcDJtdCwgdDsN
Cj4gPiArICAgIGludCByZXQgPSAwOw0KPiANCj4gWW91IGRvbid0IG5lZWQgdG8gaW5pdGlhbGl6
ZSByZXQuDQo+IA0KPiA+ICsNCj4gPiArICAgIHBhZ2VzID0geG1hbGxvY19hcnJheShzdHJ1Y3Qg
cGFnZV9pbmZvICosIG5yX2dmbnMpOw0KPiA+ICsgICAgaWYgKCAhcGFnZXMgKQ0KPiA+ICsgICAg
ICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBUYWtl
IHJlZmVyZW5jZSBvZiBzdGF0aWNhbGx5IHNoYXJlZCBwYWdlcyBmcm9tIG93bmVyIGRvbWFpbi4N
Cj4gPiArICAgICAqIFJlZmVyZW5jZSB3aWxsIGJlIHJlbGVhc2VkIHdoZW4gZGVzdHJveWluZyBz
aGFyZWQgbWVtb3J5IHJlZ2lvbi4NCj4gPiArICAgICAqLw0KPiA+ICsgICAgcmV0ID0gZ2V0X3Bh
Z2VzX2Zyb21fZ2ZuKG9kLCBvX2dmbiwgbnJfZ2ZucywgcGFnZXMsICZwMm10LCBQMk1fQUxMT0Mp
Ow0KPiA+ICsgICAgaWYgKCByZXQgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHJldCA9IC1F
SU5WQUw7DQo+ID4gKyAgICAgICAgZ290byBmYWlsX3BhZ2VzOw0KPiA+ICsgICAgfQ0KPiA+ICsN
Cj4gPiArICAgIGlmICggcDJtX2lzX3JhbShwMm10KSApDQo+ID4gKyAgICAgICAgdCA9IChwMm10
ID09IHAybV9yYW1fcncpID8gcDJtX21hcF9mb3JlaWduX3J3IDoNCj4gcDJtX21hcF9mb3JlaWdu
X3JvOw0KPiA+ICsgICAgZWxzZQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHJldCA9IC1FSU5W
QUw7DQo+ID4gKyAgICAgICAgZ290byBmYWlsX3BhZ2VzOw0KPiANCj4gV2hlcmUgd291bGQgd2Ug
cmVsZWFzZSB0aGUgcmVmZXJlbmNlcz8NCj4gDQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAg
LyogU2V0IHVwIGd1ZXN0IGZvcmVpZ24gbWFwLiAqLw0KPiA+ICsgICAgcmV0ID0gZ3Vlc3RfcGh5
c21hcF9hZGRfcGFnZXMoYmQsIF9nZm4oYl9nZm4pLCBwYWdlX3RvX21mbihwYWdlc1swXSksDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucl9nZm5zLCB0KTsNCj4gDQo+
IEEgZmV3IHRoaW5nczoNCj4gICAgLSBUaGUgYmVnaW5uaW5nIG9mIHRoZSBjb2RlIGFzc3VtZXMg
dGhhdCB0aGUgTUZOIG1heSBiZSBkaXNjb250aWd1b3VzIGluDQo+IHRoZSBwaHlzaWNhbCBtZW1v
cnkuIEJ1dCBoZXJlLCB5b3UgYXJlIGFzc3VtaW5nIHRoZXkgYXJlIGNvbnRpZ3VvdXMuDQo+IElm
IHlvdSB3YW50IHRoZSBsYXR0ZXIsIHRoZW4geW91IHNob3VsZCBjaGVjayB0aGUgTUZOcyBhcmUg
Y29udGlndW91cy4NCj4gVGhhdCBzYWlkLCBJIGFtIG5vdCBzdXJlIGlmIHRoaXMgcmVzdHJpY3Rp
b24gaXMgcmVhbGx5IG5lY2Vzc2FyeS4NCj4gDQoNCk9oLCwgY2F1Z2h0IG1lLCBpdCBuZXZlciBv
Y2N1cnJlZCB0byBtZSB0aGF0IHRoZSBwYWdlcyBpbiBhcnJheSBgcGFnZXNgIGNvdWxkDQpiZSBk
aXNjb250aW51b3VzLg0KSSBkZWZpbml0ZWx5IHdhbnQgdGhlIGxhdHRlci4gVGhpcyBmdW5jdGlv
biBpcyBhbHdheXMgZGVhbGluZyB3aXRoIGEgbWVtb3J5IHJlZ2lvbg0KKGNvbnRpZ3VvdXMgTUZO
UykgZWFjaCB0aW1lLiBTbyBtYXliZSBhIGxvb3AgdG8gY2hlY2sNCnBhZ2VfdG9fbWZuKHBhZ2Vz
W2ldKSA9PSBtZm5fYWRkKHNtZm4sIGkpIGlzIG5lZWRlZC4NCg0KPiAgICAtIElJUkMsIGd1ZXN0
X3BoeXNtYXBfYWRkX3BhZ2VzKCkgZG9lc24ndCByZXZlcnQgdGhlIG1hcHBpbmdzLiBTbyB5b3UN
Cj4gbmVlZCB0byByZXZlcnQgaXQgaW4gY2FzZSBvZiBmYWlsdXJlLg0KPiANCg0KWWVzLCBib3Ro
IGZhaWx1cmUgcG9pbnRzIHlvdSBhcmUgcmVmZXJyaW5nIHRvIGFyZSByZXF1aXJpbmcgcmV2ZXJ0
aW5nIHRoZSBtYXBwaW5ncy4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cg==

