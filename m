Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C46E8BE6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 09:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523917.814338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppP8N-0006Cc-OY; Thu, 20 Apr 2023 07:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523917.814338; Thu, 20 Apr 2023 07:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppP8N-00069r-LB; Thu, 20 Apr 2023 07:55:15 +0000
Received: by outflank-mailman (input) for mailman id 523917;
 Thu, 20 Apr 2023 07:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Idg=AL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ppP8M-0005c9-5V
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 07:55:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae3f2b8b-df50-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 09:55:13 +0200 (CEST)
Received: from DB6PR0202CA0022.eurprd02.prod.outlook.com (2603:10a6:4:29::32)
 by PAWPR08MB8983.eurprd08.prod.outlook.com (2603:10a6:102:340::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 07:55:11 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29::4) by DB6PR0202CA0022.outlook.office365.com
 (2603:10a6:4:29::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.24 via Frontend
 Transport; Thu, 20 Apr 2023 07:55:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.24 via Frontend Transport; Thu, 20 Apr 2023 07:55:11 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Thu, 20 Apr 2023 07:55:11 +0000
Received: from 24d640a6055e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8673633-E96A-46A4-8E8A-A36F6B371A44.1; 
 Thu, 20 Apr 2023 07:55:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 24d640a6055e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Apr 2023 07:55:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBAPR08MB5831.eurprd08.prod.outlook.com (2603:10a6:10:1a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 07:55:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 07:55:01 +0000
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
X-Inumbo-ID: ae3f2b8b-df50-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCIp0LNKgmmQzKLmDUIZqNT0jh+9nsp5OHiCSiuEWrQ=;
 b=HcXHLRTR2U7CVR5396yZAo2WEAf6GsDaf7CocJ4lmg1gLIfSt/NnlE9Ak7jAyaChg2hJz0Mo1w7fCMBUUTBZr39vL9aK0c4zYYrWV8+m1ydJXZRNMLugrSaOOQT1ay4n1o7LbLOfIMuVACR8lJQfyNzBYWs+Yy60BpJGjg91w30=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 73dbad5c90052534
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epQnDpQkMI3NKuoxlF0vI5MDahbIZxIJO+PmjVjUtat7XgHAdTlIV+bZyCOs8lGMOMTYRNLzsOAKbD/JxqExPWm5Zg42f2z36kIkm4VB0gq6cQWOI2L4u3PP59883rURcea65666cb0/c4cSbR149wSLSLGpVBJuYAbpvYImMREGbKldEtjn2hRWRM2NfO5RzS70ib5a+0PfIH732pO01dp4Hv7h96keTDJ9NoR8dnLCK5MdgrAXl4i+mchg0KPmFyDmDgCXGmlluklXyr2M0cMCIFANr5nRHcvxpU/ofb1U+9ft40R0xqeM/yhmsOjNZUPadLsEoD9GRpcxoI9NSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCIp0LNKgmmQzKLmDUIZqNT0jh+9nsp5OHiCSiuEWrQ=;
 b=mNMBvozis/Zq1lHzxJya3+OcIo2sAHYzZguwABtfIBYS6lOlol1/cgvWCiPC3k7ln2P63Fq8ox0FHYHA9bWmswWa999G9A05g48cfnMCy7sGatRukaqZDfByNQRLS8u8bIz1crfnnyPUqyUCrvTjvToxoHJ+eJDl0DkdapgKcgJBndiq6eCbRJix9b3lF7ZtoYxL42/8/LauJH8DTdiqDcibQRjCuo0FaOq34YMltsdjO+63EOnSsvIXKcYMOmN/y1Wq+DMw6b5b1njZh8exV1CIozhn1IGQwP1RadTxmP2VxgLSyGhzr0Eq2YLPY9+AocvS7ULweb9CqKibiEmnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCIp0LNKgmmQzKLmDUIZqNT0jh+9nsp5OHiCSiuEWrQ=;
 b=HcXHLRTR2U7CVR5396yZAo2WEAf6GsDaf7CocJ4lmg1gLIfSt/NnlE9Ak7jAyaChg2hJz0Mo1w7fCMBUUTBZr39vL9aK0c4zYYrWV8+m1ydJXZRNMLugrSaOOQT1ay4n1o7LbLOfIMuVACR8lJQfyNzBYWs+Yy60BpJGjg91w30=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZbSQq1oowf9vRd0a2ZPNGYXQmqK8xC64AgAE14QCAAAESAIABmpCAgAADSgA=
Date: Thu, 20 Apr 2023 07:55:01 +0000
Message-ID: <06C78335-3FD1-4AD2-A576-BCE636018280@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-6-luca.fancellu@arm.com>
 <109F3491-6845-4A5F-9F77-F24D8970B1BE@arm.com>
 <C99DF25D-538F-4373-9F3A-F4E62B9C4E54@arm.com>
 <2B510623-0438-4D01-A916-14A8DE8D0A8C@arm.com>
 <5AE27C3A-3857-4044-9010-F452C7CF7E6F@arm.com>
In-Reply-To: <5AE27C3A-3857-4044-9010-F452C7CF7E6F@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DBAPR08MB5831:EE_|DBAEUR03FT026:EE_|PAWPR08MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b8f5de-c046-4b94-2a1d-08db41749131
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5Bnxu/2kJ+D7Yr2LhZ6sAXMJsiG06sASh99Xew2/7tS+7oFIfQ58e7p2Ke+TBB4Rk5K3Tldm+qeQHWegFnmGK4YkEpkjo5iyUEGPK+kwoeY1A5qhbTw4cO7K3seez855UK3gQY2hKAIwpM/rUMzsSBPYlbUeAlrw1lC5sPjTi7CfNthgw6tsWFHqOOV5sUThUR44szr7LHLpS/Ek/RR4fTLA5/ODN2IqquQ9peHBaMiNXpCewrKE6rhjIeLxJsjZCHFgotFW9ZiN+655WTozRrY7bjn0njJfSJeze9CQsoY+B/iSVhHhIHblvrb5S+YLmNRqS38ZvZ6Ecnk18Ccg5LuGoVdb2ovVy8fOSI7VUr+eo6FDb6eG//SWeRhFZG/5q9mbun3rv6ohIVRNuWtmRJV7Q4itbGfok3+8bmBjB7Liw1FMVP9HIftJSNNqynwTgXsVChvVKNIzKFqWxKvePyolrVCrJerb2vpRS+OTE7hR+Wt+mrGQPJW7rQE4O4xly642E+FxkG3W8VLoC4uvJMd5fb9lc2+IHT00m0Vqu2VWZo7O0vpFcnOHs0MWW6D6qjIyyCmTbEmOq+u1EySfMvEieJrkIXsLxshPgriyAFrpYfg1DYCTaPaTHRCEmcUlTvaMyAnV5gTM3bvqUZ8Qsw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39850400004)(451199021)(36756003)(2616005)(2906002)(66946007)(76116006)(64756008)(66446008)(6636002)(66476007)(91956017)(186003)(53546011)(6506007)(6512007)(83380400001)(71200400001)(86362001)(6486002)(38070700005)(66556008)(478600001)(5660300002)(54906003)(37006003)(33656002)(4326008)(122000001)(38100700002)(6862004)(41300700001)(8936002)(8676002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A6C09646F827D4EB4328405CAF96744@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5831
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8aa8866-19da-443e-1a82-08db41748b6a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DnDBpyf+x9vkvbPICa37wLT2qsiwHdNXjE1hjZHM6R3VSrRLe900bVKx/JZSL1T+k9HiLHwvE5p9aWXkexHZshzuN8lT2M075qcvF7CbEyWYHQ4mRVhS0N/UitX0PKvAj1Wvw/KklFCaxQAzfMr8rqu+gx21q32OT85HQER7QHRU0D5py0H6PsD3ENVHdUGW6M8Pr8gbgDbWY1wbXqXO+FC1JdyevVSp7yIbIGCneautAYqSv6feExBlaLUGsCUlbStpZn6YhVD2HbP1QCMtHTcZERZrPzrB6sCjY9HDIGkoNLAx6J0CerGSyDYxhGxQyMCJL1emR5kEGAqx/Rc1U5T/Lsgy7zpZFT4WLaxiPxY0dq+hxUY2NNG7fF9ZaCuAnIkmpFbGQA7MNjpRyJuIVxHW/GrvXXPWWvbL8Vi7CeQ1FNtuqWhw6r67B0W2fj1rmT3H8eNJGj7ySx+wS+B6sDG6BkUbK/X6zTFR3uXMqILuPSITMBVfWydWJ+lVrBEKaXOZg1p9UQCglGxY+W8VLA41kmvKmE/xIrh2jtw1Je1/A0dBm/5rb1a0wJq8OhOUT/8EPpUv9reN2G8YumABdVgbhQR5Bqax4HrateZOQXUUeDQAjQqzfrZEj7ldST1AzW1/ae0GF1pWCU5g/8q7B4jnNn8LPUGRFkzl6jcXESy9N/UFGHp9vfNk7SbT/BnzjEOlk2MuDCTABcLuR+S+7g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(6512007)(6506007)(82740400003)(81166007)(26005)(356005)(40460700003)(6486002)(478600001)(70586007)(4326008)(70206006)(36756003)(6636002)(41300700001)(86362001)(316002)(37006003)(54906003)(83380400001)(36860700001)(186003)(40480700001)(47076005)(336012)(107886003)(53546011)(33656002)(8676002)(6862004)(8936002)(2906002)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 07:55:11.0987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b8f5de-c046-4b94-2a1d-08db41749131
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8983

SGkgTHVjYSwNCg0KPiBPbiAyMCBBcHIgMjAyMywgYXQgMDk6NDMsIEx1Y2EgRmFuY2VsbHUgPEx1
Y2EuRmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4+Pj4+ICt2b2lkIHN2ZV9zYXZl
X3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQ0KPj4+Pj4gK3sNCj4+Pj4+ICsgICAgdW5zaWduZWQgaW50
IHN2ZV92bF9iaXRzID0gc3ZlX2RlY29kZV92bCh2LT5kb21haW4tPmFyY2guc3ZlX3ZsKTsNCj4+
Pj4+ICsgICAgdWludDY0X3QgKnN2ZV9jdHhfenJlZ19lbmQgPSB2LT5hcmNoLnZmcC5zdmVfY29u
dGV4dCArDQo+Pj4+PiArICAgICAgICAgICAgKHN2ZV96cmVnX2N0eF9zaXplKHN2ZV92bF9iaXRz
KSAvIHNpemVvZih1aW50NjRfdCkpOw0KPj4+PiANCj4+Pj4gWW91IGRvIHF1aXRlIHNvbWUgY29t
cHV0YXRpb24gaGVyZSBmb3Igc29tZXRoaW5nIHdoaWNoIGRvZXMgbm90IGNoYW5nZQ0KPj4+PiBk
dXJpbmcgdGhlIGxpZmUgb2YgdGhlIFZNLg0KPj4+PiBDb3VsZCB3ZSBzYXZlIHRoZSBjb250ZXh0
X2VuZCBpbiB0aGUgdmNwdSBpbnN0ZWFkIGFuZCBqdXN0IGRvIHRoaXMNCj4+Pj4gY29tcHV0YXRp
b24gb24gaW5pdCBhbmQgZnJlZSBvbmx5ID8NCj4+PiANCj4+PiBZZXMgc3VyZSwgd291bGQgeW91
IGJlIG9rIHRvIGhhdmUgaXQgaW4gc3RydWN0IHZmcF9zdGF0ZT8NCj4+IA0KPj4gWWVzIGRlZmlu
aXRlbHkgaSB3b3VsZCBzdG9yZSBpdCBpbnN0ZWFkIG9mIHRoZSBjdXJyZW50IHN2ZV9jb250ZXh0
Lg0KPj4gDQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IFRoZXNlIGFyZSB0aGUgY2hhbmdlcyBJ
4oCZbSBkb2luZyB0byB0aGlzIHBhdGNoIHRvIGFkZHJlc3MgeW91ciBjb21tZW50LCBhcmUgeW91
IG9rIHdpdGggdGhlbT8NCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvc3Zl
LmMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvc3ZlLmMNCj4gaW5kZXggZjBlYWIxOGRjMzg0Li4xZmVm
NDY2YmEwYWEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KPiArKysg
Yi94ZW4vYXJjaC9hcm0vYXJtNjQvc3ZlLmMNCj4gQEAgLTkxLDM1ICs5MSwzNSBAQCBpbnQgc3Zl
X2NvbnRleHRfaW5pdChzdHJ1Y3QgdmNwdSAqdikNCj4gICAgIGlmICggIWN0eCApDQo+ICAgICAg
ICAgcmV0dXJuIC1FTk9NRU07DQo+IA0KPiAtICAgIHYtPmFyY2gudmZwLnN2ZV9jb250ZXh0ID0g
Y3R4Ow0KPiArICAgIC8qIFBvaW50IHRvIHRoZSBlbmQgb2YgWjAtWjMxIG1lbW9yeSwganVzdCBi
ZWZvcmUgRkZSIG1lbW9yeSAqLw0KPiArICAgIHYtPmFyY2gudmZwLnN2ZV96cmVnX2N0eF9lbmQg
PSBjdHggKw0KPiArICAgICAgICAoc3ZlX3pyZWdfY3R4X3NpemUoc3ZlX3ZsX2JpdHMpIC8gc2l6
ZW9mKHVpbnQ2NF90KSk7DQo+IA0KPiAgICAgcmV0dXJuIDA7DQo+IH0NCj4gDQo+IHZvaWQgc3Zl
X2NvbnRleHRfZnJlZShzdHJ1Y3QgdmNwdSAqdikNCj4gew0KPiAtICAgIFhGUkVFKHYtPmFyY2gu
dmZwLnN2ZV9jb250ZXh0KTsNCj4gKyAgICB1bnNpZ25lZCBpbnQgc3ZlX3ZsX2JpdHMgPSBzdmVf
ZGVjb2RlX3ZsKHYtPmRvbWFpbi0+YXJjaC5zdmVfdmwpOw0KPiArDQo+ICsgICAgLyogUG9pbnQg
YmFjayB0byB0aGUgYmVnaW5uaW5nIG9mIFowLVozMSArIEZGUiBtZW1vcnkgKi8NCj4gKyAgICB2
LT5hcmNoLnZmcC5zdmVfenJlZ19jdHhfZW5kID0gdi0+YXJjaC52ZnAuc3ZlX3pyZWdfY3R4X2Vu
ZCAtDQo+ICsgICAgICAgIChzdmVfenJlZ19jdHhfc2l6ZShzdmVfdmxfYml0cykgLyBzaXplb2Yo
dWludDY0X3QpKTsNCg0KUGxlYXNlIHVzZSBhIGxvY2FsIHZhcmlhYmxlIGhlcmUgaW5zdGVhZC4N
Cg0KRm9yIHRoZSByZXN0IGFsbCBnb29kIHllcywgaXQgbWFrZXMgdGhlIHNhdmUvcmVzdG9yZSBj
b2RlIHNpbXBsZXIgOi0pDQoNClRoYW5rcw0KQmVydHJhbmQNCg0KPiArDQo+ICsgICAgWEZSRUUo
di0+YXJjaC52ZnAuc3ZlX3pyZWdfY3R4X2VuZCk7DQo+IH0NCj4gDQo+IHZvaWQgc3ZlX3NhdmVf
c3RhdGUoc3RydWN0IHZjcHUgKnYpDQo+IHsNCj4gLSAgICB1bnNpZ25lZCBpbnQgc3ZlX3ZsX2Jp
dHMgPSBzdmVfZGVjb2RlX3ZsKHYtPmRvbWFpbi0+YXJjaC5zdmVfdmwpOw0KPiAtICAgIHVpbnQ2
NF90ICpzdmVfY3R4X3pyZWdfZW5kID0gdi0+YXJjaC52ZnAuc3ZlX2NvbnRleHQgKw0KPiAtICAg
ICAgICAgICAgKHN2ZV96cmVnX2N0eF9zaXplKHN2ZV92bF9iaXRzKSAvIHNpemVvZih1aW50NjRf
dCkpOw0KPiAtDQo+ICAgICB2LT5hcmNoLnpjcl9lbDEgPSBSRUFEX1NZU1JFRyhaQ1JfRUwxKTsN
Cj4gDQo+IC0gICAgc3ZlX3NhdmVfY3R4KHN2ZV9jdHhfenJlZ19lbmQsIHYtPmFyY2gudmZwLmZw
cmVncywgMSk7DQo+ICsgICAgc3ZlX3NhdmVfY3R4KHYtPmFyY2gudmZwLnN2ZV96cmVnX2N0eF9l
bmQsIHYtPmFyY2gudmZwLmZwcmVncywgMSk7DQo+IH0NCj4gDQo+IHZvaWQgc3ZlX3Jlc3RvcmVf
c3RhdGUoc3RydWN0IHZjcHUgKnYpDQo+IHsNCj4gLSAgICB1bnNpZ25lZCBpbnQgc3ZlX3ZsX2Jp
dHMgPSBzdmVfZGVjb2RlX3ZsKHYtPmRvbWFpbi0+YXJjaC5zdmVfdmwpOw0KPiAtICAgIHVpbnQ2
NF90ICpzdmVfY3R4X3pyZWdfZW5kID0gdi0+YXJjaC52ZnAuc3ZlX2NvbnRleHQgKw0KPiAtICAg
ICAgICAgICAgKHN2ZV96cmVnX2N0eF9zaXplKHN2ZV92bF9iaXRzKSAvIHNpemVvZih1aW50NjRf
dCkpOw0KPiAtDQo+ICAgICBXUklURV9TWVNSRUcodi0+YXJjaC56Y3JfZWwxLCBaQ1JfRUwxKTsN
Cj4gICAgIFdSSVRFX1NZU1JFRyh2LT5hcmNoLnpjcl9lbDIsIFpDUl9FTDIpOw0KPiANCj4gLSAg
ICBzdmVfbG9hZF9jdHgoc3ZlX2N0eF96cmVnX2VuZCwgdi0+YXJjaC52ZnAuZnByZWdzLCAxKTsN
Cj4gKyAgICBzdmVfbG9hZF9jdHgodi0+YXJjaC52ZnAuc3ZlX3pyZWdfY3R4X2VuZCwgdi0+YXJj
aC52ZnAuZnByZWdzLCAxKTsNCj4gfQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL2FybTY0L3ZmcC5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L3ZmcC5o
DQo+IGluZGV4IDhhZjcxNGNiOGVjYy4uNGFhMzcxZTg1ZDI2IDEwMDY0NA0KPiAtLS0gYS94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvdmZwLmgNCj4gKysrIGIveGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2FybTY0L3ZmcC5oDQo+IEBAIC0xMywxMCArMTMsMTIgQEAgc3RydWN0IHZmcF9z
dGF0ZQ0KPiAgICAgICovDQo+ICAgICB1aW50NjRfdCBmcHJlZ3NbNjRdIF9fdmZwX2FsaWduZWQ7
DQo+ICAgICAvKg0KPiAtICAgICAqIFdoZW4gU1ZFIGlzIGVuYWJsZWQgZm9yIHRoZSBndWVzdCwg
c3ZlX2NvbnRleHQgY29udGFpbnMgbWVtb3J5IHRvDQo+IC0gICAgICogc2F2ZS9yZXN0b3JlIFow
LVozMSByZWdpc3RlcnMgYW5kIEZGUi4NCj4gKyAgICAgKiBXaGVuIFNWRSBpcyBlbmFibGVkIGZv
ciB0aGUgZ3Vlc3QsIHN2ZV96cmVnX2N0eF9lbmQgcG9pbnRzIHRvIG1lbW9yeQ0KPiArICAgICAq
IHdoZXJlIFowLVozMSByZWdpc3RlcnMgYW5kIEZGUiBjYW4gYmUgc2F2ZWQvcmVzdG9yZWQsIGl0
IHBvaW50cyBhdCB0aGUNCj4gKyAgICAgKiBlbmQgb2YgdGhlIFowLVozMSBzcGFjZSBhbmQgYXQg
dGhlIGJlZ2lubmluZyBvZiB0aGUgRkZSIHNwYWNlLCBpdCdzIGRvbmUNCj4gKyAgICAgKiBsaWtl
IHRoYXQgdG8gZWFzZSB0aGUgc2F2ZS9yZXN0b3JlIGFzc2VtYmx5IG9wZXJhdGlvbnMuDQo+ICAg
ICAgKi8NCj4gLSAgICB1aW50NjRfdCAqc3ZlX2NvbnRleHQ7DQo+ICsgICAgdWludDY0X3QgKnN2
ZV96cmVnX2N0eF9lbmQ7DQo+ICAgICByZWdpc3Rlcl90IGZwY3I7DQo+ICAgICByZWdpc3Rlcl90
IGZwZXhjMzJfZWwyOw0KPiAgICAgcmVnaXN0ZXJfdCBmcHNyOw0KPiANCj4gDQoNCg==

