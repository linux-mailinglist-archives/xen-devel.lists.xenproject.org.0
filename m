Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0070B90B
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 11:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537835.837396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11xR-0005pg-JA; Mon, 22 May 2023 09:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537835.837396; Mon, 22 May 2023 09:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11xR-0005mP-FC; Mon, 22 May 2023 09:36:01 +0000
Received: by outflank-mailman (input) for mailman id 537835;
 Mon, 22 May 2023 09:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvIk=BL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q11xP-0005mJ-6K
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 09:35:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bf9847d-f884-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 11:35:54 +0200 (CEST)
Received: from DUZPR01CA0163.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::25) by PAWPR08MB10260.eurprd08.prod.outlook.com
 (2603:10a6:102:369::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 09:35:45 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::bc) by DUZPR01CA0163.outlook.office365.com
 (2603:10a6:10:4b3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 09:35:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.13 via Frontend Transport; Mon, 22 May 2023 09:35:44 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Mon, 22 May 2023 09:35:44 +0000
Received: from b44a5fb236c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDDE97EF-65C3-4138-BDED-FF08143BA998.1; 
 Mon, 22 May 2023 09:35:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b44a5fb236c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 May 2023 09:35:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6740.eurprd08.prod.outlook.com (2603:10a6:20b:305::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 09:35:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 09:35:35 +0000
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
X-Inumbo-ID: 0bf9847d-f884-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAnErE0iPmulMM7K+O4tVeGFFSPj/8XYBKtQ54e1JQU=;
 b=TXhrWxq6FumM0/Mb6lFTkYqIaWFFJLLW2dMI+NCoT10fUAaKW2GsOamj3BledkvfNZlnNr//M6tSBJz9JR4oNZcMMdJWG8MLfj3RGGGgyTJpRWQOy56mjwrGCcnBzGZk7VIohtysKq96Y1VBpDR9LD04UmOjEbZJ1FXTFJ99pQs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 44823c885a601ae7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g79McFVoyUbTqYtvJIXDuYnnlIvtKd5tuBT2R6RwE8Qhe/8cGIIKCtiVi9w0ohcWSMQhsjTeutc9kMh65yUA0Hzp/c0qTWl8/P5g1Wsm9RZr2dLXhEpA6UgTs1g8Q9vIN++8OpC7PHnQcUAOS4TyBB874Gdgte1kR/pH0ME+C6XTUMKdivBVMuk53bpHT9DM+hpfGF1ske0zsn0al9yZUU420X74d/rrNSzrFv9YlkwKefkh7OVgiCK8arAn010N1nJtq8O6fgR8lb43u3TjD7arvu7I/AFXxGNAtUmxpz+vqfRLcE1XTYZy0h34vva2cOBTyIW5I0pkYSy3fNh6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAnErE0iPmulMM7K+O4tVeGFFSPj/8XYBKtQ54e1JQU=;
 b=Er+3HxUf2+oy7OK0tcISmp9UAKXe8GIr13mJMV3ni+ol7nknO7exEkpn/m3db9ViUZy1yAGmdMzlHTx63s68iAGJ9/fD9LAzctzaH9esi/fF8Bq35sCRIxx/6dTWfm31OhpVnfLsb+pkXcJJrzjst+6EBB60uxcZpeZb5957t7lEVeKZ1AfGVbT7fvkSpizYJKajzl7Bfs144yf7KMCg+jz78ZKwhT65g8uk9aw0XC2S0Yu2c/Y1c0HgHb7UFaVhA6gyKzkgDeuZuddiRDRy6/PDpkVDiM39cDp2Woa5syhPVZyRJ+CSA2MWp2PkDp4ZI51wuT7TGKUtV9gO8bcnOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAnErE0iPmulMM7K+O4tVeGFFSPj/8XYBKtQ54e1JQU=;
 b=TXhrWxq6FumM0/Mb6lFTkYqIaWFFJLLW2dMI+NCoT10fUAaKW2GsOamj3BledkvfNZlnNr//M6tSBJz9JR4oNZcMMdJWG8MLfj3RGGGgyTJpRWQOy56mjwrGCcnBzGZk7VIohtysKq96Y1VBpDR9LD04UmOjEbZJ1FXTFJ99pQs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Thread-Topic: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Thread-Index:
 AQHZdnKBJmFHv6Wq8kSjvXctD+zlI69f6zCAgAHjioCAAAXEgIAEQtyAgAAOngCAAA0iAIAAAXeA
Date: Mon, 22 May 2023 09:35:34 +0000
Message-ID: <4A4AB910-A369-4906-A4FE-7246CFB60456@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-2-luca.fancellu@arm.com>
 <1fb3c4a2-8bc7-45e4-7ccf-803157f1b3b1@xen.org>
 <86D7B5C8-2671-4359-A48D-E7D52B06565C@arm.com>
 <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
 <a21f2917-052a-ddb5-3de5-1ea58cb55252@suse.com>
 <8A5D1D62-0FCF-4A2F-8B09-D216002D168C@arm.com>
 <5fb23d0c-dbab-58c3-71d4-f3d5254249fc@xen.org>
In-Reply-To: <5fb23d0c-dbab-58c3-71d4-f3d5254249fc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6740:EE_|DBAEUR03FT027:EE_|PAWPR08MB10260:EE_
X-MS-Office365-Filtering-Correlation-Id: a76eb7f4-5b20-48c1-824b-08db5aa7ea96
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Iqt9ZldI8Nc6TPNczmW1Yry5M7Ei1tk3QI8Mgzn7xDhOoi7MYhVpLm44KGPGOJX8tCqqzhGLodeZmWZNBE7O8V9mIBym8ifwEzXPlpiP2CpX8j0ZyKqKnXqgGJjJp9MYN0MiW441SAsKSGPKkX3nuQlrUA++g6q5DmiEvlxb7zTsElYoc7K47UlkJrX1UGobLL+qrtHGqmjci4zq4w8L9TKHhhpcXcQOPZBnmx/j+z0yQ6PJoAVqdEfi86Wch0gmJuIRB1u+evqYJjKYQIVcnNdPlaEomzCSExzUCxz5B7xmkIsGJccnUyatVwmm5gzPvrRfs69GzLEK7hmzkV4P/80oWTb2Ks8Nrz1VaupVQjM6FMD71KpKe4+1BgaD2ka19Xhae7uSL0T5kXJnQIz5dFHY3jT9x85xroeXUfpVy/5zGOqAbAI7faoPWuEpsTuwi5yj+j3O4yNcJ8Q2hcidmPN/J+iu4XADUCxnYgdaZHTVLO/sf6VFkeIlUIyQ2Hbobx53NjBYspk7E1AgsTKZ2Z+KT/ublU4N3KkQExif+AX4zB4vUxkUdIqiiV2N8E0hEChuDe8RvxIpunhHv0d5ZvjbW2ifiA5JYOZNeEPQHp60Gh5meCybhu2uwPqHnM1fViCY77/aYmI9o9bl1FKifw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199021)(71200400001)(2906002)(6486002)(38070700005)(91956017)(6916009)(66556008)(66946007)(76116006)(66476007)(54906003)(64756008)(66446008)(478600001)(2616005)(53546011)(122000001)(38100700002)(8676002)(8936002)(36756003)(316002)(4326008)(41300700001)(5660300002)(33656002)(86362001)(6506007)(83380400001)(26005)(186003)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B412DFC82C802F4DA7CBAF364E7A5745@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6740
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53c145a6-2d20-4bcf-2471-08db5aa7e4ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SbyW3J0BaADCLBwmwhZkYQCdYxyNdher/hqPG4TngltRzPBOGCZLDdbWj+wrP2b/Ju5QbRBQRSY7bzLuQCvHIa9ZPAwcwmdqsUywJLqFR7wegR4GL+Jqp+rtvNNtm/vU+blxID20xXqSnB8bdERixReuOXKz6uVPQa6IJaeIkjKeSZ246LbQk2Tpc4vp9iESJiy3w3LDaqm1oKVeWAwuCxLlpB5rKrp4Y2csa6lOZUc3e7WLrrRvZw0KD8PbTgBIQxzDcl/r5X0Sl1gB3P6iMbxNet3FPeoQq8bSsFZr4c4SHNst/D8z0LIDeOSP/gsHpZuB0Wto836toyPBWQX9VGe7q8qgJ1Z463Vtdg3eY/jECreLgfJ1ddPBaO2JgugxSVF0DA1qlsXFjvLvpZyGs7NCrVOtNr/+hft6vEQVp0SbFqpTOsfFZ3SzOacg7Pe76sbIjEk/qgTj0tySsUE/qO2I62GOFVMVcRtAmB/78GfBoJosych7oqqszBVlrUFqELNwzrq+G9Cf8l/8EJG5JWUQZ2mOR/Db3/wGbx7DN5fIPnWojaw3Llp9EgUOM7nhg5Ck+k76WCjyYiKLmbijaiKMO6BC43g9/0hS07Imu1w/JjMdDX8dexww1FDGJNjhu1b1iG4/FJvBdsqoSNrENGfYlbNueT13yQdgshfj5m0e04sBtr6m7QSiPsAprfJPPqFirLbsyDWRTa448X+bnJaDRQPNMQug9zXESwx7xyAlrY94PftwCU+1iL4maOUF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(2906002)(5660300002)(83380400001)(8676002)(8936002)(6862004)(82310400005)(36756003)(70586007)(70206006)(4326008)(54906003)(316002)(6486002)(478600001)(41300700001)(40480700001)(33656002)(86362001)(336012)(26005)(2616005)(107886003)(356005)(81166007)(82740400003)(36860700001)(47076005)(186003)(6512007)(6506007)(53546011)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 09:35:44.4827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a76eb7f4-5b20-48c1-824b-08db5aa7ea96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10260

DQoNCj4gT24gMjIgTWF5IDIwMjMsIGF0IDEwOjMwLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMjIvMDUvMjAyMyAwOTo0MywgTHVjYSBG
YW5jZWxsdSB3cm90ZToNCj4+PiBPbiAyMiBNYXkgMjAyMywgYXQgMDg6NTAsIEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMTkuMDUuMjAyMyAxNjo0
NiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBPbiAxOS8wNS8yMDIzIDE1OjI2LCBMdWNhIEZh
bmNlbGx1IHdyb3RlOg0KPj4+Pj4+IE9uIDE4IE1heSAyMDIzLCBhdCAxMDozNSwgSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+ICsvKg0KPj4+Pj4+PiArICogQXJt
IFNWRSBmZWF0dXJlIGNvZGUNCj4+Pj4+Pj4gKyAqDQo+Pj4+Pj4+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMjIgQVJNIEx0ZC4NCj4+Pj4+Pj4gKyAqLw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsjaW5jbHVk
ZSA8eGVuL3R5cGVzLmg+DQo+Pj4+Pj4+ICsjaW5jbHVkZSA8YXNtL2FybTY0L3N2ZS5oPg0KPj4+
Pj4+PiArI2luY2x1ZGUgPGFzbS9hcm02NC9zeXNyZWdzLmg+DQo+Pj4+Pj4+ICsjaW5jbHVkZSA8
YXNtL3Byb2Nlc3Nvci5oPg0KPj4+Pj4+PiArI2luY2x1ZGUgPGFzbS9zeXN0ZW0uaD4NCj4+Pj4+
Pj4gKw0KPj4+Pj4+PiArZXh0ZXJuIHVuc2lnbmVkIGludCBzdmVfZ2V0X2h3X3ZsKHZvaWQpOw0K
Pj4+Pj4+PiArDQo+Pj4+Pj4+ICtyZWdpc3Rlcl90IGNvbXB1dGVfbWF4X3pjcih2b2lkKQ0KPj4+
Pj4+PiArew0KPj4+Pj4+PiArICAgIHJlZ2lzdGVyX3QgY3B0cl9iaXRzID0gZ2V0X2RlZmF1bHRf
Y3B0cl9mbGFncygpOw0KPj4+Pj4+PiArICAgIHJlZ2lzdGVyX3QgemNyID0gdmxfdG9femNyKFNW
RV9WTF9NQVhfQklUUyk7DQo+Pj4+Pj4+ICsgICAgdW5zaWduZWQgaW50IGh3X3ZsOw0KPj4+Pj4+
PiArDQo+Pj4+Pj4+ICsgICAgLyogUmVtb3ZlIHRyYXAgZm9yIFNWRSByZXNvdXJjZXMgKi8NCj4+
Pj4+Pj4gKyAgICBXUklURV9TWVNSRUcoY3B0cl9iaXRzICYgfkhDUFRSX0NQKDgpLCBDUFRSX0VM
Mik7DQo+Pj4+Pj4+ICsgICAgaXNiKCk7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICAvKg0KPj4+
Pj4+PiArICAgICAqIFNldCB0aGUgbWF4aW11bSBTVkUgdmVjdG9yIGxlbmd0aCwgZG9pbmcgdGhh
dCB3ZSB3aWxsIGtub3cgdGhlIFZMDQo+Pj4+Pj4+ICsgICAgICogc3VwcG9ydGVkIGJ5IHRoZSBw
bGF0Zm9ybSwgY2FsbGluZyBzdmVfZ2V0X2h3X3ZsKCkNCj4+Pj4+Pj4gKyAgICAgKi8NCj4+Pj4+
Pj4gKyAgICBXUklURV9TWVNSRUcoemNyLCBaQ1JfRUwyKTsNCj4+Pj4+PiANCj4+Pj4+PiBGcm9t
IG15IHJlYWRpbmcgb2YgdGhlIEFybSAoRDE5LTYzMzEsIEFSTSBEREkgMDQ4N0ouYSksIGEgZGly
ZWN0IHdyaXRlIHRvIGEgc3lzdGVtIHJlZ2lzdGVyIHdvdWxkIG5lZWQgdG8gYmUgZm9sbG93ZWQg
YnkgYW4gY29udGV4dCBzeW5jaHJvbml6YXRpb24gZXZlbnQgKGUuZy4gaXNiKCkpIGJlZm9yZSB0
aGUgc29mdHdhcmUgY2FuIHJlbHkgb24gdGhlIHZhbHVlLg0KPj4+Pj4+IA0KPj4+Pj4+IEluIHRo
aXMgc2l0dWF0aW9uLCBBRkFJQ1QsIHRoZSBpbnN0cnVjaXRvbiBpbiBzdmVfZ2V0X2h3X3ZsKCkg
d2lsbCB1c2UgdGhlIGNvbnRlbnQgb2YgWkNSX0VMMi4gU28gZG9uJ3Qgd2UgbmVlZCBhbiBJU0Io
KSBoZXJlPw0KPj4+Pj4gDQo+Pj4+PiBGcm9tIHdoYXQgSeKAmXZlIHJlYWQgaW4gdGhlIG1hbnVh
bCBmb3IgWkNSX0VMeDoNCj4+Pj4+IA0KPj4+Pj4gQW4gaW5kaXJlY3QgcmVhZCBvZiBaQ1JfRUwy
LkxFTiBhcHBlYXJzIHRvIG9jY3VyIGluIHByb2dyYW0gb3JkZXIgcmVsYXRpdmUgdG8gYSBkaXJl
Y3Qgd3JpdGUgb2YNCj4+Pj4+IHRoZSBzYW1lIHJlZ2lzdGVyLCB3aXRob3V0IHRoZSBuZWVkIGZv
ciBleHBsaWNpdCBzeW5jaHJvbml6YXRpb24NCj4+Pj4+IA0KPj4+Pj4gSeKAmXZlIGludGVycHJl
dGVkIGl0IGFzIOKAnHRoZXJlIGlzIG5vIG5lZWQgdG8gc3luYyBiZWZvcmUgd3JpdGXigJ0gYW5k
IEnigJl2ZSBsb29rZWQgaW50byBMaW51eCBhbmQgaXQgZG9lcyBub3QNCj4+Pj4+IEFwcGVhciBh
bnkgc3luY2hyb25pc2F0aW9uIG1lY2hhbmlzbSBhZnRlciBhIHdyaXRlIHRvIHRoYXQgcmVnaXN0
ZXIsIGJ1dCBpZiBJIGFtIHdyb25nIEkgY2FuIGZvciBzdXJlDQo+Pj4+PiBhZGQgYW4gaXNiIGlm
IHlvdSBwcmVmZXIuDQo+Pj4+IA0KPj4+PiBBaCwgSSB3YXMgcmVhZGluZyB0aGUgZ2VuZXJpYyBz
ZWN0aW9uIGFib3V0IHN5bmNocm9uaXphdGlvbiBhbmQgZGlkbid0DQo+Pj4+IHJlYWxpemUgdGhl
cmUgd2FzIGEgcGFyYWdyYXBoIGluIHRoZSBaQ1JfRUwyIHNlY3Rpb24gYXMgd2VsbC4NCj4+Pj4g
DQo+Pj4+IFJlYWRpbmcgdGhlIG5ldyBzZWN0aW9uLCBJIGFncmVlIHdpdGggeW91ciB1bmRlcnN0
YW5kaW5nLiBUaGUgaXNiKCkgaXMNCj4+Pj4gbm90IG5lY2Vzc2FyeS4NCj4+PiANCj4+PiBBbmQg
UkRWTCBjb3VudHMgYXMgYW4gImluZGlyZWN0IHJlYWQiPyBJJ20gcHJldHR5IHN1cmUgIm5vcm1h
bCIgU1ZFIGluc24NCj4+PiB1c2UgaXMgZmFsbGluZyBpbiB0aGF0IGNhdGVnb3J5LCBidXQgUkRW
TCBtaWdodCBhbHNvIGJlIHZpZXdlZCBhcyBtb3JlDQo+Pj4gc2ltaWxhciB0byBNUlMgaW4gdGhp
cyByZWdhcmQ/IFdoaWxlIHRoZSBjb25zdHJ1Y3QgQ3VycmVudFZMIGlzIHVzZWQgaW4NCj4+PiBl
aXRoZXIgY2FzZSwgSSdtIHN0aWxsIG5vdCBzdXJlIHRoaXMgZ29lcyB3aXRob3V0IHNheWluZy4N
Cj4+IEhpIEphbiwNCj4+IExvb2tpbmcgaW50byB0aGUgTGludXggY29kZSwgaW4gZnVuY3Rpb24g
dmVjX3Byb2JlX3ZxcyguLi4pIGluIGFyY2gvYXJtNjQva2VybmVsL2Zwc2ltZC5jLA0KPj4gWkNS
X0VMMSBpcyB3cml0dGVuLCB3aXRob3V0IHN5bmNocm9uaXNhdGlvbiwgYW5kIGFmdGVyd2FyZHMg
UkRWTCBpcyB1c2VkLg0KPiANCj4gWW91IGFyZSBtYWtpbmcgdGhlIGFzc3VtcHRpb24gdGhhdCB0
aGUgTGludXggY29kZSBpcyBjb3JyZWN0LiBJdCBpcyBtb3N0bHkgbGlrZWx5IHRoZSBjYXNlLCBi
dXQgaW4gZ2VuZXJhbCBpdCBpcyBiZXN0IHRvIGp1c3RpZnkgYmFycmllcnMgYmFzZWQgb24gdGhl
IEFybSBBcm0gYmVjYXVzZSBpdCBpcyBhdXRob3JpdGF0aXZlLg0KPiANCj4gSW4gdGhpcyBjYXNl
LCB0aGUgQXJtIEFybSBpcyBwcmV0dHkgY2xlYXIgb24gdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBp
bmRpcmVjdCByZWFkIGFuZCBkaXJlY3QgcmVhZCAoc2VlIEQxOS02MzMzMyBBUk0gRERJIDA0ODdK
LkEpLiBUaGUgbGF0dGVyIG9ubHkgcmVmZXJzIHRvIHVzZSBvZiB0aGUgaW5zdHJ1Y3Rpb24gb2Yg
TVJTLiBSRFZMIGlzIGl0cyBvd24gaW5zdHJ1Y3Rpb24gYW5kIHRoZXJlZm9yZSB0aGlzIGlzIGFu
IGluZGlyZWN0IHJlYWQuDQoNClllcyB5b3UgYXJlIHJpZ2h0DQoNCj4gDQo+IENoZWVycywNCj4g
DQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0KDQo=

