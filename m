Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17D418902
	for <lists+xen-devel@lfdr.de>; Sun, 26 Sep 2021 15:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196123.348951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUTy6-00013z-Vu; Sun, 26 Sep 2021 13:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196123.348951; Sun, 26 Sep 2021 13:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUTy6-00011I-Rt; Sun, 26 Sep 2021 13:13:22 +0000
Received: by outflank-mailman (input) for mailman id 196123;
 Sun, 26 Sep 2021 13:13:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ODXE=OQ=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mUTy5-00011C-9A
 for xen-devel@lists.xenproject.org; Sun, 26 Sep 2021 13:13:21 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a05762b7-a0b2-4b88-90d7-78d11a945d36;
 Sun, 26 Sep 2021 13:13:18 +0000 (UTC)
Received: from DB6PR07CA0017.eurprd07.prod.outlook.com (2603:10a6:6:2d::27) by
 DB8PR08MB5516.eurprd08.prod.outlook.com (2603:10a6:10:f9::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15; Sun, 26 Sep 2021 13:13:16 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::8) by DB6PR07CA0017.outlook.office365.com
 (2603:10a6:6:2d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.8 via Frontend
 Transport; Sun, 26 Sep 2021 13:13:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Sun, 26 Sep 2021 13:13:16 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Sun, 26 Sep 2021 13:13:15 +0000
Received: from ea46bd69b4b9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 683343D1-C111-4DCF-AA44-B128E6AA00CB.1; 
 Sun, 26 Sep 2021 13:13:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea46bd69b4b9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 26 Sep 2021 13:13:04 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6155.eurprd08.prod.outlook.com (2603:10a6:10:1f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Sun, 26 Sep
 2021 13:13:01 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Sun, 26 Sep 2021
 13:13:01 +0000
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
X-Inumbo-ID: a05762b7-a0b2-4b88-90d7-78d11a945d36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovA0XASrJjq008VECFLU/ddTx6Ar8xjVWsVwT5yfezg=;
 b=SdWHW/tObGtYBlcdm2e5pLprvuZ0PaRtw0McvC0rpU64FbzSCQWUZXI3kruFXbjO5/ZkieJtTLAX70kGpx9KT8xlETRPPnE8Ok1JdJleezsWGFF4X3i2x+lBUJIFX33Bbl8ZkgdyiWIf+CuXzzkeAurtqFjRAt5Pk8zDmFkpz4M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sd5sY18UMc1pL2ewjelIS9L9DQaMtioRMkzCzK5o6KeLx1UwxjAPSxFieQ/eBU9YG6uVmqu3gnM494zkc66Mq9qcikp/z3q3h0S8jXJFec0a2seoIoDahyhDtQ05HW4WFfZyhhuWUHwQhd1dAgEFD9KHh5kz3VCrHZO5QKu6cZ6ZQdii/4SXSgejRBmVBGeyPPa5476gJRvvP6IU9f+DnvRNdWXhOumVq+ERCbqXfKYP5FbpVkLM0DhnmfQ4XghII2wjEAh8RlHkklvmMLkAc0ok+loHqcSfWZxZ/VfPIv12h9DTUxkSKWznNXlWDg7ACLo8twytlfx/corYtz7FXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ovA0XASrJjq008VECFLU/ddTx6Ar8xjVWsVwT5yfezg=;
 b=RV3C2ujYTdA/VTwWnYRRflYxOKe2ejQISOSndefEbDM7SERRyQiThDvpohbmVPEp6IOqb2v+VBNCn6kBoYmeL6rhQAYVFROFueUhC6//on/zOhFtJztCn4pvUKv42jzJlZHOf+Tf/6/ShFG8bWH1RSC9mzjs+isCrLexPeyBiO1vHnsSBrBjPmJgZjrAdBFHXUBljY4Uq1CpPu0AG6pIjelXCnQN0WK0ryA3ymunbObNZnf0rhYBGHrOj7ZMIZYJVrp2RhuuQJgKsLv+onwKQftD7vjI0q04t45XzqFeEVjHlMnBj2UoTKLS7Ai24x3oVeGq03qHLlKRHmvEmPUmpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovA0XASrJjq008VECFLU/ddTx6Ar8xjVWsVwT5yfezg=;
 b=SdWHW/tObGtYBlcdm2e5pLprvuZ0PaRtw0McvC0rpU64FbzSCQWUZXI3kruFXbjO5/ZkieJtTLAX70kGpx9KT8xlETRPPnE8Ok1JdJleezsWGFF4X3i2x+lBUJIFX33Bbl8ZkgdyiWIf+CuXzzkeAurtqFjRAt5Pk8zDmFkpz4M=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Topic: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Index: AQHXsHMrRDdmLUiNMk+huFUWk4EjYquyZ70AgAPY1CA=
Date: Sun, 26 Sep 2021 13:13:01 +0000
Message-ID:
 <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-23-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B8845E157B8DDA4D96BC41621B9A2BA7.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ee920c2c-7447-4ed6-e2da-08d980ef6714
x-ms-traffictypediagnostic: DBBPR08MB6155:|DB8PR08MB5516:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB55166F7B0F5F8BD4A053A69F9EA69@DB8PR08MB5516.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IiPz2rxj5Zn79Hj9T0sf3IH2mcWX7kFUQ/99VqGaIvF7Nq1JYEeTPjoGaWQZ/u9dL5E5yWGZh9WAYHZ3IDFYJu7883/VNuNnVATDT1Yv7ykYd8S3ngSVDdIe/CVxqV6GyA2obZ/by2nTnDGRjzqRFD24ZCe8/wUC3v6AYyvzO3Gn825SIgD6zkRe7fwgcCp1vnrDROl5BzX74zz+mox03m06UhxW2RGzGqNnd20mVRQk7oAyWf0bPISYtkNX2AKA3NwJqBp0W2r29qDsgSl7FGRScMyiNZ99Z1TR558xB/Td84jJrPbW65aFJkwIUQ6aPJnKqgDWPKszjj04vgNEShCLDuaHlXEKs38CcgJE6BDKfVmkiPIIdK5LozD1ZVfSySjr6GJt6tPhMM8z22L02Jj5VepFSSx1URb27fDlnfqNB5f9YWsOYnjTkxYsiaPYNlK7k6vIE88A8vhRTCueQ5JCfUHqFKkbaFHLekl26wwApUsJU9PdeQWvMQ+9qrryiTwqN/rvqsE5uIgpG7XeGUrLmFRMIa1J/Fra+dMlLYSxejjabWsQPBVvnB8WSbocfubHX6Qj/dTtZ4uuepfLrGYAh87IS+8xslvVnwnp6pdO7Df6+vwaG28MkLYcE3Gdba4bqXkhUz/7g5j50DRh+C25eHjHlXaTzCR/YtF21heAk9B8iNmQiuFDG3wzOTfgjIe8Y07f0Rz+m5ni60muuDO746sLNqUb7J8EZeqqD08lFWMITdtbuT1CIQNq1+/gVf50fZCspuJt7DwUWPn4Ujk+e5qiLbaRA/G+HED6WEc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(966005)(38070700005)(9686003)(71200400001)(66476007)(86362001)(26005)(4326008)(66946007)(52536014)(83380400001)(6506007)(53546011)(55016002)(8676002)(66446008)(66556008)(122000001)(64756008)(186003)(54906003)(316002)(33656002)(7696005)(8936002)(38100700002)(6916009)(508600001)(2906002)(76116006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6155
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2d4c209-f5d8-4974-4715-08d980ef5e5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2fMP9rGXyziCG3hpk3u/kYGKGdNLmCaTbaQmlNVfYoltH4rMehShcr8PFkh64DDMxCKXA4BcBvGaAIPvde6DGsyvD/0O2naZKeqacqmPrSAp3lGPf8vbU2PaqJpFhjshz9Xg1Ity6MOtPNeEm20ky1Xwa65JGD61K+njwLm3m965qeE3pxY3cf6XIifa6eKmdceC3hC9y81TMsgBHN+PA8GvmJUJU7bHOKwHUZyc9zPNM8s7XrOeyeVLKG/R2U3yb6HAhn2hVYv0nKjIP66UX1rrDLtu1jNxTJJuhuNt5mqS3UNMwSGRWosn7T//uyDiBp9R4FDlTFQWdYh5Vz8PtSoN1alzpaBo1l/W2JXNt6mFbdblFMVAd60b13iW3GP79SQ7N8tVJrD2fk9P3JbZ8AOoFX17VNL1GD+O3GNI6hFmQrtcUnjfXBcfau3M0Fxd2tGwG8/Om3jA0KQ2JFqdAzkISxmolC+Ljj/Bp7MmmDmKJ680Y1z5diUI81ACuL/GklhuY0099BvcKITL0LVyac4776Ulx3Z9eWNMetIF2EoO1aeLHgp2gsuKo58rgvN7K+cpNlTpJW/32YQFAlE9Vj1iyE1Fa12tDIONWnCoexwjG1y/iMGjId+pShuKCmweJ5atcHLzd2QjoPoCUFqSj5fXXVxzv4hwGiNvnIhlpHtGxIs3vG1R7EW4YAYB+ms05D5jR6BWzD4DvTXEI+cPNtgGqURb8a5nL5R7+sWm0ClPKtCYfu+8BXrFLBfJ6cSCaFBuxXYZUvgaOoN/TrnqewU8wUv/B012fLjM9q6yWBI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(47076005)(8936002)(186003)(8676002)(336012)(54906003)(316002)(36860700001)(6506007)(6862004)(53546011)(83380400001)(4326008)(81166007)(2906002)(5660300002)(70586007)(966005)(33656002)(55016002)(70206006)(9686003)(82310400003)(52536014)(508600001)(26005)(356005)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2021 13:13:16.4516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee920c2c-7447-4ed6-e2da-08d980ef6714
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5516

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgOTozNQ0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMjIvMzddIHhlbi9hcm06IHVzZSBOUl9NRU1fQkFOS1Mg
dG8gb3ZlcnJpZGUgZGVmYXVsdA0KPiBOUl9OT0RFX01FTUJMS1MNCj4gDQo+IE9uIFRodSwgMjMg
U2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEFzIGEgbWVtb3J5IHJhbmdlIGRlc2NyaWJl
ZCBpbiBkZXZpY2UgdHJlZSBjYW5ub3QgYmUgc3BsaXQgYWNyb3NzDQo+ID4gbXVsdGlwbGUgbm9k
ZXMuIFNvIHdlIGRlZmluZSBOUl9OT0RFX01FTUJMS1MgYXMgTlJfTUVNX0JBTktTIGluDQo+ID4g
YXJjaCBoZWFkZXIuDQo+IA0KPiBUaGlzIHN0YXRlbWVudCBpcyB0cnVlIGJ1dCB3aGF0IGlzIHRo
ZSBnb2FsIG9mIHRoaXMgcGF0Y2g/IElzIGl0IHRvDQo+IHJlZHVjZSBjb2RlIHNpemUgYW5kIG1l
bW9yeSBjb25zdW1wdGlvbj8NCj4gDQoNCk5vLCB3aGVuIEp1bGllbiBhbmQgSSBkaXNjdXNzZWQg
dGhpcyBpbiBsYXN0IHZlcnNpb25bMV0sIHdlIGhhZG4ndCB0aG91Z2h0DQpzbyBkZWVwbHkuIFdl
IGp1c3QgdGhvdWdodCBhIG1lbW9yeSByYW5nZSBkZXNjcmliZWQgaW4gRFQgY2Fubm90IGJlIHNw
bGl0DQphY3Jvc3MgbXVsdGlwbGUgbm9kZXMuIFNvIE5SX01FTV9CQU5LUyBzaG91bGQgYmUgZXF1
YWwgdG8gTlJfTUVNX0JBTktTLg0KDQpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMjEtMDgvbXNnMDA5NzQuaHRtbCANCg0KPiBJIGFtIGFza2lu
ZyBiZWNhdXNlIE5SX01FTV9CQU5LUyBpcyAxMjggYW5kDQo+IE5SX05PREVfTUVNQkxLUz0yKk1B
WF9OVU1OT0RFUyB3aGljaCBpcyA2NCBieSBkZWZhdWx0IHNvIGFnYWluDQo+IE5SX05PREVfTUVN
QkxLUyBpcyAxMjggYmVmb3JlIHRoaXMgcGF0Y2guDQo+IA0KPiBJbiBvdGhlciB3b3JkcywgdGhp
cyBwYXRjaCBhbG9uZSBkb2Vzbid0IG1ha2UgYW55IGRpZmZlcmVuY2U7IGF0IGxlYXN0DQo+IGRv
ZXNuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZSB1bmxlc3MgQ09ORklHX05SX05VTUFfTk9ERVMgaXMg
aW5jcmVhc2VkLg0KPiANCj4gU28sIGlzIHRoZSBnb2FsIHRvIHJlZHVjZSBtZW1vcnkgdXNhZ2Ug
d2hlbiBDT05GSUdfTlJfTlVNQV9OT0RFUyBpcw0KPiBoaWdoZXIgdGhhbiA2ND8NCj4gDQoNCkkg
YWxzbyB0aG91Z2h0IGFib3V0IHRoaXMgcHJvYmxlbSB3aGVuIEkgd2FzIHdyaXRpbmcgdGhpcyBw
YXRjaC4NCkNPTkZJR19OUl9OVU1BX05PREVTIGlzIGluY3JlYXNpbmcsIGJ1dCBOUl9NRU1fQkFO
S1MgaXMgYSBmaXhlZA0KdmFsdWUsIHRoZW4gTlJfTUVNX0JBTktTIGNhbiBiZSBzbWFsbGVyIHRo
YW4gQ09ORklHX05SX05VTUFfTk9ERVMNCmF0IG9uZSBwb2ludC4NCg0KQnV0IEkgYWdyZWUgd2l0
aCBKdWxpZW4ncyBzdWdnZXN0aW9uLCBOUl9NRU1fQkFOS1MgYW5kIE5SX05PREVfTUVNQkxLUw0K
bXVzdCBiZSBhd2FyZSBvZiBlYWNoIG90aGVyLiBJIGhhZCB0aG91Z2h0IHRvIGFkZCBzb21lIEFT
U0VSVCBjaGVjaywNCmJ1dCBJIGRvbid0IGtub3cgaG93IHRvIGRvIGl0IGJldHRlci4gU28gSSBw
b3N0IHRoaXMgcGF0Y2ggZm9yIG1vcmUNCnN1Z2dlc3Rpb24uDQoNCj4gDQo+ID4gQW5kIGtlZXAg
ZGVmYXVsdCBOUl9OT0RFX01FTUJMS1MgaW4gY29tbW9uIGhlYWRlcg0KPiA+IGZvciB0aG9zZSBh
cmNoaXRlY3R1cmVzIE5VTUEgaXMgZGlzYWJsZWQuDQo+IA0KPiBUaGlzIGxhc3Qgc2VudGVuY2Ug
aXMgbm90IGFjY3VyYXRlOiBvbiB4ODYgTlVNQSBpcyBlbmFibGVkIGFuZA0KPiBOUl9OT0RFX01F
TUJMS1MgaXMgc3RpbGwgZGVmaW5lZCBpbiB4ZW4vaW5jbHVkZS94ZW4vbnVtYS5oICh0aGVyZSBp
cyBubw0KPiB4ODYgZGVmaW5pdGlvbiBvZiBpdCkNCj4gDQoNClllcy4NCg0KPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgeGVu
L2luY2x1ZGUvYXNtLWFybS9udW1hLmggfCA4ICsrKysrKystDQo+ID4gIHhlbi9pbmNsdWRlL3hl
bi9udW1hLmggICAgIHwgMiArKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbnVtYS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmgNCj4gPiBpbmRleCA4ZjFjNjdl
M2ViLi4yMTU2OWU2MzRiIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVt
YS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmgNCj4gPiBAQCAtMyw5ICsz
LDE1IEBADQo+ID4NCj4gPiAgI2luY2x1ZGUgPHhlbi9tbS5oPg0KPiA+DQo+ID4gKyNpbmNsdWRl
IDxhc20vc2V0dXAuaD4NCj4gPiArDQo+ID4gIHR5cGVkZWYgdTggbm9kZWlkX3Q7DQo+ID4NCj4g
PiAtI2lmbmRlZiBDT05GSUdfTlVNQQ0KPiA+ICsjaWZkZWYgQ09ORklHX05VTUENCj4gPiArDQo+
ID4gKyNkZWZpbmUgTlJfTk9ERV9NRU1CTEtTIE5SX01FTV9CQU5LUw0KPiA+ICsNCj4gPiArI2Vs
c2UNCj4gPg0KPiA+ICAvKiBGYWtlIG9uZSBub2RlIGZvciBub3cuIFNlZSBhbHNvIG5vZGVfb25s
aW5lX21hcC4gKi8NCj4gPiAgI2RlZmluZSBjcHVfdG9fbm9kZShjcHUpIDANCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUveGVuL251bWEuaCBiL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4g
PiBpbmRleCAxOTc4ZTJiZTFiLi4xNzMxZTFjYzZiIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9udW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gQEAg
LTEyLDcgKzEyLDkgQEANCj4gPiAgI2RlZmluZSBNQVhfTlVNTk9ERVMgICAgMQ0KPiA+ICAjZW5k
aWYNCj4gPg0KPiA+ICsjaWZuZGVmIE5SX05PREVfTUVNQkxLUw0KPiA+ICAjZGVmaW5lIE5SX05P
REVfTUVNQkxLUyAoTUFYX05VTU5PREVTKjIpDQo+ID4gKyNlbmRpZg0KPiA+DQo+ID4gICNkZWZp
bmUgdmNwdV90b19ub2RlKHYpIChjcHVfdG9fbm9kZSgodiktPnByb2Nlc3NvcikpDQo+ID4NCj4g
PiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=

