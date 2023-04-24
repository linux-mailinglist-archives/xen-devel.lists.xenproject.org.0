Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87306ECFDD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525405.816577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwkn-0004pu-Hl; Mon, 24 Apr 2023 14:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525405.816577; Mon, 24 Apr 2023 14:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwkn-0004nJ-EN; Mon, 24 Apr 2023 14:01:17 +0000
Received: by outflank-mailman (input) for mailman id 525405;
 Mon, 24 Apr 2023 14:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhGg=AP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pqwkl-0004nC-Th
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:01:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77db332c-e2a8-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 16:01:11 +0200 (CEST)
Received: from DB6PR0201CA0018.eurprd02.prod.outlook.com (2603:10a6:4:3f::28)
 by DB9PR08MB6506.eurprd08.prod.outlook.com (2603:10a6:10:263::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:01:02 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::ef) by DB6PR0201CA0018.outlook.office365.com
 (2603:10a6:4:3f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 14:01:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 14:01:02 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Mon, 24 Apr 2023 14:01:01 +0000
Received: from bab51ad44cc3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD53452C-E9C1-4777-9BD4-7927851D3AF9.1; 
 Mon, 24 Apr 2023 14:00:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bab51ad44cc3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Apr 2023 14:00:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBBPR08MB6041.eurprd08.prod.outlook.com (2603:10a6:10:206::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:00:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 14:00:48 +0000
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
X-Inumbo-ID: 77db332c-e2a8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyVYQEMGXUOQiregtJcDHODeHEeDQ3Nwpg4pQOrM0B0=;
 b=oibUaJv7WL5vACYMyudo8+bniX0atkTprxtueya6OSVfjvlCE9DW+yTmhLCLOh85KSolDvXSBGTrsps+4ZAsXGnkk4FOvuJh+wO91gpT07bkKz6xGXKcFrKGme2pMORasUlm7ERq/jg3LQwZAsZfbYWdPcL7yL81tkVovGaHmoo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e27c4062971cdcf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1d9EPvGvyri9IQhjvR0yMj+Zcs5mRHFbuZBKxbKSKaWQKsF2S0p/C9h2xD2eyd04LKgYTmFr68MDA0CIWxf76M1eb+fvufzUFO/3Ah5+7taeFmXypHJ5Nipf11OV48YRD6WvqRtAglectsolKuG5bdqw8RSV/OZryzbmExOAEJbeQSMa9Br2wlCMf4CrIFkvLlN5NCYbti8LtE3mKfBCoUbT0rdAbeChJM/oPGzjlHaRjPuzLl+rbH5XmNT6Jkv1G9PVeRw/1+XjESKMgs/4LzGFCByWQ/lGK5c3pSTEv51DwEMbxz1Jc4XcB8rDyiBLHQOff4ALpiZ0oG8VeXyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyVYQEMGXUOQiregtJcDHODeHEeDQ3Nwpg4pQOrM0B0=;
 b=VzxOJhMDhwRAz6gAprkepyycMN9/+XkSGOjnbomMaYl++74e/ndMZiYsqgiHKTwG9bkR0WZNVchaOQfgEiFlNrBcq5QHPnpbFrjqKgn/HWUDDBOx8QIakUIxreivM/5sJ8Fq29XYbSvuO/YZHFBfpskytuMgZhXEABTBPV7CpkwLPHdKD5tBt+NzrV02Ee4x2WnVvdOZgzHwKDtRl4CThh/VTDrZaebLl4FzlKAdYkBwuR/U++B0UlGuWbupKCCSCRBvC+G8xQhzJx5gvWsTqWVueKc/Om1IUM3coZVpLA0EjY119UdAq7voo0Y2LIEVW+CYvHdd5ZEsjXNG+Ba+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyVYQEMGXUOQiregtJcDHODeHEeDQ3Nwpg4pQOrM0B0=;
 b=oibUaJv7WL5vACYMyudo8+bniX0atkTprxtueya6OSVfjvlCE9DW+yTmhLCLOh85KSolDvXSBGTrsps+4ZAsXGnkk4FOvuJh+wO91gpT07bkKz6xGXKcFrKGme2pMORasUlm7ERq/jg3LQwZAsZfbYWdPcL7yL81tkVovGaHmoo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZdnKG11PjGcmQuE2MpJrElBiS3686VJGAgAAo1IA=
Date: Mon, 24 Apr 2023 14:00:48 +0000
Message-ID: <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
In-Reply-To: <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBBPR08MB6041:EE_|DBAEUR03FT050:EE_|DB9PR08MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: a46d18fb-4154-4130-0e70-08db44cc569e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6qrXwPvGmzlTRfAu5K/FMSFNvvK7/O51oAz6st969abKYcu38JFd8fbKHdIqGdROd9Mf1OBH1xs70BfAqDQcWuAWBBaPx2GeVJTKwMQLfAdgoVc6UWzpuKKN90PxCSL3Mcvl7SbXDcmr7ZOaDVLGv4585vcCkM3yDDA1akw87dBG5CgFHvXLRslXYhfqwWUC3enLdylApksFEnwI2cQR3KWKhXZORDsjZV6JMk5eNXJGkahEHhiseEVvfnmAMthqIN+4OgMpqmlvWcuc603gC7WIuSQMpRk242+tlgfTuDXBA4BDa/uXNQWvuonPb5Ta1B4z+ujW4pKwd1iXG5fr1orB1pgJ2tdOk1uDB940xBfe9sqzEE6j2wUfOIguJYrcZabx5wi0TsncFDI1gSlWzAT2B/lRzCKLlXhi6cjo6C4bUZ4sRDm0S9sVblb+hCKDQYifXDdpETes10LNR2rArZmTFetc2O/zv4pMzyXBOP/mfE2xoRDLg6+tQsYbgO9WiKDRcEVCmHiT2s1vOFoDYB4FmxKXiwD2PeTSGw/WuHKl2Wbx0w1/9jLeRg1zOj3A9ygQhjwEnDOPN6BByqEFNFfcoeSVl24ap40hYhPMysjTtKYiYmFvP2oT0wj/e8ai6zBzna3aYuhC039hag5XZA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(8676002)(8936002)(5660300002)(38070700005)(41300700001)(33656002)(36756003)(86362001)(6512007)(26005)(186003)(122000001)(71200400001)(53546011)(38100700002)(478600001)(6486002)(83380400001)(2616005)(6506007)(54906003)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C51CB9FF01CA7C42BE48F1BD0A9368CB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6041
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	38f82446-425b-4675-a91d-08db44cc4e9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k2VP5EpSe5MzDIh/4/lg3QgYkkHf3qa1Q/JL4afoPQG0DnwQ4v8jlOcA6e0dkoDp/rPeLUEi7Ghb4gv6ueS1dsnUsgIL38efhpzS9bM3tZoDI/ERLcGGnjWHBAUwILLRUnMv4n6YtEDML1wHi8R//wWnyKoK9KRD+2bxt0yjD/VQBgs7kE+sKSsOjLNLbQS7F27meMJD8XBri0hGYiH3VHozppP6t19O65/EKzUJLX6bm4D5TkM1lgQ/A3XFP367SfDYjWEtnXI2s5HfHJvxbnx6OEHHJAlM1yPRwdTK+jMZ/Ie4Gw6kqWm20nHeG1+8iJdwer/IpLUxWJObPxlYpcqjoItzxy16D8NWfZmvCjsM06YuE1E7pp635WZI6UBGys55o165fr63SozTL3V7e6lPe+73y+BZZ12sIqw0vxwa4/zVIIDS11ujXD2YAoziiWScrsKsIto2Eo7xtkMq+9hWT5XYVjyKGAQuGz4JzmNNdX2gzECr4KuEDWBX5ga0SZsaq5jOnL3u2GNbt/Q5fXpNjDklr+ELoNUq8Ov5ckHLGTBDM4/BGs4uFYWVPIQbRL1WJzsv/jX+5ptBhqh/iWc/MIXW998tv5NG5kNXyFhcYRxBJ2aG00CzwZLiXema14qspvU3FoTLCjC0tcYWs/LnfvIhZ/N7qp47PSfIh4u677f3ypQyp8HO64HHLzVDylfresNzVbdLgFGSyqAWBA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(70206006)(70586007)(316002)(4326008)(6862004)(8676002)(8936002)(5660300002)(41300700001)(33656002)(82310400005)(36756003)(86362001)(40480700001)(356005)(6512007)(26005)(186003)(81166007)(53546011)(478600001)(6486002)(36860700001)(83380400001)(47076005)(2616005)(336012)(6506007)(82740400003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 14:01:02.0117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a46d18fb-4154-4130-0e70-08db44cc569e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6506

SGkgSmFuLA0KDQo+IE9uIDI0IEFwciAyMDIzLCBhdCAxMjozNCwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI0LjA0LjIwMjMgMDg6MDIsIEx1Y2EgRmFu
Y2VsbHUgd3JvdGU6DQo+PiBAQCAtMzAsOSArMzcsMTEgQEAgaW50IHN2ZV9jb250ZXh0X2luaXQo
c3RydWN0IHZjcHUgKnYpOw0KPj4gdm9pZCBzdmVfY29udGV4dF9mcmVlKHN0cnVjdCB2Y3B1ICp2
KTsNCj4+IHZvaWQgc3ZlX3NhdmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpOw0KPj4gdm9pZCBzdmVf
cmVzdG9yZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdik7DQo+PiArYm9vbCBzdmVfZG9tY3RsX3ZsX3Bh
cmFtKGludCB2YWwsIHVuc2lnbmVkIGludCAqb3V0KTsNCj4+IA0KPj4gI2Vsc2UgLyogIUNPTkZJ
R19BUk02NF9TVkUgKi8NCj4+IA0KPj4gKyNkZWZpbmUgb3B0X2RvbTBfc3ZlICAgICAoMCkNCj4+
ICNkZWZpbmUgaXNfc3ZlX2RvbWFpbihkKSAoMCkNCj4+IA0KPj4gc3RhdGljIGlubGluZSByZWdp
c3Rlcl90IGNvbXB1dGVfbWF4X3pjcih2b2lkKQ0KPj4gQEAgLTU5LDYgKzY4LDExIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBzdmVfY29udGV4dF9mcmVlKHN0cnVjdCB2Y3B1ICp2KSB7fQ0KPj4gc3Rh
dGljIGlubGluZSB2b2lkIHN2ZV9zYXZlX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KSB7fQ0KPj4gc3Rh
dGljIGlubGluZSB2b2lkIHN2ZV9yZXN0b3JlX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KSB7fQ0KPj4g
DQo+PiArc3RhdGljIGlubGluZSBib29sIHN2ZV9kb21jdGxfdmxfcGFyYW0oaW50IHZhbCwgdW5z
aWduZWQgaW50ICpvdXQpDQo+PiArew0KPj4gKyAgICByZXR1cm4gZmFsc2U7DQo+PiArfQ0KPiAN
Cj4gT25jZSBhZ2FpbiBJIGRvbid0IHNlZSB0aGUgbmVlZCBmb3IgdGhpcyBzdHViOiBvcHRfZG9t
MF9zdmUgaXMgI2RlZmluZS1kDQo+IHRvIHBsYWluIHplcm8gd2hlbiAhQVJNNjRfU1ZFLCBzbyB0
aGUgb25seSBjYWxsIHNpdGUgbWVyZWx5IHJlcXVpcmVzIGENCj4gdmlzaWJsZSBkZWNsYXJhdGlv
biwgYW5kIERDRSB3aWxsIHRha2UgY2FyZSBvZiBlbGltaW5hdGluZyB0aGUgYWN0dWFsIGNhbGwu
DQoNCknigJl2ZSB0cmllZCB0byBkbyB0aGF0LCBJ4oCZdmUgcHV0IHRoZSBkZWNsYXJhdGlvbiBv
dXRzaWRlIHRoZSBpZmRlZiBzbyB0aGF0IGl0IHdhcyBhbHdheXMgaW5jbHVkZWQNCmFuZCBJIHJl
bW92ZWQgdGhlIHN0dWIsIGJ1dCBJIGdvdCBlcnJvcnMgb24gY29tcGlsYXRpb24gYmVjYXVzZSBv
ZiB1bmRlZmluZWQgZnVuY3Rpb24uDQpGb3IgdGhhdCByZWFzb24gIEkgbGVmdCB0aGF0IGNoYW5n
ZSBvdXQuDQoNCj4gDQo+PiAtLS0gYS94ZW4vY29tbW9uL2tlcm5lbC5jDQo+PiArKysgYi94ZW4v
Y29tbW9uL2tlcm5lbC5jDQo+PiBAQCAtMzE0LDYgKzMxNCwzMSBAQCBpbnQgcGFyc2VfYm9vbGVh
bihjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICpzLCBjb25zdCBjaGFyICplKQ0KPj4gICAg
IHJldHVybiAtMTsNCj4+IH0NCj4+IA0KPj4gK2ludCBfX2luaXQgcGFyc2Vfc2lnbmVkX2ludGVn
ZXIoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqcywgY29uc3QgY2hhciAqZSwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvbmcgbG9uZyAqdmFsKQ0KPj4gK3sNCj4+
ICsgICAgc2l6ZV90IHNsZW4sIG5sZW47DQo+PiArICAgIGNvbnN0IGNoYXIgKnN0cjsNCj4+ICsg
ICAgbG9uZyBsb25nIHB2YWw7DQo+PiArDQo+PiArICAgIHNsZW4gPSBlID8gKHsgQVNTRVJUKGUg
Pj0gcyk7IGUgLSBzOyB9KSA6IHN0cmxlbihzKTsNCj4gDQo+IEFzIHBlciB0aGlzICJlIiBtYXkg
Y29tZSBpbiBhcyBOVUxMLCBtZWFuaW5nIHRoYXQgLi4uDQo+IA0KPj4gKyAgICBubGVuID0gc3Ry
bGVuKG5hbWUpOw0KPj4gKw0KPj4gKyAgICAvKiBDaGVjayB0aGF0IHRoaXMgaXMgdGhlIG5hbWUg
d2UncmUgbG9va2luZyBmb3IgYW5kIGEgdmFsdWUgd2FzIHByb3ZpZGVkICovDQo+PiArICAgIGlm
ICggKHNsZW4gPD0gbmxlbikgfHwgc3RybmNtcChzLCBuYW1lLCBubGVuKSB8fCAoc1tubGVuXSAh
PSAnPScpICkNCj4+ICsgICAgICAgIHJldHVybiAtMTsNCj4+ICsNCj4+ICsgICAgcHZhbCA9IHNp
bXBsZV9zdHJ0b2xsKCZzW25sZW4gKyAxXSwgJnN0ciwgMCk7DQo+PiArDQo+PiArICAgIC8qIE51
bWJlciBub3QgcmVjb2duaXNlZCAqLw0KPj4gKyAgICBpZiAoIHN0ciAhPSBlICkNCj4+ICsgICAg
ICAgIHJldHVybiAtMjsNCj4gDQo+IC4uLiB0aGlzIGlzIGFsd2F5cyBnb2luZyB0byBsZWFkIHRv
IGZhaWx1cmUgaW4gdGhhdCBjYXNlLiAoSSBndWVzcyBJIGNvdWxkDQo+IGhhdmUgc3BvdHRlZCB0
aGlzIGVhcmxpZXIsIHNvcnJ5LikNCj4gDQo+IEFzIGEgbml0LCBJJ2QgYWxzbyBhcHByZWNpYXRl
IGlmIHN0eWxlIGhlcmUgKHBhcmVudGhlc2l6YXRpb24gaW4gcGFydGljdWxhcikNCj4gY291bGQg
bWF0Y2ggdGhhdCBvZiBwYXJzZV9ib29sZWFuKCksIHdoaWNoIGRvZXNuJ3QgcHV0IHBhcmVudGhl
c2VzIGFyb3VuZA0KPiB0aGUgb3BlcmFuZHMgb2YgY29tcGFyaXNvbiBvcGVyYXRvcnMgKGEgZmV3
IGxpbmVzIHVwIGZyb20gaGVyZSkuIFdpdGggdGhlDQo+IG90aGVyIGZ1bmN0aW9uIGluIG1pbmQs
IEknbSB0aGVuIG5vdCBnb2luZyB0byBwaWNrIG9uIHRoZSBzZWVtaW5nbHkNCj4gcmVkdW5kYW50
ICh3aXRoIHRoZSBzdWJzZXF1ZW50IHN0cm5jbXAoKSkgInNsZW4gPD0gbmxlbiIsIHdoaWNoIGhh
cyBhbg0KPiBlcXVpdmFsZW50IHRoZXJlIGFzIHdlbGwuDQoNCllvdSBhcmUgcmlnaHQsIGRvIHlv
dSB0aGluayB0aGlzIHdpbGwgYmUgb2s6DQoNCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2tlcm5l
bC5jIGIveGVuL2NvbW1vbi9rZXJuZWwuYw0KaW5kZXggYjY3ZDkwNTZmZWMzLi43Y2QwMGE0Yzk5
OWEgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL2tlcm5lbC5jDQorKysgYi94ZW4vY29tbW9uL2tl
cm5lbC5jDQpAQCAtMzI0LDExICszMjQsMTQgQEAgaW50IF9faW5pdCBwYXJzZV9zaWduZWRfaW50
ZWdlcihjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICpzLCBjb25zdCBjaGFyICplLA0KICAg
ICBzbGVuID0gZSA/ICh7IEFTU0VSVChlID49IHMpOyBlIC0gczsgfSkgOiBzdHJsZW4ocyk7DQog
ICAgIG5sZW4gPSBzdHJsZW4obmFtZSk7DQogDQorICAgIGlmICggIWUgKQ0KKyAgICAgICAgZSA9
IHMgKyBzbGVuOw0KKw0KICAgICAvKiBDaGVjayB0aGF0IHRoaXMgaXMgdGhlIG5hbWUgd2UncmUg
bG9va2luZyBmb3IgYW5kIGEgdmFsdWUgd2FzIHByb3ZpZGVkICovDQotICAgIGlmICggKHNsZW4g
PD0gbmxlbikgfHwgc3RybmNtcChzLCBuYW1lLCBubGVuKSB8fCAoc1tubGVuXSAhPSAnPScpICkN
CisgICAgaWYgKCBzbGVuIDw9IG5sZW4gfHwgc3RybmNtcChzLCBuYW1lLCBubGVuKSB8fCBzW25s
ZW5dICE9ICc9JyApDQogICAgICAgICByZXR1cm4gLTE7DQogDQotICAgIHB2YWwgPSBzaW1wbGVf
c3RydG9sbCgmc1tubGVuICsgMV0sICZzdHIsIDApOw0KKyAgICBwdmFsID0gc2ltcGxlX3N0cnRv
bGwoJnNbbmxlbiArIDFdLCAmc3RyLCAxMCk7DQogDQogICAgIC8qIE51bWJlciBub3QgcmVjb2du
aXNlZCAqLw0KICAgICBpZiAoIHN0ciAhPSBlICkNCg0KDQpQbGVhc2Ugbm90ZSB0aGF0IEnigJl2
ZSBhbHNvIGluY2x1ZGVkIHlvdXIgY29tbWVudCBhYm91dCB0aGUgYmFzZSwgd2hpY2ggSSBmb3Jn
b3QgdG8gYWRkLCBhcG9sb2dpZXMgZm9yIHRoYXQuDQoNCnNsZW4gPD0gbmxlbiBkb2VzbuKAmXQg
c2VlbXMgcmVkdW5kYW50IHRvIG1lLCBJIGhhdmUgdGhhdCBiZWNhdXNlIEnigJltIGFjY2Vzc2lu
ZyBzW25sZW5dIGFuZCBJIHdvdWxkIGxpa2UNCnRoZSBzdHJpbmcgcyB0byBiZSBhdCBsZWFzdCA+
IG5sZW4NCg0KDQoNCj4gDQo+IEphbg0KDQo=

