Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB637790E9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 15:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582426.912196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSO8-00025s-AO; Fri, 11 Aug 2023 13:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582426.912196; Fri, 11 Aug 2023 13:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSO8-00023a-7P; Fri, 11 Aug 2023 13:41:12 +0000
Received: by outflank-mailman (input) for mailman id 582426;
 Fri, 11 Aug 2023 13:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wg3T=D4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qUSO7-00023U-4w
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 13:41:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5be010a-384c-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 15:41:01 +0200 (CEST)
Received: from DUZPR01CA0317.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::27) by AM9PR08MB6178.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.19; Fri, 11 Aug
 2023 13:40:53 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4ba:cafe::2c) by DUZPR01CA0317.outlook.office365.com
 (2603:10a6:10:4ba::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.31 via Frontend
 Transport; Fri, 11 Aug 2023 13:40:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Fri, 11 Aug 2023 13:40:52 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Fri, 11 Aug 2023 13:40:52 +0000
Received: from 39db14bd1755.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 14EEAE9E-1CA2-495B-904A-EEE56D2FEB9F.1; 
 Fri, 11 Aug 2023 13:40:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39db14bd1755.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Aug 2023 13:40:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9755.eurprd08.prod.outlook.com (2603:10a6:10:460::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 13:40:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 13:40:39 +0000
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
X-Inumbo-ID: b5be010a-384c-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQfkcMShEh69JqDG4f+QFUhttAHBQxbmuASOiHoiTqY=;
 b=aBJHnaKgI/Yahpu4tQ6K+Cxjen4fEpFDkVqh7F/J5aDohepbNlw3b/0oRY6AVst3XmQrzjsxdt+dky34HFLQ0hFJ5ajfd3puN5j5sU49HgfzlkYsgEUsoTVsy8Jd3TgwfRR9bVIZmQBT7ntT5vWWwBO32n5HBtTG7aA9Ehpzo8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3afc0bbbbf87df7a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzMvbIlWFKobRRwNlTG7iDmURJ1lrxNm9RwVnO8CMliITZuwHrGesU1jsR0LxVgMsX2QgdtaWtNfYcqptOnHxZSFCxFOCW0eFvxq1eTWYRaNAZmMcOBNTXjbRagr/zn7r7nNZrOQu1QXlwabs92q33vgLcfrYqU+6o1FyUU2A9AT/nC4CU1J0Gig/Cp8eHqO3cdqY+ilek+qol2uYWOlqJpbn4DHpZ9PepkLIJUuZV2jXAzWu8K+GmAyc8Qu8FgwlvmIXwUuvdEHl4j2EHo0tsw6LNjJZTOy2mpDSBzjc2YNY1gfCJ6ay8XQiG9oSu5f8DwkHfkVSgwr6Zw5A3hBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQfkcMShEh69JqDG4f+QFUhttAHBQxbmuASOiHoiTqY=;
 b=Fp0hbRSx8LORZgVCgBw5AFFwwmt5Fk041JiskCkSTWAVqizPlyGLKcFsCgRkZJwuwSCeESJmdqd8krvN1kbIlDDTwYk+q8b+QDGltakGdSQcM93Rt4L0VxsZkvQc3Xq4qHMw26L5/0EL63ExmcZwoPbOKz7xr4+O12e/nH3oZFjwdHY5ZunZ1CrPsE1gulz8WqQoD70h8oXUs7Iw8R0inYL3D3MftZPb0efGzv5mWY4D6gzCFYer3vonH1Ni+G2z2CRuKNXxBgJolCL8D9XErZynHYmkuec8yvOjr6Qm+1XQcvEGMK121PG9tmrr8dKLFu/5toZLES/ZYIqYYl7WCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQfkcMShEh69JqDG4f+QFUhttAHBQxbmuASOiHoiTqY=;
 b=aBJHnaKgI/Yahpu4tQ6K+Cxjen4fEpFDkVqh7F/J5aDohepbNlw3b/0oRY6AVst3XmQrzjsxdt+dky34HFLQ0hFJ5ajfd3puN5j5sU49HgfzlkYsgEUsoTVsy8Jd3TgwfRR9bVIZmQBT7ntT5vWWwBO32n5HBtTG7aA9Ehpzo8c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/5] xen/arm: Add asm/domain.h include to kernel.h
Thread-Topic: [PATCH 2/5] xen/arm: Add asm/domain.h include to kernel.h
Thread-Index: AQHZyc51AtDCvMz7Yk+h8v6wea9TNK/lEvIAgAAMOAA=
Date: Fri, 11 Aug 2023 13:40:39 +0000
Message-ID: <3C46ADAD-477D-46BB-BCCB-81C3198517E5@arm.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <20230808080010.3858575-3-luca.fancellu@arm.com>
 <b9d88e5a-91d1-43b7-becd-8a742698e1c8@xen.org>
In-Reply-To: <b9d88e5a-91d1-43b7-becd-8a742698e1c8@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB9755:EE_|DBAEUR03FT015:EE_|AM9PR08MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da6726b-ab14-4233-7b87-08db9a7094ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DhWzsPFQhEcvlm2sRbB6oOerGVSvxOFY4tr/z5aMI6cSQRzZSdeBLDpJUXKFs1u/6PVkPeQSroKIiuTSZuTMk39HW2emvhadZUJ0LCl7o8CrnyyOQBJ1pRXsxjXKqOztsTXf+PbbHDSjwvqn+gKthZWYISrvA4tNcr8b+dXlqgoVG50DIbJj9CcUFIzGlVR5oHdRHWeJWziEd5qZo2Gp89Sk29xVDt06IUWfxpvk4ucNOhapKWb9bGg03astCAIPZb3lq75NmntiHAIdzLU/M+6BEVYsiAPWV+JJlyjza5vNaZIL9gQS+9WbW10UHCNMWHk06/XkoCRSf7uWiJllwPlY7tJOlZHktA8ElOvY+YHKHS13NF7zlSk19FIt3ijvqLh5Dxc7V/FU4+PwIb9VdgMJPNihJLXAkL3UWWHKp17aDv6rHmcprMVq3QY22frOtJOQ3FFc9CgwlkaGSRSGr3RlU8fbvn4tclHZ3bz2EjfgStAEyMABMcA7S8yBDVtXeollO4XBPxBdeJMkGqFYwTlLx2k33IwLAozg8arhhEV3ArATS1z3h9zrAbfeSFY8ssOokmrMBU8urkv0g/eePkhVK+4EdAbSZmZ1Jugeg77076wb23I8d1r4kZWvZzcyETaA/zgWzBgS+k8nTAiIJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(1800799006)(186006)(316002)(6512007)(478600001)(2616005)(38070700005)(5660300002)(6486002)(76116006)(64756008)(66556008)(66946007)(66446008)(66476007)(86362001)(8936002)(33656002)(41300700001)(8676002)(6916009)(71200400001)(91956017)(4326008)(122000001)(36756003)(2906002)(53546011)(6506007)(26005)(54906003)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3E1A05098506A42853EB5D291BF9A4E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9755
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df77153c-9988-4d95-dc50-08db9a708d11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uoiSakOLJu4PYbbnPQV9yvrdAKVyPsofAYU69EsKsHiVyZy4wgGVXGJ2B9XDa3vTeigvzM0EGpRufG8mfUjYM/wA1srzG2JoqESuDph48ZT+Z/zpWYGBl8htjhlQ4Zr5egSOkWyuv503crDsme5nFVJ49tWyUT02h5Ns+KSzD0jORb03JdbRlpyFYhXR9FWYmreXCUazJUQBio1znNQ2R+14ilgJYnfuKny3dE3GBdLWzPJW55bAGN64C72axS/JUVk3WjtXdd+KESoLaOIN89d4YyMUZS+dV/NefOEXzd6Ju6kjKxLehep9hSqfl/M0kt7q3r7X2q0M8SoLjC3ojiBBddNZZZK3ej9029luoADIUEW4CNoe6eNwGk9LgN45pyOFsr6VmlLY1Znt1WLlBDzzo7QswJMXo7C0y9ZtIKWlmaef7eCL4t2XZkzWE06Xymcrkt1u4hRKPu63ZlfLj2LtH4ZesL7b2Gacy7KP2FuEG9/QosxjOhBcT8p77sjtaBIYgyveHrmDIB9cVB8G2zNC4zbOGT6+2CUJLmpJeuXr7MfJsZayDCIrSacq+Uun2Rg+q4UOOuCZcd+F7eZ/Lt5sVfmb3V3FGr+h6xUfGgy3IJn1o4SWImSvKtuW1Wkm1y6OzPVdu4LcCF4AM1zLgtTROzDZ/5mICYRH1JTrAclxQK+YwqMzJ3dqaPYXsDZK1fH7oHroMXnMk+diTZZJJk9EsuKDgMj1WUV9T+VXq8UlHGHP7gRbi3kju1MuomcC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(82310400008)(1800799006)(186006)(451199021)(40470700004)(36840700001)(46966006)(356005)(53546011)(81166007)(82740400003)(336012)(6512007)(6506007)(107886003)(26005)(36860700001)(47076005)(2616005)(41300700001)(40460700003)(36756003)(2906002)(478600001)(54906003)(8676002)(86362001)(5660300002)(33656002)(8936002)(6486002)(6862004)(4326008)(70206006)(40480700001)(316002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 13:40:52.9686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da6726b-ab14-4233-7b87-08db9a7094ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6178

DQoNCj4gT24gMTEgQXVnIDIwMjMsIGF0IDEzOjU2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAwOC8wOC8yMDIzIDA5OjAwLCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gQWRkIGFzbS9kb21haW4uaCB0aGF0IGlzIGRlZmluaW5n
IHRoZSB0eXBlICdlbnVtIGRvbWFpbl90eXBlJywgaXQNCj4+IGlzIG5lZWRlZCBvbiBhcm02NCBi
dWlsZCB3aGVyZSB0aGlzIHR5cGUgaXMgdXNlZCBmb3IgYSBtZW1iZXIgb2YNCj4+IHRoZSBzdHJ1
Y3R1cmUga2VybmVsX2luZm8uDQo+IA0KPiBJIHJlYWQgIm5lZWRlZCIgYXMgaW4gaXQgWGVuIGJ1
aWxkIGlzIGJyb2tlbi4gQnV0IEFGQUlLLCB0aGlzIGlzIG1vcmUgYSBsYXRlbnQgaXNzdWUgaWYg
c29tZW9uZSBlbHNlIHdhbnQgdG8gaW5jbHVkZSB0aGUgaGVhZGVyLiBJcyB0aGF0IGNvcnJlY3Q/
DQoNClllcyBjb3JyZWN0DQoNCj4gDQo+IElmIHNvLCBob3cgYWJvdXQ6DQo+IA0KPiBUaGUgJ2Vu
dW0gZG9tYWluX3R5cGUnIGlzIGRlZmluZWQgYnkgJ2FzbS9kb21haW4uaCcgd2hpY2ggaXMgbm90
IGluY2x1ZGVkIChkaXJlY3RseSBvciBpbmRpcmVjdGx5KSBieSAnYXNtL2tlcm5lbC5oJy4NCj4g
DQo+IFRoaXMgY3VycmVudGx5IGRvZXNuJ3QgYnJlYWsgdGhlIGNvbXBpbGF0aW9uIGJlY2F1c2Ug
YXNtL2RvbWFpbi5oIHdpbGwgaW5jbHVkZWQgYnkgdGhlIHVzZXIgb2YgJ2tlcm5lbC5oJy4gQnV0
IGl0IHdvdWxkIGJlIGJldHRlciB0byBhdm9pZCByZWx5aW5nIG9uIGl0LiBTbyBhZGQgdGhlIGlu
Y2x1ZGUgaW4gJ2FzbS9kb21haW4uaCcuDQoNClllYWggbXVjaCBiZXR0ZXIsIHNob3VsZCBJIHB1
c2ggYSB2Mj8NCg0KPiANCj4+IEZpeGVzOiA2NmU5OTRhNWU3NGYgKCJ4ZW46IGFybTY0OiBhZGQg
Z3Vlc3QgdHlwZSB0byBkb21haW4gZmllbGQuIikNCj4gDQo+IFdoaWxlIHdlIGFpbSB0byBoYXZl
IGhlYWRlciBzZWxmLWNvbnRhaW5lZCwgdGhpcyBoYXMgbmV2ZXIgYmVlbiBhIGd1YXJhbnRlZSBp
biBYZW4uIFNvIEkgd291bGQgYXJndWUgdGhpcyBpcyBub3QgYSBmaXggaW4gdGhlIHNlbnNlIGl0
IHNvbWVvbmUgd291bGQgd2FudCB0byBpbmdlc3QgaXQgaW4gdGhlcmUgdHJlZS4NCg0KT2sgSSBz
ZWUsIEkgdGhvdWdodCBpdCBjb3VsZCBiZSBsaW5rZWQgdG8gdGhlIGlzc3VlIGFib3V0IHNvcnRp
bmcgaGVhZGVycyB0aGF0IGxlZCB0byBidWlsZCBicmVha2FnZSwgYnV0IEnigJl2ZQ0Kbm90IGlu
dmVzdGlnYXRlZCBmdXJ0aGVyIHNvIEkgd291bGQgYmUgb2sgdG8gZHJvcCB0aGUgRml4ZXM6DQoN
Cj4gDQo+IENoZWVycywNCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNh
LmZhbmNlbGx1QGFybS5jb20+DQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
a2VybmVsLmggfCAxICsNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20va2VybmVsLmggYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20va2VybmVsLmgNCj4+IGluZGV4IDQ2MTdjZGM4M2JhYy4uMGEyM2U4NmMy
ZDM3IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2tlcm5lbC5oDQo+
PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20va2VybmVsLmgNCj4+IEBAIC03LDYgKzcs
NyBAQA0KPj4gICNkZWZpbmUgX19BUkNIX0FSTV9LRVJORUxfSF9fDQo+PiAgICAjaW5jbHVkZSA8
eGVuL2RldmljZV90cmVlLmg+DQo+PiArI2luY2x1ZGUgPGFzbS9kb21haW4uaD4NCj4+ICAjaW5j
bHVkZSA8YXNtL3NldHVwLmg+DQo+PiAgICAvKg0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0K
DQo=

