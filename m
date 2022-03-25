Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E644E6CA9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 03:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294555.500922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXa3S-0004SK-5o; Fri, 25 Mar 2022 02:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294555.500922; Fri, 25 Mar 2022 02:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXa3S-0004QC-1a; Fri, 25 Mar 2022 02:51:58 +0000
Received: by outflank-mailman (input) for mailman id 294555;
 Fri, 25 Mar 2022 02:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rHzJ=UE=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nXa3Q-0004Q1-Ih
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 02:51:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86443583-abe6-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 03:51:54 +0100 (CET)
Received: from AS8P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::24)
 by DU0PR08MB7463.eurprd08.prod.outlook.com (2603:10a6:10:356::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 02:51:44 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::b6) by AS8P189CA0011.outlook.office365.com
 (2603:10a6:20b:31f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 02:51:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 02:51:43 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Fri, 25 Mar 2022 02:51:42 +0000
Received: from 3c8e8e4647a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77BA609C-F9E6-4CDD-BB5F-1954E2B60AA1.1; 
 Fri, 25 Mar 2022 02:51:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c8e8e4647a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 02:51:37 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by HE1PR0802MB2507.eurprd08.prod.outlook.com (2603:10a6:3:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 25 Mar
 2022 02:51:27 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::f9fc:3a4:39ac:a50e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::f9fc:3a4:39ac:a50e%6]) with mapi id 15.20.5081.022; Fri, 25 Mar 2022
 02:51:26 +0000
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
X-Inumbo-ID: 86443583-abe6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXT6tETsad+lByr7odF92MgQnpVZiPQn3NXeleh+dqo=;
 b=NIhNNcfXdjwehRKtgQWYA3RGXyC6DEnNvp5oxNZhI/3bwPRAjsD6Cr1I0ZHQVb+nCIlzTDzFvtbUozJjhbBGLNnNZYgAFW3nN+ZsMV5ZUokANufTA+zmljsC9uZr8uhsJQ1b99t9hEEHPS4FO69TPzuHNSEGM2xTisBR+1aDLTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nO8Twp30wH3DWKTVDd6nTH7UzLA3bqmdt1OkBSe0Pk8yMVgshidhBW+aBaDV4RtjmuckN45EjSsGbrqP527l1ArdG5w4Q/353FQYkbqg9fTiXZ+/DE95JfgfsIwFRi7XIhxzyfds84ypFdE7yeIOGU4t11gfXUqsp5f3MLExwZzHHfAI1G9Hk16s0PfNVH9OC1hhDXFilAj2CbZx4ghgxQeR8c48keJQqyd6feMK1UFYpQs2zILjoZM1/Yr+BMwc030gi44GepYl9UQPfzTmSb7nZMVlDy+sKA2HhLn4C5aWJr+YPDhUfpJLT7hmiKAhae50cyHZ+4Ch00KlE/p0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXT6tETsad+lByr7odF92MgQnpVZiPQn3NXeleh+dqo=;
 b=EZOiks5fPhDc7oGBP4Xsh8bJxgYM5DHgxwxlk3KVpRP0a9fOwS/rCowXyCJnDDLK/pEttLPGMf2mgq6Mqem4eAKZX4+Vd+e1xUk5mmWZE+BZDcfrPRqmHzHFRt7StgTTpnCzB6JfvP52InSlhSiWxIy4eurb4FSoo/gqCeb8WSd2feMZq9DcqUHNWLxDmRP5A0iNZgT4vC+ISXdkkHUqBc3J4bU0UTu/j9+V0Cq0n5iFEK3UOerSe8lU9Ahaft8T31yz65/MtSbyaO9MwHIyQZFDkBZDgA3InSNsAY4XDEC8lGd7AkTj9+fJvQtIykAYsX36TYs3MWv/vv9G1UhPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXT6tETsad+lByr7odF92MgQnpVZiPQn3NXeleh+dqo=;
 b=NIhNNcfXdjwehRKtgQWYA3RGXyC6DEnNvp5oxNZhI/3bwPRAjsD6Cr1I0ZHQVb+nCIlzTDzFvtbUozJjhbBGLNnNZYgAFW3nN+ZsMV5ZUokANufTA+zmljsC9uZr8uhsJQ1b99t9hEEHPS4FO69TPzuHNSEGM2xTisBR+1aDLTU=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: RE: [PATCH] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Topic: [PATCH] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Index: AQHYP+Pkem9qADMk0kmO09zJM2squKzPZhZQ
Date: Fri, 25 Mar 2022 02:51:25 +0000
Message-ID:
 <PAXPR08MB74201501E8AF611683A60ACF9E1A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220325010052.1597420-1-sstabellini@kernel.org>
In-Reply-To: <20220325010052.1597420-1-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 261C61A53DBD454C9DF9477794310C8A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 76a4177d-42d1-45d7-8ace-08da0e0a64f3
x-ms-traffictypediagnostic:
	HE1PR0802MB2507:EE_|VE1EUR03FT057:EE_|DU0PR08MB7463:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR08MB746359C9E494B858C4A68B869E1A9@DU0PR08MB7463.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 63jwq3t6bejnXGk8tMYik6PAYxoqDttWYvox1t6EqFnTYaCyZxJbhwiDWEOyYkRkDMVIXV86snqlAYK8y9XIUs11MU77GlleeUhf7udlX40sI8LugX96+j/7xK5GvYNt1/UvKp9K7KzNiUqG9sB75uNUt6VIz8ipFlDRyJStqd6gDhOGT1QWBDhtvmksW7IfKQDyr2tWgvVLbz5foqUcnLn/k0ayI1+DQZFouckMVVdmhDCRZwSKSDQtoT7JoHrEJY1++tNwTwuxaS/kWbZMsAtxnlOhGsJ+gPIA67uYifyGtGtPFp113g7sX5Mz/QaEcIUbl8u4MlVS8DqaP19pP6lpCZidRY/+W5SYxFiYow845yvf1kL82Kryqq9+emIkWSQjhFF7PFQgtiqd4drpbOxF9tHWXVjH6JdD0VHxLHzrNCz+thEDG9KZTlds5Yfk/Asf54q+L12VAixI4O/07wxydTjEYrVcVfuSO9cRviIBX1lwjEnNCNyziJtP71c5INK9zE8AWyPzsaAiudbfgFI8uoWh9CeBrCTvqzDH9WKPh5g0o+6h/0pu/gS/5H7BQZNDZjZsqL+p2nC48wCaDDPmstwareochwJLhu+X9Yw6Boyyk2PA7c42RL9yB3hA5CfDReVmJlp/aykrVshAugy3Z6EXclpZ8x3SECtgu3j36pgUC+MGShB7FJ/TszMRKekDAVMxF9SaQh1xetpGQg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(86362001)(508600001)(64756008)(66946007)(8936002)(76116006)(66446008)(122000001)(66476007)(66556008)(8676002)(5660300002)(2906002)(110136005)(316002)(52536014)(71200400001)(7696005)(186003)(38070700005)(6506007)(83380400001)(55016003)(26005)(53546011)(38100700002)(9686003)(54906003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2507
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e23332fa-849e-4bf0-e09a-08da0e0a5ac1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Be2z54hFKKwMFBbOdkZoIT7191V3tUxeFJMIf5CCZg8J30tIdOy6W6enf3OOhwkjFPL6ZmmOlsJXhyoc6tcWtvRHTXx396TEYCOjE2euZ266d14F2Ez7aetOoYd1VTv6wq4FOwzG24w/EeId1vfb+ViUjsWvMJErJ/nzX7EWQFLnTFIIRWHf5SEWCWIRpWgCheFp/lGgUQG3JJoo3HwfHk3eNx8WK+UHwY0p8Dr8/FoAt/FtJIjuYMnVK2mVTYK76WQSXcMg9lpWZ5FCTQLZn0AJ+2j21C6SkoXPJhxTObNdaIbMLIGUVxqmJq3rznP3IkcHzuPsr0cg2N+nlyi68tRDBi6CszNWmR6QvQ0eTP/QdmBIvdUFskFQojSMxuzUArnDQe7C0NvVimp/acl1wlFRlTB5sEvYQTGgEx8FT99DCzUO0NYslSIYy9x0ylbJKkfeiZ2W4XAn5gA97lIJ+NJbHrPct/IaNeRXUqxrlLCohIWJv7fzLO9dhuNnNQRo6HZ/qtkQwe0hyZf05NagyFUKXr2CmkZvjf4mVxTjCOTnd7jhttMDT6EXMtMLljJwp3dKNw6mmkSxfyo2aU2Vm2l/xJ1CnggRoSVbLRS1yebEr5fVOeu697HkGk2yhHM263XWY9ADPG2eGWsamyalef9xyujDXEmJkbcFVxyg6mnUY7sFfRl2/br79bkUZ56/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(356005)(81166007)(8676002)(82310400004)(110136005)(54906003)(4326008)(70586007)(70206006)(86362001)(26005)(186003)(336012)(107886003)(52536014)(5660300002)(316002)(8936002)(55016003)(36860700001)(83380400001)(47076005)(9686003)(53546011)(7696005)(6506007)(40460700003)(2906002)(33656002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 02:51:43.1397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a4177d-42d1-45d7-8ace-08da0e0a64f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7463

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4t
ZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYg
T2YNCj4gU3RlZmFubyBTdGFiZWxsaW5pDQo+IFNlbnQ6IDIwMjLE6jPUwjI1yNUgOTowMQ0KPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBqdWxpZW5AeGVuLm9yZzsg
c3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFy
cXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb207IFN0ZWZhbm8gU3RhYmVs
bGluaQ0KPiA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SF0geGVuL2FybTogc2V0IENQU1IgWiBiaXQgd2hlbiBjcmVhdGluZyBhYXJjaDMyIGd1ZXN0cw0K
PiANCj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54
LmNvbT4NCj4gDQo+IFRoZSBmaXJzdCAzMiBieXRlcyBvZiB6SW1hZ2UgYXJlIE5PUHMuIFdoZW4g
Q09ORklHX0VGSSBpcyBlbmFibGVkIGluIHRoZQ0KPiBrZXJuZWwsIGNlcnRhaW4gdmVyc2lvbnMg
b2YgTGludXggd2lsbCB1c2UgYW4gVU5QUkVESUNBVEFCTEUgTk9QDQo+IGVuY29kaW5nLCBzb21l
dGltZXMgcmVzdWx0aW5nIGluIGFuIHVuYm9vdGFibGUga2VybmVsLiBXaGV0aGVyIHRoZQ0KPiBy
ZXN1bHRpbmcga2VybmVsIGlzIGJvb3RhYmxlIG9yIG5vdCBkZXBlbmRzIG9uIHRoZSBwcm9jZXNz
b3IuIFNlZSBjb21taXQNCj4gYTkyODgyYTRkMjcwIGluIHRoZSBMaW51eCBrZXJuZWwgZm9yIGFs
bCB0aGUgZGV0YWlscy4NCj4gDQo+IEFsbCBrZXJuZWwgcmVsZWFzZXMgc3RhcnRpbmcgZnJvbSBM
aW51eCA0Ljkgd2l0aG91dCBjb21taXQgYTkyODgyYTRkMjcwDQo+IGFyZSBhZmZlY3RlZC4NCj4g
DQo+IEZvcnR1bmF0ZWx5IHRoZXJlIGlzIGEgc2ltcGxlIHdvcmthcm91bmQ6IHNldHRpbmcgdGhl
ICJaIiBiaXQgaW4gQ1BTUg0KPiBtYWtlIGl0IHNvIHRob3NlIGludmFsaWQgTk9QIGluc3RydWN0
aW9ucyBhcmUgbmV2ZXIgZXhlY3V0ZWQuIFRoYXQgaXMNCj4gYmVjYXVzZSB0aGUgaW5zdHJ1Y3Rp
b24gaXMgY29uZGl0aW9uYWwgKG5vdCBlcXVhbCkuIFNvLCBvbiBRRU1VIGF0DQo+IGxlYXN0LCB0
aGUgaW5zdHJ1Y3Rpb24gd2lsbCBlbmQgdXAgdG8gYmUgaWdub3JlZCBhbmQgbm90IGdlbmVyYXRl
IGFuDQo+IGV4Y2VwdGlvbi4gU2V0dGluZyB0aGUgIloiIGJpdCBtYWtlcyB0aG9zZSBrZXJuZWwg
dmVyc2lvbnMgYm9vdGFibGUNCj4gYWdhaW4gYW5kIGl0IGlzIGhhcm1sZXNzIGluIHRoZSBvdGhl
ciBjYXNlcy4NCj4gDQo+IE5vdGUgdGhhdCBib3RoIFUtQm9vdCBhbmQgUUVNVSAta2VybmVsIHNl
dCB0aGUgIloiIGJpdCBpbiBDUFNSIHdoZW4NCj4gYm9vdGluZyBhIHpJbWFnZSBrZXJuZWwgb24g
YWFyY2gzMi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFu
by5zdGFiZWxsaW5pQHhpbGlueC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIGlt
cHJvdmUgY29tbWl0IG1lc3NhZ2UNCj4gLSBpbXByb3ZlIGluLWNvZGUgY29tbWVudA0KPiANCj4g
Q2hhbmdlcyBpbiB2MjoNCj4gLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlDQo+IC0gYWRkIGluLWNv
ZGUgY29tbWVudA0KPiAtIG1vdmUgUFNSX1ogdG8gdGhlIGJlZ2lubmluZw0KPiAtLS0NCj4gIHhl
bi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oIHwgMTEgKysrKysrKysrKy0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJj
aC1hcm0uaA0KPiBpbmRleCA5NGIzMTUxMWRkLi5jMGMxMTQ5ZTI3IDEwMDY0NA0KPiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0KPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaA0KPiBAQCAtMzYxLDYgKzM2MSw3IEBAIHR5cGVkZWYgdWludDY0X3QgeGVuX2Nh
bGxiYWNrX3Q7DQo+ICAjZGVmaW5lIFBTUl9EQkdfTUFTSyAgICAoMTw8OSkgICAgICAgIC8qIGFy
bTY0OiBEZWJ1ZyBFeGNlcHRpb24gbWFzayAqLw0KPiAgI2RlZmluZSBQU1JfSVRfTUFTSyAgICAg
KDB4MDYwMGZjMDApICAvKiBUaHVtYiBJZi1UaGVuIE1hc2sgKi8NCj4gICNkZWZpbmUgUFNSX0pB
WkVMTEUgICAgICgxPDwyNCkgICAgICAgLyogSmF6ZWxsZSBNb2RlICovDQo+ICsjZGVmaW5lIFBT
Ul9aICAgICAgICAgICAoMTw8MzApICAgICAgIC8qIFplcm8gY29uZGl0aW9uIGZsYWcgKi8NCj4g
DQo+ICAvKiAzMiBiaXQgbW9kZXMgKi8NCj4gICNkZWZpbmUgUFNSX01PREVfVVNSIDB4MTANCj4g
QEAgLTM4Myw3ICszODQsMTUgQEAgdHlwZWRlZiB1aW50NjRfdCB4ZW5fY2FsbGJhY2tfdDsNCj4g
ICNkZWZpbmUgUFNSX01PREVfRUwxdCAweDA0DQo+ICAjZGVmaW5lIFBTUl9NT0RFX0VMMHQgMHgw
MA0KPiANCj4gLSNkZWZpbmUgUFNSX0dVRVNUMzJfSU5JVA0KPiAoUFNSX0FCVF9NQVNLfFBTUl9G
SVFfTUFTS3xQU1JfSVJRX01BU0t8UFNSX01PREVfU1ZDKQ0KPiArLyoNCj4gKyAqIFdlIHNldCBQ
U1JfWiB0byBiZSBhYmxlIHRvIGJvb3QgTGludXgga2VybmVsIHZlcnNpb25zIHdpdGggYW4gaW52
YWxpZA0KPiArICogZW5jb2Rpbmcgb2YgdGhlIGZpcnN0IDggTk9QIGluc3RydWN0aW9ucy4gU2Vl
IGNvbW1pdCBhOTI4ODJhNGQyNzAgaW4NCj4gKyAqIExpbnV4Lg0KPiArICoNCj4gKyAqIE5vdGUg
dGhhdCBQU1JfWiBpcyBhbHNvIHNldCBieSBVLUJvb3QgYW5kIFFFTVUgLWtlcm5lbCB3aGVuIGxv
YWRpbmcNCj4gKyAqIHpJbWFnZSBrZXJuZWxzIG9uIGFhcmNoMzIuDQo+ICsgKi8NCj4gKyNkZWZp
bmUgUFNSX0dVRVNUMzJfSU5JVA0KPiAoUFNSX1p8UFNSX0FCVF9NQVNLfFBTUl9GSVFfTUFTS3xQ
U1JfSVJRX01BU0t8UFNSX01PREVfU1ZDKQ0KPiAgI2RlZmluZSBQU1JfR1VFU1Q2NF9JTklUDQo+
IChQU1JfQUJUX01BU0t8UFNSX0ZJUV9NQVNLfFBTUl9JUlFfTUFTS3xQU1JfTU9ERV9FTDFoKQ0K
PiANCg0KTWF5YmUgdGhpcyBpcyBhIGdvb2Qgb3Bwb3J0dW5pdHkgdG8gZml4IHRoZSBhbGlnbm1l
bnQgb2YgdGhlIHR3byBtYWNyb3MgOiApDQoNClJldmlld2VkLWJ5OiBXZWkgQ2hlbiA8V2VpLkNo
ZW5AYXJtLmNvbT4NCg0KPiAgI2RlZmluZSBTQ1RMUl9HVUVTVF9JTklUICAgIHhlbl9ta191bGxv
bmcoMHgwMGM1MDA3OCkNCj4gLS0NCj4gMi4yNS4xDQo+IA0KDQo=

