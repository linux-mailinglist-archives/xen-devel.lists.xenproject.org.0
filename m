Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E903E7735C9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 03:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579189.907055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTBIE-0002VU-1j; Tue, 08 Aug 2023 01:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579189.907055; Tue, 08 Aug 2023 01:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTBID-0002Tr-SZ; Tue, 08 Aug 2023 01:13:49 +0000
Received: by outflank-mailman (input) for mailman id 579189;
 Tue, 08 Aug 2023 01:13:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yxwq=DZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qTBIB-0002TV-TB
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 01:13:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2044.outbound.protection.outlook.com [40.107.7.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d27e87f5-3588-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 03:13:46 +0200 (CEST)
Received: from AM6P193CA0061.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::38)
 by AM7PR08MB5431.eurprd08.prod.outlook.com (2603:10a6:20b:10c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 01:13:05 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::53) by AM6P193CA0061.outlook.office365.com
 (2603:10a6:209:8e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26 via Frontend
 Transport; Tue, 8 Aug 2023 01:13:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.16 via Frontend Transport; Tue, 8 Aug 2023 01:13:04 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Tue, 08 Aug 2023 01:13:04 +0000
Received: from e6699f1ce5be.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92EED3FB-B4D4-4F28-9AB1-482077DDB106.1; 
 Tue, 08 Aug 2023 01:12:18 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6699f1ce5be.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Aug 2023 01:12:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB5763.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 01:12:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 01:12:16 +0000
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
X-Inumbo-ID: d27e87f5-3588-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hZh/FasuzIaiEaNf3QrEe3BVC9c1xc5yAp1v/YpTVo=;
 b=uVwIQaWmAdkPlSS2/gsH7tCHWy3cXqj2/P6D5E8wHBMSjiJs0Cdll2PKvC+VGeObAu7ihYEXsQG1bVgWFwAWB/KRHRb3hmr9Z6qcc6u3k3OF0J9F3dvMJyx3QHlU0UvrvB9TTPzxM0+4kwFzZCgdI7NmR9Gef26dzZ1CtOps9BI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 881e4134ef41e0c8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmCLElw2eREJNch7Rj3ZyDY7HI+bF4iWxtiD8b06AM6WT5ZJucgU2flbT4Kpkwdt8ANqiYAiX7HUB/K7Nzzm9Hcfjooka3+lFzwmx/dk4S5qCWzvDBeiak7o+ovpm3tqPSWdoxHUgtFPttb/bblflJ6zobi8oFK00P27d+WlDsHOFURdXEo4gMisdIQaQYfjs+XmrlRRW1YiQKWvaDULq0Mpqay/h0j7sp2ChNnCZujyLsjPRjJSwp5sFDqj6E9P+MWBFBigjCvsVXfR+xBsKwwNHCJVSqOLBRaOgLajhOMGx3CSJBw9b6zDyhh/+j4nVLcDqshGwiBtSkBqlCw+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hZh/FasuzIaiEaNf3QrEe3BVC9c1xc5yAp1v/YpTVo=;
 b=GJP2RJYXapoV3elk+MwsA14iO0awakFQouny8YJa30Cd545q7HxApnInJF/Ag+xVkJ+1LniVYVo5FxhfHwZdIDcHgRSONIppKoZpvEtJoPfK83oUKrCeJ5yu99ZsCN3uWHYXTA8sppCQyqNJHriKJ1ClJVUEWWogZAkjO7SeqddOh9z0/GPSryeMzXQrMmGwyOyjhew8WIYY8EdL3b29mNN5Q4sBP9GdPgnZ82vEnS2PlGLjfLammOKnJhTCYVfa0fRfVUB8DU3x68BsR6CZobKSxazmBGsh7oEONajxQJ3HQuPv/rHxs32i+I+GGDQAeJF2ycz2h1eVQHzbsLk6kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hZh/FasuzIaiEaNf3QrEe3BVC9c1xc5yAp1v/YpTVo=;
 b=uVwIQaWmAdkPlSS2/gsH7tCHWy3cXqj2/P6D5E8wHBMSjiJs0Cdll2PKvC+VGeObAu7ihYEXsQG1bVgWFwAWB/KRHRb3hmr9Z6qcc6u3k3OF0J9F3dvMJyx3QHlU0UvrvB9TTPzxM0+4kwFzZCgdI7NmR9Gef26dzZ1CtOps9BI=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Xen 4.18 release: Reminder about last posting date
Thread-Topic: Xen 4.18 release: Reminder about last posting date
Thread-Index: AdnGpQJJnpHQXjHHQ2KSH/TFd+8FbgCv9A+AAAwhZoA=
Date: Tue, 8 Aug 2023 01:12:16 +0000
Message-ID: <5466B9C5-8D63-48F0-B899-DADCFC75F0B2@arm.com>
References:
 <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2308071209470.2127516@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2308071209470.2127516@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB5763:EE_|AM7EUR03FT063:EE_|AM7PR08MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9d3faf-5ac1-4692-8cf2-08db97ac9e3f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1WlPMYUW6VUujME74VJkOgfIk8LNZi8AP48DL8jkBWB5MGCGIWd2vL11vEwzFHQOS/Dvf9N2a8bdC+8kC3nEmxAtB0T/wl/riN3l6c2qYpyEzlc5Jb2Xo2rRbL0d30cy/tcWxHLiY58hZUNX66qV0P7YeD1a3sOohWBin4cnTqEPVq6ZrBiY/5/63yKC/SEge4NzQ44iHiOD7SjP+WNGfxX8AqfwmgQ9Tf2BmIuATfc8pealwmfOtlkrZPzqqHfPWiPjjkGSglyQGNgR8M7bwRwOGS2h0I3JiY4pEyZEoqN9s33LCHzvK6vg9MudUb9K8f9yiHIIdnjXqEPmn87t1DqeSgfzrR/lisYFgBGFIMJixm0BCS19CpUmnznY498tU09olo5wUHU4i0Xa0VVAWwJYrtkAmPcwiRNSdhHMNgtVFOXrAoiD0QMzeNO+ShjltociwSPeQAWpwUGrTDTNh/QkxIgpdIcQJam3bH/0KSOnDCx1Q4Lp5MW73t+6Yht6CQnJPYchtJT7ueZwpopRSALUtiSa8hhBRaRFQh9WhdNniWDcSzJOSzPIxMskXlyTAOXu0grn98gkaT8qbQ/iKwWCTIzV872sCsMbMXHmv/riklfsULa2dIhQvtkr3MfeT9/9aOQOfOf31GwtSWqguJ4R+CpV1wYHycs8kckWY9PCfqKjLzuEqL/mCD18Q/KXsS03vBJwHbYFpGj9sUUrKW7NN2y960SKgQ+sLSGf6j0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(186006)(90011799007)(1800799003)(90021799007)(451199021)(2616005)(6486002)(45080400002)(122000001)(478600001)(83380400001)(966005)(6512007)(53546011)(26005)(6506007)(66556008)(33656002)(64756008)(66446008)(66476007)(66946007)(91956017)(76116006)(8676002)(41300700001)(316002)(8936002)(2906002)(4326008)(6916009)(71200400001)(36756003)(54906003)(38100700002)(86362001)(38070700005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34B40C817654F549BFA8D800209F8C9F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5763
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3f3d493-41c9-4982-a8bf-08db97ac819f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vn8LD+AV03BEIT/F7xSgqicGmYFj2CbTz1vcFGMPCe1+qylsy1jCr5ZP2/ynLUdLnmPycMN7YoLMu14RoFRLFmubn7RJPta3q8fS1p+nQjAX+Sdwvh1Xx1+drxaZ38v+LZ6uO24nGq9FRw9eHfe/i/73ZLtjRmMhELuSr5jJgw+qQd9yJv9QqUurSHoPwJ2H5/xRJu95ytsN/1+M1k4LAD9aRvFkfZ8wLZx4xniZ+Z6P72RkS13SPbGabtA7kwaRfCRszxary58dOOnqCjgU2vSdrukgJ+IZ5PxU1TNXRc11WkvyhthRJAim4olHcjUQ58Og2JFQVXK+DoRRfauq/zgMza+d50ujtqhM/89IB1IzRU/O7I5Cyb9iEVoHxrI6KHV4NSmK/FvjKBjDBERzcFGv90giW5+TTxMgXhG0BmT2nCNyQj6c2CsY6QfplvtOW4RTfTr7RojZuxaMPcZFX4eCrQdimGjuaO+3Efo6nRwc9HPNHTEZJ91FKdlWNpn50b/JaxEN2uQjJp65Dc3q3Yg4sqKsBPkAVGPZP8xIsj2WEMXs14kiHkIbf5tpl0t0Ayjqj0ct0d1GbB8Xy3c1KLpxb/lLRnU8mpTH6HMgrgYk8U+6oawA24PHi5/ZFlK7qld6gmYLQo0zGmN+0w+cfS4XmQ6I4+YJuXasuS6aKkLhqvmCdjREZUCG0fUUD9mDVoGuR1ESLQKnHEd2Pz6lOxxlkxN2rCesyHWVs6ZtlXwL3qPqvgxriiybYNmrWMNYct/md/DVH1lSVNFI5OJmLJLen8mVEWbboKhJeVsXzCuBlmwCN5qylJvw4wUNxim0TMR+NJBFBp0fdlhjXcT1Vg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(90011799007)(451199021)(82310400008)(90021799007)(186006)(1800799003)(40470700004)(36840700001)(46966006)(6862004)(8676002)(8936002)(5660300002)(4326008)(41300700001)(316002)(47076005)(86362001)(83380400001)(40480700001)(40460700003)(2906002)(36860700001)(6512007)(966005)(6486002)(2616005)(6506007)(53546011)(26005)(36756003)(336012)(70586007)(70206006)(356005)(45080400002)(478600001)(81166007)(82740400003)(54906003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 01:13:04.7722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9d3faf-5ac1-4692-8cf2-08db97ac9e3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5431

SGkgU3RlZmFubywNCg0KPiBPbiBBdWcgOCwgMjAyMywgYXQgMDM6MjQsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDcgQXVn
IDIwMjMsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+PiBIaSBldmVyeW9uZSwNCj4+IA0KPj4gRm9sbG93
aW5nIHRoZSByZWxlYXNlIHNjaGVkdWxlIGRpc2N1c3Npb24gaW4gaW4gQXByaWwsIEkgYW0gc2Vu
ZGluZyB0aGlzIGVtYWlsDQo+PiB0byByZW1pbmQgdGhhdCBhY2NvcmRpbmcgdG8gdGhlIHJlbGVh
c2Ugc2NoZWR1bGUgWzFdLCBBdWd1c3QgMTEgKHRoaXMgRnJpZGF5KQ0KPj4gd2lsbCBiZSB0aGUg
bGFzdCBwb3N0aW5nIGRhdGUsIHdoZW4gcGF0Y2hlcyBhZGRpbmcgbmV3IGZlYXR1cmVzIGFyZSBl
eHBlY3RlZA0KPj4gdG8gYmUgcG9zdGVkIHRvIHRoZSBtYWlsaW5nIGxpc3QgYnkgdGhpcyBkYXRl
Lg0KPj4gDQo+PiBBbHNvLCBub3RlIHRoYXQgd2UgY3VycmVudGx5IGhhdmUgMSByZWxlYXNlIGJs
b2NrZXIgWzJdIHdoaWNoIG1pZ2h0IG5lZWQNCj4+IHNvbWUgYXR0ZW50aW9uLg0KPj4gDQo+PiBb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsL0FTOFBSMDhNQjc5OTE5RjlDRTBC
MkJGODBFNzEwM0ZCNTkyNjA5QEFTOFBSMDhNQjc5OTEuZXVycHJkMDgucHJvZC5vdXRsb29rLmNv
bS8NCj4+IFsyXSBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QveGVuLy0vaXNzdWVzLzEx
NA0KPiANCj4gV2UgaGF2ZSBhbm90aGVyIHJlbGVhc2UgYmxvY2tlciBpbiBteSBvcHRpb246DQo+
IGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE2ODMxMjQ2ODgwODk3Nw0KPiBodHRw
czovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNjgzMTI2ODc2MTAyODMNCg0KSeKAmXZlIHRh
a2VuIGEgbm90ZSBmb3IgdGhpcywgdGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuDQoNCktpbmQgcmVn
YXJkcywNCkhlbnJ5DQoNCj4gDQo+IEFuZHJldywgd291bGQgeW91IE9LIHdpdGggbWFraW5nIGl0
IGEgcmVsZWFzZSBibG9ja2VyPyBXZSBhbHJlYWR5IGhhdmUgYQ0KPiB0ZW50YXRpdmUgZml4IGZy
b20gSnVsaWVuLg0KPiANCg0K

