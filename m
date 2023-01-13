Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E6669B34
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 16:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477405.740117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGLWD-0000s2-AG; Fri, 13 Jan 2023 14:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477405.740117; Fri, 13 Jan 2023 14:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGLWD-0000pL-6F; Fri, 13 Jan 2023 14:58:57 +0000
Received: by outflank-mailman (input) for mailman id 477405;
 Fri, 13 Jan 2023 14:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Kou=5K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pGLWB-0000pF-AA
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 14:58:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb1ddf31-9352-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 15:58:52 +0100 (CET)
Received: from FR3P281CA0126.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::16)
 by GV1PR08MB8009.eurprd08.prod.outlook.com (2603:10a6:150:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 14:58:50 +0000
Received: from VI1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::1) by FR3P281CA0126.outlook.office365.com
 (2603:10a6:d10:94::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 14:58:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT014.mail.protection.outlook.com (100.127.145.17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 14:58:49 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Fri, 13 Jan 2023 14:58:48 +0000
Received: from 3965f8f287ee.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9F2DF37-6BD4-49C4-B726-5435679549B2.1; 
 Fri, 13 Jan 2023 14:58:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3965f8f287ee.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 14:58:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8658.eurprd08.prod.outlook.com (2603:10a6:20b:564::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 14:58:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 14:58:40 +0000
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
X-Inumbo-ID: cb1ddf31-9352-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPUmg80n0eB51azLxyi5e7OIc/4qg3yfsmv3NZ6ZT8c=;
 b=bqJVFPZBL0q2F5ArHaZpYewyM09Y6+Q0PsGrHeiINCC4z1jjMp7oWjFak/cKi1OuHQ6GgMC5pc2pObz1SU/7AzkIYpc0eSK/CBy/lbsMwKJO7WfeULu6GhPOS5cRNpYUYjLpZh95HJBIppbZdPrdMXq4GLVztj1AEL70btl/jGs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4852022f2091c209
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/F8stLFm3SmCDoQh30GV6qqxr8OoteSBbEbDAnS62QCrZ9XL5b2TKMZMjw0Cvi5ChZIqIT74wkb2/T/xTEnds/SYzp7vcLUCs7Y6pLVN80I0r8q5KLHYu3povfEwSVtEFh/YldcHzxjVkCDcoBm5YAXUzjIXJ02o6fIW1bCTEsSodTj+i5Ij5W2ukN7HoD3rg8Ygithssvj//YM1/LeblqEAUJBz66LRmZZ6XWrmf5hm7hgE35OpNCk+yCMoXEzgpkaxK8i+kfziIy2Hq3JdCVwAxi9jCWhoEkgzP13894HpzihFv9WGFOfnHC8o7+fvUsnsl0GH3NyRv/KJ3vYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPUmg80n0eB51azLxyi5e7OIc/4qg3yfsmv3NZ6ZT8c=;
 b=hlk2oOFlbkpbKwyWae4OgTi4qP3MKiE7sn8ziF7QbwNoVW+a8R549FtyLPmlbDqI7tRLqGMEtNLc13o6Y2a9nDoZmbJUxsM0ti0iwO3ZP06nMMDCG49dZnnEufzeqdpKIaq4dS1mtAIN+/HFSivdjTO1u64A4b2dnr2MhISJVWgXk+nvQni7xeeYPMaBo4sh3sbffBdRsmOoPwGL5PxxMg2fVQ5IaiaKva8hyu3Bg9hIZRTuPUmnHY2NPzcwJMlt9/z2Qt84iaBV6l+0y0AWvGbfprROuZnZjWSg42c3gI+U15rxLTpFOK/Mu9u1QADN4quAkn5KM/2nBeiA75rkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPUmg80n0eB51azLxyi5e7OIc/4qg3yfsmv3NZ6ZT8c=;
 b=bqJVFPZBL0q2F5ArHaZpYewyM09Y6+Q0PsGrHeiINCC4z1jjMp7oWjFak/cKi1OuHQ6GgMC5pc2pObz1SU/7AzkIYpc0eSK/CBy/lbsMwKJO7WfeULu6GhPOS5cRNpYUYjLpZh95HJBIppbZdPrdMXq4GLVztj1AEL70btl/jGs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 09/14] xen/arm32: head: Remove restriction where to
 load Xen
Thread-Topic: [PATCH v4 09/14] xen/arm32: head: Remove restriction where to
 load Xen
Thread-Index: AQHZJzd+ffGmBsJNbUGFhc+Z6Z3UHa6ccI0A
Date: Fri, 13 Jan 2023 14:58:39 +0000
Message-ID: <859E7F71-489B-4DD3-A4B2-9AD0DE19837D@arm.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-10-julien@xen.org>
In-Reply-To: <20230113101136.479-10-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8658:EE_|VI1EUR03FT014:EE_|GV1PR08MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ab2b11-75e5-4243-47c7-08daf576ada5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Bbg3jPJx2o/rkLpGJCUuTrlXFiYC25euffCsYOOFGQycz+qzNvb7tuTjiiQwrbeD3Aq/6rQNTFEAbTikcQqcXi7w3s2CGIkcJEsSPaR0cTvaF1mUIm0qJ8at4PlgwIFoZQO63XigRXQroE9j0t8wlstQlC3ldU7W03pFla0o/4BpcHL00CuYqO9fyjX7ewaYoaEDi8v9IkPYRrGYUc+rRep04NKX4DLi95sQYNzfEMaDueaO5QlHYagYzVWnfwu5i4BSLEsdish1F8GqIgkrVXspjJSa4TAyXmw36oYV956mEC5zzCe9brQAKEvuJW7O80QWCOtNTtRxTeP7t9YhazyjXy5ANAQCSxLqgbTD8PwSPTknKWIP216dWUL90LQ1OaHl9JIvr00hlv1lnafC1Asad85ud3nY2n7zoBiKyxCyR48UjHYSRVenZUr9wxBlQeJ1WISE+zw+TaiEFmB+p94XTtAG+1rmEksxVQ4PSRVS7pwq9OXWafaGfgnsKoC0F2JCPJMhNnxvI5lvF2zhtUS8MFcMqzeeHtKI9Qji1jHEu81B0kuCKdu4X4yf44ap5+o90jYyAMyJ4r8r+Ez9VVn/TMO4Q0UQOg004O0wb5wNpIDc+Kj15EiAexwtUx+PSBYyBweVBh06+7aAnp2hH8/8y+ZD90kVqKPM+HRGtZ5KboyX2CPnWc8C8QEtIp+3S0Yxyj8NhSUQS/w2+gVhSwLhVKzfILu4VwL4z106d7Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199015)(5660300002)(33656002)(53546011)(316002)(2616005)(2906002)(6506007)(54906003)(36756003)(122000001)(38100700002)(71200400001)(86362001)(6486002)(6512007)(186003)(478600001)(26005)(91956017)(8936002)(76116006)(4326008)(6916009)(66446008)(8676002)(66946007)(64756008)(66476007)(38070700005)(66556008)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7E633D68D0614429767735F154981A0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8658
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a112096-14f2-4fbd-6e9e-08daf576a809
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BQ5nC9yweiVmiKykkRAL2GEs7Cy+z2c3j9ZZIFaLpIYk6dM8lledup9xLTdTXj1K0vqQCRjygnRLHhDGOBp5DM0TMhpd6k6WDAcv5PwUdva4HV/09uUIs2n1KYdY/MYCQDpAhoI7ox85SnSFdHh9gojTgMRTVnZ6bQD1KAA4gryS4S682EKnVKGH0bE0L4bXogrbPVpoyixpLMzKubiREF4JCsm7RiyBjXmYh8ZbZRuV/uhmLqpFvjmV/oZv8F34oxBkP5GBB/eaoe3e/u/mLL1YwbBu1K61tK0sEJz+/njfxvEI6lFhD8WDPHfEXjdR97vTipFTCgYzOs+GOlPArJxd4zlj8kXddOwdWaZKwZUd7DanPAvy5+BNMjwGb1PP+7hFcEQrJQeDukwbG/XPV3AJXstinQE7qrukeZiLjsqHEYzlCD0pUMqOm3NygJn5QugAJlpGAR9u3Jikh17zW1jEOnngE1iT4IgHg4fhsm5q6P3x31laE2896Oy0WfzSGA+T8f2zehuPP/7Ta2APCj1xU3jb3C5nSiE4FP3T+4Z26Dn41T039QbOeR7BrC7VFtss/qktcnAytdl8VKkiSeYzKatpPnJkb2MEGiUzBx4XnLA0CWuNKnWGTqlKtiqTHjXw/pidtcz+/hfOx8DA0+sy1S0iTN8/1aCTxrFcgXdiJYPvhn5Yw0gPeTTOy549elQmAFm8ijOMbgsIf2UI+g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(478600001)(36756003)(86362001)(70586007)(33656002)(40460700003)(8676002)(70206006)(4326008)(41300700001)(82740400003)(81166007)(356005)(36860700001)(54906003)(107886003)(186003)(6486002)(6506007)(53546011)(82310400005)(6862004)(26005)(5660300002)(316002)(47076005)(8936002)(40480700001)(2906002)(2616005)(336012)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 14:58:49.3489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ab2b11-75e5-4243-47c7-08daf576ada5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8009

DQoNCj4gT24gMTMgSmFuIDIwMjMsIGF0IDEwOjExLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBBdCB0aGUgbW9tZW50LCBib290bG9hZGVycyBjYW4gbG9hZCBYZW4gYW55d2hlcmUg
aW4gbWVtb3J5IGJ1dCB0aGUNCj4gcmVnaW9uIDJNQiAtIDRNQi4gV2hpbGUgSSBhbSBub3QgYXdh
cmUgb2YgYW55IGlzc3VlLCB3ZSBoYXZlIG5vIHdheQ0KPiB0byB0ZWxsIHRoZSBib290bG9hZGVy
IHRvIGF2b2lkIHRoYXQgcmVnaW9uLg0KPiANCj4gSW4gYWRkaXRpb24gdG8gdGhhdCwgaW4gdGhl
IGZ1dHVyZSwgWGVuIG1heSBncm93IG92ZXIgMk1CIGlmIHdlDQo+IGVuYWJsZSBmZWF0dXJlIGxp
a2UgVUJTQU4gb3IgR0NPVi4gVG8gYXZvaWQgd2lkZW5pbmcgdGhlIHJlc3RyaWN0aW9uDQo+IG9u
IHRoZSBsb2FkIGFkZHJlc3MsIGl0IHdvdWxkIGJlIGJldHRlciB0byBnZXQgcmlkIG9mIGl0Lg0K
PiANCj4gV2hlbiB0aGUgaWRlbnRpdHkgbWFwcGluZyBpcyBjbGFzaGluZyB3aXRoIHRoZSBYZW4g
cnVudGltZSBtYXBwaW5nLA0KPiB3ZSBuZWVkIGFuIGV4dHJhIGluZGlyZWN0aW9uIHRvIGJlIGFi
bGUgdG8gcmVwbGFjZSB0aGUgaWRlbnRpdHkNCj4gbWFwcGluZyB3aXRoIHRoZSBYZW4gcnVudGlt
ZSBtYXBwaW5nLg0KPiANCj4gUmVzZXJ2ZSBhIG5ldyBtZW1vcnkgcmVnaW9uIHRoYXQgd2lsbCBi
ZSB1c2VkIHRvIHRlbXBvcmFyaWx5IG1hcCBYZW4uDQo+IEZvciBjb252ZW5pZW5jZSwgdGhlIG5l
dyBhcmVhIGlzIHJlLXVzaW5nIHRoZSBzYW1lIGZpcnN0IHNsb3QgYXMgdGhlDQo+IGRvbWhlYXAg
d2hpY2ggaXMgdXNlZCBmb3IgcGVyLWNwdSB0ZW1wb3JhcnkgbWFwcGluZyBhZnRlciBhIENQVSBo
YXMNCj4gYm9vdGVkLg0KPiANCj4gRnVydGhlcm1vcmUsIGRpcmVjdGx5IG1hcCBib290X3NlY29u
ZCAod2hpY2ggY292ZXIgWGVuIGFuZCBtb3JlKQ0KPiB0byB0aGUgdGVtcG9yYXJ5IGFyZWEuIFRo
aXMgd2lsbCBhdm9pZCB0byBhbGxvY2F0ZSBhbiBleHRyYSBwYWdlLXRhYmxlDQo+IGZvciB0aGUg
c2Vjb25kLWxldmVsIGFuZCB3aWxsIGhlbHBmdWwgZm9yIGZvbGxvdy11cCBwYXRjaGVzICh3ZSB3
aWxsDQo+IHdhbnQgdG8gdXNlIHRoZSBmaXhtYXAgd2hpbHN0IGluIHRoZSB0ZW1wb3JhcnkgbWFw
cGluZykuDQo+IA0KPiBMYXN0bHksIHNvbWUgcGFydCBvZiB0aGUgY29kZSBub3cgbmVlZHMgdG8g
a25vdyB3aGV0aGVyIHRoZSB0ZW1wb3JhcnkNCj4gbWFwcGluZyB3YXMgY3JlYXRlZC4gU28gcmVz
ZXJ2ZSByMTIgdG8gc3RvcmUgdGhpcyBpbmZvcm1hdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IC0tLS0NCj4gDQoNCkhpIEp1bGll
biwNCg0KPiANCj4gKy8qDQo+ICsgKiBSZW1vdmUgdGhlIHRlbXBvcmFyeSBtYXBwaW5nIG9mIFhl
biBzdGFydGluZyBhdCBURU1QT1JBUllfWEVOX1ZJUlRfU1RBUlQuDQo+ICsgKg0KPiArICogQ2xv
YmJlcnMgcjAgLSByMQ0KDQpOSVQ6IHIwIC0gcjM/DQoNCj4gKyAqLw0KPiArcmVtb3ZlX3RlbXBv
cmFyeV9tYXBwaW5nOg0KPiArICAgICAgICAvKiByMjpyMyA6PSBpbnZhbGlkIHBhZ2UtdGFibGUg
ZW50cnkgKi8NCj4gKyAgICAgICAgbW92ICAgcjIsICMwDQo+ICsgICAgICAgIG1vdiAgIHIzLCAj
MA0KPiArDQo+ICsgICAgICAgIGFkcl9sIHIwLCBib290X3BndGFibGUNCj4gKyAgICAgICAgbW92
X3cgcjEsIFRFTVBPUkFSWV9YRU5fVklSVF9TVEFSVA0KPiArICAgICAgICBnZXRfdGFibGVfc2xv
dCByMSwgcjEsIDEgICAgIC8qIHIxIDo9IGZpcnN0IHNsb3QgKi8NCj4gKyAgICAgICAgbHNsICAg
cjEsIHIxLCAjMyAgICAgICAgICAgICAvKiByMSA6PSBmaXJzdCBzbG90IG9mZnNldCAqLw0KPiAr
ICAgICAgICBzdHJkICByMiwgcjMsIFtyMCwgcjFdDQo+ICsNCj4gKyAgICAgICAgZmx1c2hfeGVu
X3RsYl9sb2NhbCByMA0KPiArDQo+ICsgICAgICAgIG1vdiAgcGMsIGxyDQo+ICtFTkRQUk9DKHJl
bW92ZV90ZW1wb3JhcnlfbWFwcGluZykNCj4gKw0KDQpUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1l
LCBJ4oCZdmUgYWxzbyBidWlsdCBmb3IgYXJtNjQvMzIgYW5kIHRlc3QgdGhpcyBwYXRjaCBvbiBm
dnAgYWFyY2gzMiBtb2RlLA0KYm9vdGluZyBEb20wIGFuZCBjcmVhdGluZy9ydW5uaW5nL2Rlc3Ry
b3lpbmcgc29tZSBndWVzdHMuDQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZh
bmNlbGx1QGFybS5jb20+DQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVA
YXJtLmNvbT4NCg0KQ2hlZXJzLA0KTHVjYQ==

