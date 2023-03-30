Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF36D0179
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 12:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516588.800945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpjA-0005Z4-2w; Thu, 30 Mar 2023 10:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516588.800945; Thu, 30 Mar 2023 10:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpjA-0005Wx-06; Thu, 30 Mar 2023 10:41:56 +0000
Received: by outflank-mailman (input) for mailman id 516588;
 Thu, 30 Mar 2023 10:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mFBc=7W=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1phpj8-0005Wm-6B
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 10:41:54 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ac4b1a2-cee7-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 12:41:51 +0200 (CEST)
Received: from DUZPR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::11) by DU0PR08MB8472.eurprd08.prod.outlook.com
 (2603:10a6:10:404::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 10:41:49 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:469:cafe::a2) by DUZPR01CA0053.outlook.office365.com
 (2603:10a6:10:469::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Thu, 30 Mar 2023 10:41:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.22 via Frontend Transport; Thu, 30 Mar 2023 10:41:49 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Thu, 30 Mar 2023 10:41:49 +0000
Received: from fa0fde7a1a45.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36BBC740-4C8B-4A63-8AFB-14A6A4082B1F.1; 
 Thu, 30 Mar 2023 10:41:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa0fde7a1a45.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Mar 2023 10:41:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8153.eurprd08.prod.outlook.com (2603:10a6:150:93::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 10:41:36 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 10:41:36 +0000
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
X-Inumbo-ID: 7ac4b1a2-cee7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSAEO2x3X3MlmRd359r+k61fgH3bIwm7sU+bGyYrVSE=;
 b=ccvulJb5Zr5wJNhdRcp2zT44u2mYqAkehrRfEtsKIZwTlEZAY7fqgJu31nf/TlWSVtuyarwkkN99nMP++ZZxbExe5uCFmSdz59C6Mtom6MfOFZt4pqvH9hBKS5UkFIv0cxJ4EsGRNC65dcYqbUtiPRp3NHZN9BZarrLIOk8Zl8g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ea1f1956b4062aa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzc0NDdc4RxFw/3chQqAyLbFJxnyFhPy+LHVUd6pHoIF70C169YnCv0B/zsPOML44YvaPu54/DdL0LitWdeP0ZxjI0/ji68jbX6dg/tl1oM+p3CBVwuPyfi8XjzvSiUHBRN3v/q7kh/Mykx70YVCjp95Fy+2e1mZcpnsyDFqNpCIF9FYIyxJTjOsfCZaK7YAjox9/vYcYbdJP3r2AjtYi/MKs+r4QgYzKDaX31Yee2QAd3BAMn9fd0bmpHwBcBywh6GNQgWAmViFjgp11ZZiuA28THnLDIN6qOkHyzndNtjAtCuiUy7ga6t1i3sA240dnZqSG+vrG8s0QmTuPTZoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSAEO2x3X3MlmRd359r+k61fgH3bIwm7sU+bGyYrVSE=;
 b=Q2dergyF4nRfiquYV1Q/77W5lTyBL43hlZuHY+tlSMVo/kAPhLMFBbmvsBv58dQLS1ds/VZ4VZfIde9qMFfMVqVHtZysOs1cUpzy5YYBupu6mjyYIHwvGVKau4lAP9QNgDoOL5kjSzriBCEFTRdxPs/1FWRSdmhAWYkaa/jULJq4VGyzpZsmsCEjEIgILmLec6m8PCSnmFLrQ9rqUYrwGYHSOuhcqXboOAadW9dXyKYYVcpHAf5xyWNSKD4RSLCAPhvVT05yJIohltj+G4mzfyG2oLG8R++0llMfoROPafNyhV1L0k8xeG4fsCo1KMHV7wideT3mf+0rOVfijBS05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSAEO2x3X3MlmRd359r+k61fgH3bIwm7sU+bGyYrVSE=;
 b=ccvulJb5Zr5wJNhdRcp2zT44u2mYqAkehrRfEtsKIZwTlEZAY7fqgJu31nf/TlWSVtuyarwkkN99nMP++ZZxbExe5uCFmSdz59C6Mtom6MfOFZt4pqvH9hBKS5UkFIv0cxJ4EsGRNC65dcYqbUtiPRp3NHZN9BZarrLIOk8Zl8g=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 08/12] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Thread-Topic: [PATCH v4 08/12] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Thread-Index: AQHZYJtgTfBLBphVFEKpZ9zmMHKmq68P+xMAgAMsEIA=
Date: Thu, 30 Mar 2023 10:41:35 +0000
Message-ID: <45149B4D-7127-4CC1-B8D7-A6B4BFC16F43@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-9-luca.fancellu@arm.com>
 <b5411b23-2c2a-b771-c2c6-00b0f2a7a033@suse.com>
In-Reply-To: <b5411b23-2c2a-b771-c2c6-00b0f2a7a033@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8153:EE_|DBAEUR03FT051:EE_|DU0PR08MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b702d7e-5277-43c5-ae85-08db310b5df2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VZ2VfEitkjUzwrdBo0G14CiOeYn5SRsNdpIEbhiF4Bf874fcmdFtcj0aWUULm9sDmBOH5b60zn+ipKulohcb5uneAaS2vS3fgscpYenySTGr1F1CzVSo5Dw+0qPY4bNy5Cim2Q0/D2qp1vZoRYLyNOUZ+JYDDyi41b7NkeiEZvBaxKoy/3rOdpWaeB0pynNiimnWlVSQiW3Bio0s4pOevsQsGxReLf9sKx8oyio6SmrPLa8tCoZ/omqGf0F6dtPdRtwPJg1GCdiL2b70GY8SwbIbZDOxQWNrj55RK7HVDUaN94kreDORV2PX/8fVCoXx8GtDB8/1L/tfSDnM+RAYLPhiIyWDsTAhPrrVqC5Zzz9i88yu4p4OorCh7YPxeJ3pBVfeSrnxMmDKqfRTigDE1SF8pDFTqD5OXQO7kXQer2QJSwbQddZz5Vp8dOMM2dgknUotc/9wsj47U4ADtpktHFo00cNpOPFsyIfHEw0q1xCkta1sjLoUeSYvqyVLmCsQms0TyOnjZxaSvL5DBzCywFpgp8ZcgIsvmXmQ4DiiYW3K/DLxXBq8bXeLBxWBPKjcNsHv0iPDUfXy9U1LJXh8p5LqH0zD1fi8XIDo1yiXF1wg7PBhDHijGbRJx09LjN1t+zaA0e6YaGPx+UXR3iirCg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(8936002)(4326008)(66556008)(66946007)(6916009)(8676002)(66476007)(91956017)(76116006)(64756008)(66446008)(5660300002)(2906002)(41300700001)(316002)(478600001)(54906003)(6486002)(36756003)(71200400001)(26005)(186003)(33656002)(38100700002)(53546011)(122000001)(2616005)(6506007)(6512007)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9CE249A03696441881C95E102CE2E01@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8153
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	495a4728-358d-44b0-1974-08db310b55f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pc3LD0qFaMFCtTRw3g7qtHOfVWZK9Yz6t/oIQfDUC7jD52HYdX0vUVq9Jyy6powlS8/GlpEjRiIG8Bqj/EdbvhOZSMjme2z7f/RfzQ/ELErYQ+cwRjdjifoEMdBPex6M2MusZH1Ve70qRIanaieQl1OgPxYtR334FDMGYwn5zVWuuOdVZvRc2eKRKnT6kLRH1CPcQUDjsB5NuXS7Mwvjly1NSZj6V1BHrb19ycuyy3UMjGT4OaXSotA7pSdh1LZm17TD8p0eW+Kwn5NM8g9YB8ufNMEfrVNazVdKqZjc5xx9w+uq3eSHSCu/h/3e09W7trGLzSTBbB9trPlQIufljU2WMstUXEQrFl2JoCm6KKztF7ikon4YiQoxeQZvOfWkAtYJwr1YlMoIvkL+hS5YVnQAz5a43zWj/i+wVyrJ5Wql3SPjnl6jtWPfBykr4cigEV6JV/Fr439fKo+aaAjwZWITeKft+MvYVwUuVLdVCNsb/49z/oWKtImrJDCnUW4FKvEPOtFINEP6AwpVzvKYZiqYKn1dIm6JMy2PRmQpxaxuBUGllbWzzmdPWgDsIvkJ2ORvw7HCgHqB92uU+xbY/Y7eEXfw3fYMwdndUv2EMA+c8etjZ8g3KZx+cu5kzzcoTw9rymNowwkm/QdvRwscKQqX2u97/5z+OtqsnAf2puOsGr7X7wjUDvvNdamgsZjuV5QoGCtG9nkLD4P6KNgwzA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(81166007)(356005)(5660300002)(316002)(36860700001)(8936002)(54906003)(70586007)(336012)(82740400003)(41300700001)(86362001)(4326008)(8676002)(40480700001)(70206006)(2906002)(6862004)(6486002)(2616005)(40460700003)(26005)(6512007)(82310400005)(47076005)(6506007)(186003)(33656002)(53546011)(36756003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:41:49.3643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b702d7e-5277-43c5-ae85-08db310b5df2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8472

DQoNCj4gT24gMjggTWFyIDIwMjMsIGF0IDExOjE0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjcuMDMuMjAyMyAxMjo1OSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2FybTY0L3N2ZS5jDQo+PiBAQCAtMTI0LDMgKzEyNCwxNSBAQCBpbnQgX19pbml0IHN2
ZV9wYXJzZV9kb20wX3BhcmFtKGNvbnN0IGNoYXIgKnN0cl9iZWdpbiwgY29uc3QgY2hhciAqc3Ry
X2VuZCkNCj4+IHsNCj4+ICAgICByZXR1cm4gcGFyc2VfaW50ZWdlcigic3ZlIiwgc3RyX2JlZ2lu
LCBzdHJfZW5kLCAoaW50Kikmb3B0X2RvbTBfc3ZlKTsNCj4+IH0NCj4+ICsNCj4+ICt2b2lkIHN2
ZV9hcmNoX2NhcF9waHlzaW5mbyh1aW50MzJfdCAqYXJjaF9jYXBhYmlsaXRpZXMpDQo+PiArew0K
Pj4gKyAgICBpZiAoIGNwdV9oYXNfc3ZlICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgLyogVmVj
dG9yIGxlbmd0aCBpcyBkaXZpZGVkIGJ5IDEyOCB0byBzYXZlIHNvbWUgc3BhY2UgKi8NCj4+ICsg
ICAgICAgIHVpbnQzMl90IHN2ZV92bCA9IE1BU0tfSU5TUihzdmVfZW5jb2RlX3ZsKGdldF9zeXNf
dmxfbGVuKCkpLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9T
WVNDVExfUEhZU0NBUF9BUk1fU1ZFX01BU0spOw0KPj4gKw0KPj4gKyAgICAgICAgKmFyY2hfY2Fw
YWJpbGl0aWVzIHw9IHN2ZV92bDsNCj4+ICsgICAgfQ0KPj4gK30NCj4gDQo+IEknbSBhZ2FpbiB3
b25kZXJpbmcgd2h5IGEgc2VwYXJhdGUgZnVuY3Rpb24gaXMgbmVlZGVkLCB3aGVuIGV2ZXJ5dGhp
bmcNCj4gdGhhdCdzIG5lZWRlZCBpcyAuLi4NCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vc3lz
Y3RsLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9zeXNjdGwuYw0KPj4gQEAgLTExLDExICsxMSwx
NCBAQA0KPj4gI2luY2x1ZGUgPHhlbi9saWIuaD4NCj4+ICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4N
Cj4+ICNpbmNsdWRlIDx4ZW4vaHlwZXJjYWxsLmg+DQo+PiArI2luY2x1ZGUgPGFzbS9hcm02NC9z
dmUuaD4NCj4gDQo+IC4uLiBiZWNvbWluZyBhdmFpbGFibGUgaGVyZSBmb3IgdXNlIC4uLg0KPiAN
Cj4+ICNpbmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+DQo+PiANCj4+IHZvaWQgYXJjaF9kb19waHlz
aW5mbyhzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkpDQo+PiB7DQo+PiAgICAgcGktPmNh
cGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaHZtIHwgWEVOX1NZU0NUTF9QSFlTQ0FQ
X2hhcDsNCj4+ICsNCj4+ICsgICAgc3ZlX2FyY2hfY2FwX3BoeXNpbmZvKCZwaS0+YXJjaF9jYXBh
YmlsaXRpZXMpOw0KPiANCj4gLi4uIGhlcmUuIFRoYXQgd291bGQgYmUgZXZlbiBtb3JlIHNvIGlm
LCBsaWtlIHN1Z2dlc3RlZCBiZWZvcmUsDQo+IGdldF9zeXNfdmxfbGVuKCkgcmV0dXJuZWQgMCB3
aGVuICFjcHVfaGFzX3N2ZS4NCg0KSeKAmXZlIGhhZCBhIGxvb2sgb24gdGhpcywgSSBjYW4gZG8g
ZXZlcnl0aGluZyBJbiBhcmNoX2RvX3BoeXNpbmZvIGlmIGluIHhlbi9pbmNsdWRlL3B1YmxpYy9z
eXNjdGwuaA0KdGhlIFhFTl9TWVNDVExfUEhZU0NBUF9BUk1fU1ZFX01BU0sgaXMgcHJvdGVjdGVk
IGJ5IF9fYWFyY2g2NF9fIG9yIF9fYXJtX18gLg0KDQpEbyB5b3UgYWdyZWUgb24gdGhhdD8NCg0K
PiANCj4gSmFuDQoNCg==

