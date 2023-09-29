Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD77B2CF1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 09:17:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610187.949496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm7jV-00048G-2f; Fri, 29 Sep 2023 07:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610187.949496; Fri, 29 Sep 2023 07:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm7jU-00046M-Vz; Fri, 29 Sep 2023 07:16:16 +0000
Received: by outflank-mailman (input) for mailman id 610187;
 Fri, 29 Sep 2023 07:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGVc=FN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qm7jT-00046G-7y
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 07:16:15 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c12f506-5e98-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 09:16:03 +0200 (CEST)
Received: from AS9P194CA0014.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::25)
 by GV2PR08MB8341.eurprd08.prod.outlook.com (2603:10a6:150:bb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Fri, 29 Sep
 2023 07:15:58 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::a4) by AS9P194CA0014.outlook.office365.com
 (2603:10a6:20b:46d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 07:15:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.24 via Frontend Transport; Fri, 29 Sep 2023 07:15:57 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Fri, 29 Sep 2023 07:15:57 +0000
Received: from 6d2641f2d434.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B604A36-6310-48C6-8CBE-917DC0707012.1; 
 Fri, 29 Sep 2023 07:15:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d2641f2d434.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 07:15:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM8PR08MB5825.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 07:15:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 07:15:48 +0000
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
X-Inumbo-ID: 0c12f506-5e98-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1EtuaFbmtSfEpDKmW8UsU7lftlaVd1qVeGFCMqybMQ=;
 b=jS7Vahev73t+W7oMqQbHcyChPek5Vk0lS5sEmVZHxzH7UPUt/CQjuTBR0BLJhw7tnGNrgiongiH1HLyU8EUrVWndrP/ea9iJGaM1chTV8vovZ1fwgPQQ22E+VUuPvLtLtRPf0bpiKWNKVQW/u44dEe/gFoeRMs3ghWFWnNTFdkg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e809c2742c82889
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aI95eU6cfSCZw5xBCCAFja9YkVY3wbOkf4kj2pDzGLDeAZu3d/+AjJK5830oIh1mnzc39gF42ZU3viJVgjelxc6ONuQJJvTkxyFt3pf05mtIvu2HhtqLHKiHjkWcdYbnNbLkVNycSEmHhZT3v9F1SLskbTNt11QiUu4IlnRRk8IPjD+hVf9SyVPiQdCVoetNYUnNL5UW4wnUy22NVRfv4Xjh1KNmWM9lfkucdte2V9YJikIsHodML5LpUmIQnboOVMmF4yaWZS1GYb+2Ay75pHPq8pJENfT/bGGeIdpQmwtm1U3BVxbEy6TKLawDoHMgjlPgSJsgR0dUNmyydW3xxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1EtuaFbmtSfEpDKmW8UsU7lftlaVd1qVeGFCMqybMQ=;
 b=aZJm7RIX6Mjd0pPf+oj6b534dIBrA8tlkbgUr54Fc1QoHlIy1YTvXRqxzX5rOOLtlxmay3l3VqVKpShB690Sl7DsSjQzSiIPI4gbgyTjAyPeXc8EAODX0J00nPSKxT6MNg7DEcg1llK3/pV3nGdNPC0WvSIbHel68i0Q/v00qI0YAKYV4L65Mu5JSVlvHE1i2PHoSgA2vci4LHrfWQjougatG2R45Me/or7OB+W53qWjbHUt1wLTQm/eBwhvHGQyJQAEZy5TkuuSwiOzD0Bc/HcPtBoyZKeWIrCVLoxhmuMJK0cfYxiVGZpaayEkTmB6SERPIaIvfHlaTKksy6LEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1EtuaFbmtSfEpDKmW8UsU7lftlaVd1qVeGFCMqybMQ=;
 b=jS7Vahev73t+W7oMqQbHcyChPek5Vk0lS5sEmVZHxzH7UPUt/CQjuTBR0BLJhw7tnGNrgiongiH1HLyU8EUrVWndrP/ea9iJGaM1chTV8vovZ1fwgPQQ22E+VUuPvLtLtRPf0bpiKWNKVQW/u44dEe/gFoeRMs3ghWFWnNTFdkg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHZ8UtNgBNI2koBH0+cEATmTDiuOrAw9peAgABwTYA=
Date: Fri, 29 Sep 2023 07:15:48 +0000
Message-ID: <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
 <20230927140133.631192-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM8PR08MB5825:EE_|AM7EUR03FT059:EE_|GV2PR08MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ea78cf-ec9d-4dea-2cea-08dbc0bbed43
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +IwHPMwqeoZM64JPJcC39YwdpMfmpnfgyYKztVyzW5i84paY5szwB61pr4OA/KsifDLBY5TMTXrQx+iq9x3YP/VHdpqqZ56MzAdiuYo17R+PZRzUIHTnVQRryHVz3I4gvUQvIi79XEdTN9zL2gWC/P7mos/2I8DG9tPxLFtK4vlZxMZVrHa1od3ubscDYL9OoGIwh5T5A53O4ANEJYAuPccKQnz+4NsRp6tsX2nNGZ+OZSnTi6x7YOYTbwSjxFmp0pmZZV4d4yCSx+8PZ63ZUKL3vrhlcANttVsSTksOoqHBXej8XFWAesnBwE98mwdUmB4cM1+t761zFHBo5Ac/t5ueeIl0M+3wwdm0QFad6wzxYIxBM/X9YTNgpjDM2WfzewHhPFr+kDDDCU48h1DMNo7ZWuexVAyHEXuxEGcMJ8CbcflSejBUjR/BH3Chr8Hc3eZ/osHQVw5ll9RrNhTqRs/q3kKYdd8wekDQHJ6veEccNZ+LMk2QpKXHTsTn+0n5A8YCzLSBfUQVW/gqxvJlaYH5ue4iKcDFPr6L0vZidQe09GH+ko1lN4bj64PSRuFO24uKeY7adLjdJPGPYZbcC814CgT3Gb2WvvHyckTkvU78GN6tmy7AhX8zBA13wdCvI45/Qcs8gYFP/JOZGwaOMEO/mrUE/pIzZf4jmdl9SAc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(33656002)(2616005)(26005)(2906002)(53546011)(6512007)(6506007)(86362001)(38070700005)(38100700002)(122000001)(316002)(6916009)(91956017)(36756003)(41300700001)(71200400001)(6486002)(5660300002)(54906003)(66476007)(66556008)(66946007)(66446008)(64756008)(76116006)(8936002)(8676002)(4326008)(478600001)(83380400001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9161234D699C448AAB2E4B0BBF595D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5825
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cfe3af80-1f02-4cc8-bf52-08dbc0bbe7de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qKq+8ATXNdIRU+EBPE7a1WbwMdkVB2vgZtpiFylyrWWVR4wDfdUi5pAI1bOvGx2QXMF3IOaJP+sPcWugtyl69L8EqbzzijKzT8MFbeybdf2IMNl11GobA63XwAFG6o+KcL01WYzVhDvLYqW71LXilOvQLYdCQ/ouN7YgDur1o7Cg+lvf4mrmTFWZVnbYSeOWlRpp9Hr7md8bqwNucC/fVpqyO5SCVgDXNvgBixZQyqqqtpyB4biF/E3T/Ji5kimYerIcXMnhnWUh3WMVSHtnbEZPC3uGuD1mfFgOVjbiD3PywzGJ7nxfFMHCv5xkhqSHmfJ509NUKDtdlhJvcnXNUi0O9Y8BtcaQIySts3MZ+04DmYlt+UydUUWx/Wuk36qXXxwGXrRnSss6DlVAwoTlTxDJcBBlwfovKybZ4JvMKPgRfc65d+N+e2te81VPBVtzBR87AYIbrB4pgwa0PSqvI0nJvb1kCJ46OTjAnRFa2iv0RnB+aMKm0IlWkJeBWdxCrODl/u+CHfkTCkOsfrZeWeIJeNCLtZJmFIuZKZGxZuAx1OCrvUjYT1U9S1cmG0fhyLGRvzelL7KtfhcR6gbvaK/YOJ01/mj9CIUFRV+XG1li/UNjYSLZm4vCHe0zfiBSvia1A29QdVel/ZD1cL1Zz7FaGD6V2mXQq5R7OmukPHMHmV+Z9C97qodKatDlhJ+uZRJjfDyYxSWyP1P/pBehVGzqsZbSj96FkUwPAdi/G45sTINXe/6pelmonpr8Ux5tYFXX64IeW9pIt083sUFnEA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(82310400011)(36840700001)(40470700004)(46966006)(40460700003)(336012)(40480700001)(6486002)(53546011)(6506007)(6512007)(478600001)(36860700001)(47076005)(81166007)(86362001)(356005)(82740400003)(2906002)(107886003)(41300700001)(83380400001)(2616005)(26005)(36756003)(5660300002)(54906003)(8676002)(70586007)(33656002)(8936002)(70206006)(316002)(6862004)(4326008)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 07:15:57.4452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ea78cf-ec9d-4dea-2cea-08dbc0bbed43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8341

SGkgU3RlZmFubywNCg0KPiBPbiAyOSBTZXAgMjAyMywgYXQgMDE6MzMsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIDI3IFNl
cCAyMDIzLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gQ3VycmVudGx5IHRoZSBkb20wbGVzcyBm
ZWF0dXJlIGNvZGUgaXMgbW9zdGx5IGluc2lkZSBkb21haW5fYnVpbGQuYw0KPj4gYW5kIHNldHVw
LmMsIGl0IGlzIGEgZmVhdHVyZSB0aGF0IG1heSBub3QgYmUgdXNlZnVsIHRvIGV2ZXJ5b25lIHNv
DQo+PiBwdXQgdGhlIGNvZGUgaW4gYSBkaWZmZXJlbnQgY29tcGlsYXRpb24gbW9kdWxlIGluIG9y
ZGVyIHRvIG1ha2UgaXQNCj4+IGVhc2llciB0byBkaXNhYmxlIHRoZSBmZWF0dXJlIGluIHRoZSBm
dXR1cmUuDQo+PiANCj4+IE1vdmUgZ2ljX2ludGVycnVwdF90IGluIGRvbWFpbl9idWlsZC5oIHRv
IHVzZSBpdCB3aXRoIHRoZSBmdW5jdGlvbg0KPj4gZGVjbGFyYXRpb24sIG1vdmUgaXRzIGNvbW1l
bnQgYWJvdmUgdGhlIGRlY2xhcmF0aW9uLg0KPj4gDQo+PiBUaGUgZm9sbG93aW5nIGZ1bmN0aW9u
cyBhcmUgbm93IHZpc2libGUgZXh0ZXJuYWxseSBmcm9tIGRvbWFpbl9idWlsZA0KPj4gYmVjYXVz
ZSB0aGV5IGFyZSB1c2VkIGFsc28gZnJvbSB0aGUgZG9tMGxlc3MtYnVpbGQgbW9kdWxlOg0KPj4g
LSBnZXRfYWxsb2NhdGlvbl9zaXplDQo+PiAtIHNldF9pbnRlcnJ1cHQNCj4+IC0gZG9tYWluX2Zk
dF9iZWdpbl9ub2RlDQo+PiAtIG1ha2VfbWVtb3J5X25vZGUNCj4+IC0gbWFrZV9yZXN2X21lbW9y
eV9ub2RlDQo+PiAtIG1ha2VfaHlwZXJ2aXNvcl9ub2RlDQo+PiAtIG1ha2VfcHNjaV9ub2RlDQo+
PiAtIG1ha2VfY3B1c19ub2RlDQo+PiAtIG1ha2VfdGltZXJfbm9kZQ0KPj4gLSBoYW5kbGVfZGV2
aWNlX2ludGVycnVwdHMNCj4+IC0gY29uc3RydWN0X2RvbWFpbg0KPj4gLSBwcm9jZXNzX3NobQ0K
Pj4gDQo+PiBUaGUgZnVuY3Rpb25zIGFsbG9jYXRlX3N0YXRpY19tZW1vcnkgYW5kIGFzc2lnbl9z
dGF0aWNfbWVtb3J5XzExDQo+PiBhcmUgbm93IGV4dGVybmFsbHkgdmlzaWJsZSwgc28gcHV0IHRo
ZWlyIGRlY2xhcmF0aW9ucyBpbnRvDQo+PiBkb21haW5fYnVpbGQuaCBhbmQgbW92ZSB0aGUgI2Vs
c2UgYW5kIHN0dWIgZGVmaW5pdGlvbiBpbiB0aGUgaGVhZGVyDQo+PiBhcyB3ZWxsLg0KPj4gDQo+
PiBNb3ZlIGlzX2RvbTBsZXNzX21vZGUgZnJvbSBzZXR1cC5jIHRvIGRvbTBsZXNzLWJ1aWxkLmMg
YW5kIG1ha2UgaXQNCj4+IGV4dGVybmFsbHkgdmlzaWJsZS4NCj4+IA0KPj4gV2hlcmUgc3BvdHRl
ZCwgZml4IGNvZGUgc3R5bGUgaXNzdWVzLg0KPj4gDQo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBp
cyBpbnRlbmRlZC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5m
YW5jZWxsdUBhcm0uY29tPg0KPiANCj4gVGhpcyBpcyBncmVhdCEgQSBjb3VwbGUgb2YgcXVlc3Rp
b25zLg0KPiANCj4gV2h5IHdhcyBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5IG5vdCBtb3ZlZCB0byBk
b20wbGVzcy1idWlsZC5jID8NCg0KTXkgYWltIGlzIHRvIGRlY291cGxlIHRoZSBmZWF0dXJlcywg
c28gaW4gcGF0Y2ggNCB3ZSBtb3ZlIChqdXN0IG9uY2UgYXMgSnVsaWVuIHN1Z2dlc3RlZCkNCnRo
ZSBzdGF0aWMgbWVtb3J5IGNvZGUgb24gYSBtb2R1bGUgb24gaXRzIG93biwgYmVjYXVzZSB3ZSBj
YW4gaGF2ZSBhIGd1ZXN0IGJvb3RlZCB3aXRoDQpkb20wbGVzcyBmZWF0dXJlIGJ1dCBoYXZpbmcg
aXQgd2l0aCBzdGF0aWMgbWVtb3J5IGlzIG9wdGlvbmFsLg0KDQo+IA0KPiBXb3VsZCBpdCBtYWtl
IHNlbnNlIHRvIGFsc28gbW92ZSBjb25zdHJ1Y3RfZG9tMCB0byBkb20wbGVzcy1idWlsZC5jDQo+
IGdpdmVuIHRoZSBzaW1pbGFyaXRpZXMgd2l0aCBjb25zdHJ1Y3RfZG9tVT8gSSBhbSBub3Qgc3Vy
ZSBhYm91dCB0aGlzLg0KPiANCg0KV2UgY2Fu4oCZdCBkbyB0aGF0IGJlY2F1c2UgdGhlIGZpbmFs
IGdvYWwgb2YgdGhpcyBzZXJpZSBpcyB0byBoYXZlIGEgS2NvbmZpZyBkaXNhYmxpbmcgZG9tMGxl
c3MsDQpzbyBpbiB0aGF0IGNhc2Ugd2Ugd2lsbCBlbmQgdXAgcmVtb3ZpbmcgZnJvbSB0aGUgY29t
cGlsYXRpb24gYWxzbyBjb25zdHJ1Y3RfZG9tMC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg==

