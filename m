Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6006E0E96
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520749.808699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwzc-0006f1-RT; Thu, 13 Apr 2023 13:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520749.808699; Thu, 13 Apr 2023 13:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwzc-0006cE-Ne; Thu, 13 Apr 2023 13:28:04 +0000
Received: by outflank-mailman (input) for mailman id 520749;
 Thu, 13 Apr 2023 13:28:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HU9H=AE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pmwzb-0005qb-KY
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:28:03 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0328be83-d9ff-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 15:28:01 +0200 (CEST)
Received: from DUZPR01CA0163.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::25) by PAWPR08MB9736.eurprd08.prod.outlook.com
 (2603:10a6:102:2ea::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:27:59 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::31) by DUZPR01CA0163.outlook.office365.com
 (2603:10a6:10:4b3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 13:27:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Thu, 13 Apr 2023 13:27:59 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Thu, 13 Apr 2023 13:27:59 +0000
Received: from 4a6a96a6ad27.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07377B3D-DB35-4508-8E0B-4F85C873DCB7.1; 
 Thu, 13 Apr 2023 13:27:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a6a96a6ad27.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 13:27:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM0PR08MB5489.eurprd08.prod.outlook.com (2603:10a6:208:18e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:27:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 13:27:50 +0000
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
X-Inumbo-ID: 0328be83-d9ff-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLiqadu5AG8GrrWoQG7VBbBfiLxOAYVHW7Po1uAAX34=;
 b=vvvlebrTgNSMqrutYMyhDdCQ5capYmxdP07/9l6OTWNM6cU5DLfNPyDUQG9E7MJSOPAf+olQKcUoWVEhv1yuSX/uKQCp91iUINX8JPHHOKfluvlFl3KOZkPn5UCclwXqS0nAFDI7w9Ztlt32GuYivc9pz4aeik1X33A9NFvH46g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 533f5e52ad0b60ef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boEMpuluaGVaTAvrPJx5n8KdGDpNN183GSScEMsBr4LG9PB4lJCN27Yt8oWc79YapkitdqsPbsAQXz6AZ/DkKw4upwpiScqXknDyNPthDrIbRi54niytK75fLKFoNbGZSlg2kjcqWQ/brATSfyAqm9Bogt5078srCf+YVcVQs1rz4CRz2vXhEohZ7HWYKi+BGr/6niC1o9XX5Dk5ueu3VbCyu2uTISQ6CpMoOkg7Vj+eoZyHUsBiIRCB88IMf/igXq9IdgGyvdPxpEeusgoCmoRbNUKC45/MuW7Y+GC37YKWi96gcCMa/oZGU2ANQtME/R15F8p4/YuP/skKlu1L2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLiqadu5AG8GrrWoQG7VBbBfiLxOAYVHW7Po1uAAX34=;
 b=X8WSc6wRcLdqeIIhywXMuxV7ktvy59/k2FqOTrkiI2+qkxafiiiRgyFaxHKlupGKdkb8UEtRTa94DRugOGPp59kYAYljrgFAO6KmBvrbjAD73c/Wh9gaMi3AtqyJE1mrUzVD5/fY/yJEr/OITStk6MRYFLQ0Y/dqc/7FtCLIhq3bo3sLvuhlf/xg6lNhg2+CcTcYvVk69gvAYy19x2Q0y1saig5UCIg+jLlDz3vWq8QWBDFwRQ/oaiz+b3E9OmawpWuF726DubAtV0+GxeJrgNcbMuxCneHcEUSF+xPl/sojTQrM/P7XpYURPJjMLruN8GgkcmY1CJdvaCkBOvkrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLiqadu5AG8GrrWoQG7VBbBfiLxOAYVHW7Po1uAAX34=;
 b=vvvlebrTgNSMqrutYMyhDdCQ5capYmxdP07/9l6OTWNM6cU5DLfNPyDUQG9E7MJSOPAf+olQKcUoWVEhv1yuSX/uKQCp91iUINX8JPHHOKfluvlFl3KOZkPn5UCclwXqS0nAFDI7w9Ztlt32GuYivc9pz4aeik1X33A9NFvH46g=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 04/12] xen/arm: add SVE exception class handling
Thread-Topic: [PATCH v5 04/12] xen/arm: add SVE exception class handling
Thread-Index: AQHZbSQzMQ+GouBmA0y3P+pRTDiAq68pNiQAgAAHA4A=
Date: Thu, 13 Apr 2023 13:27:50 +0000
Message-ID: <E4470524-C5C5-4168-A9C2-A5A594D4C7CF@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-5-luca.fancellu@arm.com>
 <f405fa12-d99b-c07f-0bdd-c49f64f3ffb4@xen.org>
In-Reply-To: <f405fa12-d99b-c07f-0bdd-c49f64f3ffb4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM0PR08MB5489:EE_|DBAEUR03FT041:EE_|PAWPR08MB9736:EE_
X-MS-Office365-Filtering-Correlation-Id: e22c8ac6-a553-472a-1bcf-08db3c22e633
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BWI8JAZCh/TVHVx9JpTphva1KorqYmMY3syXIbBz9to1c/znVrdlRrMNBBMDpCfLAs7QJtJ8uKVt5m09BGcdhOypUq2D84GJdKcJuslECqqXk21QY4rLXWnehIpvr+JreqYoKpfEZ72BkGdbCndkJhgPi6R2cWqDxID/3c/WpvqXwll1VavwMfH8IiHXZBjTznu141WGJ7cJ265HcrY6MI9pXheC9KalO4VikYmhYSxWuHBxAfU3tVDwoe49L/O3jiccyPT62ONV/WhPiQVE8pzd8rNjheI7AaB4icxIqbpgmrqjSgPKjkORGT9NOdVbdG+7PcGjXqhMA9Z3xFGYZRGBHRJaAujQGrxiwfzs3XWCE87VXCdwoetf3uWpeQcLu8n2UWcB5uPOfl7hcIoff71HGuHPn/2zkh+md75jryxLQN514VQrE/Incdr82J+uwDTXD4SGATNOEbRL7ZxZr9hOqhyJfE4O93gGuCrKgGzKpVQATgU+gEJ8gtB7a+y1JA18bhgAki0aVI0yjkI4VrrcDwDT3R+PyKTIGgJ6MOtJLG9aEtvj0QVuVXVYxud1OhO0vzTd040FUaNC0CJv6xb9k+edvxmVil0wEjU1X6mXU3uZ1bZ0uzszFcWRmadg4Twsso2H7UrNbJbIxFmjeg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(38070700005)(478600001)(316002)(54906003)(86362001)(122000001)(66446008)(38100700002)(6916009)(4326008)(66476007)(66946007)(66556008)(64756008)(91956017)(76116006)(33656002)(6486002)(83380400001)(2616005)(41300700001)(2906002)(36756003)(26005)(186003)(71200400001)(6506007)(5660300002)(6512007)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <11F32304C51EBB4B95704D58160D405E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5489
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bdd4a059-81a2-4015-2639-08db3c22e123
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GaxOB+QFhlceuw/3Xp1u+mBb26j90EJZ+zjM3vTZIMOFDP2ngTWV5Fy26CIPKozLsNJQlFIzLtO/qM/2RMq+0KAoGPJsAdTghVKe/3SE0mtk2B9caPS8m6CLx9RoiN04bd7jQfnoNG0EITWa0HZ/vz9+2JeVuyAT+G5kK9lvnb/LfkrFKiuqB7zQx7mZCseaE6vSxga5AueD1s0OuME3mWCpV8bfJ+H7Zw+br0GJLhyXDDhZQJzZmZ+eO17Ihx+lowWz53GuxMF62zwT0dzgfaWQnGt6/QK2HmYfiJNaSVlQ8OzmuGw9t77RyM2F6cxVzzfS9WlK2y0cbE1KhFp98WhNm7S4pSJPiCJHhPacKBWz0DAGp33gepUOjA/YnnHVa3Zhp4AogWIUoQfFsXHfqR7NKuewwf92d9fWltZWefkgfnzCOxBW9PkGjBtQTlQDysbCgIk8IjiNnEnsO0SyT0gZuWOguqVTuoIVvDk/bOt0TZb5fcB4ro+gBGGu7kPmdtUL8m/tOStN2WP94yhu9UKwKrmgPn6wCi2uJ2b6arscOafqUc/86/TJAhOlUSrwQCn48/pkgSCQmeELQWhkWj+JtHPI4t2NHPwh3m0ZvhSXt69EWUmPeivylvB91KEpYDI24Ul3lDu2qzoBmg+BDaJzt+evspTSG+21AibUfFZqPPwlET/UPHqFYlNgk9q3SY5ZWEjGjqnMO8q6XcMUhw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(6486002)(40460700003)(70206006)(70586007)(4326008)(36756003)(2906002)(86362001)(81166007)(82740400003)(356005)(41300700001)(33656002)(5660300002)(82310400005)(8676002)(8936002)(6862004)(316002)(478600001)(40480700001)(54906003)(6512007)(6506007)(26005)(336012)(36860700001)(2616005)(186003)(107886003)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:27:59.1720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e22c8ac6-a553-472a-1bcf-08db3c22e633
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9736

DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3Ry
YXBzLmMNCj4+IEBAIC0yMTYwLDYgKzIxNjAsMTMgQEAgdm9pZCBkb190cmFwX2d1ZXN0X3N5bmMo
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgICBwZXJmY19pbmNyKHRyYXBf
c3lzcmVnKTsNCj4+ICAgICAgICAgIGRvX3N5c3JlZyhyZWdzLCBoc3IpOw0KPj4gICAgICAgICAg
YnJlYWs7DQo+PiArICAgIGNhc2UgSFNSX0VDX1NWRToNCj4+ICsgICAgICAgIEdVRVNUX0JVR19P
TihyZWdzX21vZGVfaXNfMzJiaXQocmVncykpOw0KPj4gKyAgICAgICAgZ3ByaW50ayhYRU5MT0df
V0FSTklORywNCj4+ICsgICAgICAgICAgICAgICAgIkRvbWFpbiBpZCAlZCB0cmllZCB0byB1c2Ug
U1ZFIHdoaWxlIG5vdCBhbGxvd2VkXG4iLA0KPj4gKyAgICAgICAgICAgICAgICBjdXJyZW50LT5k
b21haW4tPmRvbWFpbl9pZCk7DQo+IA0KPiBncHJpbnRrKCkgd2lsbCBhbHJlYWR5IHByaW50IHRo
ZSBkb21haW4vdkNQVSBmb3IgeW91LiBBbHNvLCBpZiB5b3Ugd2FudCB0byBwcmludCBhIGRvbWFp
biBJRCwgdGhlbiB5b3Ugc2hvdWxkIHVzZSAoIiVwZCIsIGQpIHJhdGhlciB0aGFuICgiJWQiLCBk
LT5kb21haW5faWQpLg0KDQpPayBJ4oCZbGwgY2hhbmdlIGl0IHRvOg0KDQpncHJpbnRrKFhFTkxP
R19XQVJOSU5HLCAiRG9tYWluIHRyaWVkIHRvIHVzZSBTVkUgd2hpbGUgbm90IGFsbG93ZWRcbiIp
Ow0KDQo+IA0KPj4gKyAgICAgICAgaW5qZWN0X3VuZGVmX2V4Y2VwdGlvbihyZWdzLCBoc3IpOw0K
Pj4gKyAgICAgICAgYnJlYWs7DQo+PiAgI2VuZGlmDQo+PiAgICAgICAgY2FzZSBIU1JfRUNfSU5T
VFJfQUJPUlRfTE9XRVJfRUw6DQo+PiBAQCAtMjE4OSw2ICsyMTk2LDExIEBAIHZvaWQgZG9fdHJh
cF9oeXBfc3luYyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICAgY2FzZSBIU1Jf
RUNfQlJLOg0KPj4gICAgICAgICAgZG9fdHJhcF9icmsocmVncywgaHNyKTsNCj4+ICAgICAgICAg
IGJyZWFrOw0KPj4gKyAgICBjYXNlIEhTUl9FQ19TVkU6DQo+PiArICAgICAgICAvKiBBbiBTVkUg
ZXhjZXB0aW9uIGlzIGEgYnVnIHNvbWV3aGVyZSBpbiBoeXBlcnZpc29yIGNvZGUgKi8NCj4+ICsg
ICAgICAgIHByaW50aygiU1ZFIHRyYXAgYXQgRUwyLlxuIik7DQo+PiArICAgICAgICBkb191bmV4
cGVjdGVkX3RyYXAoIkh5cGVydmlzb3IiLCByZWdzKTsNCj4gDQo+IEkgdGhpbmsgaXQgd291bGQg
YmUgYmV0dGVyIGlmIHlvdSBwYXNzICJTVkUgdHJhcCBhdCBFTDIiIGFzIGEgc3RyaW5nIHJhdGhl
ciB0aGFuIGFkZGluZyB5b3VyIG93biBwcmludGsgYWJvdmUuDQoNCk9rIEnigJlsbCByZW1vdmUg
dGhlIHByaW50ayBhbmQgZG8ganVzdCBkb191bmV4cGVjdGVkX3RyYXAoIlNWRSB0cmFwIGF0IEVM
MiIsIHJlZ3MpOw0KDQo+IA0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiAgI2VuZGlmDQo+PiAgICAg
IGNhc2UgSFNSX0VDX0RBVEFfQUJPUlRfQ1VSUl9FTDoNCj4+ICAgICAgY2FzZSBIU1JfRUNfSU5T
VFJfQUJPUlRfQ1VSUl9FTDoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3Jh
bGwNCg0KDQo=

