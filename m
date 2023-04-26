Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7F6EF089
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526598.818467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praxF-00043E-0P; Wed, 26 Apr 2023 08:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526598.818467; Wed, 26 Apr 2023 08:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praxE-00041W-Tk; Wed, 26 Apr 2023 08:56:48 +0000
Received: by outflank-mailman (input) for mailman id 526598;
 Wed, 26 Apr 2023 08:56:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNUB=AR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1praxD-00041Q-Dn
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 08:56:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4452d1eb-e410-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 10:56:44 +0200 (CEST)
Received: from DB6P18901CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::20)
 by DB3PR08MB8915.eurprd08.prod.outlook.com (2603:10a6:10:43d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 08:56:41 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::23) by DB6P18901CA0010.outlook.office365.com
 (2603:10a6:4:16::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34 via Frontend
 Transport; Wed, 26 Apr 2023 08:56:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.20 via Frontend Transport; Wed, 26 Apr 2023 08:56:40 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Wed, 26 Apr 2023 08:56:40 +0000
Received: from 8a331848db47.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE694588-77F1-4C2E-A959-D3BCB09D76E4.1; 
 Wed, 26 Apr 2023 08:56:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a331848db47.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Apr 2023 08:56:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8779.eurprd08.prod.outlook.com (2603:10a6:20b:5be::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 08:56:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 08:56:32 +0000
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
X-Inumbo-ID: 4452d1eb-e410-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Li2dIvkxQIQVgVE27pmrEXty1j/6u0TmS1D0UWIdPNg=;
 b=7hdveCXK0m7Phd/d3gmm8upmHZ2the+IBaiaKh/pQ+uOk/Mmj5GKkShSVTbvgvRVyeSplnaX+FO1leQjGsJuO42jCYtpoPI3sUBlX+EZUQKCI1VFCR7k422T0hIWY/exEpOwtyrK1Aic7Bp88NXWPsTsB4DT5Q0fXJxhni//l6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcvFf1mT4Nqht5bX25fEbTJFz7QURyys93LiTtBbXdREnDvIJP6FDthNppzl4Fy2e4lfVS2p1RMlPpqWopXu/4X/7vLCYomzWIc//hP3o+3GBp4cZFq1a7E7Q8JcIh9/4wBYKlR/Br+OImI82WZ8/Q40K1aHND7DKXvaH8JLWMalYGa6yEf+ZxitpWxR1Jgxny0VKQy6ygRYyQrS4UUZ6t4HGazEb3bkbD+htVL5/nhF4l0F+ptb3nH9wqBxCNG2XWntYYCRuTm6hPdeBoFYlP57/+Ttho1VBu7AhxL1R5UbR3gF4B26i3LglqiDqW2jcZX731hnEY84GiiMMI622w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Li2dIvkxQIQVgVE27pmrEXty1j/6u0TmS1D0UWIdPNg=;
 b=iQGI0mcvl8JhGq9cO943UOpd1ZrkUsraeMF+TUj60GG9t/EokzMofY9DdpGJPX4/5t9xPPZ2Ci5sU229SyjYzEfE8fkaD8g6lImQInz8jj9vXnSBhTXk/Pf55idvIZyZs1q7fUu/yLmdABQOxNj6TzrIkYA5+Lv5Z3o19en94PmX9Wfyc0KKxwZDh75m1GUPrr6mJhZfVJUAPz0cxzelb0oTlzkPJSsH2V/XTzB/aCy1zN/mN1yVJu6Yz5XKrLRa2Q2HHrFt7+txInEGrnt0W8SRR25/9zYIaB+PNKq+DC24U/HyodGLx0Mgj4amWXcv0g3dOnmfKsFNpUACLBI66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Li2dIvkxQIQVgVE27pmrEXty1j/6u0TmS1D0UWIdPNg=;
 b=7hdveCXK0m7Phd/d3gmm8upmHZ2the+IBaiaKh/pQ+uOk/Mmj5GKkShSVTbvgvRVyeSplnaX+FO1leQjGsJuO42jCYtpoPI3sUBlX+EZUQKCI1VFCR7k422T0hIWY/exEpOwtyrK1Aic7Bp88NXWPsTsB4DT5Q0fXJxhni//l6Y=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Index:
 AQHZd0ulMpqFICe/LUiDVq6+aDsW9687tFqAgAFSIKCAACZ1gIAABguQgAAM+YCAAAMWUIAAB/ZA
Date: Wed, 26 Apr 2023 08:56:32 +0000
Message-ID:
 <AS8PR08MB7991108BC21AF3869FE5C03092659@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <188a01f0-a2d1-0f2d-4d01-61a259c790f1@suse.com>
 <AS8PR08MB7991F2DDC4C13F33390557EA92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e783d71f-cc0c-e235-28a8-7ec9ad63d41f@suse.com>
 <AS8PR08MB79919EAEDCD85073CAECE5DD92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <cebf1a46-71cb-a700-78ac-f9ee8bb64c22@suse.com>
 <AS8PR08MB79911D9836C2954C047BECDF92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79911D9836C2954C047BECDF92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 61B970A5FF209D4EA5E4A564E725E220.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8779:EE_|DBAEUR03FT023:EE_|DB3PR08MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e315ee-41ce-46bc-0dd5-08db463426c7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iWkaEvQkOm1cPqY9usIdDNIwH8XPLD4JMCCHWQ/imNIu+CXOkwzBEydNXNIVInGa93vq4KsCRWQC5ThCYqOeVkvic0jucACgsZMpwG2CiIvJtuwFY4U2MW6NkiJlqsSr0WK6+pdDxmQRRc4aVp+40eLECQ0SDxCmVEacCwnAHvzZ80Tvl6L7pxZ8oXnC2SDfwa3NXjuzpMjC3yAtW7ClGHICYXLPqSD9E3uORjIhAhNPGv5lKF9gxBVJASwSY9EkiYeHC0eR2I16mqkAnk+/wzrHoWcN8HpBZ2c7Ladj+DgnoWS/1qtHeKNPyKWI7FgDw9HloiDOFfCAGwj4GzTxCxNce9SC9ksbVGLmC6x1waqgbR2FscLl3pyA2LnEIOuksrLNQ+SCBzYzELLtvKcwOd6rchTDNpsCFCtIU0y+PpjvleLZiRWd7z3cBBe8/CbyW44FMKSgLvdwkzz4jWnE7293hh2uqPiWfEbmT3xGbu8aDwa8MD6xDz9P48bKXzx5vv0JNuXZfh4QWg7i806ENoQWHBPZ9mlGgHyVZUjw3oNyb/kVRcRI5feNoq3r/BMbDCGmS0yl1lmW6Ur9j9gkufB85ZfBPY+rLmxVqLQ/56Yi6+WZ34P6thJcbW1OVio/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199021)(86362001)(2940100002)(186003)(9686003)(6506007)(26005)(38100700002)(5660300002)(52536014)(7696005)(33656002)(83380400001)(71200400001)(478600001)(54906003)(38070700005)(41300700001)(8936002)(2906002)(8676002)(316002)(64756008)(66446008)(55016003)(66476007)(122000001)(76116006)(6916009)(66556008)(66946007)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8779
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a68b72f7-4415-4dd5-e523-08db463421e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+xufpFb35lgCtT9tJ51IcY5q+nGW/AeBhIMAchx25qB7zFbSF0TeCspdb8eBEuNcRaxarfMilP15j+F/nIdEsquqX0QQ0YKRLGiOS/0KApXPkeLoZKhV2v4b/0e+2pf+4iy22vpcQnooxyJq5Qv2xePQdCJyZTF2Q/etFqj52dnn81AyHlmi4CK8dknj1FrW4zRbnSmBiZ9fF+Uerhzc3QucMZLvvn3MKLLiwWJckNQ8YwrhFPLr360NOPzOLZAciShmbd+N3WE00DKz8FAGKdVISLCHq9zMBBNeKYL/8FZQei4VpL4+jnt4hSrFOKv/jJUyh/pTzN4N/qfd5IYTM5zYOkYI+If3h/xu5zenVofIph3zo4fPFi4YKry3CCzI9dX1ONYuK9i4QPXbBx07CUxA83VbHMmqKp8+RbNpVv++0XoOzDMGPEAgfxkYJ/saR/+uwoCKAKCgsoaJ90AYe1TJeYfdNOqjfXCFiPbnXKIqLsGxxZgrx9y8R2QurSRV/UAzgj5QIxaST2pZrS754c2trWUfJPotn7UZ3IyGo7y6rq1quI2rweNDLkQCvM/cXv+QQN+N78kSYIHX+zyvkkmo5/7dH5qTxrqpE9rZGJ8T9QPtsmGvXhP5G5GbZVrU6boDu7hC0r8WTYXkcmMTwW8PS5bqZhS25AHLbLyKyvRqhRKggvSbAJopWpYxwsyCMmHrVZAx7UaTT7l3OY726qUBXGPWNYuMlxIKoEeNW9U=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39850400004)(451199021)(40470700004)(46966006)(36840700001)(478600001)(34070700002)(2940100002)(36860700001)(7696005)(40480700001)(81166007)(356005)(9686003)(26005)(186003)(82740400003)(54906003)(83380400001)(6506007)(47076005)(336012)(5660300002)(8936002)(8676002)(41300700001)(70586007)(70206006)(2906002)(4326008)(316002)(6862004)(52536014)(86362001)(40460700003)(55016003)(33656002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 08:56:40.5724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e315ee-41ce-46bc-0dd5-08db463426c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8915

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVucnkgV2Fu
Zw0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY0IDA5LzE3XSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYSBo
ZWxwZXIgdG8gcGFyc2UgZGV2aWNlDQo+IHRyZWUgTlVNQSBkaXN0YW5jZSBtYXANCj4gDQo+IEhp
IEphbiwNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAw
OS8xN10geGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRldmljZQ0KPiA+IHRy
ZWUgTlVNQSBkaXN0YW5jZSBtYXANCj4gPg0KPiA+ID4gR3JlYXQgcG9pbnRzISBUaGFua3MgZm9y
IHBvaW50aW5nIHRoZSA4LWJpdCB0cnVuY2F0aW9uIG91dC4gWW91IGFyZSBjb3JyZWN0Lg0KPiA+
ID4gU29tZWhvdyBteSBpbXByZXNzaW9uIG9mIG51bWFfc2V0X2Rpc3RhbmNlKCkncyBmaXJzdCB0
d28gYXJndW1lbnRzDQo+IGFyZQ0KPiA+ID4gYWxyZWFkeSAidW5zaWduZWQgaW50IiBzbyBJIG1p
c3NlZCB0aGlzIHBhcnQuLi5Tb3JyeS4NCj4gPiA+DQo+ID4gPiBJbiB0aGF0IGNhc2UsIEkgdGhp
bmsgSSB3aWxsIGFkZCBhIGNoZWNrIGJldHdlZW4gImZyb20sIHRvIiBhbmQNCj4gPiBNQVhfTlVN
Tk9ERVMNCj4gPiA+IGFzIHNvb24gYXMgdGhlIHZhbHVlcyBvZiAiZnJvbSIgYW5kICJ0byIgYXJl
IHBvcHVsYXRlZCBieSBkdF9uZXh0X2NlbGwoKS4NCj4gPiA+IEhvcGVmdWxseSB0aGlzIHdpbGwg
YWRkcmVzcyB5b3VyIGNvbmNlcm4uDQo+ID4NCj4gPiBXaGlsZSB0aGlzIHdvdWxkIGFkZHJlc3Mg
YnkgY29uY2VybiwgSSBkb24ndCBzZWUgd2h5IHlvdSB3YW50IHRvIHJlcGVhdA0KPiA+IHRoZSBj
aGVja2luZyB0aGF0IG51bWFfc2V0X2Rpc3RhbmNlKCkgYWxyZWFkeSBkb2VzLg0KPiANCj4gQ29y
cmVjdCwgSSB0aGluayBJIHdvdWxkIGJldHRlciB0byBtb3ZlIHRoZSBjaGVjayBpbiBudW1hX3Nl
dF9kaXN0YW5jZSgpIHRvDQo+IHRoZSBjYWxsZXIgZmR0X3BhcnNlX251bWFfZGlzdGFuY2VfbWFw
X3YxKCkgYXMgSSBiZWxpZXZlIGlmIHRoZSB0cnVuY2F0aW9uDQo+IHJlYWxseSBoYXBwZW5zIGl0
IGlzIHRvbyBsYXRlIHRvIGNoZWNrIGluIG51bWFfc2V0X2Rpc3RhbmNlKCkuDQoNCk9uIHNlY29u
ZCB0aG91Z2h0LCBtYXliZSBldmVuIHJlbW92ZSB0aGUgc2FtZSBjaGVjayBpbiBfX25vZGVfZGlz
dGFuY2UoKQ0KaWYgd2UgZG8gdGhlIGNoZWNrIGluIHRoZSBjYWxsZXIsIGFzIEkgYmVsaWV2ZSB0
aGV5IHdpbGwgc3VmZmVyIHRoZSBzYW1lIHByb2JsZW0uLi4NCg0KS2luZCByZWdhcmRzLA0KSGVu
cnkNCg0KPiANCj4gS2luZCByZWdhcmRzLA0KPiBIZW5yeQ0KPiANCj4gPg0KPiA+IEphbg0K

