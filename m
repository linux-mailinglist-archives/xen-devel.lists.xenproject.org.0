Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC34ED7C6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 12:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296872.505497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZs57-00053A-Bi; Thu, 31 Mar 2022 10:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296872.505497; Thu, 31 Mar 2022 10:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZs57-00050A-79; Thu, 31 Mar 2022 10:31:09 +0000
Received: by outflank-mailman (input) for mailman id 296872;
 Thu, 31 Mar 2022 10:31:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yrn=UK=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZs55-000504-E7
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 10:31:07 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe05::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa621ca1-b0dd-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 12:31:03 +0200 (CEST)
Received: from AM9P193CA0017.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::22)
 by VI1PR0801MB2045.eurprd08.prod.outlook.com (2603:10a6:800:89::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 10:30:54 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21e:cafe::49) by AM9P193CA0017.outlook.office365.com
 (2603:10a6:20b:21e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Thu, 31 Mar 2022 10:30:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 10:30:54 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Thu, 31 Mar 2022 10:30:53 +0000
Received: from 051bd8fbb708.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8906F5B6-75FC-488B-9CDB-F484AED63D58.1; 
 Thu, 31 Mar 2022 10:30:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 051bd8fbb708.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 31 Mar 2022 10:30:47 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM4PR08MB2785.eurprd08.prod.outlook.com (2603:10a6:205:5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 10:30:38 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be%8]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 10:30:38 +0000
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
X-Inumbo-ID: aa621ca1-b0dd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvXueQ5frZ3Uaqgw39dvYeQnBHzyNckzPrAZSd2icmA=;
 b=x0mQAgGi4YedvOmp8h/5bUoJ0br4QcpyJ+F6RdtcP4usWOIoE6y1EWtm+tp7ftqlW9mW5ey+rNBkRkCKusM+bGR9OYvoQ+Vd4ZokRDtG58TycpfBaGF9el53F2ykiAES1fz84QcFaJEJuoylXRQc0KYxAN89EgV+LPhAV98uk4I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTM1nJjsBIGTLVnmXsvweJP5nklOhh9EBwOoVf1Ig5qtEeRFSkV/xDF+XJhAfbzY4HYHjT1P83GM4G7fI/6Pl3s8m2mnG+MZ19HU0GqYtfv4qrHTyOFOgNpKGeMUHzGoNK/bY//nfGSZdRgL+T2XoACHq1xTf9BnFXNpONzRXaWPurJ5YQ3Tr36M3B0hQVvJG08l3SBASy/KfXLJMxndj/2GMow9bBVGUf0RlYgagG65HGstjVBWR8c80ybycmAmkVGtO0lae0Rh4di312h1HelHORS1wE7jbIHKJ0S1fiE0xb1+lkEkwN6WLy++zn+OZLzwWyZaHdGcXqXdvx7EAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvXueQ5frZ3Uaqgw39dvYeQnBHzyNckzPrAZSd2icmA=;
 b=DT+muq0DbU13cAhQClzuFXlll0pSW+mfRPiWgEXB4lZ7zVCONodlxlO0FB3GniswxLk0W/V8gaw9mPSemlPWhNP6aS6LfZGYIoDNr3V9MP8GP4ksAU3hvUTKiOjWqZNAgMUNRkSMiq3W9mOG5rf/ELbCFnTpauokx9b+476EdFbcBq+WKXdNuShfBa6TfTjEtL6w5TMYPPKGazMnnUTWY02Ep1JUl7kYCAo1gSb+pHELvpMkCV5v4QpcEH3BQOjniH+yoEmeNWOM9ubpZpCFwN7NBYhoF8cBdo3EQ8T4lY2sAF5C7zFpbFiqJHRB0FV85Lw7xJEZ7dfzef8a4HZehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvXueQ5frZ3Uaqgw39dvYeQnBHzyNckzPrAZSd2icmA=;
 b=x0mQAgGi4YedvOmp8h/5bUoJ0br4QcpyJ+F6RdtcP4usWOIoE6y1EWtm+tp7ftqlW9mW5ey+rNBkRkCKusM+bGR9OYvoQ+Vd4ZokRDtG58TycpfBaGF9el53F2ykiAES1fz84QcFaJEJuoylXRQc0KYxAN89EgV+LPhAV98uk4I=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
Thread-Topic: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
Thread-Index: AQHYRBnkeXnYvoANH0WdfY8GUNrlN6zXr5KAgAEgZ0CAAENNAIAAARVQ
Date: Thu, 31 Mar 2022 10:30:38 +0000
Message-ID:
 <DU2PR08MB7325D94A0BFFC2A3BB0AFF08F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-4-Penny.Zheng@arm.com>
 <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
 <DU2PR08MB73251B78F8EB19E334A70876F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <eba664e6-4146-426b-5119-59fe02a96bb5@suse.com>
In-Reply-To: <eba664e6-4146-426b-5119-59fe02a96bb5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8726EBF7C6D9C842AF073370F5C6B767.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bb10cd2f-03dc-42ec-66cb-08da1301891f
x-ms-traffictypediagnostic:
	AM4PR08MB2785:EE_|VE1EUR03FT026:EE_|VI1PR0801MB2045:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB2045395792D6C61AA969518BF7E19@VI1PR0801MB2045.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EkXYXnQh3ulJBnm83XVaXFyMCHZT/Qk2GZSnhvQRH9Ei4/4XqIUkyzlZadlcYW4rQwX4r2m2iEjaI9EprV208Rsvn/fkwxUdh89EJ5xz3wb/JiJcyEG4xQ96q4joDpoTQyocqPqKYRrQ7T+ZWsycYC71N9qduhwq5F/DpUBQJLLoS/hax+WezWvLfTuS+1EsKLHCvzNLPNP2cUiDVfsfE6xG8/iBxcGUgekAxtF6qqD8gObxbwDBF9wUWC4Ourl/KW0rDC7jwla1y/dQ3tX1tDbijZI91OTMCCYcYF51iCejf1QUc7MSHBX839hBIjZW6i/M66e+sXJPQLNGEJt0AhdbuCs1b75Et2wJFjxq7kOO8WMLG43ndN8FkSpnfHzNJz1BoIBkazXLq+wn7sGsI+rtdv+6EGbBocPuhSX3AsJY1qEfb34nMm4i0JDXH+jKeVlYyeyV1MlMkgGSXeBu8kapYy4pNtSJPc1ThJ1VrUplUD9atwrHNS1EWRCt2LNblmVq2OKKGomlehi2sfeiFBDLaazQ5yFv0pVFudQbe64R/V+qyok5FwEmMLi7e5pjhTtctte6dAMdImyZMSfkMWAXikkoxkSeDluTuFU8Z2NAOmDdF4xB8mKXPK5ZLQqKAD+O5zhWRxzn0E910vIFskeK5V0lRvCY9aqP3jK714SGqnbJj59lBL265KSilOMek+DgT2K0wwXKhjIzx5q6fA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(6916009)(33656002)(54906003)(316002)(83380400001)(86362001)(186003)(26005)(508600001)(53546011)(71200400001)(7696005)(6506007)(9686003)(45080400002)(122000001)(5660300002)(8936002)(52536014)(2906002)(38070700005)(66446008)(66476007)(66556008)(38100700002)(4326008)(8676002)(76116006)(64756008)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2785
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31ea1f33-a3c0-4685-2f0e-08da13017fa5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c/litOBI0e4Zi/YGgc24k1S08Vphxs3CUoP59eotjX3BX+q84MeF1pJMQjjxkMklRL01CAD05hquhLRWwcG9SYbAc6xLt1OOyMLmneTmZYRMgMGUowZLaTsZTuSRAYQVMfWGLIPUrQpFgEar1RGoIsEuRCP5P6aOaIMAy03fPbT4LSxA02TbwCoV1es3YE4C00HHIyokYgDkmdPUIhnIeTxNQWs5RaRhBleu1NgnEIeaYrqyD59D17+o0GelMahoUmIu0TGpNuvc3ugnKc8FRW0ZTIBa/wNWiXJJnDH2uhwetTc73iY+K40JDb0TuA3ISGvnGLyKUyJJrdSr6rICjxyZgLsIvcC4BroPeKVV0RCDxVhjxx8At5xJ8geP/cthQMQZCDRkduBrON5om5nucTQ6e7t2yAae+3mB1BV5wPLtwO0Iqxn5RPgmxD/RpkmugQjjHGg7KrjsCQknuKFm1LHTKSPpVo25ch8eQpp9ofRF2klmY3tmZrhvqQFy9OIMSntSHVwfr3qQVnd6VsmQsZ6eDsNir9gx5fMjDAG3pgwnXhJ7dh+E/nzwbV/YzKeYEB1vwgVHb9wqVDOTOFhm8Pr2XrzUwBJa96ZMl26zb7WDM0wA1pmyTFsYIPD4zl6dmACy3ScOFq9WYtLUNNRE8Rm8VT/G4EFdVdKZ5c3vWdJQdDABeyQaX1DrYlFvXOEP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(9686003)(54906003)(82310400004)(52536014)(8936002)(33656002)(5660300002)(316002)(53546011)(6506007)(7696005)(36860700001)(47076005)(81166007)(356005)(83380400001)(86362001)(55016003)(45080400002)(4326008)(40460700003)(186003)(26005)(6862004)(336012)(508600001)(8676002)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 10:30:54.1371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb10cd2f-03dc-42ec-66cb-08da1301891f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2045

SGkgSmFuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDMxLCAyMDIy
IDM6MDYgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzog
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5j
b20+Ow0KPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2Vvcmdl
IER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMy81XSB4ZW4vYXJtOiB1bnBvcHVsYXRlIG1l
bW9yeSB3aGVuIGRvbWFpbiBvbg0KPiBzdGF0aWMgYWxsb2NhdGlvbg0KPiANCj4gT24gMzEuMDMu
MjAyMiAwODoxMywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgSmFuDQo+ID4NCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDMwLCAyMDIyIDU6NTMgUE0N
Cj4gPj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiA+PiBDYzogV2Vp
IENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBIZW5yeSBXYW5nDQo+IDxIZW5yeS5XYW5nQGFybS5j
b20+Ow0KPiA+PiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2Vv
cmdlIER1bmxhcA0KPiA+PiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8NCj4gPj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tDQo+ID4+IGRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMy81XSB4ZW4vYXJt
OiB1bnBvcHVsYXRlIG1lbW9yeSB3aGVuIGRvbWFpbiBvbg0KPiA+PiBzdGF0aWMgYWxsb2NhdGlv
bg0KPiA+Pg0KPiA+PiBPbiAzMC4wMy4yMDIyIDExOjM2LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4g
Pj4+IC0tLSBhL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gPj4+ICsrKyBiL3hlbi9jb21tb24vbWVt
b3J5LmMNCj4gPj4+IEBAIC0zNSw2ICszNSwxMCBAQA0KPiA+Pj4gICNpbmNsdWRlIDxhc20vZ3Vl
c3QuaD4NCj4gPj4+ICAjZW5kaWYNCj4gPj4+DQo+ID4+PiArI2lmbmRlZiBpc19kb21haW5fb25f
c3RhdGljX2FsbG9jYXRpb24gI2RlZmluZQ0KPiA+Pj4gK2lzX2RvbWFpbl9vbl9zdGF0aWNfYWxs
b2NhdGlvbihkKSAwDQo+ID4+DQo+ID4+IE5pdDogImZhbHNlIiwgbm90ICIwIi4NCj4gPj4NCj4g
Pj4+IEBAIC00MDUsMTMgKzQwOSwyOSBAQCBpbnQgZ3Vlc3RfcmVtb3ZlX3BhZ2Uoc3RydWN0IGRv
bWFpbiAqZCwNCj4gPj4gdW5zaWduZWQgbG9uZyBnbWZuKQ0KPiA+Pj4gICAgICAgKiBkZXZpY2Ug
bXVzdCByZXRyaWV2ZSB0aGUgc2FtZSBwZm4gd2hlbiB0aGUgaHlwZXJjYWxsDQo+ID4+IHBvcHVs
YXRlX3BoeXNtYXANCj4gPj4+ICAgICAgICogaXMgY2FsbGVkLg0KPiA+Pj4gICAgICAgKg0KPiA+
Pj4gKyAgICAgKiBXaGVuIGRvbWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbiwgdGhleSBzaG91bGQg
YWx3YXlzIGdldA0KPiA+Pj4gKyBwYWdlcyBmcm9tDQo+ID4+IHRoZQ0KPiA+Pj4gKyAgICAgKiBy
ZXNlcnZlZCBzdGF0aWMgcmVnaW9uIHdoZW4gdGhlIGh5cGVyY2FsbCBwb3B1bGF0ZV9waHlzbWFw
IGlzDQo+IGNhbGxlZC4NCj4gPj4+ICsgICAgICoNCj4gPj4+ICAgICAgICogRm9yIHRoaXMgcHVy
cG9zZSAoYW5kIHRvIG1hdGNoIHBvcHVsYXRlX3BoeXNtYXAoKSBiZWhhdmlvciksIHRoZQ0KPiBw
YWdlDQo+ID4+PiAgICAgICAqIGlzIGtlcHQgYWxsb2NhdGVkLg0KPiA+Pj4gICAgICAgKi8NCj4g
Pj4+IC0gICAgaWYgKCAhcmMgJiYgIWlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICkNCj4gPj4+
ICsgICAgaWYgKCAhcmMgJiYgIShpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSB8fA0KPiA+Pj4g
KyAgICAgICAgICAgICAgICAgIGlzX2RvbWFpbl9vbl9zdGF0aWNfYWxsb2NhdGlvbihkKSkgKQ0K
PiA+Pj4gICAgICAgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKHBhZ2UpOw0KPiA+Pj4NCj4gPj4+ICAg
ICAgcHV0X3BhZ2UocGFnZSk7DQo+ID4+PiArI2lmZGVmIENPTkZJR19TVEFUSUNfTUVNT1JZDQo+
ID4+PiArICAgIC8qDQo+ID4+PiArICAgICAqIFdoZW4gZG9tYWluIG9uIHN0YXRpYyBhbGxvY2F0
aW9uLCB3ZSBzaGFsbCBzdG9yZSBwYWdlcyB0bw0KPiA+PiByZXN2X3BhZ2VfbGlzdCwNCj4gPj4+
ICsgICAgICogc28gdGhlIGh5cGVyY2FsbCBwb3B1bGF0ZV9waHlzbWFwIGNvdWxkIHJldHJpZXZl
IHBhZ2VzIGZyb20gaXQsDQo+ID4+PiArICAgICAqIHJhdGhlciB0aGFuIGFsbG9jYXRpbmcgZnJv
bSBoZWFwLg0KPiA+Pj4gKyAgICAgKi8NCj4gPj4+ICsgICAgaWYgKCBpc19kb21haW5fb25fc3Rh
dGljX2FsbG9jYXRpb24oZCkgKQ0KPiA+Pj4gKyAgICB7DQo+ID4+PiArICAgICAgICBwYWdlX2xp
c3RfYWRkX3RhaWwocGFnZSwgJmQtPnJlc3ZfcGFnZV9saXN0KTsNCj4gPj4+ICsgICAgICAgIGQt
PnJlc3ZfcGFnZXMrKzsNCj4gPj4+ICsgICAgfQ0KPiA+Pj4gKyNlbmRpZg0KPiA+Pg0KPiA+PiBJ
IHRoaW5rIHRoaXMgaXMgd3JvbmcsIGFzIGEgcmVzdWx0IG9mIG5vdCBpbnRlZ3JhdGluZyB3aXRo
IHB1dF9wYWdlKCkuDQo+ID4+IFRoZSBwYWdlIHNob3VsZCBvbmx5IGdvIG9uIHRoYXQgbGlzdCBv
bmNlIGl0cyBsYXN0IHJlZiB3YXMgZHJvcHBlZC4gSQ0KPiA+PiBkb24ndCByZWNhbGwgZm9yIHN1
cmUsIGJ1dCBpaXJjIHN0YXRpY21lbSBwYWdlcyBhcmUgcHV0IG9uIHRoZQ0KPiA+PiBkb21haW4n
cyBwYWdlIGxpc3QganVzdCBsaWtlIG90aGVyIHBhZ2VzIHdvdWxkIGJlLiBCdXQgdGhlbiB5b3Ug
YWxzbw0KPiA+PiBjb3JydXB0IHRoZSBsaXN0IHdoZW4gdGhpcyBpc24ndCB0aGUgbGFzdCByZWYg
d2hpY2ggaXMgcHV0Lg0KPiA+DQo+ID4gWWVzLCBzdGF0aWNtZW0gcGFnZXMgYXJlIHB1dCBvbiB0
aGUgZG9tYWluJ3MgcGFnZSBsaXN0Lg0KPiA+IEhlcmUsIEkgdHJpZWQgdG8gb25seSBkZXN0cm95
IHRoZSBQMk0gbWFwcGluZywgYW5kIGtlZXAgdGhlIHBhZ2Ugc3RpbGwNCj4gPiBhbGxvY2F0ZWQg
dG8gdGhpcyBkb21haW4uDQo+IA0KPiBXZWxsLCBtdWNoIGRlcGVuZHMgb24gd2hhdCB5b3UgY2Fs
bCAiYWxsb2NhdGVkIi4gRm9yIHBvcHVsYXRlX3BoeXNtYXAgeW91DQo+IHRoZW4gdGFrZSBwYWdl
cyBmcm9tIHJlc3ZfcGFnZV9saXN0LiBTbyBJJ2QgbGlrZSB0byBkaXN0aW5ndWlzaCAiYWxsb2Nh
dGVkIiBmcm9tDQo+ICJyZXNlcnZlZCI6IFRoZSBwYWdlcyBhcmUgYWxsb2NhdGVkIHRvIHRoZSBk
b21haW4gd2hlbiB0aGV5J3JlIG9uIHRoZSBub3JtYWwNCj4gcGFnZSBsaXN0OyB0aGV5J3JlIHJl
c2VydmVkIHdoZW4gdGhleSdyZSBvbiB0aGUgbmV3IGxpc3QgeW91IGludHJvZHVjZS4gQW5kDQo+
IHdoYXQgeW91IHdhbnQgdG8gaW5pdGlhdGUgaGVyZSBpcyBhbiAiYWxsb2NhdGVkIiAtPiAicmVz
ZXJ2ZWQiIHRyYW5zaXRpb24uDQo+IA0KPiA+IHJlc3ZfcGFnZV9saXN0IGlzIGp1c3QgcHJvdmlk
aW5nIGFuIGVhc3kgd2F5IHRvIHRyYWNrIGRvd24gdGhlIHVucG9wdWxhdGVkDQo+IG1lbW9yeS4N
Cj4gPiAnJycNCj4gPiBCdXQgdGhlbiB5b3UgYWxzbyBjb3JydXB0IHRoZSBsaXN0IHdoZW4gdGhp
cyBpc24ndCB0aGUgbGFzdCByZWYgd2hpY2gNCj4gPiBpcyBwdXQuDQo+ID4gJycnDQo+ID4gSSdt
IHNvcnJ5LCB3b3VsZCB5b3UgbGlrZSB0byBiZSBtb3JlIHNwZWNpZmljIG9uIHRoaXMgY29tbWVu
dD8NCj4gPiBJIHdhbnQgdGhlc2UgcGFnZXMgdG8gbGlua2VkIGluIHRoZSBkb21haW4ncyBwYWdl
IGxpc3QsIHRoZW4gaXQgY291bGQNCj4gPiBiZSBmcmVlZCBwcm9wZXJseSB3aGVuIGRvbWFpbiBn
ZXQgZGVzdHJveWVkIHRocm91Z2ggcmVsaW5xdWlzaF9tZW1vcnkuDQo+IA0KPiBDbGVhcmx5IHRo
ZXkgY2FuJ3QgYmUgb24gYm90aCBsaXN0cy4gSGVuY2UgeW91IGNhbiBwdXQgdGhlbSBvbiB0aGUg
bmV3IGxpc3QNCj4gb25seSBfYWZ0ZXJfIGhhdmluZyB0YWtlbiB0aGVtIG9mZiB0aGUgIm5vcm1h
bCIgbGlzdC4gVGhhdCAidGFraW5nIG9mZiB0aGUNCj4gbm9ybWFsIGxpc3QiIHNob3VsZCBoYXBw
ZW4gd2hlbiB0aGUgbGFzdCByZWYgaXMgZHJvcHBlZCwgbm90IGhlcmUgLSBzZWUNCj4gZnJlZV9k
b21oZWFwX3BhZ2VzKCkncyB1c2VzIG9mIGFyY2hfZnJlZV9oZWFwX3BhZ2UoKSwgcmVjYWxsaW5n
IHRoYXQNCj4gZnJlZV9kb21oZWFwX3BhZ2UoKSBpcyB3aGF0DQo+IHB1dF9wYWdlKCkgY2FsbHMg
dXBvbiBkcm9wcGluZyB0aGUgbGFzdCByZWYuDQo+IA0KDQpSaWdodCwgcmlnaHQsIEkndmUgbWlz
c2VkIHRoZSBjcml0aWNhbCBwb2ludCAidGhleSBjYW4ndCBiZSBvbiBib3RoIGxpc3RzIi4NCkhl
cmUgaXMgYSB0aGluZywgcHV0X3BhZ2UgaXMgYSB2ZXJ5IGNvbW1vbiBoZWxwZXIgdGhhdCBpdCBp
cyBhbHNvIGJlZW5pbmcNCnVzZWQgd2hlbiBmcmVlaW5nIG1lbW9yeSBvbiBkb21haW4gZGVjb25z
dHJ1Y3Rpb24uIEF0IHRoYXQgdGltZSwgSQ0KZG9uJ3Qgd2FudCB0byBwdXQgdGhlc2UgcGFnZXMg
aW4gcmVzdl9wYWdlX2xpc3QsIEknZCBsaWtlIHRoZW0gdG8gYmUNCmZyZWVkIHRvIHRoZSBoZWFw
LiBUaGlzIHB1dHRpbmcgcGFnZXMgaW4gcmVzdl9wYWdlX2xpc3QgdGhpbmcgaXMgb25seSBmb3IN
CnVucG9wdWxhdGluZyBtZW1vcnkgb24gdGhlIHJ1bnRpbWUuIFNvIEknZCBzdWdnZXN0IGludHJv
ZHVjaW5nIGENCm5ldyBoZWxwZXIgcHV0X3BhZ2VzX3Jlc3YoLi4uKSB0byBkbyB0aGUgd29yay4N
CiANCkFib3V0IGJlZm9yZSB5b3UgbWVudGlvbmVkIHRoYXQgIlRoZSBwYWdlcyBhcmUgYWxsb2Nh
dGVkIHRvIHRoZQ0KZG9tYWluIHdoZW4gdGhleSdyZSBvbiB0aGUgbm9ybWFsIHBhZ2UgbGlzdDsg
dGhleSdyZSByZXNlcnZlZCB3aGVuDQp0aGV5J3JlIG9uIHRoZSBuZXcgbGlzdCB5b3UgaW50cm9k
dWNlLiAiIElzIHRoZXJlIGEgcG9zc2liaWxpdHkgdGhhdCBJDQpzdGlsbCBrZWVwIHRoZSBwYWdl
cyBhbGxvY2F0ZWQgYnV0IGp1c3QgbW92aW5nIHRoZW0gZnJvbSBub3JtYWwgcGFnZSBsaXN0DQp0
byB0aGUgbmV3IHJlc3ZfcGFnZV9saXN0PyBPZiBjb3Vyc2UsIGEgZmV3IGV4dHJhIHRoaW5ncyBu
ZWVkZWQgdG8gYmUNCmNvdmVyZWQsIGxpa2UgZG9tYWluX2FkanVzdF90b3RfcGFnZXMsIHNjcnVi
aW5nIHRoZSBwYWdlcy4gDQoNCkFub3RoZXIgcmVhc29uIEkgd2FudCB0byBrZWVwIHBhZ2UgYWxs
b2NhdGVkIGlzIHRoYXQgaWYgcHV0dGluZyBwYWdlcyBpbg0KcmVzdl9wYWdlX2xpc3QgdXBvbiBk
cm9wcGluZyB0aGUgbGFzdCByZWYsIHdlIG5lZWQgdG8gZG8gYSBsb3QgdGhpbmdzIG9uDQpwYWdl
cyB0byB0b3RhbGx5IGxldCBpdCBmcmVlLCBsaWtlIHNldCBpdHMgb3duZXIgdG8gTlVMTCwgY2hh
bmdpbmcgcGFnZSBzdGF0ZQ0KZnJvbSBpbl91c2UgdG8gZnJlZSwgZXRjLiBMYXRlciB3aGVuIHBv
cHVsYXRpbmcgdGhlbSwgd2Ugc2hhbGwgZG8gdGhlDQpleGFjdCBpbiBiYWNrd2FyZHMsIHNldHRp
bmcgdGhlIG93bmVyIGJhY2sgdG8gdGhlIGRvbWFpbiwgY2hhbmdpbmcgdGhlDQpzdGF0ZSBmcm9t
IGZyZWUgYmFjayB0byBpbl91c2UsIHdoaWNoIHNlZW1zIGEgYml0IHVzZWxlc3MuIEFuZCBhY3R1
YWxseQ0KZm9yIGRvbWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbiwgdGhlc2Ugc3RhdGljbWVtIHBh
Z2VzIGFyZSByZXNlcnZlZA0KZnJvbSB0aGUgdmVyeSBiZWdpbm5pbmcsIGFuZCB3aGVuIGl0IGlz
IGFsbG9jYXRlZCB0byB0aGUgZG9tYWluLCBpdA0KZm9yZXZlciBiZWxvbmdzIHRvIHRoZSBkb21h
aW4sIGFuZCBpdCBjb3VsZCBuZXZlciBiZSB1c2VkIGluIGFueSBvdGhlciB3YXkuDQogDQpMYXRl
ciB3aGVuIHBvcHVsYXRpbmcgdGhlIG1lbW9yeSwgd2UgY291bGQganVzdCBtb3ZlIHRoZSBwYWdl
cyBmcm9tDQpyZXN2X3BhZ2VfbGlzdCBiYWNrIHRvIHRoZSBub3JtYWwgbGlzdCwgYW5kIGFsc28g
ZG9tYWluX2FkanVzdF90b3RfcGFnZXMuDQoNCkFub3RoZXIgdGhpbmcgSSdkIGNvbnNpZGVyIHRv
IGJlIGFmZmVjdGVkIGlzIHRoYXQgd2hlbiBkb21haW4gaXMgZHlpbmcsIGFuZA0KZG9pbmcgcmVs
aW5xdWlzaF9tZW1vcnksIEkgbmVlZCBleHRyYSByZWxpbnF1aXNoaW5nIGZvciBwYWdlcyBpbiBy
ZXN2X3BhZ2VfbGlzdC4NCg0KPiBKYW4NCg0K

