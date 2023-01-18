Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8496718E1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 11:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480458.744891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5ch-0000r3-68; Wed, 18 Jan 2023 10:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480458.744891; Wed, 18 Jan 2023 10:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5ch-0000oY-2d; Wed, 18 Jan 2023 10:24:51 +0000
Received: by outflank-mailman (input) for mailman id 480458;
 Wed, 18 Jan 2023 10:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pI5cg-0000oS-5i
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 10:24:50 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20d4d0ba-971a-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 11:23:19 +0100 (CET)
Received: from DB6P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::29) by
 GVXPR08MB7896.eurprd08.prod.outlook.com (2603:10a6:150:16::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Wed, 18 Jan 2023 10:24:41 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::4c) by DB6P195CA0019.outlook.office365.com
 (2603:10a6:4:cb::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Wed, 18 Jan 2023 10:24:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 10:24:41 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Wed, 18 Jan 2023 10:24:41 +0000
Received: from f647958dc23f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 236CF102-8894-4C4C-B843-9450C52D060C.1; 
 Wed, 18 Jan 2023 10:24:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f647958dc23f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 10:24:35 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS2PR08MB8879.eurprd08.prod.outlook.com (2603:10a6:20b:5f6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 18 Jan
 2023 10:24:33 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 10:24:33 +0000
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
X-Inumbo-ID: 20d4d0ba-971a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IquuezylwvRjL4NG/xhRa2QIyePrJ3rh/pyM6D3CzYw=;
 b=6vhri22t48d3PjjyE3LKksGP4tJncXsTiw0jlBrXsf+BufAMXOFZci1OK4FRrvN6J+MUMkf4jfHo2pY1EDoKDO5XNM0yp1j93GsOLLYQ/YktEyHAgW9JVgaH3sauvtdS28vbFjP6BPLmUjhch8o3RJ7a6UhQUyXZCo9UIfTQkwo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tru4/dK5/g8UWpjWxBPBLcSoix7FP1Ax4k8RHxY+RrIIZbwcmS8Q6KPMPaw+vNb0uLtbKtvaavQGWvhiz8PeCDy2Xwb1Mdv0Bk/E15sTzfmt+cu0f2HxiRQTigHByt1gFfpelQbdv9ARQvNCWjmuAThhyN4D0gqPXOeq+KGCtaqHjLmUtJ85vZImbQRFi/VUhMgZyPTvJGL4BDqy4EkmXWj0v+oRpSf3Py/cuSd8oNlry/ztA5vSj0jent5A6Zm9vaOdR16O0WIea4H31iTfK1nbYhECfrXSHR2JaMu6AH1brEEhd4b8+ZB1AhG76L23ziN2QEOx1U9Wk1hcYtM9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IquuezylwvRjL4NG/xhRa2QIyePrJ3rh/pyM6D3CzYw=;
 b=Q8N+QjeAqFTvlZyQJoVW2bzgS7gmGSaLXFWjpC47aI+khROC6Zs1Po/0chF/4/Ygpt6peQfCg/CzFbMIt6phcDAGJr18GQNqWUW06DBqwz7Vi9PkKHoOj/ogj9xFO75x/tzxyJ4r/ekDBMfiHfkEeybRsk1Y62JMCSaEmcf5bdnfjJrNOo+jMM0BIc+LOXNHEQUhGbPWJczV52CJJor1d1mWdixqGG0tgLCGTrr4b9NwrY+ScsIijf3KaUlZFsYXid1RFulwPynjXZxCpYe0M/vPPY8UEouX5at1uVRifQ/ZhsR2bTEzVTfRMP1sLKhFWgHnH4PY+GxCy4s3O6xNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IquuezylwvRjL4NG/xhRa2QIyePrJ3rh/pyM6D3CzYw=;
 b=6vhri22t48d3PjjyE3LKksGP4tJncXsTiw0jlBrXsf+BufAMXOFZci1OK4FRrvN6J+MUMkf4jfHo2pY1EDoKDO5XNM0yp1j93GsOLLYQ/YktEyHAgW9JVgaH3sauvtdS28vbFjP6BPLmUjhch8o3RJ7a6UhQUyXZCo9UIfTQkwo=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 05/40] xen/arm64: prepare for moving MMU related code
 from head.S
Thread-Topic: [PATCH v2 05/40] xen/arm64: prepare for moving MMU related code
 from head.S
Thread-Index: AQHZJxAYj73pNk7diEiR8Njo5KbmJ66jSxAAgAA5lACAAHG8gIAACS7Q
Date: Wed, 18 Jan 2023 10:24:32 +0000
Message-ID:
 <PAXPR08MB7420F3F3A95488C1462A8AE59EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-6-Penny.Zheng@arm.com>
 <f78755d8-0b43-ebe4-4b2c-c88875347796@xen.org>
 <PAXPR08MB742006643CF50E239EBC12139EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <4e6d4deb-d38b-9845-2f58-e94f28196bf6@xen.org>
In-Reply-To: <4e6d4deb-d38b-9845-2f58-e94f28196bf6@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C405321523030C429B13296BC2772AC6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS2PR08MB8879:EE_|DBAEUR03FT043:EE_|GVXPR08MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fb667f-1995-48b2-4ac5-08daf93e35cc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CdS6Nkv14hViTwnBSRjvQ9ez6iXlHXgmtjqTvraBcY59WiDzCMqQwZLcep77MfVac0F0dD6/Z7x6h7xFtUONmChe/fUafhFZ+G3PJaCUU1KQx9b7BLpI7jlfqnQfra2pxIaA63Xc7FBT7pAFTl6tuP0FWrle+x0/gABANqEUvfd5eVUPQ0sjSQAcWk2vGa9z/54qED1hFMgvJ31u7Y5Vr1MUyC+0yggIT8jzaWf1J5vr9U9BhAO/KNNIOKtRPIoSgWcsd2hCmpEfF2i3yvaHvSm1kvdC1RTuZ/4etCMeu3kfELYqOcRlkkfv1VkjsmxDJOc/EKGGNS405ex39SAjjulzAAIXTb9Riijfvg8Id9GgF90PLg9QYty5eBn6cHLa+vVzttoRh+3qMPFllTYNAro9CIz2OeJDsROr6Lc28H6VKB+3HIxykgM/apt+zAVgXid5jcrO60l/nHTy5pMjpbiNRTUPWnVuNOud7tBnr/+hLOTqRHRa15VwnjNURY4x7fxMZ8v4Mi30gZcAM7NAHHf7JbQwP6QfPZxlMGcg0rymJaZknTkaNG+GxlM/D+dD+u4eqymlfRZ2npnNsltOylB5rsXf70wz7EGjb52Gs185AtTlFjmbYXIIfi1QhoroCJ55wiXNteaD6T84s3eGLckpDwc0gjqSfYZsvOtmG+ljf4BSag5fBTeRX65kDeZ/LZDu8IZCmGwZ49/MJwgAyA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199015)(2906002)(38100700002)(122000001)(33656002)(55016003)(86362001)(7696005)(71200400001)(316002)(54906003)(110136005)(38070700005)(6506007)(64756008)(66556008)(66476007)(8676002)(4326008)(83380400001)(41300700001)(76116006)(5660300002)(66446008)(53546011)(478600001)(26005)(186003)(8936002)(9686003)(66946007)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8879
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	32022a36-6d8b-49a0-83c4-08daf93e30c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bar0HzfXYwEX4osJk5CNOKvDTYfTe4jdrjCmp+5YurfM8amYbuRBq0atqUxAET7YpyKuZLyimnmyNgxPgcoRcaWn9ChCsU3oKikiWQq2/4wh2nFEVzS6qDHPg/Z0AI1kicfagVjsg6iUuDCVGF3q1W5Qf3xnAfM27eCvvGbhNnuED97HMEfqY9bxvEgkS5Ijt0gystv6rH2vTv/ygAG+z0Glmfieu61cZnrQDot4nejwTTCmABMRVJn24wnQ2kaGRp+EuMC6h5kwpbIIPJzIe0I++5YFVDlG1qxVEcKJgk0irqKiJvOUL652SrE5/qZgfPeCU9cdZBLIHlwsvLwq4SMwQ56HVx8HMvmxE/5LKXQpM53YHoJmeZoxaCga65nSp1KRXRHLvfZLG5Nc1RYxCYoZSLUgtEZ44zZqZ8YwpGmqHsWukwiuYJTsB3JESGSJxdFsM2j+OEA3pLvMgldXE07MFXdNxXSgeeKY2LQLBA4FSf/HpW83fOq0NPN9fl84qKG2TCDbJgl6K31Oj9rr8MOplyW/5IDfsclQUhN8b7ck75U506HFgRc+FYJh3JZHYGIbZ42pWwQUFLliRI+LQZQ3Sf2BBwgiRl6toWuueZWVHhNa+VpHqAiZA1Q+R10V2uRR/yYVP9z8DTbJRe0jDQKvAO1RzfM+lYOQGxaPxVl9zovpEKvQUbRa4ncBWlvyX2nAVg3Yar9prZZ8ZxS50A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(2906002)(82740400003)(36860700001)(81166007)(40460700003)(47076005)(40480700001)(55016003)(33656002)(110136005)(82310400005)(7696005)(316002)(54906003)(41300700001)(356005)(26005)(4326008)(70206006)(70586007)(8676002)(5660300002)(107886003)(8936002)(6506007)(52536014)(336012)(186003)(53546011)(83380400001)(9686003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 10:24:41.2216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fb667f-1995-48b2-4ac5-08daf93e35cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7896

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjPlubQx5pyIMTjml6UgMTc6NTAN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgUGVubnkgWmhlbmcgPFBlbm55Llpo
ZW5nQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJx
dWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1ayA8Vm9s
b2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDUvNDBd
IHhlbi9hcm02NDogcHJlcGFyZSBmb3IgbW92aW5nIE1NVSByZWxhdGVkDQo+IGNvZGUgZnJvbSBo
ZWFkLlMNCj4gDQo+IA0KPiANCj4gT24gMTgvMDEvMjAyMyAwMzowOSwgV2VpIENoZW4gd3JvdGU6
DQo+ID4gSGkgSnVsaWVuLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjPl
ubQx5pyIMTjml6UgNzozNw0KPiA+PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5j
b20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gQ2M6IFdlaSBDaGVuIDxX
ZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+ID4+IDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsN
Cj4gPj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiA+
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA1LzQwXSB4ZW4vYXJtNjQ6IHByZXBhcmUgZm9yIG1v
dmluZyBNTVUgcmVsYXRlZA0KPiA+PiBjb2RlIGZyb20gaGVhZC5TDQo+ID4+DQo+ID4+IEhpIFBl
bm55LA0KPiA+Pg0KPiA+PiBPbiAxMy8wMS8yMDIzIDA1OjI4LCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4gPj4+IEZyb206IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+Pj4NCj4gPj4+IFdl
IHdhbnQgdG8gcmV1c2UgaGVhZC5TIGZvciBNUFUgc3lzdGVtcywgYnV0IHRoZXJlIGFyZSBzb21l
DQo+ID4+PiBjb2RlIGltcGxlbWVudGVkIGZvciBNTVUgc3lzdGVtcyBvbmx5LiBXZSB3aWxsIG1v
dmUgc3VjaA0KPiA+Pj4gY29kZSB0byBhbm90aGVyIE1NVSBzcGVjaWZpYyBmaWxlLiBCdXQgYmVm
b3JlIHRoYXQsIHdlIHdpbGwNCj4gPj4+IGRvIHNvbWUgcHJlcGFyYXRpb25zIGluIHRoaXMgcGF0
Y2ggdG8gbWFrZSB0aGVtIGVhc2llcg0KPiA+Pj4gZm9yIHJldmlld2luZzoNCj4gPj4NCj4gPj4g
V2VsbCwgSSBhZ3JlZSB0aGF0Li4uDQo+ID4+DQo+ID4+PiAxLiBGaXggdGhlIGluZGVudGF0aW9u
cyBvZiBjb2RlIGNvbW1lbnRzLg0KPiA+Pg0KPiA+PiAuLi4gY2hhbmdpbmcgdGhlIGluZGVudGF0
aW9uIGlzIGJldHRlciBoZXJlLiBCdXQuLi4NCj4gPj4NCj4gPj4+IDIuIEV4cG9ydCBzb21lIHN5
bWJvbHMgdGhhdCB3aWxsIGJlIGFjY2Vzc2VkIG91dCBvZiBmaWxlDQo+ID4+PiAgICAgIHNjb3Bl
Lg0KPiA+Pg0KPiA+PiAuLi4gSSBoYXZlIG5vIGlkZWEgd2hpY2ggZnVuY3Rpb25zIGFyZSBnb2lu
ZyB0byBiZSB1c2VkIGluIGEgc2VwYXJhdGUNCj4gPj4gZmlsZS4gU28gSSB0aGluayB0aGV5IHNo
b3VsZCBiZWxvbmcgdG8gdGhlIHBhdGNoIG1vdmluZyB0aGUgY29kZS4NCj4gPj4NCj4gPg0KPiA+
IE9rLCBJIHdpbGwgbW92ZSB0aGVzZSBjaGFuZ2VzIHRvIHRoZSBtb3ZpbmcgY29kZSBwYXRjaGVz
Lg0KPiA+DQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFy
bS5jb20+DQo+ID4+DQo+ID4+IFlvdXIgc2lnbmVkLW9mZi1ieSBpcyBtaXNzaW5nLg0KPiA+Pg0K
PiA+Pj4gLS0tDQo+ID4+PiB2MSAtPiB2MjoNCj4gPj4+IDEuIE5ldyBwYXRjaC4NCj4gPj4+IC0t
LQ0KPiA+Pj4gICAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDQwICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLQ0KPiAtLS0NCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMN
Cj4gPj4+IGluZGV4IDkzZjliMGI5ZDUuLmIyMjE0YmM1ZTMgMTAwNjQ0DQo+ID4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TDQo+ID4+PiBAQCAtMTM2LDIyICsxMzYsMjIgQEANCj4gPj4+ICAgICAgICAgICAgYWRk
IFx4YiwgXHhiLCB4MjANCj4gPj4+ICAgIC5lbmRtDQo+ID4+Pg0KPiA+Pj4gLSAgICAgICAgLnNl
Y3Rpb24gLnRleHQuaGVhZGVyLCAiYXgiLCAlcHJvZ2JpdHMNCj4gPj4+IC0gICAgICAgIC8qLmFh
cmNoNjQqLw0KPiA+Pj4gKy5zZWN0aW9uIC50ZXh0LmhlYWRlciwgImF4IiwgJXByb2diaXRzDQo+
ID4+PiArLyouYWFyY2g2NCovDQo+ID4+DQo+ID4+IFRoaXMgY2hhbmdlIGlzIG5vdCBtZW50aW9u
ZWQuDQo+ID4+DQo+ID4NCj4gPiBJIHdpbGwgYWRkIHRoZSBkZXNjcmlwdGlvbiBpbiBjb21taXQg
bWVzc2FnZS4NCj4gPg0KPiA+Pj4NCj4gPj4+IC0gICAgICAgIC8qDQo+ID4+PiAtICAgICAgICAg
KiBLZXJuZWwgc3RhcnR1cCBlbnRyeSBwb2ludC4NCj4gPj4+IC0gICAgICAgICAqIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+Pj4gLSAgICAgICAgICoNCj4gPj4+IC0gICAgICAgICAq
IFRoZSByZXF1aXJlbWVudHMgYXJlOg0KPiA+Pj4gLSAgICAgICAgICogICBNTVUgPSBvZmYsIEQt
Y2FjaGUgPSBvZmYsIEktY2FjaGUgPSBvbiBvciBvZmYsDQo+ID4+PiAtICAgICAgICAgKiAgIHgw
ID0gcGh5c2ljYWwgYWRkcmVzcyB0byB0aGUgRkRUIGJsb2IuDQo+ID4+PiAtICAgICAgICAgKg0K
PiA+Pj4gLSAgICAgICAgICogVGhpcyBtdXN0IGJlIHRoZSB2ZXJ5IGZpcnN0IGFkZHJlc3MgaW4g
dGhlIGxvYWRlZCBpbWFnZS4NCj4gPj4+IC0gICAgICAgICAqIEl0IHNob3VsZCBiZSBsaW5rZWQg
YXQgWEVOX1ZJUlRfU1RBUlQsIGFuZCBsb2FkZWQgYXQgYW55DQo+ID4+PiAtICAgICAgICAgKiA0
Sy1hbGlnbmVkIGFkZHJlc3MuICBBbGwgb2YgdGV4dCtkYXRhK2JzcyBtdXN0IGZpdCBpbiAyTUIs
DQo+ID4+PiAtICAgICAgICAgKiBvciB0aGUgaW5pdGlhbCBwYWdldGFibGUgY29kZSBiZWxvdyB3
aWxsIG5lZWQgYWRqdXN0bWVudC4NCj4gPj4+IC0gICAgICAgICAqLw0KPiA+Pj4gKy8qDQo+ID4+
PiArICogS2VybmVsIHN0YXJ0dXAgZW50cnkgcG9pbnQuDQo+ID4+PiArICogLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ID4+PiArICoNCj4gPj4+ICsgKiBUaGUgcmVxdWlyZW1lbnRzIGFy
ZToNCj4gPj4+ICsgKiAgIE1NVSA9IG9mZiwgRC1jYWNoZSA9IG9mZiwgSS1jYWNoZSA9IG9uIG9y
IG9mZiwNCj4gPj4+ICsgKiAgIHgwID0gcGh5c2ljYWwgYWRkcmVzcyB0byB0aGUgRkRUIGJsb2Iu
DQo+ID4+PiArICoNCj4gPj4+ICsgKiBUaGlzIG11c3QgYmUgdGhlIHZlcnkgZmlyc3QgYWRkcmVz
cyBpbiB0aGUgbG9hZGVkIGltYWdlLg0KPiA+Pj4gKyAqIEl0IHNob3VsZCBiZSBsaW5rZWQgYXQg
WEVOX1ZJUlRfU1RBUlQsIGFuZCBsb2FkZWQgYXQgYW55DQo+ID4+PiArICogNEstYWxpZ25lZCBh
ZGRyZXNzLiAgQWxsIG9mIHRleHQrZGF0YStic3MgbXVzdCBmaXQgaW4gMk1CLA0KPiA+Pj4gKyAq
IG9yIHRoZSBpbml0aWFsIHBhZ2V0YWJsZSBjb2RlIGJlbG93IHdpbGwgbmVlZCBhZGp1c3RtZW50
Lg0KPiA+Pj4gKyAqLw0KPiA+Pj4NCj4gPj4+ICAgIEdMT0JBTChzdGFydCkNCj4gPj4+ICAgICAg
ICAgICAgLyoNCj4gPj4+IEBAIC01ODYsNyArNTg2LDcgQEAgRU5EUFJPQyhjcHVfaW5pdCkNCj4g
Pj4+ICAgICAqDQo+ID4+PiAgICAgKiBDbG9iYmVycyB4MCAtIHg0DQo+ID4+PiAgICAgKi8NCj4g
Pj4+IC1jcmVhdGVfcGFnZV90YWJsZXM6DQo+ID4+PiArRU5UUlkoY3JlYXRlX3BhZ2VfdGFibGVz
KQ0KPiA+Pg0KPiA+PiBJIGFtIG5vdCBzdXJlIGFib3V0IGtlZXBpbmcgdGhpcyBuYW1lLiBOb3cg
d2UgaGF2ZSBjcmVhdGVfcGFnZV90YWJsZXMoKQ0KPiA+PiBhbmQgYXJjaF9zZXR1cF9wYWdlX3Rh
YmxlcygpLg0KPiA+Pg0KPiA+PiBJIHdvdWxkIGNvbnNpZGUgdG8gbmFtZSBpdCBjcmVhdGVfYm9v
dF9wYWdlX3RhYmxlcygpLg0KPiA+Pg0KPiA+DQo+ID4gRG8geW91IG5lZWQgbWUgdG8gcmVuYW1l
IGl0IGluIHRoaXMgcGF0Y2g/DQo+IA0KPiBTbyBsb29raW5nIGF0IHRoZSByZXN0IG9mIHRoZSBz
ZXJpZXMsIEkgc2VlIHlvdSBhcmUgYWxyZWFkeSByZW5hbWluZyB0aGUNCj4gaGVscGVyIGluIHBh
dGNoICMxMS4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhlIG5hbWluZyBpcyBkb25l
DQo+IGVhcmxpZXIuDQo+IA0KPiBUaGF0IHNhaWQsIEkgYW0gbm90IGNvbnZpbmNlZCB0aGF0IGNy
ZWF0ZV9wYWdlX3RhYmxlcygpIHNob3VsZCBhY3R1YWxseQ0KPiBiZSBjYWxsZWQgZXh0ZXJuYWxs
eS4NCj4gDQo+IEluIGZhY3QsIHlvdSBoYXZlIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gICAgIGJs
IGNyZWF0ZV9wYWdlX3RhYmxlcw0KPiAgICAgYmwgZW5hYmxlX21tdQ0KPiANCj4gQm90aCB3aWxs
IG5lZWQgYSBNTVUvTVBVIHNwZWNpZmljIGltcGxlbWVudGF0aW9uLiBTbyBpdCB3b3VsZCBiZSBi
ZXR0ZXINCj4gaWYgd2UgcHJvdmlkZSBhIHdyYXBwZXIgdG8gbGltaXQgdGhlIG51bWJlciBvZiBl
eHRlcm5hbCBmdW5jdGlvbnMuDQo+DQoNCkkgYWdyZWUgd2l0aCB5b3UsIHdlIHdpbGwgdHJ5IHRv
IHdyYXBwZXIgc29tZSBmdW5jdGlvbnMgaW5zdGVhZCBvZg0KZXhwb3J0IHRoZW0uDQoNCkNoZWVy
cywNCldlaSBDaGVuDQogDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

