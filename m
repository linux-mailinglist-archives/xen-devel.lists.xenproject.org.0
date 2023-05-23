Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFD70DA55
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 12:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538396.838298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1P9S-00051D-Lx; Tue, 23 May 2023 10:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538396.838298; Tue, 23 May 2023 10:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1P9S-0004yS-Is; Tue, 23 May 2023 10:21:58 +0000
Received: by outflank-mailman (input) for mailman id 538396;
 Tue, 23 May 2023 10:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqVG=BM=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1P9Q-0004yM-Si
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 10:21:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a334c981-f953-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 12:21:54 +0200 (CEST)
Received: from AS9PR06CA0388.eurprd06.prod.outlook.com (2603:10a6:20b:460::31)
 by AS2PR08MB9546.eurprd08.prod.outlook.com (2603:10a6:20b:60d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 10:21:48 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::1d) by AS9PR06CA0388.outlook.office365.com
 (2603:10a6:20b:460::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 10:21:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 10:21:47 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Tue, 23 May 2023 10:21:47 +0000
Received: from 8a674dac0949.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4C8B512E-1E01-4BA9-AEC9-C71C64BE2AEE.1; 
 Tue, 23 May 2023 10:21:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a674dac0949.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 May 2023 10:21:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB6336.eurprd08.prod.outlook.com (2603:10a6:102:158::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 10:21:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 10:21:38 +0000
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
X-Inumbo-ID: a334c981-f953-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NbhuJvCEb4CBeWUGnXX/Hb2tIitJI+3/qVN7WX+HUA=;
 b=SNA64zG8J7v/mPc0h9WMAwfnryE8kGJv3BbrqYkcnZ0t8ypmGWpzgVBcDF4uzAszVXj5duouw12eDZR/7LiYBr+0EMN0t9REm+vR5Xm5TI6YUgLgeRDS5HbtGViKctg6bkpSqrjZjYqXeOitgstjl5VPqCkrOyfFDp9VqmEWeUA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a004a54d70825d36
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImkGYcI1p5giYYJ/az1+UMuXjNxAf6ltTUqJcs5yhXTnE3a9UhwHtF3ML6Kb0A9MeK5oASt8TLkc7gTZk4y4GfYox7Zl7r43tTJh2eQ/yjri7ijngUO754ygXD7/Ewql4Q21nXdvh4C2rl22IjP4oelVlC7eWxlAp0iuVl2McpHguJNBoH9I/CTDnl5gDrASkIsySvrZA4PswaWNxYIZZXT00Si1AVZkwuDgfmHMU9rwnEx1ru3iEg1Gk/XpZs0x9uyEQqIPPW/gWC0X78annVikPWu18fLQjllH048A8Zo+Cy6s/GfDDy1CmuRfBh3HvTiWQF3eYCF4gic9LfqQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NbhuJvCEb4CBeWUGnXX/Hb2tIitJI+3/qVN7WX+HUA=;
 b=iPoLw10OnhiZAOLy90q61uQ7aVy/knsbHCwje1gzgjIkE34c5K8x40wPv2PqiE+0QvkVOCfv4xBaopzHy9uMbxkwnl8nGeLQQDQ1JvwIhuEJk3QmWbMtMRc7+6AwKBdZqU18X0VLoPjLk11heK4ghwGM3OPV5HYFCkZFvuCWZ60zugOQTayrMTj6bFTLawegyB8KJ1ivd4mUXwzSohN+H49Jrn/A0jyzSsE5D4wcw946fE8sGI3NYs/TFtWmjVbtNuoXN2lX1nlK9jE84LycxTNnQQrLDQvj8icyJBRIVjHSwafBFTcKLML1HFt6C3B7Q5+Vh8fr7NPclFh9ez0+zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NbhuJvCEb4CBeWUGnXX/Hb2tIitJI+3/qVN7WX+HUA=;
 b=SNA64zG8J7v/mPc0h9WMAwfnryE8kGJv3BbrqYkcnZ0t8ypmGWpzgVBcDF4uzAszVXj5duouw12eDZR/7LiYBr+0EMN0t9REm+vR5Xm5TI6YUgLgeRDS5HbtGViKctg6bkpSqrjZjYqXeOitgstjl5VPqCkrOyfFDp9VqmEWeUA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZjUpfkyJmVIVJBUW8KdO0aW075a9noLWAgAAFYIA=
Date: Tue, 23 May 2023 10:21:38 +0000
Message-ID: <6DEA0CC3-C3EF-4509-A869-807CE4B21401@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-8-luca.fancellu@arm.com>
 <48722696-ea22-1af9-2a0a-aa78972d118a@suse.com>
In-Reply-To: <48722696-ea22-1af9-2a0a-aa78972d118a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB6336:EE_|AM7EUR03FT012:EE_|AS2PR08MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e022454-cfb6-41d8-19e6-08db5b77841b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RpBLDaQmT+YEOFiRQEDlMgRzyQ3xm2rlfJ7+dgEhn7PRQ5CqTA/4yb1kMA5aZJaSjDkwnuEi7xTHn4BhrTHwKZdUm/iKb+3DiuqZrDVrMjvUcAUE0/ueJQ0Ww+sts5zXoOpT0+MxLz/nCHGqPGcYFXP5Iil93Fmf7e0BI9bTlJSwVwU2pzlwYyaZ3fD0ui9FcXV6y22POz+uds+O4Cx5K70YwEWFkawfbebZfrAyvj2kCkzJSeLtS2nIk6CbsD+BtvKce3YlilnXQlFGu8PmvWRMf+UC1+sWrXjtLUfiaHqh+HMvR+Dg2hobM4V1rPpRfLuOTRNTJtwKLaY8hk2Vyjhiog8g3bFO+6W/Z9xB0PZLfGooqdvibxbBWoJCVHHuWon82iGMC8HzEGJAJJs60ZGj4B9xaofIPzaDJoUsqwkRuBwKdiSThBTOjUuCrXus9XjV411Hx2bGpul4+FR6EgNlZQDFcPyPZtXHkEUnvmBdRnSKlPJ5btAkIy2aVgMfa3VGzndq1oElwpIn+uQCYuJ+jkCp28YckxFU0WezFYQhYm/WeaxVWSiqBJ9aymJ7u50oA+nN4CQiO+AZV2GduqoERWIbMO6msQFFKbvgJfqdfyPf3JllG9tyYQTRB6JKG5RhwIMdLvyfjBIurVrLbg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(53546011)(186003)(316002)(33656002)(86362001)(26005)(6506007)(6512007)(71200400001)(2906002)(8936002)(8676002)(36756003)(5660300002)(41300700001)(6486002)(4326008)(478600001)(54906003)(38100700002)(122000001)(2616005)(66946007)(66476007)(64756008)(91956017)(66446008)(66556008)(6916009)(76116006)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F47FD606904CCC42BEEAA3CB54C9D44C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	afb09f92-556b-44f2-3fa5-08db5b777e8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rkH/E/BKPyJfwwW8u7S6/Wp8Y3xNZ7FYbO30qNF+nQQe+wobXISVRcdZFgAkurPmM+i/EqRk+tiXST+s+2SBchnvc3BMCiGtu8yUNHrTLX9ssOVawb0Yr0wYkmXGlD2cgFv5PMIBk96byDp61DgUPOeLTB+CMEhM0zHcdK6oSBHjej6qmH1yymIvJ3lTw4IXOuIy1yb4glBFWY7O1hGYcN7NBrrXyeODEWPkewwZ20OOZOpdziPBmO51zXeEXr78/fRhKq7TJ80J3PFfoV6Qj9ZtVxxTn9zYQb/A2hM3LSmzlHVidZZ3l4C+At6bStMLMMhPQv2+q5QRsoi5lzgC8vCfzu2yvs8sumtn4itRgX8KUxylQGOpk434HxD9JK8giHRfZaGwHsU82t/7S2Hz/SnY1utu0nDH41JDmM6irfVcelZ0J/gz4yQW8P07mVV9QQERWENUzbYy2GqtB+IlipemZp+mefu9xd/F1nv3Mr9w54R1ZKq6dadD45Zh+mexixmBtDL0pmFhqkiVQ4sv2iMKFTtYI/fE6AaE1QozJFX0lS5vvjbNDT0HcEXmkb1MRN6kxhugyO/fIomPqpylkEcqNc8MJMu4jATwQQaAptkaNa7UXazSEYVbw6viu4PqNZ4EGyKzjLz3Ccaclsd/els13GM5hoS7dFzYj1yDSehndnoBJNmMm32W9snTCQuVWw9lvGFP0P+LsrERXeAzKUqQPYnDO3Sfmu6eIhOqIyQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(6512007)(6506007)(53546011)(2616005)(356005)(40480700001)(186003)(478600001)(54906003)(26005)(70586007)(70206006)(316002)(81166007)(86362001)(33656002)(82740400003)(4326008)(41300700001)(40460700003)(36756003)(2906002)(82310400005)(5660300002)(336012)(36860700001)(47076005)(8676002)(8936002)(6862004)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 10:21:47.8036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e022454-cfb6-41d8-19e6-08db5b77841b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9546

DQoNCj4gT24gMjMgTWF5IDIwMjMsIGF0IDExOjAyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjMuMDUuMjAyMyAwOTo0MywgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IEFkZCBhIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIgdG8gYWxsb3cgRG9tMCB0aGUg
dXNlIG9mIFNWRSByZXNvdXJjZXMsDQo+PiB0aGUgY29tbWFuZCBsaW5lIHBhcmFtZXRlciBzdmU9
PGludGVnZXI+LCBzdWIgYXJndW1lbnQgb2YgZG9tMD0sDQo+PiBjb250cm9scyB0aGUgZmVhdHVy
ZSBvbiB0aGlzIGRvbWFpbiBhbmQgc2V0cyB0aGUgbWF4aW11bSBTVkUgdmVjdG9yDQo+PiBsZW5n
dGggZm9yIERvbTAuDQo+PiANCj4+IEFkZCBhIG5ldyBmdW5jdGlvbiwgcGFyc2Vfc2lnbmVkX2lu
dGVnZXIoKSwgdG8gcGFyc2UgYW4gaW50ZWdlcg0KPj4gY29tbWFuZCBsaW5lIGFyZ3VtZW50Lg0K
Pj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5j
b20+DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiAj
ICFhcm0NCj4gDQo+PiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MNCj4+
ICsrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYw0KPj4gQEAgLTc3Nyw5ICs3
NzcsOSBAQCBTcGVjaWZ5IHRoZSBiaXQgd2lkdGggb2YgdGhlIERNQSBoZWFwLg0KPj4gDQo+PiAj
IyMgZG9tMA0KPj4gICAgID0gTGlzdCBvZiBbIHB2IHwgcHZoLCBzaGFkb3c9PGJvb2w+LCB2ZXJi
b3NlPTxib29sPiwNCj4+IC0gICAgICAgICAgICAgICAgY3B1aWQtZmF1bHRpbmc9PGJvb2w+LCBt
c3ItcmVsYXhlZD08Ym9vbD4gXQ0KPj4gKyAgICAgICAgICAgICAgICBjcHVpZC1mYXVsdGluZz08
Ym9vbD4sIG1zci1yZWxheGVkPTxib29sPiBdICh4ODYpDQo+PiANCj4+IC0gICAgQXBwbGljYWJp
bGl0eTogeDg2DQo+PiArICAgID0gTGlzdCBvZiBbIHN2ZT08aW50ZWdlcj4gXSAoQXJtKQ0KPiAN
Cj4gV2hpbGUgaW4gdGhlIHRleHQgYmVsb3cgeW91IG1lbnRpb24gdGhpcyBpcyBBcm02NCBvbmx5
LCBJIHRoaW5rIHRoZSB0YWcNCj4gaGVyZSB3b3VsZCBiZXR0ZXIgZXhwcmVzcyB0aGlzIGFzIHdl
bGwuDQoNCk9rIEkgY2FuIHVzZSBBcm02NCBpbnN0ZWFkIGlmIHRoZXJlIGlzIG5vIG9wcG9zaXRp
b24gZnJvbSBvdGhlcnMNCg0KPiANCj4+IEBAIC04MzgsNiArODM4LDIyIEBAIENvbnRyb2xzIGZv
ciBob3cgZG9tMCBpcyBjb25zdHJ1Y3RlZCBvbiB4ODYgc3lzdGVtcy4NCj4+IA0KPj4gICAgIElm
IHVzaW5nIHRoaXMgb3B0aW9uIGlzIG5lY2Vzc2FyeSB0byBmaXggYW4gaXNzdWUsIHBsZWFzZSBy
ZXBvcnQgYSBidWcuDQo+PiANCj4+ICtFbmFibGVzIGZlYXR1cmVzIG9uIGRvbTAgb24gQXJtIHN5
c3RlbXMuDQo+PiArDQo+PiArKiAgIFRoZSBgc3ZlYCBpbnRlZ2VyIHBhcmFtZXRlciBlbmFibGVz
IEFybSBTVkUgdXNhZ2UgZm9yIERvbTAgZG9tYWluIGFuZCBzZXRzDQo+PiArICAgIHRoZSBtYXhp
bXVtIFNWRSB2ZWN0b3IgbGVuZ3RoLCB0aGUgb3B0aW9uIGlzIGFwcGxpY2FibGUgb25seSB0byBB
QXJjaDY0DQo+PiArICAgIGd1ZXN0cy4NCj4gDQo+IFdoeSAiZ3Vlc3RzIj8gRG9lcyB0aGUgb3B0
aW9uIGFmZmVjdCBtb3JlIHRoYW4gRG9tMD8NCg0KSSB1c2VkIOKAnGd1ZXN0c+KAnSBiZWNhdXNl
IGluIG15IG1pbmQgSSB3YXMgcmVmZXJyaW5nIHRvIGFsbCB0aGUgYWFyY2g2NCBPUyB0aGF0IGNh
biBiZSB1c2VkDQphcyBjb250cm9sIGRvbWFpbiwgSSBjYW4gY2hhbmdlIGl0IGlmIGl0IHNvdW5k
cyBiYWQuDQoNCj4gDQo+PiArICAgIEEgdmFsdWUgZXF1YWwgdG8gMCBkaXNhYmxlcyB0aGUgZmVh
dHVyZSwgdGhpcyBpcyB0aGUgZGVmYXVsdCB2YWx1ZS4NCj4+ICsgICAgVmFsdWVzIGJlbG93IDAg
bWVhbnMgdGhlIGZlYXR1cmUgdXNlcyB0aGUgbWF4aW11bSBTVkUgdmVjdG9yIGxlbmd0aA0KPj4g
KyAgICBzdXBwb3J0ZWQgYnkgaGFyZHdhcmUsIGlmIFNWRSBpcyBzdXBwb3J0ZWQuDQo+PiArICAg
IFZhbHVlcyBhYm92ZSAwIGV4cGxpY2l0bHkgc2V0IHRoZSBtYXhpbXVtIFNWRSB2ZWN0b3IgbGVu
Z3RoIGZvciBEb20wLA0KPj4gKyAgICBhbGxvd2VkIHZhbHVlcyBhcmUgZnJvbSAxMjggdG8gbWF4
aW11bSAyMDQ4LCBiZWluZyBtdWx0aXBsZSBvZiAxMjguDQo+PiArICAgIFBsZWFzZSBub3RlIHRo
YXQgd2hlbiB0aGUgdXNlciBleHBsaWNpdGx5IHNwZWNpZmllcyB0aGUgdmFsdWUsIGlmIHRoYXQg
dmFsdWUNCj4+ICsgICAgaXMgYWJvdmUgdGhlIGhhcmR3YXJlIHN1cHBvcnRlZCBtYXhpbXVtIFNW
RSB2ZWN0b3IgbGVuZ3RoLCB0aGUgZG9tYWluDQo+PiArICAgIGNyZWF0aW9uIHdpbGwgZmFpbCBh
bmQgdGhlIHN5c3RlbSB3aWxsIHN0b3AsIHRoZSBzYW1lIHdpbGwgb2NjdXIgaWYgdGhlDQo+PiAr
ICAgIG9wdGlvbiBpcyBwcm92aWRlZCB3aXRoIGEgbm9uIHplcm8gdmFsdWUsIGJ1dCB0aGUgcGxh
dGZvcm0gZG9lc24ndCBzdXBwb3J0DQo+PiArICAgIFNWRS4NCj4gDQo+IEFzc3VtaW5nIHRoaXMg
YWxzbyBjb3ZlcnMgdGhlIC0xIGNhc2UsIEkgd29uZGVyIGlmIHRoYXQgaXNuJ3QgYSBsaXR0bGUg
dG9vDQo+IHN0cmljdC4gIk1heGltdW0gc3VwcG9ydGVkIiBpbW8gY2FuIHZlcnkgd2VsbCBiZSAw
Lg0KDQpNYXhpbXVtIHN1cHBvcnRlZCwgd2hlbiBwbGF0Zm9ybXMgdXNlcyBTVkUsIGNhbiBiZSBh
dCBtaW5pbXVtIDEyOCBieSBhcm0gc3BlY3MuDQoNCg0KDQo+IA0KPiBKYW4NCg0K

