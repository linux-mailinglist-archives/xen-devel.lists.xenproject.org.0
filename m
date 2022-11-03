Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C091618548
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 17:50:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436909.691148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdQO-0005hd-05; Thu, 03 Nov 2022 16:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436909.691148; Thu, 03 Nov 2022 16:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdQN-0005fj-SB; Thu, 03 Nov 2022 16:50:39 +0000
Received: by outflank-mailman (input) for mailman id 436909;
 Thu, 03 Nov 2022 16:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfRY=3D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqdQM-0005fd-DM
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 16:50:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a041df93-5b97-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 17:50:30 +0100 (CET)
Received: from DB8PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:10:100::42)
 by DBBPR08MB6108.eurprd08.prod.outlook.com (2603:10a6:10:1f4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 16:50:26 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::f6) by DB8PR06CA0029.outlook.office365.com
 (2603:10a6:10:100::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 16:50:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:50:26 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Thu, 03 Nov 2022 16:50:25 +0000
Received: from c7e8a47af215.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6D80C10-A0BA-45DA-904F-18AD22829D40.1; 
 Thu, 03 Nov 2022 16:50:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7e8a47af215.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Nov 2022 16:50:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5765.eurprd08.prod.outlook.com (2603:10a6:10:1ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 16:50:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Thu, 3 Nov 2022
 16:50:16 +0000
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
X-Inumbo-ID: a041df93-5b97-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BOhWv29djl2GBgLYIWiBcREszHUCEGInsOxcMWkOOOxBouWllYyr7foWZmaIaP3uyy3BO8yCDqs9Q1cdVIemFtWLKbR2+zSqoTHVQcho1k2LuE2wyFMSH2YeLY3OM94TgeTJJ1zdyC12RyIvZ8+C575Hkm0elAISsOhwrc2YMlqBnwZoLW2/Hh5MOtgsN3qJRpBbrgun5wTMYLh+aerF8GIbIPIG59dThfMS4NXVtRA/VFWmohIdczDlrq7RbEZz0JPYhLEhGgPHloljEQET7F0bsw/Oqr3OL8MJMcQSEjaZ05kUiWJ3Q1NpYUs4XyevVYgiV87an3qGyhEyFq9nTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS9rGZjA096Wtu2NF9SeKTN/1BqZDtC152/38ubEOJQ=;
 b=hWb8AAsZnUiYRUpFvw36wj9lOZ+KzK1PAcEpN622rchKFyQ2KRcm2EZPBlDn5FMviGN1tkRRGe/EK+pav06dkqc5WEVR+QIGxjqCd+Lxe1w6OH7NksLV8KbNgrifNM3ZYqjpos3Z9KL2sh8FwGljqhbBsaEmc1nsdAiTwH2FF7b0JIytQCdi78UL74wTFg41FB7iY+EYoM2le7Q/MvUi0vJx7r+t5jHnEryU/0vCkJF12q6G30kFGlin0q1SqWG2kB4vs9bHVpO1QvQ/g4fIfiibZMmRnd5/p3uQVkRbIAdiKgb4rYJb18nF9XvhwP7c3GYIX3jt3xFkYf0HrHLduw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS9rGZjA096Wtu2NF9SeKTN/1BqZDtC152/38ubEOJQ=;
 b=dKJ97EFlun7wfhMeDgfkzBhx2FncfXxrar35s7mQLnEhzvQFSQRuhpD+DgFXF2iSUad4vPziHnHDRYeQdNFJdQAN049QjwWEEg93Leh5QKuFV5WoV5taiwbz8vlPx6E1tRN5iN/9hIfy7JwSHUPrhttY/B4tWreJN4D3oJLCZPs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2EXT93chYEM5IywsclRGTj7+SdptJVjRIO+GGkHpne08O9soQd0o20UEUo4bpFC4yZAe7lIPho+3NUvExQcqHCcDX7t5N6wNEGXWT7MoB7hi0nW2KSZAHOjgdaPclF2gQoJWo1Vi1Go37ZxrDkpi0ZzrOX3hcV6JqTcLUH/hUv4hheziKCPkLqV+tVI4jId+nAciYqk/jgC5vKJMayBVFNTgTzMcYngtlSJZlwqzRG7kUaMA0hzB6amaFdizN9DcRUza8bVkARBqr2I5DE1RKpWIwQLDojGMpV5A3o8UoiP1oGZwombzV2j2r8fAEdsJakX0dpmBRORB4Q0HTp3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS9rGZjA096Wtu2NF9SeKTN/1BqZDtC152/38ubEOJQ=;
 b=llCgle65p4XTwqOCSnINQ9CMDN/slFoQVI+nv3kO5IjuUI3TmJ169SbiFZRWwJZhH0ISHsA10jXC7Ht2L3R2WuHspzBY7HAqwS+LIkpSferwMb5P3hSkb2XiOAHV3D0ZeikV9bRO/EA4+LJeQOgZZuwFrjiH2m5nS5qthtboriZHW2LCl3EvpJ/c4gLMjhNCb7XFTBju177tOjJtH5/bnKHr6XM1gDb36szzjSmk5lTKEOlQfTgHadDmoJ3kcVKmPch61k9BYfBopAwJfOsiqVLV+P5U0/Xx0LMHGgqrxcxcX7C5tmwlx1+Pnv+CY8pvmXx5GOkQ6jk692okPL0DVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS9rGZjA096Wtu2NF9SeKTN/1BqZDtC152/38ubEOJQ=;
 b=dKJ97EFlun7wfhMeDgfkzBhx2FncfXxrar35s7mQLnEhzvQFSQRuhpD+DgFXF2iSUad4vPziHnHDRYeQdNFJdQAN049QjwWEEg93Leh5QKuFV5WoV5taiwbz8vlPx6E1tRN5iN/9hIfy7JwSHUPrhttY/B4tWreJN4D3oJLCZPs=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH-for-4.17] xen: fix generated code for calling hypercall
 handlers
Thread-Topic: [PATCH-for-4.17] xen: fix generated code for calling hypercall
 handlers
Thread-Index: AQHY76J0n3XAu9trAECn0VzPTwDhaq4taCGAgAAA7RA=
Date: Thu, 3 Nov 2022 16:50:16 +0000
Message-ID:
 <AS8PR08MB799199CD19500B8BEDCDAC8A92389@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221103163631.13145-1-jgross@suse.com>
 <bc48e60a-a048-b954-eb64-53446dab9c32@suse.com>
In-Reply-To: <bc48e60a-a048-b954-eb64-53446dab9c32@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3D862D1BD47001478A7834DA3EEB2122.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBAPR08MB5765:EE_|DBAEUR03FT030:EE_|DBBPR08MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd31ad2-7d5e-42d3-b905-08dabdbb81de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QP46ZhqqBvxGj7Hf79s70RMKImgtknD3rUciRnlL9yNeg+k5WhWehIvxRkFZE9/FMBNdUyot8/sUv7JDpvN8fE5qDwxjQ/qfOwLM1SlgqJFrcoTBSwrJOVmVWlPOs9jXnCgF82W/4DWFAFupwpcev1th2KaYUqrlANa+s1M8rZM+B8hgNoqw984Fjb/dn0U5fitXXvV+LmMG44PXjeDlIe6JXQ+h4f5t4kGJawwAheQdbJlp03luA1HOE4/eIjV7h7JcQjWK470rfPm/pIT+cDg9MxbOYM4guB/4GJ2+JlJXCSmeRGQQKPkaryEodYOWk/n8JcQF4BFZOuPrQubWzQq3wEuh/BiK1ugi4nYW4S/+U+VWy3zkPMx2aUrKVoQ3I1UUNPh/Pa9J+m2ivhelH6yzgm7V33BNqa+rTEn/CuFaNyGk1FqAl9AxR3qldn56g73yxr2mXqAl/4T7eKW5ZRvISXEMGsuLDDekVF5nHJpZk9hDM6o8tuOI9dEKMfl78n9NNP6GUbMRdIJ1SO8RB4HRxoKVxrbY3P6NsmJGMSSRRCQh493vhJRvkY1mfDuLOGj5/0gRlBbjUUvCWAwzzqHqOQQOxbr6dTX7D7/EWoO0kZB14X8Z/Yz6gbbZRl6Xyi0fYzorgwYnkb8tjXKGLe4oAu25h4f9ta/Tem6T3p3gO9ZGeBkJCLvoFzj72VYkZKworulhiMY/LrU6BUFER0SkbYFypnDxYoBGte60NxltfTpR9wZSikj/dsgfbknOQ00QThXynoPwHVoPhxBj/w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(83380400001)(33656002)(38070700005)(8676002)(122000001)(38100700002)(5660300002)(86362001)(41300700001)(66556008)(66446008)(7696005)(52536014)(8936002)(2906002)(55016003)(6506007)(64756008)(9686003)(76116006)(316002)(71200400001)(186003)(26005)(66946007)(54906003)(4326008)(110136005)(478600001)(53546011)(66476007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5765
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	151bdbc2-16a3-4d7f-a0c6-08dabdbb7c21
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A5tvaVsj+B/T66usAAmjqkRnK1HCctJ0Zr9OOtUqqxtyqosY9b+jgxlzFTyjPwzbAJcBsTWsmVCPvycrcZ28KOWHzVZOboYet/KujmjiSLOTzLvcrNxXvK/+gcB9DHPAUAzJaZuxQNejoNx9fx9VSzArj8LnboiNQDfdlatPl20gl0Se2WXk6Ff4ahVlBKbPdQXr2i2ywOjLMg+KAg1Vsg37Ile4j0YUCB6BlJ5aorw01dDlSC81p2BQNWFO+2YyjcGmypJmXE2MGt1CVyYGLtj5D5gY8qXo4mV5VrjAbDPfbUVhnQRggivzvxlO3NqwsS0nK/IqekfVUrsVfk9cLEOaTYGGeXWs0v/BHGUlwT1WasV1VcB3D73hHNZecNeZNBpqbFtBYtWlkOepYl7Qjg2UKFO3CI2BmCz2bgfCieT+nLvCEWr2WJ7TB/tT3s9nH2vW66PSaPRJsTTkafaZiFjscRchL3Kxmv7WGgPqDzWIbXYaP0/ceco1tIt/12Dqeky5bPUqcaa9G30ktCEppjz0M0g6gDJfQiQ0OkABvgUi4sSg+R4IatP0//za2/1aElGZebZV769xD2v/HAhvIzVRxhFBMFc3wPPPEG206QyBTnkV/+etHHNS/cKLcqxc/wbY5+gvf4ecIsTsp8T03O1VSB+0AfH73P1xMj1CVtwhQdiCnLsymK4x9T+/XLS6Co/N+xj2KSKiq7AskYGk4lYEOzGAak97zRfJigyn7fNQc/Ayml4cWNmf4IadCEyloJc7PecOuIbIuXQStk0ELg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(6506007)(186003)(2906002)(336012)(83380400001)(110136005)(40460700003)(53546011)(70586007)(7696005)(82740400003)(70206006)(55016003)(4326008)(52536014)(41300700001)(40480700001)(8676002)(33656002)(82310400005)(47076005)(8936002)(54906003)(478600001)(316002)(5660300002)(26005)(9686003)(86362001)(356005)(81166007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:50:26.1737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd31ad2-7d5e-42d3-b905-08dabdbb81de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6108

SGkgSnVlcmdlbiBhbmQgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SC1mb3ItNC4xN10geGVuOiBmaXggZ2VuZXJhdGVkIGNvZGUgZm9yIGNhbGxpbmcgaHlwZXJjYWxs
DQo+IGhhbmRsZXJzDQo+IA0KPiBPbiAwMy4xMS4yMDIyIDE3OjM2LCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOg0KPiA+IFRoZSBjb2RlIGdlbmVyYXRlZCBmb3IgdGhlIGNhbGxfaGFuZGxlcnNfKigpIG1h
Y3JvcyBuZWVkcyB0byBhdm9pZA0KPiA+IHVuZGVmaW5lZCBiZWhhdmlvciB3aGVuIG11bHRpcGxl
IGhhbmRsZXJzIHNoYXJlIHRoZSBzYW1lIHByaW9yaXR5Lg0KPiA+IFRoZSBpc3N1ZSBpcyB0aGUg
aHlwZXJjYWxsIG51bWJlciBiZWluZyB1bnZlcmlmaWVkIGZlZCBpbnRvIHRoZSBtYWNyb3MNCj4g
PiBhbmQgdGhlbiB1c2VkIHRvIHNldCBhIG1hc2sgdmlhICJtYXNrID0gMVVMTCA8PCA8aHlwZXJj
YWxsLW51bWJlcj4iLg0KPiA+DQo+ID4gQXZvaWQgYSBzaGlmdCBhbW91bnQgb2YgbW9yZSB0aGFu
IDYzIGJ5IHNldHRpbmcgbWFzayB0byB6ZXJvIGluIGNhc2UNCj4gPiB0aGUgaHlwZXJjYWxsIG51
bWJlciBpcyB0b28gbGFyZ2UuDQo+ID4NCj4gPiBGaXhlczogZWNhMWYwMGQwMjI3ICgieGVuOiBn
ZW5lcmF0ZSBoeXBlcmNhbGwgaW50ZXJmYWNlIHJlbGF0ZWQgY29kZSIpDQo+ID4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVu
cnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpXaXRoLi4uDQoNCj4gYWxiZWl0IHByZWZl
cmFibHkgd2l0aCAuLi4NCj4gDQo+ID4gLS0tIGEveGVuL3NjcmlwdHMvZ2VuX2h5cGVyY2FsbC5h
d2sNCj4gPiArKysgYi94ZW4vc2NyaXB0cy9nZW5faHlwZXJjYWxsLmF3aw0KPiA+IEBAIC0yNjMs
NyArMjYzLDcgQEAgRU5EIHsNCj4gPiAgICAgICAgICBwcmludGYoIiNkZWZpbmUgY2FsbF9oYW5k
bGVyc18lcyhudW0sIHJldCwgYTEsIGEyLCBhMywgYTQsIGE1KSBcXFxuIiwNCj4gY2EpOw0KPiA+
ICAgICAgICAgIHByaW50ZigiKHsgXFxcbiIpOw0KPiA+ICAgICAgICAgIGlmIChuZWVkX21hc2sp
DQo+ID4gLSAgICAgICAgICAgIHByaW50ZigiICAgIHVpbnQ2NF90IG1hc2sgPSAxVUxMIDw8IG51
bTsgXFxcbiIpOw0KPiA+ICsgICAgICAgICAgICBwcmludGYoIiAgICB1aW50NjRfdCBtYXNrID0g
KG51bSA+IDYzKSA/IDAgOiAxVUxMIDw8IG51bTsgXFxcbiIpOw0KPiANCj4gLi4uICJudW0iIGFs
c28gcHJvcGVybHkgcGFyZW50aGVzaXplZCAodGhpcyBpcyBwYXJ0IG9mIGEgbWFjcm8gZGVmaW5p
dGlvbg0KPiBpbiB0aGUgb3V0cHV0IGFmdGVyIGFsbCkuIEVhc3kgZW5vdWdoIHRvIHRha2UgY2Fy
ZSBvZiB3aGlsZSBjb21taXR0aW5nLg0KDQouLi5KYW4ncyBjb21tZW50IGZpeGVkIChvciBhZ3Jl
ZW1lbnQgdG8gbGV0IHRoZSBjb21taXR0ZXIgZml4IG9uIGNvbW1pdCkuDQoNCktpbmQgcmVnYXJk
cywNCkhlbnJ5DQoNCj4gDQo+IEphbg0K

