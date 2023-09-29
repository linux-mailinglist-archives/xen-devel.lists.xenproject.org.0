Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56347B2D1A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 09:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610205.949535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm81G-0002Rc-7f; Fri, 29 Sep 2023 07:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610205.949535; Fri, 29 Sep 2023 07:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm81G-0002OX-4g; Fri, 29 Sep 2023 07:34:38 +0000
Received: by outflank-mailman (input) for mailman id 610205;
 Fri, 29 Sep 2023 07:34:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGVc=FN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qm81E-0002OR-Cc
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 07:34:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a23754c3-5e9a-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 09:34:33 +0200 (CEST)
Received: from DUZPR01CA0250.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::6) by DB3PR08MB8962.eurprd08.prod.outlook.com
 (2603:10a6:10:43f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 07:34:29 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b5:cafe::63) by DUZPR01CA0250.outlook.office365.com
 (2603:10a6:10:4b5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 07:34:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Fri, 29 Sep 2023 07:34:29 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Fri, 29 Sep 2023 07:34:29 +0000
Received: from 49bb745e87f4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A18D1D2-F371-4DE9-B2C8-F926BCA12F49.1; 
 Fri, 29 Sep 2023 07:33:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 49bb745e87f4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 07:33:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7653.eurprd08.prod.outlook.com (2603:10a6:20b:4cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 07:33:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 07:33:55 +0000
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
X-Inumbo-ID: a23754c3-5e9a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqAO5OIhOuqvoJAZN3fDVXFBtyrR9lVW0pffhrRBATM=;
 b=AlRVJC3dBT2BLw/1ALgIERykl9O2nbOduNq5QiUUrDWaXI6LH+78abZCaQGUJTbLWCog1P9ybaUZXqCALMquUVKc1xd07oBvFnTG13Q5aUTo89xaqGEGd5XRvck7tiGVQmDsYjEKmNrrlxFz5XzUPlnFn/lO5DLkGTMaEuRqfmE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1fbf8b5b55173bc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ck+Q/kss4jy04+Z4fvJr9skcFjFoV6bf51kYZIr2uT7pL9CYenDIpyKogebWS0vuhkyUGVxMqJKNvoQq0PYa+DbHcNLnLoSrpvW7EUtLMDECBbFS9p8dS0pdWJ5DgQg6B9BR/NFrbtxHmdnPoBRSCmWVQ/UBz1Bgqgrnj/tQ3+8NLz+PfmI22ln1IsdOfAb4jOQSzC5BYC/wZAUc2DISZbAaYBDMTvWToLLWfBlq4SvxjuMy9Xj0z3D99UQxktVNQOl/4BazVU5nlpuuJbBtwVIr3xt6ZZ0Rzk97HL6ROYIblYZ+VOWW39G81mB3xoYuTSbbNlgzuQN5P/gaSpTONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqAO5OIhOuqvoJAZN3fDVXFBtyrR9lVW0pffhrRBATM=;
 b=HXGGubNU0AMyUf2NuyA7KtpHKnSJ/8L5HfP6Mx/Lge7SyJdWhnW81vG1vA+zXODoFSg5iPQSQfquAqVi8mAJ6sq2dBYow8whjCIGNASpHZBk6XeKUL26Qrfn4s6gjAWTRjI0fad0PL0wjNYBigF3AgpDLPqvmdmoDT3rDvQ39cxsr/95zoQdNxMrU+p141k7FZFiuRVXp+8pxdLCKxz56CkaRW77WUyzBBIrh7qkL6EZBCFfKwvEPBEg/wNO4/YfhABODPD7MQrfgq2FoC33MoBfRRE4geOH6PBnr/2B5c8JB1ib6F75K/x9yaBKYh0tVh7QYjA2IbNYp8CcHyn+Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqAO5OIhOuqvoJAZN3fDVXFBtyrR9lVW0pffhrRBATM=;
 b=AlRVJC3dBT2BLw/1ALgIERykl9O2nbOduNq5QiUUrDWaXI6LH+78abZCaQGUJTbLWCog1P9ybaUZXqCALMquUVKc1xd07oBvFnTG13Q5aUTo89xaqGEGd5XRvck7tiGVQmDsYjEKmNrrlxFz5XzUPlnFn/lO5DLkGTMaEuRqfmE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "nicola.vetrini@bugseng.com"
	<nicola.vetrini@bugseng.com>, "simone.ballarin@bugseng.com"
	<simone.ballarin@bugseng.com>, "federico.serafini@bugseng.com"
	<federico.serafini@bugseng.com>
Subject: Re: Misra rule 10.3 violations report script
Thread-Topic: Misra rule 10.3 violations report script
Thread-Index: AQHZ8eai6IW78bNFI0CROv/LSYbjorAw4NCAgACJ7wA=
Date: Fri, 29 Sep 2023 07:33:55 +0000
Message-ID: <AB2332E6-1EE4-4657-8403-F090D1E6C13E@arm.com>
References: <D36FE722-43D5-4A93-B725-AD4157A1BA61@arm.com>
 <alpine.DEB.2.22.394.2309281609360.1996340@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309281609360.1996340@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7653:EE_|DBAEUR03FT032:EE_|DB3PR08MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9569b4-6ce0-42f2-b255-08dbc0be83f2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K0q9DRKHWw2yRSBLJKBJGw8eQSPBlAZEvWHRVoSBCSZ0+9l7/1YZsXmQOMR6zs1yhsnZGeWtAn/xFFyEKdl+hu4vxNgsPs/u2RQG+ujcFdK7dZl1aLzKnIZ11M29H+Z/QM/p0ZEBrg6Yxr1Y0/Zqi6zrMrZNN6kKj7TpxcvV5QgBkW1Rv3PkKtJQvwER/CddnzXr4MUCt5n11XRV63pBeASoGCRDLnRvRhlAgH5HAk8KNH0Tx6/BIwOBX8K+LShBtbitVP1yTyaSVKD7jP29UEV3Ggq+zDJmGDa4YcuWcDmEJ+1kp9mJSkHY+Feb98qTl8JJ2fI/YTOhvhnZ76/VQg96OXtNYMPJD6F1wHEVESEaNGKgw9J9kWdGrhBjxLoOF+p6K7jwDtAcKIQa8BvdKlpJ2kBvejOC1CKlgVSOE1Ykl+vhJf4MGW3OpqIcxn/V5EKL7XbqUjrO2VS9TxIxgee6IUX17uLuvoyb1ouvozqqDgNVyUPbjqmYBMeJ2vaLLfCROe7XoazIMHJB/BVEmKyEWe5PlKxkwlfWgGBOAphCYV2fn/CbBZ0rblbFfVweTzAdeJe9D1TOUenUczKRIv8xGfpm4/M8SIWI3KoASuUUNPqWpl6nSwInM9FXo7+TrXJcaPQ3/fIBUpBUPM3IZQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6506007)(6486002)(6512007)(2616005)(53546011)(86362001)(33656002)(36756003)(38100700002)(122000001)(38070700005)(26005)(2906002)(71200400001)(478600001)(83380400001)(316002)(8936002)(66556008)(4326008)(8676002)(41300700001)(66476007)(5660300002)(91956017)(76116006)(64756008)(54906003)(6916009)(66946007)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FD7342F9010964ABA2B61252FE3021E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7653
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6057173d-e3d7-4c48-776e-08dbc0be6fb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c+XMRRb2e6GRXi3ATSZsJSyVH18+vUSa0zSDWvctl/y3pu2KkkzddAcvIkrmKqe/z/do2XZpZG7CDpAX+k27nVTlRiE68H8IsDCxA9R3psMM8tZs6Yn2+hBSuesn0ygRl8ned2RuO4PXl7QbqdGwopZaLMMeTHAh4FtkZSTyDPmJ/VDzwRKQXLL6B+IYBcsLtmHtaqKwuOHRYFviFLv+DLhmYjeUV+byAVHfhOLlOU6LoNZkjzvfnJ+0iF3NlLW0DURQt3vLXX/qkDL2txOVeUrmn9n0WMuK0bbAf99+4/v8umG8fuSUj5hdEZq8Z9n63ywe76yphl+aAJzxidN8xfOxfmKJaT3aW5KGqEGd4TddWbr8ekGO2J9EiwBzLgzthKN3gNKduY+UBmuwchSc++sPxPc9l2NndrQlWg0yZrmV4cjHJnODvBeQd2CVpliOi2PeF21cgVI43NWG31/xhEr3V18V9t8xxHDlmFIQQMpKGggltBjEJQ6i21494TISvU/vdYur74kDm8b5tt9FP9lMZ0EqEG8UXJiru1NJS4X6vroiixC/qXsIQbPT++LSEwFfWv7Bwv+z+iJuPXViIFb9RbxWYC4+O89ANhDe/AsJsnjoyQXg/FLBwe4iA+B50ncwJkM7bHapGdiiLWrDLjJlIwnGmILEfgzLxaa3rviRwWvDt9OJ+E6d+SdQw9CmcrnR4tvM4v2i0/YXYwt7iO96lttWf0yYTA//1lODABQr7QLcmoL5Kx5OJJdYp7u9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39850400004)(136003)(230922051799003)(82310400011)(186009)(1800799009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(2616005)(47076005)(336012)(5660300002)(4326008)(6862004)(8936002)(8676002)(6486002)(53546011)(6506007)(81166007)(6512007)(82740400003)(356005)(83380400001)(33656002)(107886003)(26005)(36860700001)(478600001)(70206006)(70586007)(36756003)(316002)(54906003)(40480700001)(86362001)(2906002)(41300700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 07:34:29.3097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9569b4-6ce0-42f2-b255-08dbc0be83f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8962

DQoNCj4gT24gMjkgU2VwIDIwMjMsIGF0IDAwOjIwLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAyOCBTZXAgMjAyMywgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+IEhpIGFsbCwNCj4+IA0KPj4gSW4gdGhlIGxhc3QgTUlTUkEg
bWVldGluZyBTdGVmYW5vIHRvbGQgbWUgYWJvdXQgdGhlIFJ1bGUgMTAuMyBhbmQgdGhhdCB3ZSBo
YXZlIGEgbG90IG9mIHZpb2xhdGlvbnMsDQo+PiBidXQgR0NDIGhhcyBhIHdheSB0byBsaXN0IHRo
ZW0gYXMgd3JpdHRlbiBpbiBydWxlcy5yc3QuDQo+PiANCj4+IFNvIHRoZSBpc3N1ZSB3YXMganVz
dCB0aGF0IHdlIGhhdmUgYSBsb3Qgb2YgdmlvbGF0aW9ucywgbW9zdCBvZiB0aGVtIGNvbWluZyBm
cm9tIGhlYWRlcnMgYW5kIHRoZQ0KPj4gRGV2ZWxvcGVyIG1pZ2h0IGZlZWwgYSBiaXQgbG9zdCBz
aW5jZSB0aGUgbnVtYmVyIGlzIHZlcnkgaGlnaCwgc28gSeKAmXZlIGRldmVsb3BlZCB0aGlzIHNj
cmlwdCB0byB0YWtlDQo+PiB0aGUgR0NDIGJ1aWxkIGxvZyBhbmQgY3JlYXRlIGEgbGlzdCBvZiB1
bmlxdWUgb2NjdXJyZW5jZXMgb2YgdGhlIHZpb2xhdGlvbnMgc29ydGVkIGluIGRlc2NlbmRpbmcN
Cj4+IG9yZGVyLCBzbyB0aGF0IHdobyBoYXMgYSBiaXQgb2YgdGltZSBjYW4gdHJ5IHRvIGZpeCBz
b21lIG9mIHRob3NlIGFuZCBtYXliZSBjYW4gc3RhcnQgZnJvbSB0aGUgdG9wDQo+PiBvZiB0aGUg
bGlzdCB0byBmaXggYXMgbWFueSBhcyBwb3NzaWJsZSBvY2N1cnJlbmNlcy4NCj4+IA0KPj4gSSBh
dHRhY2ggdGhlIHNjcmlwdCBhcyBwYXRjaCBmaWxlLg0KDQpIaSBTdGVmYW5vLA0KDQo+IA0KPiBU
aGFua3MgTHVjYSEgQWN0dWFsbHkgSSB0aGluayB0aGlzIGlzIGdyZWF0ISBUaGUgc2NyaXB0IG1h
a2VzIGl0IG11Y2gNCj4gZWFzaWVyIHRvIHVzZSB0aGUgR0NDIG91dHB1dCB0byBhZGRyZXNzIDEw
LjMgdmlvbGF0aW9ucy4gSSB0aGluayB3ZQ0KPiBzaG91bGQgaGF2ZSBpdCBpbiB0aGUgeGVuLmdp
dCB0cmVlLg0KDQpPayBJIGNhbiByZWZpbmUgaXQgYSBiaXQgaW4gdGhhdCBjYXNlIGFuZCBwdXNo
IGl0IHRvIHRoZSBNTC4NCg0KPiANCj4gVGhhbmtzIHRvIHRoZSBzY3JpcHQgSSB3YXMgYWJsZSB0
byBxdWlja2x5IGFkZHJlc3MgdGhlIHRvcCB2aW9sYXRpb24gaW4NCj4gYml0bWFwLmguDQoNCkni
gJltIHdvbmRlcmluZyBpZiB3ZSBuZWVkIHRvIHJlbW92ZSBmcm9tIHRoZSBsaXN0IHRoZSBleGNs
dWRlZCBmaWxlcywgaW4gdGhpcw0KZmlyc3Qgc2hvdCBJIGRpZG7igJl0IGRvIHRoYXQgYnV0IHNo
b3VsZCBiZSBlYXN5Lg0KDQoNCg==

