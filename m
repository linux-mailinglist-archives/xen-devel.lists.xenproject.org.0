Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AF63FE7CA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 04:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176848.321885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLcmx-0002xL-Hm; Thu, 02 Sep 2021 02:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176848.321885; Thu, 02 Sep 2021 02:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLcmx-0002ua-E3; Thu, 02 Sep 2021 02:49:15 +0000
Received: by outflank-mailman (input) for mailman id 176848;
 Thu, 02 Sep 2021 02:49:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=do2V=NY=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mLcmv-0002uU-W6
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 02:49:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::625])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ea214a7-0b2b-42ba-a15c-c2ba08ef346f;
 Thu, 02 Sep 2021 02:49:11 +0000 (UTC)
Received: from AM6P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::25)
 by VE1PR08MB5741.eurprd08.prod.outlook.com (2603:10a6:800:1b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 02:49:07 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::5a) by AM6P191CA0012.outlook.office365.com
 (2603:10a6:209:8b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Thu, 2 Sep 2021 02:49:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 02:49:05 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Thu, 02 Sep 2021 02:49:05 +0000
Received: from fe5c61d1ba8d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D0BD3C8B-8302-442D-A88F-722B8C8FC3DE.1; 
 Thu, 02 Sep 2021 02:48:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe5c61d1ba8d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Sep 2021 02:48:58 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3532.eurprd08.prod.outlook.com (2603:10a6:10:4f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 02:48:46 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%7]) with mapi id 15.20.4457.026; Thu, 2 Sep 2021
 02:48:46 +0000
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
X-Inumbo-ID: 4ea214a7-0b2b-42ba-a15c-c2ba08ef346f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51bC7OwzeC89ccTfqq5DnigU2oiyXRd0TM+PRBRudxM=;
 b=wSLtzGuLZNWvxM58rp7NJDBWUCx6PPDfax8JLMBi7tI/iP3ffWxeWmzUGVqQqO3R0WFxFJCf/oa4tJ0KrEizsRibY/gxL2foCTQRiTeKfN25lMHaNryOpTD+zqrxtj6LgUBC2W1yGhNQAfCdNA9KVnAKaabE34pfmN/gPVFTKOQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCB8cAkCmJaEICifainkhzoQRYdCKf5IrnwazooulxHDurnvncQLvs53O0knu7Ew5SrLRSuV7QlrR/Elyg+oO/Ieh4FUysB2RPnMOw1FIhGzrbBaVHwlBJWdj+hNSfBMzfToEUSnraTWGsMYsuPdx63eriaph8lM6Y4Cq1DVqbazU1jMASUoYHtkQw4No6RaAjfufldtFiSXH3B9e359kUgUo2CvgeA5uOa3X8Wwj2srecVrszOy31RhlQfYa5bSKHovD0XcmXWXKn97haYphRVdwhV7nfmctPVxgqwncuxYhC1rc1107e0j3FYoq+T2nbPNBO3ca/bPSbMsFlIs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=51bC7OwzeC89ccTfqq5DnigU2oiyXRd0TM+PRBRudxM=;
 b=bPsXPs0mq4II6mza68Knz2YUPD7WgX6g0mAZRvQeJ2PlZ9ihxVT3ZfBAM83gaxnOBqEa8CAyP5UCXbIYyHyXVqWpsH3htDv1kkWQsJR4jV1kR8m4zfUI+02ksqc485hEAd2l0grXpxgPqhw25qNJWiwouApbzAL10Dxy4OUFYrIJgAU7GyFaVbaZnfGEBOXJgk9Dax3wxdHUeXP8OOxVo1idgG6UyopXp6danQxKQCsTVn8yMx4NAXgtVk0N3S1N+fGJNpS5Kvu//i/hRfJa2Z8GKtmJTAAh/dxvGWj6EuZqXhiiXCJfaUU5ITTpWux239B9r9ccYVpXRoBQVQyxUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51bC7OwzeC89ccTfqq5DnigU2oiyXRd0TM+PRBRudxM=;
 b=wSLtzGuLZNWvxM58rp7NJDBWUCx6PPDfax8JLMBi7tI/iP3ffWxeWmzUGVqQqO3R0WFxFJCf/oa4tJ0KrEizsRibY/gxL2foCTQRiTeKfN25lMHaNryOpTD+zqrxtj6LgUBC2W1yGhNQAfCdNA9KVnAKaabE34pfmN/gPVFTKOQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 25/40] xen/arm: unified entry to parse all NUMA
 data from device tree
Thread-Topic: [XEN RFC PATCH 25/40] xen/arm: unified entry to parse all NUMA
 data from device tree
Thread-Index: AQHXjptEfh486q3QYEyqJH3oIGMDv6uM6C8AgAEbO4CAAZ5dgIAAiwHA
Date: Thu, 2 Sep 2021 02:48:45 +0000
Message-ID:
 <DB9PR08MB68579F8A62FB53FBE8256FE49ECE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-26-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301752501.17851@sstabellini-ThinkPad-T480s>
 <088e4b16-afea-8248-55f1-a081bba7f80c@xen.org>
 <alpine.DEB.2.21.2109011129050.17925@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109011129050.17925@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 83BC028FF5AB0541B4E6B989F2FBE67B.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b2a6cd65-eeec-49dc-65ed-08d96dbc3af3
x-ms-traffictypediagnostic: DB7PR08MB3532:|VE1PR08MB5741:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5741A65EE950C464481BC0D09ECE9@VE1PR08MB5741.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /YhbuRzgEnTa+Ydv3QJkCVdcVamAx0LTRUxPttkUMP+tD+Ic4sx94zgD5pqPkwnIF67CCE89sPdarWXGO1m8PxB0Qf2NIEFsRxOar9g9MvY0t9SVfXoM4Y+84LW4JO0HZXETd8g6TkezKiw+TtQM7fWdrozToNYXWlcdm8s0myHb3ZRKVRIsrX2ED23bHkzZanF1nVg429NMiwiEiAkUZzyfGCEApETN16eVvUq5OMTRp4NkFteEh/OLaRDGn6kTf2g7+sUkP+DmeO9Y6L6FEQORwt/+E8wrTf/8DNa77Ysnlv4jeeQEZxZIxrSNTQiVBQWejsD3+Tz6xRIX63YaAJrMxOEuPvxmQY0SSTwZU5pqYhO8TdFjret8jD9YEjsvL/PdxfCT40iDPkngTAJDnPM8wcVcpvq+hlLDWLPKzuNKzCISbkxnlrBa6/8XG5O2PaprQQVrEN9GMHdKzg7slnMWP4l/QApU/IuD2vIeoey/mM9ljsJWcnj2Wjiz8E54FCv2sU48DNUWqj5Rsr6UOuedPY6bNrYo1YNWfgwnsvkc8nc2Mbjtu89Kbob8MCzNkutMf+hVjtkNBCGgxDc4A50tJMcBggQxtL7S0/jH+sV8dY8crrxADrOg4U98F9uhhntCoRsGqyT07cbEDmr9yKH8o6Q1Qs7UBirkGq0gLxsfNGLSmm+DDtHDlS9HwVDXR23Nvtgo5hPGNjTEUlZ8Rw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(8936002)(83380400001)(71200400001)(38100700002)(6506007)(53546011)(5660300002)(122000001)(64756008)(26005)(66946007)(38070700005)(76116006)(66476007)(66446008)(66556008)(52536014)(478600001)(4326008)(186003)(2906002)(9686003)(316002)(55016002)(7696005)(54906003)(8676002)(33656002)(86362001)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3532
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b239dab7-fef3-4b94-bf6b-08d96dbc2f26
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DJHCDxfW0ZJjUtOVIHPJ818s7g+bG4cIP4a6KTrQxNpaj2OgeSqyJ7k8SnM9F0CWJHjgzRq6mswUOdiSu6VVwNY3p06KQUKy/iihtRfNWocxZzQzcNm2DLuh1Xfh1ZjOtHS+sQXQwNYqtnR9hEzwgM7VdRfhiDxk7KLOH1iN+1JARgHi92uYgKay/dXfKuCZ3wUgWV6rrkVq0Nk+UGabibkOh2z9OKFe6a5m11uv+kAwXZkZA9oP7wA9VgGeTIaW3I0S6ruCpT7t3SKtQCyzAvVGQpWDGlbOsNtREjCQUmHydt3MGEFDpQ3NI5Xr1dCSqljW5XGZkASBsIp9oGJLJich712d2BFycH66MvMP9Br8LrKK7IvWozKRhUObtPdB9psaik48jFk3/FYOK4K37bEeaMyMC7nZIWLRD1Sd1smBLYSxssHiBBUBdy10JrucqCEsHABGuWkYyoVHAkiRMFNYlZH9o0PE3IFTOQS8mBkjyn/c49t0hiTCl62VMYzvk2pMVrFsZXv5Tcbp3tNQyW101duXgyi5+aiVO+CzsA7gcL2aC7EuZMfSofejIEzag4eMGUy2kY8WdESOWnyNFouKcM5gwiifjVETy9XIwE0DaHAYJHOpa0sdC2JaW35g7sSfA5cbhpA8Plw20ToTszQuvLO/qxk6pA2NGY/VTrt+3jgLg460Ukw0hyYXp7GSPzL/Rfy5faJsCWy2r3KLgg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966006)(36840700001)(356005)(9686003)(8676002)(55016002)(8936002)(5660300002)(81166007)(316002)(52536014)(4326008)(33656002)(82740400003)(110136005)(54906003)(478600001)(7696005)(26005)(53546011)(83380400001)(186003)(70206006)(70586007)(336012)(47076005)(86362001)(82310400003)(36860700001)(2906002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 02:49:05.9195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a6cd65-eeec-49dc-65ed-08d96dbc3af3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5741

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDIxxOo51MIyyNUgMjozMQ0K
PiBUbzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaSBDaGVuDQo+IDxXZWkuQ2hlbkBhcm0u
Y29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBqYmV1bGljaEBzdXNlLmNvbTsN
Cj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0
OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjUvNDBdIHhlbi9hcm06IHVuaWZpZWQgZW50cnkgdG8gcGFy
c2UgYWxsDQo+IE5VTUEgZGF0YSBmcm9tIGRldmljZSB0cmVlDQo+IA0KPiBPbiBUdWUsIDMxIEF1
ZyAyMDIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4gSGkgU3RlZmFubywNCj4gPg0KPiA+IE9u
IDMxLzA4LzIwMjEgMDE6NTQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gPiA+IE9uIFdl
ZCwgMTEgQXVnIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+ID4gPiBJbiB0aGlzIEFQSSwgd2Ug
c2NhbiB3aG9sZSBkZXZpY2UgdHJlZSB0byBwYXJzZSBDUFUgbm9kZSBpZCwgbWVtb3J5DQo+ID4g
PiA+IG5vZGUgaWQgYW5kIGRpc3RhbmNlLW1hcC4gVGhvdWdoIGVhcmx5X3NjYW5fbm9kZSB3aWxs
IGludm9rZSBoYXMgYQ0KPiA+ID4gPiBoYW5kbGVyIHRvIHByb2Nlc3MgbWVtb3J5IG5vZGVzLiBJ
ZiB3ZSB3YW50IHRvIHBhcnNlIG1lbW9yeSBub2RlIGlkDQo+ID4gPiA+IGluIHRoaXMgaGFuZGxl
ciwgd2UgaGF2ZSB0byBlbWJlZGVkIE5VTUEgcGFyc2UgY29kZSBpbiB0aGlzIGhhbmRsZXIuDQo+
ID4gPiA+IEJ1dCB3ZSBzdGlsbCBuZWVkIHRvIHNjYW4gd2hvbGUgZGV2aWNlIHRyZWUgdG8gZmlu
ZCBDUFUgTlVNQSBpZCBhbmQNCj4gPiA+ID4gZGlzdGFuY2UtbWFwLiBJbiB0aGlzIGNhc2UsIHdl
IGluY2x1ZGUgbWVtb3J5IE5VTUEgaWQgcGFyc2UgaW4gdGhpcw0KPiA+ID4gPiBBUEkgdG9vLiBB
bm90aGVyIGJlbmVmaXQgaXMgdGhhdCB3ZSBoYXZlIGEgdW5pcXVlIGVudHJ5IGZvciBkZXZpY2UN
Cj4gPiA+ID4gdHJlZSBOVU1BIGRhdGEgcGFyc2UuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4g
ICB4ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jIHwgMzEgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0NCj4gLS0NCj4gPiA+ID4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCAg
ICAgIHwgIDEgKw0KPiA+ID4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9udW1hX2RldmljZV90cmVlLmMNCj4gPiA+ID4gYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2Vf
dHJlZS5jDQo+ID4gPiA+IGluZGV4IDZlMGQxZDNkOWYuLjI3ZmZiNzJmN2IgMTAwNjQ0DQo+ID4g
PiA+IC0tLSBhL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gPiA+ID4gKysrIGIv
eGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+ID4gPiBAQCAtMTMxLDcgKzEzMSw4
IEBAIHNhdmVfbWVtYmxrOg0KPiA+ID4gPiAgIH0NCj4gPiA+ID4gICAgIC8qIFBhcnNlIENQVSBO
VU1BIG5vZGUgaW5mbyAqLw0KPiA+ID4gPiAtaW50IF9faW5pdCBkZXZpY2VfdHJlZV9wYXJzZV9u
dW1hX2NwdV9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50DQo+IG5vZGUpDQo+ID4gPiA+ICtzdGF0
aWMgaW50IF9faW5pdA0KPiA+ID4gPiArZGV2aWNlX3RyZWVfcGFyc2VfbnVtYV9jcHVfbm9kZShj
b25zdCB2b2lkICpmZHQsIGludCBub2RlKQ0KPiA+ID4gPiAgIHsNCj4gPiA+ID4gICAgICAgdWlu
dDMyX3QgbmlkOw0KPiA+ID4gPiAgIEBAIC0xNDcsNyArMTQ4LDcgQEAgaW50IF9faW5pdA0KPiBk
ZXZpY2VfdHJlZV9wYXJzZV9udW1hX2NwdV9ub2RlKGNvbnN0DQo+ID4gPiA+IHZvaWQgKmZkdCwg
aW50IG5vZGUpDQo+ID4gPiA+ICAgfQ0KPiA+ID4gPiAgICAgLyogUGFyc2UgbWVtb3J5IG5vZGUg
TlVNQSBpbmZvICovDQo+ID4gPiA+IC1pbnQgX19pbml0DQo+ID4gPiA+ICtzdGF0aWMgaW50IF9f
aW5pdA0KPiA+ID4gPiAgIGRldmljZV90cmVlX3BhcnNlX251bWFfbWVtb3J5X25vZGUoY29uc3Qg
dm9pZCAqZmR0LCBpbnQgbm9kZSwNCj4gPiA+ID4gICAgICAgY29uc3QgY2hhciAqbmFtZSwgdWlu
dDMyX3QgYWRkcl9jZWxscywgdWludDMyX3Qgc2l6ZV9jZWxscykNCj4gPiA+ID4gICB7DQo+ID4g
PiA+IEBAIC0yMDIsNyArMjAzLDcgQEAgZGV2aWNlX3RyZWVfcGFyc2VfbnVtYV9tZW1vcnlfbm9k
ZShjb25zdCB2b2lkDQo+ICpmZHQsDQo+ID4gPiA+IGludCBub2RlLA0KPiA+ID4gPiAgIH0NCj4g
PiA+ID4gICAgIC8qIFBhcnNlIE5VTUEgZGlzdGFuY2UgbWFwIHYxICovDQo+ID4gPiA+IC1pbnQg
X19pbml0DQo+ID4gPiA+ICtzdGF0aWMgaW50IF9faW5pdA0KPiA+ID4gPiAgIGRldmljZV90cmVl
X3BhcnNlX251bWFfZGlzdGFuY2VfbWFwX3YxKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUpDQo+
ID4gPiA+ICAgew0KPiA+ID4gPiAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9w
Ow0KPiA+ID4gPiBAQCAtMjY3LDMgKzI2OCwyNyBAQCBkZXZpY2VfdHJlZV9wYXJzZV9udW1hX2Rp
c3RhbmNlX21hcF92MShjb25zdA0KPiB2b2lkDQo+ID4gPiA+ICpmZHQsIGludCBub2RlKQ0KPiA+
ID4gPiAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gPiAgIH0NCj4gPiA+ID4gKw0KPiA+ID4gPiAr
c3RhdGljIGludCBfX2luaXQgZmR0X3NjYW5fbnVtYV9ub2Rlcyhjb25zdCB2b2lkICpmZHQsDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgaW50IG5vZGUsIGNvbnN0IGNoYXIgKnVuYW1lLCBpbnQg
ZGVwdGgsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgdTMyIGFkZHJlc3NfY2VsbHMsIHUzMiBz
aXplX2NlbGxzLCB2b2lkICpkYXRhKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArICAgIGludCByZXQg
PSAwOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgaWYgKCBmZHRfbm9kZV9jaGVja190eXBlKGZk
dCwgbm9kZSwgImNwdSIpID09IDAgKQ0KPiA+ID4gPiArICAgICAgICByZXQgPSBkZXZpY2VfdHJl
ZV9wYXJzZV9udW1hX2NwdV9ub2RlKGZkdCwgbm9kZSk7DQo+ID4gPiA+ICsgICAgZWxzZSBpZiAo
IGZkdF9ub2RlX2NoZWNrX3R5cGUoZmR0LCBub2RlLCAibWVtb3J5IikgPT0gMCApDQo+ID4gPiA+
ICsgICAgICAgIHJldCA9IGRldmljZV90cmVlX3BhcnNlX251bWFfbWVtb3J5X25vZGUoZmR0LCBu
b2RlLCB1bmFtZSwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRk
cmVzc19jZWxscywgc2l6ZV9jZWxscyk7DQo+ID4gPiA+ICsgICAgZWxzZSBpZiAoIGZkdF9ub2Rl
X2NoZWNrX2NvbXBhdGlibGUoZmR0LCBub2RlLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAibnVtYS1kaXN0YW5jZS1tYXAtdjEiKSA9PSAwICkNCj4gPiA+ID4gKyAg
ICAgICAgcmV0ID0gZGV2aWNlX3RyZWVfcGFyc2VfbnVtYV9kaXN0YW5jZV9tYXBfdjEoZmR0LCBu
b2RlKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgIHJldHVybiByZXQ7DQo+ID4gPiA+ICt9DQo+
ID4gPg0KPiA+ID4gSnVsaWVuLCBkbyB5b3UgaGF2ZSBhbiBvcGluaW9uIG9uIHdoZXRoZXIgaXQg
bWlnaHQgYmUgd29ydGggcmV1c2luZw0KPiB0aGUNCj4gPiA+IGV4aXN0aW5nIGVhcmx5X3NjYW5f
bm9kZSBmdW5jdGlvbiBmb3IgdGhpcyB0byBhdm9pZGluZyBhbm90aGVyIGZ1bGwNCj4gRkRUDQo+
ID4gPiBzY2FuICh0byBhdm9pZCBhbm90aGVyIGNhbGwgdG8gZGV2aWNlX3RyZWVfZm9yX2VhY2hf
bm9kZSk/DQo+ID4NCj4gPiBJIGRvbid0IGxpa2UgdGhlIGZ1bGwgRkRUIHNjYW4gYW5kIGFjdHVh
bGx5IGRyYWZ0ZWQgYW4gZS1tYWlsIGluIHJlcGx5LQ0KPiB0byBbMV0NCj4gPiB0byBzdWdnZXN0
IHBhcnNlIGFsbCB0aGUgTlVNQSBpbmZvcm1hdGlvbiBmcm9tIGVhcmx5X3NjYW5fbm9kZSgpLg0K
PiA+DQo+ID4gSG93ZXZlciwgd2UgZG9uJ3Qga25vdyB3aGV0aGVyIEFDUEkgb3IgRFQgd2lsbCBi
ZSB1c2VkIGF0IHRoZSB0aW1lDQo+ID4gZWFybHlfc2Nhbl9ub2RlKCkgaXMgY2FsbGVkLiBTbyB3
ZSB3aWxsIG5lZWQgdG8gcmV2ZXJ0IGFueSBjaGFuZ2Ugd2hpY2gNCj4gY2FuDQo+ID4gbWFrZSB0
aGUgY29kZSBhIGxpdHRsZSBtb3JlIGF3a3dhcmQuDQo+ID4NCj4gPiBTbyBJIGRlY2lkZWQgdG8g
ZHJvcCBteSBlLW1haWwgYmVjYXVzZSBJIHByZWZlciB0aGUgZnVsbCBEVCBzY2FuIGZvciBub3cu
DQo+IFdlDQo+ID4gY2FuIGxvb2sgYXQgb3B0aW1pemluZyBsYXRlciBpZiB0aGlzIGJlY29tZXMg
YSBwYWluIHBvaW50Lg0KPiANCj4gVWhtLCB5ZXMgeW91IGFyZSByaWdodC4NCj4gDQo+IFdlIHdv
dWxkIGhhdmUgdG8gbW92ZSBzb21lIG9mIHRoZSBsb2dpYyB0byBkZXRlY3QgQUNQSSBlYXJsaWVy
IHRvDQo+IGVhcmx5X3NjYW5fbm9kZSAoZS5nLiB4ZW4vYXJjaC9hcm0vYWNwaS9ib290LmM6ZHRf
c2Nhbl9kZXB0aDFfbm9kZXMpLg0KPiBUaGF0IGNvdWxkIGFjdHVhbGx5IGJlIGEgZ29vZCBpZGVh
LCBidXQgaXQgaXMgdHJ1ZSB0aGF0IGNvdWxkIGJlIGRvbmUNCj4gd2l0aCBhIHNlcGFyYXRlIHBh
dGNoIGxhdGVyLg0KDQpTb3VuZHMgZ29vZCB0byBtZS4NCg==

