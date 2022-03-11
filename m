Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C54D609D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 12:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288985.490236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSdTP-0000hQ-EB; Fri, 11 Mar 2022 11:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288985.490236; Fri, 11 Mar 2022 11:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSdTP-0000eZ-Ac; Fri, 11 Mar 2022 11:30:19 +0000
Received: by outflank-mailman (input) for mailman id 288985;
 Fri, 11 Mar 2022 11:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRj6=TW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nSdTM-0000eT-SX
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 11:30:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ea56b2f-a12e-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 12:30:14 +0100 (CET)
Received: from AM6PR0502CA0069.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::46) by AM0PR08MB4161.eurprd08.prod.outlook.com
 (2603:10a6:208:134::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 11:30:03 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::e3) by AM6PR0502CA0069.outlook.office365.com
 (2603:10a6:20b:56::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 11:30:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 11:30:03 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Fri, 11 Mar 2022 11:30:03 +0000
Received: from 72898bd4ddc3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92762F4D-5145-4422-8CCD-7840035AFB50.1; 
 Fri, 11 Mar 2022 11:29:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72898bd4ddc3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 11:29:52 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM4PR0802MB2227.eurprd08.prod.outlook.com (2603:10a6:200:5e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 11:29:50 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 11:29:50 +0000
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
X-Inumbo-ID: 9ea56b2f-a12e-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsCeOcSuwjMD2fsHQeMAY1oXQKKExhxDi1howaZ3RIM=;
 b=ZHl6011ZModw2zmLG8IUN5hq132v4QcX1rNDqFGHmdFa/INbIsSQQOyAfMIruFLj/Tmb0rh9zaxm2JLMSL2QFxahjqz9Vxoj7R5jbAvr9+TNrJoxhGjFrS1fLjS+vn/FaQKTBj98fsjVMwu3+d9WwHO/RTOBAbRRXwvK6qY3Orw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 366115b56a1efca7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPW2VEBUKFryUTt9UVuowxNHO8kc2xUdj6YTO/Fne6y7RDjf6kdJyUZT6FAKUn0e54xSKT+XVuWapoRf/iOHQ04OZlTZbpgba/i+1ee8aSQsRy05/BlTmgGXBGQcZQ6upazR91NEOuH4X3JYhTwIqSWZVQIuhuiFNvj6i+S27dZpszY1I2vrhHxbjZncjr5wxijfZxGTbar1TY92VEMr57mMTqZsdClCyPoc7xbI0AOQmK7UJCvMru55TzXSQ74i1UXFSIXS7uf2aLIBPO5vfRLUTs+CWLVBk7JS1LWl84uSG8QixSarlx2QfkVDMJJQhThIe9SJ0hLHpmNePD1dYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsCeOcSuwjMD2fsHQeMAY1oXQKKExhxDi1howaZ3RIM=;
 b=BLhFjxDxn5a4ejgkFsXfoBM0whd/JYOH1erEkoCOKkI5VECbZc6FpdNDf63UY86vPZElC07oFiqtF3sZDWqlPOm7yFDCIx/FU+GaTFx9uwUTnh6PhjnV4NE52cv90XN3GL80XcDVwvCfnatiazAY7Q2NRUHl4y/wjwyO4zQXwJM60ZvvLdyYbw6IPD0/6jkBJmiywJQ1weRwa7+KH27lm1jBGxyg6qBmJzgY0Mnh5XM0VbP3pNtIwLHXXd050D29eyqWV+eH4CaxRZ0lnlZtz40+9X5uHK7YNwKOEmRmMgXRhlIJGdqrEFeiGOie1OaxdZx8TtOSgUetoQGD97v1Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsCeOcSuwjMD2fsHQeMAY1oXQKKExhxDi1howaZ3RIM=;
 b=ZHl6011ZModw2zmLG8IUN5hq132v4QcX1rNDqFGHmdFa/INbIsSQQOyAfMIruFLj/Tmb0rh9zaxm2JLMSL2QFxahjqz9Vxoj7R5jbAvr9+TNrJoxhGjFrS1fLjS+vn/FaQKTBj98fsjVMwu3+d9WwHO/RTOBAbRRXwvK6qY3Orw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Dario
 Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index:
 AQHYNKHSvTK6bj2+f02v/DWZHCtE9qy51VEAgAANLYCAAAlQgIAABMeAgAAIuQCAABQSAA==
Date: Fri, 11 Mar 2022 11:29:50 +0000
Message-ID: <509DF3D9-A0B4-4139-8DE8-C4276C16BD26@arm.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-5-luca.fancellu@arm.com>
 <378565ed-80d4-e760-2e25-f5d2e4cb9ce2@suse.com>
 <0D3FFA8E-A904-4375-BDBB-2C974C224D14@arm.com>
 <21783c1d-d8c7-b03b-2221-5e34b4bd0fd4@suse.com>
 <26fbe29d-b5d3-2ce5-a16b-ca05329c778a@suse.com>
 <918fd4d8-99d6-3acf-0637-7feda1e08f71@suse.com>
In-Reply-To: <918fd4d8-99d6-3acf-0637-7feda1e08f71@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a03593e0-5e12-493b-27f3-08da03527c4c
x-ms-traffictypediagnostic:
	AM4PR0802MB2227:EE_|AM5EUR03FT022:EE_|AM0PR08MB4161:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB416138A6B0927BE769582927E40C9@AM0PR08MB4161.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tz800KjDiKBBKjCsP+RdOyC6tgwKAWOMXALvpuqvVUdYydYXrXvI5LbEkP8w30hwHMUPTHh9LX6v029TJ+tinXfTZ1w6lIP6HLOJmyrGWcvTBpsrHub/oQ4TkLfFK5WlrP8b4xwyh1XKu5mZd/2CX999AGyA+fbKNEpFPtMfpLwXDcJ78KmlZygc6AuiFEGCWncqxS9eB16TsbOAVYaiVt4n0vbiI8dNXbhpv+Hk0b1i4oMNToPVDkC2eWbnqyGYALMY7jSb1sB43vjNdIx2WTc8IpRnQ/Gm9P6WKsYeP3CkTMtICG97bkJQyUtOhY6vfvnJ9OvVO9m8sg54FTekbZk6Gyq5Gk3ZMyI5EpjUaB2sA/P6PbS0bs47EYZaiRSJKNilrR3ChdfIuTzFXC/nld69kYGGnakEriJNVSkea8yB0wFRM9LpAXaiX/43ZhBaKgM3GYZ7xuHhI5E09jfoJAt8Jcj/b03I8yriarC2Rd0fucqx0r6gdODoH3lAPJyoERCsMVDejduJFSN/JZUncIpk+00mt0VwbwujPw0m7ik93qH+WWu2p/01I7t4H/wX1V/qd7i7+qu5bTNkFlUqeUGdBIugI6KuMsXocTDysM3RiwrQfz+6pmCKZir2qEZqCGTAwTehUV7uO1vQuMUm7CO0J5R/89CpRWHIYBzwB3nP0QGE4k4wzWFlJ4Eqm22jP9rYGUgAzFDcvwULhjImv5a0LHvfunw8b4j2wQbopQk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(26005)(7416002)(8936002)(122000001)(38100700002)(186003)(33656002)(2906002)(53546011)(6512007)(6506007)(86362001)(66446008)(66476007)(66556008)(64756008)(66946007)(36756003)(8676002)(4326008)(76116006)(91956017)(316002)(6486002)(508600001)(110136005)(71200400001)(54906003)(5660300002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <359E632D236F9A43B6E2E6750C397B0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2227
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	90de2269-23b8-4e0d-1a4c-08da035274cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c1H5D+BhDp35ccYkg2pkN54d+Y2LvOsYjNQaJZlBn8XO8FI8YxjMGvLeYl5zlqCgpyopWoGEcAoHZeQ8zIvMiK/7pYFegG4RCgNGcdJtKGqbEZr5A/Qsxzm4NcyDC6wp/UKjoxr/U59T7eZoNPssa29hha87bSShwzZ8LcvjOmHFUm/JteosISpHPGDcj69YVp2G/Wm9VMeuTX2b9D3EfaT2Z/wwq0UptQbnfY/JpnYf5aLwYupn6jBErvyBOREKfmHBiRCFQIE3IzscTiHB3GQiNShajzFQBFmjMKbofkAJGtkcOsqUmzvTcaCPdv6wJ4ymbLHMt4kMBunXkmohRripaUl3MMdtS95UYy44+CmuUuFPPINxaIjHFLAJG5a0ZrC4JWNM4lKqP5sklgrQ2w586ha9wvjMew7i5TRinMsIcQVe2uSz1y56TTbH5pmIsj+AeAwiPHh7NJE7IUf/iizULGoqhEUCPRW2nz6JuqRJoHCF4z6nniU9RrMghSPzYE4+v6i/oM1f74bUvwgEhQE6EyeUTLixjjwROrfX7eRHqnNe8bjz9U0N2eAM/4g1RsbfN+0JWihPD6UPhUXA5iTpCSUNZ/jlBjTXqKVPdFqQw/0JUgIdqJkwmm2Ify51G8sNWWzvAOp3xEGRW3v0T6QjXkV1C2fahVN7it7RWELaC5Bl+GX5CpBMOSB5frcM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(110136005)(6486002)(54906003)(336012)(186003)(356005)(2616005)(81166007)(316002)(2906002)(107886003)(36756003)(6512007)(6506007)(33656002)(82310400004)(36860700001)(47076005)(70586007)(70206006)(8936002)(5660300002)(53546011)(86362001)(26005)(40460700003)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 11:30:03.3132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a03593e0-5e12-493b-27f3-08da03527c4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4161

DQoNCj4gT24gMTEgTWFyIDIwMjIsIGF0IDEwOjE4LCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTEuMDMuMjIgMTA6NDYsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4gT24gMTEuMDMuMjAyMiAxMDoyOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBPbiAx
MS4wMy4yMiAwOTo1NiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+IE9uIDExIE1hciAyMDIy
LCBhdCAwODowOSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+
IE9uIDEwLjAzLjIyIDE4OjEwLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+IC0tLSAvZGV2
L251bGwNCj4+Pj4+PiArKysgYi94ZW4vY29tbW9uL2Jvb3RfY3B1cG9vbHMuYw0KPj4+Pj4+IEBA
IC0wLDAgKzEsMjEyIEBADQo+Pj4+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wICovDQo+Pj4+Pj4gKy8qDQo+Pj4+Pj4gKyAqIHhlbi9jb21tb24vYm9vdF9jcHVwb29scy5j
DQo+Pj4+Pj4gKyAqDQo+Pj4+Pj4gKyAqIENvZGUgdG8gY3JlYXRlIGNwdXBvb2xzIGF0IGJvb3Qg
dGltZSBmb3IgYXJtIGFyY2hpdGVjdHVyZS4NCj4+Pj4+IA0KPj4+Pj4gUGxlYXNlIGRyb3AgdGhl
IGFybSByZWZlcmVuY2UgaGVyZS4NCj4+Pj4+IA0KPj4+Pj4+ICsgKg0KPj4+Pj4+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMjIgQXJtIEx0ZC4NCj4+Pj4+PiArICovDQo+Pj4+Pj4gKw0KPj4+Pj4+ICsj
aW5jbHVkZSA8eGVuL3NjaGVkLmg+DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsjZGVmaW5lIEJUQ1BVUE9P
TFNfRFRfTk9ERV9OT19SRUcgICAgICgtMSkNCj4+Pj4+PiArI2RlZmluZSBCVENQVVBPT0xTX0RU
X05PREVfTk9fTE9HX0NQVSAoLTIpDQo+Pj4+PiANCj4+Pj4+IE1vdmUgdGhvc2UgaW5zaWRlIHRo
ZSAjaWZkZWYgYmVsb3csIHBsZWFzZQ0KPj4+Pj4gDQo+Pj4+Pj4gKw0KPj4+Pj4+ICtzdHJ1Y3Qg
cG9vbF9tYXAgew0KPj4+Pj4+ICsgICAgaW50IHBvb2xfaWQ7DQo+Pj4+Pj4gKyAgICBpbnQgc2No
ZWRfaWQ7DQo+Pj4+Pj4gKyAgICBzdHJ1Y3QgY3B1cG9vbCAqcG9vbDsNCj4+Pj4+PiArfTsNCj4+
Pj4+PiArDQo+Pj4+Pj4gK3N0YXRpYyBzdHJ1Y3QgcG9vbF9tYXAgX19pbml0ZGF0YSBwb29sX2Nw
dV9tYXBbTlJfQ1BVU10gPQ0KPj4+Pj4+ICsgICAgeyBbMCAuLi4gTlJfQ1BVUy0xXSA9IHsucG9v
bF9pZCA9IC0xLCAuc2NoZWRfaWQgPSAtMSwgLnBvb2wgPSBOVUxMfSB9Ow0KPj4+Pj4+ICtzdGF0
aWMgdW5zaWduZWQgaW50IF9faW5pdGRhdGEgbmV4dF9wb29sX2lkOw0KPj4+Pj4+ICsNCj4+Pj4+
PiArI2lmZGVmIENPTkZJR19BUk0NCj4+Pj4+IA0KPj4+Pj4gU2hvdWxkbid0IHRoaXMgYmUgQ09O
RklHX0hBU19ERVZJQ0VfVFJFRT8NCj4+Pj4gDQo+Pj4+IFllcywgdGhlIG9ubHkgcHJvYmxlbSBp
cyB0aGF0IGluIGdldF9sb2dpY2FsX2NwdV9mcm9tX2h3X2lkIEkgdXNlIHRoZSBhcm0gc3BlY2lm
aWMNCj4+Pj4gY3B1X2xvZ2ljYWxfbWFwKOKApiksIHNvIHdoYXQgZG8geW91IHRoaW5rIGl04oCZ
cyB0aGUgYmV0dGVyIHdheSBoZXJlPw0KPj4+PiBEbyB5b3UgdGhpbmsgSSBzaG91bGQgaGF2ZSBl
dmVyeXRoaW5nIHVuZGVyIENPTkZJR19IQVNfREVWSUNFX1RSRUUNCj4+Pj4gYW5kIGdldF9sb2dp
Y2FsX2NwdV9mcm9tX2h3X2lkIHVuZGVyIENPTkZJR19BUk0gbGlrZSBpbiB0aGlzIHdheSBiZWxv
dz8NCj4+PiANCj4+PiBIbW0sIHdoYXQgaXMgdGhlIGh3aWQgdXNlZCBmb3Igb24gQXJtPyBJIGd1
ZXNzIHRoaXMgY291bGQgYmUgc2ltaWxhcg0KPj4+IHRvIHRoZSB4ODYgYWNwaS1pZD8NCj4+IFNp
bmNlIHRoZXJlJ3MgZ29pbmcgdG8gYmUgb25seSBvbmUgb2YgRFQgb3IgQUNQSSwgaWYgYW55dGhp
bmcgdGhpcyBjb3VsZA0KPj4gYmUgdGhlIEFQSUMgSUQgYW5kIHRoZW4gLi4uDQo+Pj4gU28gSSdk
IHJhdGhlciBwdXQgZ2V0X2xvZ2ljYWxfY3B1X2Zyb21faHdfaWQoKSBpbnRvIEFybSBzcGVjaWZp
YyBjb2RlDQo+Pj4gYW5kIGFkZCBhIHJlbGF0ZWQgeDg2IGZ1bmN0aW9uIHRvIHg4NiBjb2RlLiBE
ZXBlbmRpbmcgb24gdGhlIGFuc3dlciB0bw0KPj4+IGFib3ZlIHF1ZXN0aW9uIHRoaXMgY291bGQg
ZWl0aGVyIGJlIGdldF9jcHVfaWQoKSwgb3IgbWF5YmUgYW4gaWRlbnRpdHkNCj4+PiBmdW5jdGlv
bi4NCj4+IC4uLiBhIGxvb2t1cCBsb29wIG92ZXIgeDg2X2NwdV90b19hcGljaWRbXSAoSSB0aG91
Z2h0IHdlIGhhZCBhIGZ1bmN0aW9uDQo+PiBkb2luZyBzbywgYnV0IHJpZ2h0IG5vdyBJIGNhbid0
IGZpbmQgb25lKS4NCj4gDQo+IEl0IGlzIHRoZSBzZWNvbmQgaGFsZiBvZiBnZXRfY3B1X2lkKCku
DQoNCkkgd2FzIGdvaW5nIHRvIHNheSwgbWF5YmUgSSBjYW4gZG8gc29tZXRoaW5nIGxpa2UgdGhp
czoNCg0KI2lmZGVmIENPTkZJR19BUk0NCiNkZWZpbmUgaHdpZF9mcm9tX2xvZ2ljYWxfY3B1X2lk
KHgpIGNwdV9sb2dpY2FsX21hcCh4KQ0KI2VsaWYgZGVmaW5lZChDT05GSUdfWDg2KQ0KI2RlZmlu
ZSBod2lkX2Zyb21fbG9naWNhbF9jcHVfaWQoeCkgeDg2X2NwdV90b19hcGljaWQoeCkNCiNlbHNl
DQojZGVmaW5lIGh3aWRfZnJvbV9sb2dpY2FsX2NwdV9pZCh4KSAoLTEpDQojZW5kDQoNCnN0YXRp
YyBpbnQgX19pbml0IGdldF9sb2dpY2FsX2NwdV9mcm9tX2h3X2lkKHVuc2lnbmVkIGludCBod2lk
KQ0Kew0KICAgIHVuc2lnbmVkIGludCBpOw0KDQogICAgZm9yICggaSA9IDA7IGkgPCBucl9jcHVf
aWRzOyBpKysgKQ0KICAgICAgICBpZiAoIGh3aWRfZnJvbV9sb2dpY2FsX2NwdV9pZChpKSA9PSBo
d2lkICkNCiAgICAgICAgICAgIHJldHVybiBpOw0KDQogICAgcmV0dXJuIC0xOw0KfQ0KDQpEbyB5
b3UgdGhpbmsgaXQgaXMgYWNjZXB0YWJsZT8NCg0KSSBzZWUgdGhlIGN1cnJlbnQgZ2V0X2NwdV9p
ZCjigKYpIGZyb20geDg2IGNvZGUgaXMgc3RhcnRpbmcgZnJvbSBhbiBhY3BpIGlkIHRvDQpsb29r
dXAgdGhlIGFwaWNpZCBhbmQgdGhlbiBpdCBpcyBsb29raW5nIGZvciB0aGUgbG9naWNhbCBjcHUg
bnVtYmVyLg0KSW4gdGhlIHg4NiBjb250ZXh0LCBldmVudHVhbGx5LCB0aGUgcmVnIHByb3BlcnR5
IG9mIGEgY3B1IG5vZGUgd291bGQgaG9sZCBhbg0KQWNwaSBpZCBvciBhbiBhcGljaWQ/IEkgd291
bGQgaGF2ZSBzYXkgdGhlIGxhc3Qgb25lIGJ1dCBJ4oCZbSBub3Qgc3VyZSBub3cuDQoNCkNoZWVy
cywNCkx1Y2ENCg0KPiANCj4gDQo+IEp1ZXJnZW4NCj4gPE9wZW5QR1BfMHhCMERFOURENjI4QkYx
MzJGLmFzYz4NCg0K

