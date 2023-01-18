Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4929D6718D7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 11:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480451.744880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5am-0000Cq-LX; Wed, 18 Jan 2023 10:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480451.744880; Wed, 18 Jan 2023 10:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5am-0000AW-Hx; Wed, 18 Jan 2023 10:22:52 +0000
Received: by outflank-mailman (input) for mailman id 480451;
 Wed, 18 Jan 2023 10:22:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pI5ak-0000AQ-L0
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 10:22:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2083.outbound.protection.outlook.com [40.107.6.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0da82170-971a-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 11:22:47 +0100 (CET)
Received: from FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::10)
 by GV1PR08MB8665.eurprd08.prod.outlook.com (2603:10a6:150:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 10:22:44 +0000
Received: from VI1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::d) by FR3P281CA0077.outlook.office365.com
 (2603:10a6:d10:1f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Wed, 18 Jan 2023 10:22:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT019.mail.protection.outlook.com (100.127.144.122) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 10:22:43 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Wed, 18 Jan 2023 10:22:43 +0000
Received: from a4fff2679139.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0902E2A7-8A7B-48B4-AE96-5C45529D0FCA.1; 
 Wed, 18 Jan 2023 10:22:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4fff2679139.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 10:22:34 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR08MB5504.eurprd08.prod.outlook.com (2603:10a6:803:13b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 10:22:30 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 10:22:29 +0000
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
X-Inumbo-ID: 0da82170-971a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9FstzcEsRYHLBahbtxW4s/n/Q2vAeRkF9r1YcUuAmo=;
 b=RM4RFEi+G1n6NR2mWIysoZx6sBfwnbUs0RZYsboy5jWsLRFToyZ9xG3s0KgFPbtaXuRB3VuMSISub/H0ovgVc8SolMz0YmmnOMNYtAlk0uED+CkwEPU38pQbhkW4COJURnaAYa958CbpJceUbCszgVjZ+MHJ/PGbIGR5BXK9Vm8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCNEynVhBYjbGbZlTOTeBdo/oij+H7CsykLx8st/wNwaW0Pp/UGvgORfN/IxNEgskk/h++h3DFfi9gkkt5khPnoIn1IIqB+WnQi4Gy3ks9Mficnz2TXe4MHLsdmgFdwht+T11oP4rAcVrV28maboJKG5dxzWFWl4zniesN195blOBFh6ZSqksK71K+54zNjNr6u2SayrEkAJMrQpzBOYOXK8tU0YfLe41hjPxnIjntr8/ozNPEGPFcVJq13RCe9Ax3/0jr07NLuO8qqcaHxCV8u4HYKdjWhQ0b6q61b3jT7CkE6whmSTn+4lYnD8pK8rh/tSt1oJbH7g4mx3fBke1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9FstzcEsRYHLBahbtxW4s/n/Q2vAeRkF9r1YcUuAmo=;
 b=l1xmiYme2Jb5+ALml5HoATt60LeScJ24HjeYngsjlsDbal9ME06ERWshNgR1SWfiui/uyhsn8kPamyYUVqMDXB1OtlHDMJoPQn3wFY5arumi1LG1nzOV/pEOZ/u7tcM4ZjQ9CW/OtTUioR6IlrC2u7Gwqb3aOYO/VuHm7S3coR2QRvFxF00/HV92dl94JPaXUdOwqVSqdm+zZRboO1Ny6ygmp6nQr7VPZlEj660HJm7QD9JcUH64DA+0Cusabr0L90xJ8jP4gkLzOwhplVN4PIcRZmSSPechx/M1Gb8H6uiGpWNUvaXdf0yFlSak4o7q1xLKO+AV2PC7Wd3gWC5M4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9FstzcEsRYHLBahbtxW4s/n/Q2vAeRkF9r1YcUuAmo=;
 b=RM4RFEi+G1n6NR2mWIysoZx6sBfwnbUs0RZYsboy5jWsLRFToyZ9xG3s0KgFPbtaXuRB3VuMSISub/H0ovgVc8SolMz0YmmnOMNYtAlk0uED+CkwEPU38pQbhkW4COJURnaAYa958CbpJceUbCszgVjZ+MHJ/PGbIGR5BXK9Vm8=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>
Subject: RE: [PATCH v2 04/40] xen/arm: add an option to define Xen start
 address for Armv8-R
Thread-Topic: [PATCH v2 04/40] xen/arm: add an option to define Xen start
 address for Armv8-R
Thread-Index: AQHZJxAXLGszZRVrMECopJok59rQha6jR3wAgAA4E5CAAHUeAIAABBnw
Date: Wed, 18 Jan 2023 10:22:29 +0000
Message-ID:
 <PAXPR08MB7420F43284FEC60BC88496709EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-5-Penny.Zheng@arm.com>
 <e406484a-aad3-4953-afdb-3159597ec998@xen.org>
 <PAXPR08MB7420A5C7F93F23F14C77C9BA9EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <7ffe5d34-614d-f2aa-cf87-c518917c970a@xen.org>
In-Reply-To: <7ffe5d34-614d-f2aa-cf87-c518917c970a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 72FEF97377C05641AE8EC8634FB16AEA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|VI1PR08MB5504:EE_|VI1EUR03FT019:EE_|GV1PR08MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: 3263374a-d9e8-4404-0818-08daf93defc7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jX+m4M5xpLhPjjO1FDvTDTse23IDqOyYBXDYboOCm3wSXqNrVxBL4QYTftS7w/X+qXrr32tBVi7TN9htiyH/wVpsLJos3OX1/IJkPvBlxH7jxLVbdfQkBn/JFbE4v3EuTmRqeLnpGJE/GuIrcmEda0MgEiL1yuLQRJQVbi8pbkCqDCCZcpuQI08NoAs30jqyjXWkJAu7UjA8NL4QhSJ+g25KH9Qv5ENh4KWvrhL4IRSg4vrC5Rg/9iQvaYvlQqQ8oVnc67jDkzjiWqlQQSL493I6FmsZWHqMokZGjvOKSBlV0Rcqd5X/Ri+XWdzTiqXuImToGX4lR7Uq9ddT4r0G/QvfsCbDlbb/lbotII7P0e7lwjIYC+1Rj0OFt26r4OO+j6D6uXlBqPty2be501caTMLhhkHmOgyRsYCHek5Dmk1k8A373xAaqXjKfSeHCAEU0nidYEDcohbaygYddlQJktRuJ/ZMcTSfRaHFLDBw4pP48X+Uve9thrLvUnoByN05E3IZdUc2X9f2+cIpRDmki5FoWVwNBvSjBSlkAw52iQOaVf77XxKFfydf27XWr44OgG2VmRLNdO3uxzPxl8Y9FCL1x0vDwzMI1sM+LaKUFtJAcKxGOHkp3vjTvogzTpnwI1WQUg36WT1xNsRb969tM7ccKX+neJKglD4u8/1x7fEGA0RdduWZFFnFsmk9ejW7qRaDlg7CCMjaieUec/3FBg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(83380400001)(38100700002)(122000001)(5660300002)(33656002)(38070700005)(2906002)(86362001)(76116006)(4326008)(66946007)(64756008)(52536014)(66476007)(66556008)(55016003)(8676002)(8936002)(66446008)(478600001)(53546011)(186003)(26005)(6506007)(9686003)(316002)(54906003)(110136005)(7696005)(71200400001)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5504
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b6a1add0-b2f7-4067-9853-08daf93de75e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FNl1YhMvIFdtQ43Lm+ZSUyRUKcveD9YR+1gljCqOGmOZKKIWrWO15QjJeMwVojMJcZb8OKbxFeAMwfbJKyZrm+8S8g25E/hzIZ4LUiTjO7r4vLL1vpGDR9B72xfxDcJ1sifg+yzeN34u8wkXBA/E9REVeLurJV9IkeZtfDlkiCga2i0ULO033ANOfZzME0xBzRaw0i1Zft73gNqpedo8lIq1tjG1NWe2o1sysV9Rd9n9K43vYY7snzsC5PmqwFAW0el53cdQ8Z0iYikTaz3W7C8+zaz8REv0jm5YKrxGNJl5Zg6HU5pwFCvnnouLuuW0WEflb20AyRE4e2xUmZYsCY1BYPDImjfIt3hP6U0RcYPHvjcjIS8WLfZEBY3uyVcg7D+VGemcqb3jJaAZeDUrrXW/fKTh4/Bs6ia855YXKQsoPzE+YaK+ciAv77TUIYMryHJXh8kaBe9a8FuD/wrO4FRN8t/3engzPly0lIgi3Eap4eI2JZpmQCpHOB8jU4BiB+fFtRNGpX54emYRdlpUaTVWrE/MBqBH6eD4tC6uCQypNEh1famvS4SCyKQPMC/XCXjkLGeQ4rxDvxCAVWoSQGhNlbc4qwFcbTYKy+xagLLfuMNaVPK6AX0moj0UQHlcgLti/Oz5TmoVXGIn1PVlQhvuXLmCaXbGwyHyGzt5o8pUc4nw/+5lRSTt6D6JZoy9c9DJBBE0PP7XKrpdvs5Tfw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(5660300002)(54906003)(110136005)(316002)(36860700001)(40460700003)(33656002)(336012)(82310400005)(2906002)(82740400003)(83380400001)(47076005)(86362001)(7696005)(55016003)(40480700001)(81166007)(356005)(6506007)(53546011)(26005)(186003)(9686003)(478600001)(8676002)(4326008)(41300700001)(52536014)(8936002)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 10:22:43.5903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3263374a-d9e8-4404-0818-08daf93defc7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8665

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjPlubQx5pyIMTjml6UgMTc6NDQN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgUGVubnkgWmhlbmcgPFBlbm55Llpo
ZW5nQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJx
dWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1ayA8Vm9s
b2R5bXlyX0JhYmNodWtAZXBhbS5jb20+Ow0KPiBKaWFtZWkgWGllIDxKaWFtZWkuWGllQGFybS5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDQvNDBdIHhlbi9hcm06IGFkZCBhbiBvcHRp
b24gdG8gZGVmaW5lIFhlbiBzdGFydA0KPiBhZGRyZXNzIGZvciBBcm12OC1SDQo+IA0KPiANCj4g
DQo+IE9uIDE4LzAxLzIwMjMgMDM6MDAsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEhpIEp1bGllbiwN
Cj4gDQo+IEhpIFdlaSwNCj4gDQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjPlubQx
5pyIMTjml6UgNzoyNA0KPiA+PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gQ2M6IFdlaSBDaGVuIDxXZWku
Q2hlbkBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+ID4+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4g
Pj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgSmlhbWVp
IFhpZQ0KPiA+PiA8SmlhbWVpLlhpZUBhcm0uY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDA0LzQwXSB4ZW4vYXJtOiBhZGQgYW4gb3B0aW9uIHRvIGRlZmluZSBYZW4NCj4gc3RhcnQN
Cj4gPj4gYWRkcmVzcyBmb3IgQXJtdjgtUg0KPiA+Pg0KPiA+PiBIaSBQZW5ueSwNCj4gPj4NCj4g
Pj4gT24gMTMvMDEvMjAyMyAwNToyOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiBGcm9tOiBX
ZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPj4+DQo+ID4+PiBPbiBBcm12OC1BLCBYZW4g
aGFzIGEgZml4ZWQgdmlydHVhbCBzdGFydCBhZGRyZXNzIChsaW5rIGFkZHJlc3MNCj4gPj4+IHRv
bykgZm9yIGFsbCBBcm12OC1BIHBsYXRmb3Jtcy4gSW4gYW4gTU1VIGJhc2VkIHN5c3RlbSwgWGVu
IGNhbg0KPiA+Pj4gbWFwIGl0cyBsb2FkZWQgYWRkcmVzcyB0byB0aGlzIHZpcnR1YWwgc3RhcnQg
YWRkcmVzcy4gU28sIG9uDQo+ID4+PiBBcm12OC1BIHBsYXRmb3JtcywgdGhlIFhlbiBzdGFydCBh
ZGRyZXNzIGRvZXMgbm90IG5lZWQgdG8gYmUNCj4gPj4+IGNvbmZpZ3VyYWJsZS4gQnV0IG9uIEFy
bXY4LVIgcGxhdGZvcm1zLCB0aGVyZSBpcyBubyBNTVUgdG8gbWFwDQo+ID4+PiBsb2FkZWQgYWRk
cmVzcyB0byBhIGZpeGVkIHZpcnR1YWwgYWRkcmVzcyBhbmQgZGlmZmVyZW50IHBsYXRmb3Jtcw0K
PiA+Pj4gd2lsbCBoYXZlIHZlcnkgZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2UgbGF5b3V0LiBTbyBY
ZW4gY2Fubm90IHVzZQ0KPiA+Pj4gYSBmaXhlZCBwaHlzaWNhbCBhZGRyZXNzIG9uIE1QVSBiYXNl
ZCBzeXN0ZW0gYW5kIG5lZWQgdG8gaGF2ZSBpdA0KPiA+Pj4gY29uZmlndXJhYmxlLg0KPiA+Pj4N
Cj4gPj4+IEluIHRoaXMgcGF0Y2ggd2UgaW50cm9kdWNlIG9uZSBLY29uZmlnIG9wdGlvbiBmb3Ig
dXNlcnMgdG8gZGVmaW5lDQo+ID4+PiB0aGUgZGVmYXVsdCBYZW4gc3RhcnQgYWRkcmVzcyBmb3Ig
QXJtdjgtUi4gVXNlcnMgY2FuIGVudGVyIHRoZQ0KPiA+Pj4gYWRkcmVzcyBpbiBjb25maWcgdGlt
ZSwgb3Igc2VsZWN0IHRoZSB0YWlsb3JlZCBwbGF0Zm9ybSBjb25maWcNCj4gPj4+IGZpbGUgZnJv
bSBhcmNoL2FybS9jb25maWdzLg0KPiA+Pj4NCj4gPj4+IEFuZCBhcyB3ZSBpbnRyb2R1Y2VkIEFy
bXY4LVIgcGxhdGZvcm1zIHRvIFhlbiwgdGhhdCBtZWFucyB0aGUNCj4gPj4+IGV4aXN0ZWQgQXJt
NjQgcGxhdGZvcm1zIHNob3VsZCBub3QgYmUgbGlzdGVkIGluIEFybXY4LVIgcGxhdGZvcm0NCj4g
Pj4+IGxpc3QsIHNvIHdlIGFkZCAhQVJNX1Y4UiBkZXBlbmRlbmN5IGZvciB0aGVzZSBwbGF0Zm9y
bXMuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5j
b20+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKaWFtZWkuWGllIDxqaWFtZWkueGllQGFybS5jb20+
DQo+ID4+DQo+ID4+IFlvdXIgc2lnbmVkLW9mZi1ieSBpcyBtaXNzaW5nLg0KPiA+Pg0KPiA+Pj4g
LS0tDQo+ID4+PiB2MSAtPiB2MjoNCj4gPj4+IDEuIFJlbW92ZSB0aGUgcGxhdGZvcm0gaGVhZGVy
IGZ2cF9iYXNlci5oLg0KPiA+Pj4gMi4gUmVtb3ZlIHRoZSBkZWZhdWx0IHN0YXJ0IGFkZHJlc3Mg
Zm9yIGZ2cF9iYXNlcjY0Lg0KPiA+Pj4gMy4gUmVtb3ZlIHRoZSBkZXNjcmlwdGlvbiBvZiBkZWZh
dWx0IGFkZHJlc3MgZnJvbSBjb21taXQgbG9nLg0KPiA+Pj4gNC4gQ2hhbmdlIEhBU19NUFUgdG8g
QVJNX1Y4UiBmb3IgWGVuIHN0YXJ0IGFkZHJlc3MgZGVwZW5kZW5jeS4NCj4gPj4+ICAgICAgTm8g
bWF0dGVyIEFybS12OHIgYm9hcmQgaGFzIE1QVSBvciBub3QsIGl0IGFsd2F5cyBuZWVkIHRvDQo+
ID4+PiAgICAgIHNwZWNpZnkgdGhlIHN0YXJ0IGFkZHJlc3MuDQo+ID4+DQo+ID4+IEkgZG9uJ3Qg
cXVpdGUgdW5kZXJzdGFuZCB0aGUgbGFzdCBzZW50ZW5jZS4gQXJlIHlvdSBzYXlpbmcgdGhhdCBp
dCBpcw0KPiA+PiBwb3NzaWJsZSB0byBoYXZlIGFuIEFSTXY4LVIgc3lzdGVtIHdpdGggYW4gTVBV
IG5vciBhIHBhZ2UtdGFibGU/DQo+ID4+DQo+ID4NCj4gPiBZZXMsIGZyb20gdGhlIENvcnRleC1S
ODIgcGFnZSBbMV0sIHlvdSBjYW4gc2VlIHRoZSBNUFUgaXMgb3B0aW9uYWwgaW4NCj4gRUwxDQo+
ID4gYW5kIEVMMjoNCj4gPiAiVHdvIG9wdGlvbmFsIGFuZCBwcm9ncmFtbWFibGUgTVBVcyBjb250
cm9sbGVkIGZyb20gRUwxIGFuZCBFTDINCj4gcmVzcGVjdGl2ZWx5LiINCj4gV291bGQgdGhpcyBt
ZWFuIGEgdmVuZG9yIG1heSBwcm92aWRlIHRoZWlyIGN1c3RvbSBzb2x1dGlvbiB0byBwcm90ZWN0
DQo+IHRoZSBtZW1vcnk/DQo+IA0KDQpBaCwgeW91IGdhdmUgbWUgYSBuZXcgaWRlYSwgeWVzIGlu
IHRoZSAiQVJNIERESSAwNjAwQS5jIEcxLjMuNyIgTVNBX2ZyYWMNCm9mIElEX0FBNjRNTUZSMF9F
TDEgc2F5czoNCjBiMDAwMCBQTVNBdjgtNjQgbm90IHN1cHBvcnRlZCBpbiBhbnkgdHJhbnNsYXRp
b24gcmVnaW1lLg0KMGIwMDAwIGlzIG5vdCBwZXJtaXR0ZWQgdmFsdWUuDQoNClNvIG1heWJlIHlv
dSdyZSByaWdodCwgb24gQXJtdjgtUjY0LCB3ZSBhbHdheXMgaGF2ZSBNUFUgaW4gRUwxJkVMMiwg
dGhlDQpvcHRpb25hbCBpcyBmb3IgTVBVIGN1c3RvbWl6YXRpb24uDQoNCj4gPg0KPiA+IEFsdGhv
dWdoIGl0IGlzIHVubGlrZWx5IHRoYXQgdmVuZG9ycyB1c2luZyB0aGUgQXJtdjgtUiBJUCB3aWxs
IGRvIHNvLCBpdA0KPiA+IGlzIGluZGVlZCBhbiBvcHRpb24uIEluIHRoZSBJRCByZWdpc3Rlciwg
dGhlcmUgYXJlIGFsc28gcmVsYXRlZCBiaXRzIGluDQo+ID4gSURfQUE2NE1NRlIwX0VMMSAoTVNB
X2ZyYWMpIHRvIGluZGljYXRlIHRoaXMuDQo+ID4NCj4gPj4+IC0tLQ0KPiA+Pj4gICAgeGVuL2Fy
Y2gvYXJtL0tjb25maWcgICAgICAgICAgIHwgIDggKysrKysrKysNCj4gPj4+ICAgIHhlbi9hcmNo
L2FybS9wbGF0Zm9ybXMvS2NvbmZpZyB8IDE2ICsrKysrKysrKysrKystLS0NCj4gPj4+ICAgIDIg
ZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPj4+DQo+
ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vS2Nv
bmZpZw0KPiA+Pj4gaW5kZXggYWNlNzE3OGM5YS4uYzZiNmI2MTJkMSAxMDA2NDQNCj4gPj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZp
Zw0KPiA+Pj4gQEAgLTE0NSw2ICsxNDUsMTQgQEAgY29uZmlnIFRFRQ0KPiA+Pj4gICAgCSAgVGhp
cyBvcHRpb24gZW5hYmxlcyBnZW5lcmljIFRFRSBtZWRpYXRvcnMgc3VwcG9ydC4gSXQgYWxsb3dz
DQo+ID4+IGd1ZXN0cw0KPiA+Pj4gICAgCSAgdG8gYWNjZXNzIHJlYWwgVEVFIHZpYSBvbmUgb2Yg
VEVFIG1lZGlhdG9ycyBpbXBsZW1lbnRlZCBpbg0KPiBYRU4uDQo+ID4+Pg0KPiA+Pj4gK2NvbmZp
ZyBYRU5fU1RBUlRfQUREUkVTUw0KPiA+Pj4gKwloZXggIlhlbiBzdGFydCBhZGRyZXNzOiBrZWVw
IGRlZmF1bHQgdG8gdXNlIHBsYXRmb3JtIGRlZmluZWQNCj4gPj4gYWRkcmVzcyINCj4gPj4+ICsJ
ZGVmYXVsdCAwDQo+ID4+PiArCWRlcGVuZHMgb24gQVJNX1Y4Ug0KPiA+Pg0KPiA+PiBJdCBpcyBz
dGlsbCBwcmV0dHkgdW5jbGVhciB0byBtZSB3aGF0IHdvdWxkIGJlIHRoZSBkaWZmZXJlbmNlIGJl
dHdlZW4NCj4gPj4gSEFTX01QVSBhbmQgQVJNX1Y4Ui4NCj4gPj4NCj4gPg0KPiA+IElmIHdlIGRv
bid0IHdhbnQgdG8gc3VwcG9ydCBub24tTVBVIHN1cHBvcnRlZCBBcm12OC1SLCBJIHRoaW5rIHRo
ZXkgYXJlDQo+IHRoZQ0KPiA+IHNhbWUuIElNTywgbm9uLU1QVSBzdXBwb3J0ZWQgQXJtdjgtUiBp
cyBtZWFuaW5nbGVzcyB0byBYZW4uDQo+IE9PSSwgd2h5IGRvIHlvdSB0aGluayB0aGlzIGlzIG1l
YW5pbmdsZXNzPw0KDQpJZiB0aGVyZSBpcyBBcm12OC1SIGJvYXJkIHdpdGhvdXQgRUwyIE1QVSwg
aG93IGNhbiB3ZSBwcm90ZWN0IFhlbj8gT2YgY291cnNlLA0KaWYgdXNlcnMgZG9uJ3QgY2FyZSBh
Ym91dCBzZWN1cml0eSwgWGVuIHN0aWxsIGNhbiBzdXBwb3J0IGl0Lg0KDQo+IA0KPiA+DQo+ID4+
PiArCWhlbHANCj4gPj4+ICsJICBUaGlzIG9wdGlvbiBhbGxvd3MgdG8gc2V0IHRoZSBjdXN0b21p
emVkIGFkZHJlc3MgYXQgd2hpY2ggWGVuIHdpbGwNCj4gPj4gYmUNCj4gPj4+ICsJICBsaW5rZWQg
b24gTVBVIHN5c3RlbXMuIFRoaXMgYWRkcmVzcyBtdXN0IGJlIGFsaWduZWQgdG8gYSBwYWdlIHNp
emUuDQo+ID4+PiArDQo+ID4+PiAgICBzb3VyY2UgImFyY2gvYXJtL3RlZS9LY29uZmlnIg0KPiA+
Pj4NCj4gPj4+ICAgIGNvbmZpZyBTVEFUSUNfU0hNDQo+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnDQo+ID4+IGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9L
Y29uZmlnDQo+ID4+PiBpbmRleCBjOTNhNmIyNzU2Li4wOTA0NzkzYTBiIDEwMDY0NA0KPiA+Pj4g
LS0tIGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnDQo+ID4+PiArKysgYi94ZW4vYXJj
aC9hcm0vcGxhdGZvcm1zL0tjb25maWcNCj4gPj4+IEBAIC0xLDYgKzEsNyBAQA0KPiA+Pj4gICAg
Y2hvaWNlDQo+ID4+PiAgICAJcHJvbXB0ICJQbGF0Zm9ybSBTdXBwb3J0Ig0KPiA+Pj4gICAgCWRl
ZmF1bHQgQUxMX1BMQVQNCj4gPj4+ICsJZGVmYXVsdCBGVlBfQkFTRVIgaWYgQVJNX1Y4Ug0KPiA+
Pj4gICAgCS0tLWhlbHAtLS0NCj4gPj4+ICAgIAlDaG9vc2Ugd2hpY2ggaGFyZHdhcmUgcGxhdGZv
cm0gdG8gZW5hYmxlIGluIFhlbi4NCj4gPj4+DQo+ID4+PiBAQCAtOCwxMyArOSwxNCBAQCBjaG9p
Y2UNCj4gPj4+DQo+ID4+PiAgICBjb25maWcgQUxMX1BMQVQNCj4gPj4+ICAgIAlib29sICJBbGwg
UGxhdGZvcm1zIg0KPiA+Pj4gKwlkZXBlbmRzIG9uICFBUk1fVjhSDQo+ID4+PiAgICAJLS0taGVs
cC0tLQ0KPiA+Pj4gICAgCUVuYWJsZSBzdXBwb3J0IGZvciBhbGwgYXZhaWxhYmxlIGhhcmR3YXJl
IHBsYXRmb3Jtcy4gSXQNCj4gZG9lc24ndA0KPiA+Pj4gICAgCWF1dG9tYXRpY2FsbHkgc2VsZWN0
IGFueSBvZiB0aGUgcmVsYXRlZCBkcml2ZXJzLg0KPiA+Pj4NCj4gPj4+ICAgIGNvbmZpZyBRRU1V
DQo+ID4+PiAgICAJYm9vbCAiUUVNVSBhYXJjaCB2aXJ0IG1hY2hpbmUgc3VwcG9ydCINCj4gPj4+
IC0JZGVwZW5kcyBvbiBBUk1fNjQNCj4gPj4+ICsJZGVwZW5kcyBvbiBBUk1fNjQgJiYgIUFSTV9W
OFINCj4gPj4+ICAgIAlzZWxlY3QgR0lDVjMNCj4gPj4+ICAgIAlzZWxlY3QgSEFTX1BMMDExDQo+
ID4+PiAgICAJLS0taGVscC0tLQ0KPiA+Pj4gQEAgLTIzLDcgKzI1LDcgQEAgY29uZmlnIFFFTVUN
Cj4gPj4+DQo+ID4+PiAgICBjb25maWcgUkNBUjMNCj4gPj4+ICAgIAlib29sICJSZW5lc2FzIFJD
YXIzIHN1cHBvcnQiDQo+ID4+PiAtCWRlcGVuZHMgb24gQVJNXzY0DQo+ID4+PiArCWRlcGVuZHMg
b24gQVJNXzY0ICYmICFBUk1fVjhSDQo+ID4+PiAgICAJc2VsZWN0IEhBU19TQ0lGDQo+ID4+PiAg
ICAJc2VsZWN0IElQTU1VX1ZNU0ENCj4gPj4+ICAgIAktLS1oZWxwLS0tDQo+ID4+PiBAQCAtMzEs
MTQgKzMzLDIyIEBAIGNvbmZpZyBSQ0FSMw0KPiA+Pj4NCj4gPj4+ICAgIGNvbmZpZyBNUFNPQw0K
PiA+Pj4gICAgCWJvb2wgIlhpbGlueCBVbHRyYXNjYWxlKyBNUFNvQyBzdXBwb3J0Ig0KPiA+Pj4g
LQlkZXBlbmRzIG9uIEFSTV82NA0KPiA+Pj4gKwlkZXBlbmRzIG9uIEFSTV82NCAmJiAhQVJNX1Y4
Ug0KPiA+Pj4gICAgCXNlbGVjdCBIQVNfQ0FERU5DRV9VQVJUDQo+ID4+PiAgICAJc2VsZWN0IEFS
TV9TTU1VDQo+ID4+PiAgICAJLS0taGVscC0tLQ0KPiA+Pj4gICAgCUVuYWJsZSBhbGwgdGhlIHJl
cXVpcmVkIGRyaXZlcnMgZm9yIFhpbGlueCBVbHRyYXNjYWxlKyBNUFNvQw0KPiA+Pj4NCj4gPj4+
ICtjb25maWcgRlZQX0JBU0VSDQo+ID4+PiArCWJvb2wgIkZpeGVkIFZpcnR1YWwgUGxhdGZvcm0g
QmFzZVIgc3VwcG9ydCINCj4gPj4+ICsJZGVwZW5kcyBvbiBBUk1fVjhSDQo+ID4+PiArCWhlbHAN
Cj4gPj4+ICsJICBFbmFibGUgcGxhdGZvcm0gc3BlY2lmaWMgY29uZmlndXJhdGlvbnMgZm9yIEZp
eGVkIFZpcnR1YWwNCj4gPj4+ICsJICBQbGF0Zm9ybSBCYXNlUg0KPiA+Pg0KPiA+PiBUaGlzIHNl
ZW1zIHVucmVsYXRlZCB0byB0aGlzIHBhdGNoLg0KPiA+Pg0KPiA+DQo+ID4gQ2FuIHdlIGFkZCBz
b21lIGRlc2NyaXB0aW9ucyBpbiBjb21taXQgbG9nIGZvciB0aGlzIGNoYW5nZSwgb3Igd2UNCj4g
PiBTaG91bGQgbW92ZSBpdCB0byBhIG5ldyBwYXRjaD8NCj4gDQo+IE5ldyBwYXRjaCBwbGVhc2Ug
b3IgaW50cm9kdWNlIGl0IGluIHRoZSBwYXRjaCB3aGVyZSB5b3UgbmVlZCBpdC4NCj4gDQo+IFdl
IGhhZCBwcmVmZXJyZWQgdG8gdXNlIHNlcGFyYXRlDQo+ID4gcGF0Y2hlcyBmb3IgdGhpcyBraW5k
IG9mIGNoYW5nZXMsIGJ1dCB3ZSBmb3VuZCB0aGUgbnVtYmVyIG9mIHBhdGNoZXMNCj4gPiB3b3Vs
ZCBiZWNvbWUgbW9yZSBhbmQgbW9yZS4gVGhpcyBwcm9ibGVtIGhhcyBiZWVuIGJvdGhlcmluZyB1
cyBmb3INCj4gPiBvcmdhbml6aW5nIHBhdGNoZXMuDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhlIGNv
bmNlcm4gb2YgaW5jcmVhc2luZyB0aGUgbnVtYmVyIG9mIHBhdGNoZXMuIEhvd2V2ZXIsDQo+IHRo
aXMgYWxzbyBuZWVkcyB0byB3ZWlnaHQgYWdhaW5zdCB0aGUgcmV2aWV3Lg0KPiANCg0KVW5kZXJz
dGFuZC4NCg0KPiBJbiB0aGlzIGNhc2UsIGl0IGlzIHZlcnkgZGlmZmljdWx0IGZvciBtZSB0byB1
bmRlcnN0YW5kIHdoeSB3ZSBuZWVkIHRvDQo+IGludHJvZHVjZSBGVlBfQkFTRVIuDQo+IA0KPiBJ
biBmYWN0LCBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgd2UgZGlzY3Vzc2VkIHRvIG5vdCBpbnRy
b2R1Y2UgYW55IG5ldw0KPiBwbGF0Zm9ybSBzcGVjaWZpYyBjb25maWcuIFNvIEkgYW0gYSBiaXQg
c3VycHJpc2VkIHRoaXMgaXMgYWN0dWFsbHkgbmVlZGVkLg0KPiANCg0KTm8sIHRoaXMgaXMgbm8g
dHJ1ZSwgaXQncyBteSBtaXN0YWtlLCBJIGZvcmdvdCB0byByZW1vdmUgRlZQX0JBU0VSIGZyb20N
CnRoaXMgS2NvbmZpZy4gQWN0dWFsbHksIHdlIGRvIG5vdCBuZWVkIHRoaXMgb25lLiBXZSBhbHNv
IGRvbid0IG5lZWQgYQ0KbmV3IHBhdGNoIGZvciBpdC4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0K
PiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

