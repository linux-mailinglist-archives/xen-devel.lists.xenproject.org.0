Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585745035F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225801.390024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma5I-0003Qw-LM; Mon, 15 Nov 2021 11:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225801.390024; Mon, 15 Nov 2021 11:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma5I-0003NN-I4; Mon, 15 Nov 2021 11:23:36 +0000
Received: by outflank-mailman (input) for mailman id 225801;
 Mon, 15 Nov 2021 11:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z40d=QC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mma5G-0002bn-N0
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:23:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77386de3-4606-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 12:23:33 +0100 (CET)
Received: from AS9PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:20b:48b::7)
 by AM0PR08MB3122.eurprd08.prod.outlook.com (2603:10a6:208:5d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 11:23:29 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::e4) by AS9PR04CA0072.outlook.office365.com
 (2603:10a6:20b:48b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Mon, 15 Nov 2021 11:23:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Mon, 15 Nov 2021 11:23:29 +0000
Received: ("Tessian outbound 8133f76bddb7:v109");
 Mon, 15 Nov 2021 11:23:28 +0000
Received: from c56afb978220.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0376888-B4E7-4B99-B411-B297BCB545BF.1; 
 Mon, 15 Nov 2021 11:23:22 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c56afb978220.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Nov 2021 11:23:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB7025.eurprd08.prod.outlook.com (2603:10a6:20b:34c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 11:23:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 11:23:20 +0000
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
X-Inumbo-ID: 77386de3-4606-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pjqkM2wbhg4fHFcCEukz2roOzAeRzKdg5zK+OlglCo=;
 b=T04WCAhW+GDwYdtOSc1QZmPh0dYQWDpr9aUSAcTfdXTmZvph4ZblsF9XUEt+HqwGHlYQClliMTKQXPTpjh1Q1okod1qnZ5c3xX/4tePATh3GEPhmXWyPDyFLF18WzE3rkpOp5nD8qsbHXPqN6z4Fa3WNcXvu47BTSn5/BHAZddU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8508c93ce2f4238c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnNFN9z66nqMhAtMSCLe8upPqNeyvDdh4GAccc4iOgDGjjdsfHvW1oINRWGpt/9JvtzlQ50XS2ZuVqrCtx/XEdhvljWsiAC5mkl8twTy1qyX11AQWY4xiPN4QG2CJREDz+YMz6Y2dFwRiCinMA91xG+uJXAVCE7A9EIdo5/pnLS0O7iE/FNTjfs9AO+pfsA/CMSS5oI5FtMB26OOVb5ZGwyzqEPDr9V+xqbKxr/2yQpukjOuXAaEq4KjqyAu85KHr7nblAGrUphA+OaWifzHf+CtnM10iBAOMtBD6+I9yrUJaC+oTwTdWWrKSVSnCq1dEKC+2FBSP71xXVMBKDX9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pjqkM2wbhg4fHFcCEukz2roOzAeRzKdg5zK+OlglCo=;
 b=bsaS/kcIocoxvoDkIIhGQyI3d8sZxYec4+wy0eW4KGqyIyCNW756wK8AgftVF6b4HOVP0ZV4NKs5BsAFHp0ryS4b5UsSEaFEFGV9b03gjiBZgbG98bhHTTEr0fB+tWID2o23Ybe1SVpP6U9+5GIEURK/LQREJbuKfj9XYpzEl4Rb/0ijNAqa3cSiN71Dj8r8fq/XR5LDVl084F2z6Dbu6Pzjdtu0Z5CH9HQ1hh3lIpxbJnVBDhlRXB7lPeEubGP97QHDLsG1fFLdIDdiO459OZJeMz9qbTkxSDz/IqvRFp7+alhbZ8azZTRM2NQf0ZxBcyOIYAMqYaZGnu0C1HRccQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pjqkM2wbhg4fHFcCEukz2roOzAeRzKdg5zK+OlglCo=;
 b=T04WCAhW+GDwYdtOSc1QZmPh0dYQWDpr9aUSAcTfdXTmZvph4ZblsF9XUEt+HqwGHlYQClliMTKQXPTpjh1Q1okod1qnZ5c3xX/4tePATh3GEPhmXWyPDyFLF18WzE3rkpOp5nD8qsbHXPqN6z4Fa3WNcXvu47BTSn5/BHAZddU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Thread-Topic: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Thread-Index: AQHX1yW51DCh4Kb6WkC+olJaqOqcEawEZHMAgAACF4CAAADoAIAACOmAgAAHu4A=
Date: Mon, 15 Nov 2021 11:23:20 +0000
Message-ID: <02EF96BF-D2A6-4415-A6E9-B9511C18C895@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com>
 <a1b2aa1b-7d8a-4ab6-cde5-25581ee9841c@suse.com>
 <C3FB48C2-F619-48A2-9268-F0938405133C@arm.com>
 <fc9fd8d6-7461-367c-01c6-f4c852e13f54@suse.com>
In-Reply-To: <fc9fd8d6-7461-367c-01c6-f4c852e13f54@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 25e9139e-863c-4afa-9f4c-08d9a82a5990
x-ms-traffictypediagnostic: AS8PR08MB7025:|AM0PR08MB3122:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB31229106FD467F6722AA9DFB9D989@AM0PR08MB3122.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c26017PxujNTuqpz/zxj8CJDbd06hauquHHJv7l1UEtmpg3OXdNx+1kETO/9ntZD2ZaMif7oPujzx4WJPAimHKHeudNZavy0x70b/Vb8WBmTheKGvoOC+Nn8WqqAVtz2008DTEJm8bTEp1tqoIXySUtyoTp/D2HTC+tSEUFaq+qIUkVY00ha4bFk0wfA5kgPtAuhGXaAYEkfAGR6Q/jNacu9Z/x/Iso0Vj+LaYYxQDidZFeUSNlLhY8ls6OY2afmC2P2q3kf0smeCWDQTv2L5KzdXEx1cELsQ99DHoqSdlDUpA1quzhqoBiaNkNt/BoWvhH7ZhazyV90POOXeSkfc2+D7CPoksIMncntSgwgE+rOdgg4RUkZQsO4gm+jVlFaM4SMKqmcaIVUG4tByoeMUpdJsj77i1eWT+MdGznGhhloBYsBQHSNt43b2OFhWfYupBk3TWBcmQkgK5bJjafSfMHXHZuCS+l9iYxM/ZnArk36z8YJ2iWgB5tSJ3Jz7JrHq7HZ+j2W1EhJ0T9BxbKIrFCqVt7s7g+c6t87Q/Q47KyaKLA4youL+AfUs37y+xftEa6bcoppwLG987NEKTHOR6jwWvC7vP5JH8mA54Igsy1HRrORZWjLhhLSVnevjzOVN/YjUKgZ+huRr0VdkM9orYQvgTzcLrJz7cTBEzxBAMAo368eFfut3eBIRX3AYdRh3X5PdIzTfzYrxk+DqWnEIuiL6+ORgnRtPcNMukYx+EnhWrymtJDs30e76t7J4phL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(5660300002)(26005)(71200400001)(38070700005)(4326008)(54906003)(508600001)(316002)(33656002)(6506007)(8936002)(91956017)(2616005)(8676002)(6486002)(53546011)(86362001)(6512007)(38100700002)(76116006)(66446008)(36756003)(66556008)(122000001)(66476007)(64756008)(186003)(6916009)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7876EEDA6EC95342BDB6BD9DF10487B2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7025
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3571cca4-3eb3-4a3e-f3bb-08d9a82a5450
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r4WzjYT6OjwNC2IkqdTy75iv4CluL8IyRB/shmkdcnblAAZQ5pGlBW/Hgfdf4ahNME4qzd3zsOGIfl1wBu9nLOsUT8jBxRlAOKR3EptD2xKeb2pFLX2u71o0RBijcL/1nx6LcJvoJlh0KpVK3nTSU3c9vmLGRCyNSljImRzlNT2P2QLllSsjKi3NK6BKZTq5HIkpUQ/F+KWuwXpAwybv851VeQbXEKQXB6D1AZHX4OBUzyN/8id40luhqU+a7GN26nFnU6ERSNEWSCoG3MwhHRbPCItURM+MqG7IFiA6moieH21Ss88egTN5FY67TQbDv4wQ8SmEklQkictWXDQp6Xc1ApqaVc4rXcj1iFUuEeAPhFPUzli8c2zB2sXAXOCoXj1e1d9xfUrwOggbwqXa++weKVtqzVAIqO1L4z9gOlEWLy648rXEZU1UKGgF+VXL+huDO4KUKuM1OU4i1VzAoax77Dg48ngOF36AMJT0ftKnekAzf+axRnP9WNPkRHnBreoqm/y689dBjg2RYCNuihUHYORpt2ztKPhNNKxnfcK5M4CUi/jDiSWNINinF7XBnjKmGIjxE5vqYWX5JDuz0jp4WNb0u05ZN4h7E38kor7QsMRMn8I/QOlCupOVJ/zOUf/bxI/okXqFyLgS0Pw2LYdwbL+TNve29W5cT/cMNQvboVVr67vjUdJhhCRlfiSFDYI4IuQnPzwR0wFRmJw01w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(2906002)(6862004)(5660300002)(47076005)(70206006)(86362001)(70586007)(316002)(107886003)(508600001)(36756003)(33656002)(6506007)(8676002)(336012)(8936002)(53546011)(36860700001)(2616005)(26005)(4326008)(186003)(6486002)(6512007)(356005)(54906003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:23:29.3309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e9139e-863c-4afa-9f4c-08d9a82a5990
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3122

SGkgSmFuLA0KDQo+IE9uIDE1IE5vdiAyMDIxLCBhdCAxMDo1NSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE1LjExLjIwMjEgMTE6MjMsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKYW4sDQo+PiANCj4+PiBPbiAxNSBOb3YgMjAyMSwgYXQg
MTA6MjAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g
T24gMTUuMTEuMjAyMSAxMToxMywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+IE9uIDEx
IE5vdiAyMDIxLCBhdCAxNzo1NywgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6DQo+Pj4+PiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jDQo+Pj4+PiArKysg
Yi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+Pj4+PiBAQCAtMTIzNCwxNSArMTIzNCwxOCBAQCBpbnQg
dmNwdV91bnBhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIoc3RydWN0IHZjcHUgKnYpDQo+Pj4+PiAg
IHJldHVybiAwOw0KPj4+Pj4gfQ0KPj4+Pj4gDQo+Pj4+PiAtc3RhdGljIHZvaWQgZG9fZG9tYWlu
X3BhdXNlKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvaWQgKCpzbGVlcF9mbikoc3RydWN0IHZjcHUgKnYpKQ0KPj4+Pj4gK3N0YXRpYyB2b2lk
IF9kb21haW5fcGF1c2Uoc3RydWN0IGRvbWFpbiAqZCwgYm9vbCBzeW5jIC8qIG9yIG5vc3luYyAq
LykNCj4+Pj4gDQo+Pj4+IEhlcmUgeW91IHVzZSBjb21tZW50cyBpbnNpZGUgdGhlIGZ1bmN0aW9u
IGRlZmluaXRpb24uDQo+Pj4+IEkgdGhpbmsgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCBzaG91bGQg
YmUgYXZvaWRlZCBhbmQgaW4gdGhpcyBzcGVjaWZpYyBjYXNlIGENCj4+Pj4gYm9vbGVhbiBzeW5j
IGlzIGNsZWFyIGVub3VnaCBub3QgdG8gbmVlZCB0byBleHBsYWluIHRoYXQgZmFsc2UgaXMgbm9z
aW5nLg0KPj4+IA0KPj4+IFdoaWxlIEkgYWdyZWUgdGhlIGNvbW1lbnQgaGVyZSBpc24ndCBvdmVy
bHkgdXNlZnVsLCBJIHRoaW5rIC4uLg0KPj4+IA0KPj4+Pj4gQEAgLTEyNTAsMTIgKzEyNTMsMTIg
QEAgc3RhdGljIHZvaWQgZG9fZG9tYWluX3BhdXNlKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+PiB2
b2lkIGRvbWFpbl9wYXVzZShzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+Pj4gew0KPj4+Pj4gICBBU1NF
UlQoZCAhPSBjdXJyZW50LT5kb21haW4pOw0KPj4+Pj4gLSAgICBkb19kb21haW5fcGF1c2UoZCwg
dmNwdV9zbGVlcF9zeW5jKTsNCj4+Pj4+ICsgICAgX2RvbWFpbl9wYXVzZShkLCB0cnVlIC8qIHN5
bmMgKi8pOw0KPj4+PiBTYW1lIGhlcmUuDQo+Pj4gDQo+Pj4gLi4uIGNvbW1lbnRzIGxpa2UgdGhp
cyBvbmUgYXJlIHByZXR0eSB1c2VmdWwgdG8gZGlzYW1iaWd1YXRlIHRoZSBwbGFpbg0KPj4+ICJ0
cnVlIiBvciAiZmFsc2UiICh3aXRob3V0IHRoZSByZWFkZXIgbmVlZGluZyB0byBnbyBsb29rIGF0
IHRoZSBmdW5jdGlvbg0KPj4+IGRlY2xhcmF0aW9uIG9yIGRlZmluaXRpb24pLg0KPj4gDQo+PiBJ
IGFncmVlIHdpdGggdGhhdCBidXQgdGhlIGNvbW1lbnQgaGVyZSBpcyB1c2VmdWwsIGl0IGNvdWxk
IGJlIGFkZGVkIGJlZm9yZQ0KPj4gdGhlIGNhbGwgaW5zdGVhZCBvZiBpbnNpZGUgaXQuDQo+IA0K
PiBFeGNlcHQgdGhlIGZvcm0gQW5kcmV3IGhhcyB1c2VkIGlzIHRoZSBvbmUgd2UndmUgYmVlbiB1
c2luZyBlbHNld2hlcmUNCj4gZm9yIHNvbWUgdGltZS4NCg0KSSBrbm93IEkgZm91bmQgc29tZSBv
dGhlciBleGFtcGxlcyBhbmQgdGhhdCB3aHkgSSBzYXkg4oCcc2hvdWxk4oCdIGFuZCBub3QgbXVz
dC4NCklmIG90aGVyIGNvbnNpZGVyIHRoYXQgdGhpcyBpcyB0aGUgcmlnaHQgd2F5IHRvIGdvIGFu
ZCBzaG91bGQgbm90IGJlIGNoYW5nZWQgdGhpcw0KaXMgb2sgd2l0aCBtZSBidXQgSSB3YW50ZWQg
dG8gbWFrZSB0aGUgY29tbWVudCBhcyB0aGlzIGNvdWxkIGVhc2UgdGhlIHdvcmsNCndpdGggRnVT
YSBhbmQgTWlzcmEgY29tcGxpYW5jZSBpbiB0aGUgZnV0dXJlLg0KDQpCZXJ0cmFuZA0KDQo+IA0K
PiBKYW4NCg0K

