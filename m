Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CA46E9504
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 14:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524267.815071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTiM-0000IV-8P; Thu, 20 Apr 2023 12:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524267.815071; Thu, 20 Apr 2023 12:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTiM-0000F4-54; Thu, 20 Apr 2023 12:48:42 +0000
Received: by outflank-mailman (input) for mailman id 524267;
 Thu, 20 Apr 2023 12:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE5v=AL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ppTiL-0000Ey-0o
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 12:48:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aca756a4-df79-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 14:48:40 +0200 (CEST)
Received: from AS9PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::22) by VE1PR08MB5568.eurprd08.prod.outlook.com
 (2603:10a6:800:1a8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 12:48:37 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:542:cafe::75) by AS9PR01CA0048.outlook.office365.com
 (2603:10a6:20b:542::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Thu, 20 Apr 2023 12:48:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.25 via Frontend Transport; Thu, 20 Apr 2023 12:48:36 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 20 Apr 2023 12:48:36 +0000
Received: from 89b547ba2ec4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 673FC421-5324-48C8-910D-D313B7C1C47A.1; 
 Thu, 20 Apr 2023 12:48:30 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89b547ba2ec4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Apr 2023 12:48:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6453.eurprd08.prod.outlook.com (2603:10a6:20b:31b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 12:48:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.021; Thu, 20 Apr 2023
 12:48:27 +0000
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
X-Inumbo-ID: aca756a4-df79-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9NZXMXyJlhdkvb/UfNppfnwRORp6eLFj1F6loDhpuY=;
 b=9hKB9TA7jiEt2DHJ4XvsbZhHTwJdRjqwVpzgGoGtoj3d5EXKAJ5A4dj6SfyYhMOD13DnFXs8vvsSwex6OLlQNp1m9mjAlF1t2SBDAYHkytjk0GBz2Tg94OVU8fZSZkhaCmiq3tL5Rh0uCt5D52Eg6CVmds1WSgltPpRp4hEFC5M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip9LUN/K2iryNQJEkxtRO4ZFz7U0TneV8ZLsP3nt+Xpu0VB32+pKKrqmzud45fufElsrfnrGAb00zNJER5UC79j4Q9aRydgleMKFsdaqYZLRV7VmuhkSMHeR4QXgpPt6Kar7sI0e1PihRvF2MWAROcjuu7h9YIKpdnyHC8Pv9nrWg+KxbHxuS3HRV9z2qfpAGDGTzNxmdYYrG9K6nSHfC2kvF6/mKZ5SeAa7hqovdRu0DAowfFh2825cEjhObJFOtxCuBoxQoBznlsmLFOQXvD5ZQuREonraqLmeyhmeMisJQ4vNuTu2m6LB7+00Igdj9Ti2O2b2pWTG1hbljRkeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9NZXMXyJlhdkvb/UfNppfnwRORp6eLFj1F6loDhpuY=;
 b=K3ZOyTQJIGYsEkSqQAk1aZE3Sl7EXjO6d7QLXFSyUpTMTjF9u60wNsvkyv8Gxas1VX8t3JajliTCGG2jowLH8eW3K/zOp8HmcZz6awUAmLY7xehxRQuEVnmuJBPUqOTvPQSmRUSKu7q2FvyD6ecpSaKl34uE66rpb6WkRWNS+qj7t1rJCv2GA5jYiKZ1ofi6GsgtXtJ7+RregRZ0ucW2VlWleQCbxbPyAFtudwP5yv3AYjGsPgzxoiNXBUW61S0aHWMkJxNDIggrzPfXAW0Y4Rw6X9YpLGmz5NWjKG/ZmG0IwwOcovOC8+yLGRejc43mOZpIiO1BAA3pbSccxKytig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9NZXMXyJlhdkvb/UfNppfnwRORp6eLFj1F6loDhpuY=;
 b=9hKB9TA7jiEt2DHJ4XvsbZhHTwJdRjqwVpzgGoGtoj3d5EXKAJ5A4dj6SfyYhMOD13DnFXs8vvsSwex6OLlQNp1m9mjAlF1t2SBDAYHkytjk0GBz2Tg94OVU8fZSZkhaCmiq3tL5Rh0uCt5D52Eg6CVmds1WSgltPpRp4hEFC5M=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 02/17] xen/arm: implement helpers to get and update
 NUMA status
Thread-Topic: [PATCH v3 02/17] xen/arm: implement helpers to get and update
 NUMA status
Thread-Index: AQHZc3rmEF3WFnogck6f7H8jIMmqw680I9wAgAAAs+A=
Date: Thu, 20 Apr 2023 12:48:26 +0000
Message-ID:
 <AS8PR08MB7991B9AC0AB673286ED1419192639@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-3-Henry.Wang@arm.com>
 <97a3bcbe-8f04-e4d6-a4ae-adc45543bc6b@suse.com>
In-Reply-To: <97a3bcbe-8f04-e4d6-a4ae-adc45543bc6b@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2E8DB22E213E4A4E87E93A8B57DB42C3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6453:EE_|AM7EUR03FT003:EE_|VE1PR08MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a103b63-01e0-4e84-30d0-08db419d8f21
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lPaHRqBEIHGZPpKm8japuF8wxFhsqfINx89SXT5ZyKJZXaHnCdQ1rQ+E5hhxpcyvmMWF6BZIQsNJlRrT3Eb4S9EkvfLLsteOAnUBLj/88g96uHMeiZ0mHqwKp48MaPKBxOdynpIzB0O0CE+fx8YWbyvSmpXHxxMnvXDCXTv7gpBsnHnoK8UpMeedX5ckLmLFlLXtePmM63/Axt+Hcv7v2FexwLo5bXiSxcPFxGwiPJEytdQQ2JnmedIGvYSlfw794DL0ylgCew0BzRbM3iW0qmMvtaTY24Yl6oHMvVofB3CPUXZ4sLa5DS2Vl3tgChBXvD5lyJld9Mp5jFa6V6W7zmWRhsqedwt9OytzupQ8OYXy57DydcDFmTpKl+WnzPIost3OR3Ej+aXsHLT0mabvMrIjMGQ2tNCSZ4/NMpcip09825xJlND7MU2wcRNalHcsZE19sbUU17ToVcaDLOE14eqhL+g0vDLUO7ZcJzDi0AQJPPJcyCjNBFxBxVFCPRn/lUASVCvfiBl9o73ZbruROyUx4LRttTkWcy8o6n6waDVFkHsoRigxBIU0SbLsA0CRkLz3I75kqRql32J3A6+B5PhtGrcSuwyuK7hdahNUlQw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(5660300002)(66446008)(15650500001)(64756008)(66556008)(66476007)(6916009)(66946007)(2906002)(316002)(8936002)(7696005)(4326008)(76116006)(8676002)(41300700001)(52536014)(54906003)(83380400001)(478600001)(966005)(71200400001)(9686003)(186003)(26005)(55016003)(6506007)(33656002)(38070700005)(86362001)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6453
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b56c9be-f8d4-40c1-99aa-08db419d8916
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6mQ86jpS9FDVR4WUPhvUOSnLQzykenjtu1eQWM4TSQpyD92ZMc5LjKtk1/avzy2qtGNEOaxhgKMsAiSSPXLgYlzG0MTJQLzWIMcsMKJr+rZrm49r6Z1C2sUPx1v143vg89PCC+s5N6pAkJu2MifzC8xUpBS1DP6iGJlKL6GoTdOADpGHAwebu2TShBkz5osZjtqer7vKEjLc59PPRKxKQN/rMJTXb0unq55D09+CcOo8rS526JD/Pxa0HI67Wk5Nkx0eUwfzsmZllKKl77zIw77GSueTexkrZN7uEqIgiZu7VLghvYBPNHJ9e7ZVESleTSvuHIEdYe/nhnL+nylpm33OS/EvRsgHvh3ZzYlR/9h9qqG4u7EBhxLbpvxMkdDnfiZJaStgZpDYD5ikjvg/TkZsav5ZrT3ZTsSaD68nklMxzERReKupIq0KojUQXeGIP01CcLN4MMGDNdnEk9M29npF16Xa62dHTM790N9AWpqZoLVvghSjlgbnWzSzHRz4aFEKAPWlY9yuJEmpZkQO70q+2GS2JRuD/DJjmgZg7/n36FRj8DXBkihQhYAcD21qV40pGEOtlAcEjT9+QZj/omvHBaicrIAkkO5J67LDch8UcaEhtWvaqHHx5KWhStyvefNR/XQhHmTb8s8Q6I0YgjOBYOvSkl2AX113uhBvvsEQBQvL0MfGxNvZUrvdmTUe
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199021)(36840700001)(40470700004)(46966006)(40480700001)(82740400003)(26005)(40460700003)(6506007)(186003)(9686003)(36860700001)(81166007)(356005)(55016003)(5660300002)(336012)(47076005)(15650500001)(2906002)(52536014)(33656002)(6862004)(8676002)(8936002)(83380400001)(478600001)(54906003)(966005)(86362001)(7696005)(70206006)(70586007)(41300700001)(316002)(4326008)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 12:48:36.9420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a103b63-01e0-4e84-30d0-08db419d8f21
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5568

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMi8xN10g
eGVuL2FybTogaW1wbGVtZW50IGhlbHBlcnMgdG8gZ2V0IGFuZCB1cGRhdGUNCj4gTlVNQSBzdGF0
dXMNCj4gPiAtLS0NCj4gPiB2MiAtPiB2MzoNCj4gPiAxLiBSZW5hbWUgdGhlIGZpcnN0IGVudHJ5
IG9mIGVudW0gZHRfbnVtYV9zdGF0dXMgYXMgRFRfTlVNQV9ERUZBVUxULg0KPiA+IDIuIE1ha2Ug
ZW51bSBkdF9udW1hX3N0YXR1cyBkZXZpY2VfdHJlZV9udW1hIGFzIF9fcm9fYWZ0ZXJfaW5pdCBh
bmQNCj4gPiAgICBhc3NpZ24gaXQgZXhwbGljaXRseSB0byBEVF9OVU1BX0RFRkFVTFQuDQo+ID4g
My4gVXBkYXRlIHRoZSB5ZWFyIGluIGNvcHlyaWdodCB0byAyMDIzLg0KPiA+IDQuIERvbid0IG1v
dmUgdGhlIHg4NiBudW1hX2Rpc2FibGVkKCkgYW5kIG1ha2UgQXJtJ3MgbnVtYV9kaXNhYmxlZCgp
DQo+ID4gICAgYSBzdGF0aWMgaW5saW5lIGZ1bmN0aW9uIGZvciAhQ09ORklHX05VTUEuDQo+ID4g
djEgLT4gdjI6DQo+ID4gMS4gVXNlIGFyY2hfbnVtYV9kaXNhYmxlZCB0byByZXBsYWNlIG51bWFf
ZW5hYmxlX3dpdGhfZmlybXdhcmUuDQo+ID4gMi4gSW50cm9kdWNlIGVudW1lcmF0aW9ucyBmb3Ig
ZGV2aWNlIHRyZWUgbnVtYSBzdGF0dXMuDQo+ID4gMy4gVXNlIGNvbW1vbiBudW1hX2Rpc2FibGVk
LCBkcm9wIEFybSB2ZXJzaW9uIG51bWFfZGlzYWJsZWQuDQo+ID4gNC4gSW50cm9kdWNlIGFyY2hf
bnVtYV9zZXR1cCBmb3IgQXJtLg0KPiA+IDUuIFJlbmFtZSBiYWRfc3JhdCB0byBudW1hX2JhZC4N
Cj4gPiA2LiBBZGQgbnVtYV9lbmFibGVfd2l0aF9maXJtd2FyZSBoZWxwZXIuDQo+ID4gNy4gQWRk
IG51bWFfZGlzYWJsZWQgaGVscGVyLg0KPiA+IDguIFJlZmluZSBjb21taXQgbWVzc2FnZS4NCj4g
PiAtLS0NCj4gPiAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL251bWEuaCB8IDE3ICsrKysrKysr
KysrDQo+ID4gIHhlbi9hcmNoL2FybS9udW1hLmMgICAgICAgICAgICAgfCA1MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRp
b25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vbnVtYS5jDQo+IA0K
PiBXaGlsZSBJIHdhcyBDYy1lZCBvbiB0aGlzIG9uZSwgbmVpdGhlciB0aGUgZGlmZnN0YXQgbm9y
IGFueSBwb3NzaWJsZSByZW1hcmtzDQo+IG1ha2UgY2xlYXIgd2hldGhlciBhbnl0aGluZyBpcyBl
eHBlY3RlZCBvZiBtZSBoZXJlLg0KDQpTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4gSSBhbHNvIHRo
b3VnaHQgb2YgdGhpcyB3aGVuIHNlbmRpbmcgdGhlIGVtYWlsIGJ1dA0KZXZlbnR1YWxseSBkZWNp
ZGVkIHRvIGFkZCB5b3UgaW4gdGhlIENjIGFzIHlvdSBtYWRlIHNvbWUgY29ycmVjdCBhbmQgaGVs
cGZ1bA0KY29tbWVudHMgaW4gdjIgWzFdLCBzbyBJIHRoaW5rIGl0IGlzIGEgZ29vZCBtYW5uZXIg
dG8gYWRkIHlvdSBzbyB0aGF0IHlvdSB3b3VsZA0Ka25vdyBhbGwgeW91ciAoY29ycmVjdCkgcmVt
YXJrcyBhcmUgYWRkcmVzc2VkLg0KDQpUaGFua3MgZm9yIHJldmlld2luZyB0aGUgc2VyaWVzLg0K
DQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9wYXRj
aC8yMDIzMDExMDA4NDkzMC4xMDk1MjAzLTMtd2VpLmNoZW5AYXJtLmNvbS8NCg0KS2luZCByZWdh
cmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

