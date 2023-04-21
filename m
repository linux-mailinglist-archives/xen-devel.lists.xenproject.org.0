Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE96EA6DC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 11:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524517.815524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppn02-000072-A0; Fri, 21 Apr 2023 09:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524517.815524; Fri, 21 Apr 2023 09:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppn02-0008W3-76; Fri, 21 Apr 2023 09:24:14 +0000
Received: by outflank-mailman (input) for mailman id 524517;
 Fri, 21 Apr 2023 09:24:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ii9+=AM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ppn00-0008Vx-OX
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 09:24:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 453246e9-e026-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 11:24:09 +0200 (CEST)
Received: from DB6PR07CA0104.eurprd07.prod.outlook.com (2603:10a6:6:2c::18) by
 DB3PR08MB9087.eurprd08.prod.outlook.com (2603:10a6:10:430::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Fri, 21 Apr 2023 09:24:01 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::71) by DB6PR07CA0104.outlook.office365.com
 (2603:10a6:6:2c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.11 via Frontend
 Transport; Fri, 21 Apr 2023 09:24:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.14 via Frontend Transport; Fri, 21 Apr 2023 09:24:01 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Fri, 21 Apr 2023 09:24:01 +0000
Received: from 9c66a560a4ed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 856149B8-D419-4996-9CF0-02220F887A67.1; 
 Fri, 21 Apr 2023 09:23:50 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c66a560a4ed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Apr 2023 09:23:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB6563.eurprd08.prod.outlook.com (2603:10a6:20b:315::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 09:23:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 09:23:42 +0000
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
X-Inumbo-ID: 453246e9-e026-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJzPHrLFK3QUDnsTvRJXvfb1sdWR+FKnafCYtNj4YeQ=;
 b=0cyYsS9hT1OHM9cc8dmVdhIfo5cexYMNXPHozk2L0jhmy2NzE6gleMumvrebExwV1GGJj7BlF6rqNniZI8DiWETXsw7ip1+TrNO/H5f98edeGz+PQYD25uwGTYB1uZZU9JI30Y7gh/t6uZtDfU6Q3SiEdCKVrKj5bhY5Wss0mDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN8vbNwyPsSQ8eWUPQGJBV6uqCRk6tVlMIjbUC0dwiPMSMt8/IaxdmW1ZlxRTcGFB4QX00l0kbC4EJxuHEm5W3dJL5L+SHM3a4OwjiOYQhB2gtrRNMEiITm0MZvuLdxcqtvza+fKi4uO8tgb4eaDzg6t8y4mIrEC2fLWdqC7fQ27bDrHlZoz5IMzlf7IrV7tUtOmRDln0bEIOffyCvFuqxWvMiQfx4QYY0Y8Z7ig2DNIseZuOgovn3bzgJCKkqaaoLX3kd5xiHXXV5pxZahm+d49LBoh1zcyuOd7xCzb/f9DYMsvOgGxerwyz7GwgvXg+5Lzf0HE05u/NZ+xuSB79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJzPHrLFK3QUDnsTvRJXvfb1sdWR+FKnafCYtNj4YeQ=;
 b=R1CU0yVvi4R6zX8tIFTSxZGxP3XO/5gxOqv+ndMHBx/wwsqGN1p9l4Sc1CZFqBTAiUZ6CZ7I1fjlhFZ+R2tsjPu7OmuHBVkyDoAkKOeHUCDj8lLcbzLDokEM8NPTUhVaa+v/13W1Gg0IglROy8lNkSSKWV58a7ksQm8mV4GiPqtrUfVLouZlgIhZGPqif9X/0l5dyiVFb76/zSaui+1LtekgKZwpKyxJe+XqFEGakT/rLXq1xbYDzpo8EMW60zpB2taHBJhYyCZirvyvxBVCLvxUUYh6lu5ySFYlWhs+LIeNz/9L9KeEX/vNDIt8p7RFoi638FbAjuzYJ+KIP6bW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJzPHrLFK3QUDnsTvRJXvfb1sdWR+FKnafCYtNj4YeQ=;
 b=0cyYsS9hT1OHM9cc8dmVdhIfo5cexYMNXPHozk2L0jhmy2NzE6gleMumvrebExwV1GGJj7BlF6rqNniZI8DiWETXsw7ip1+TrNO/H5f98edeGz+PQYD25uwGTYB1uZZU9JI30Y7gh/t6uZtDfU6Q3SiEdCKVrKj5bhY5Wss0mDM=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH v3 03/17] xen/arm: implement node distance helpers for
 Arm
Thread-Index: AQHZc3rmCrt50C+BaEmmIgaK9uo9ea80IxGAgAFPzpA=
Date: Fri, 21 Apr 2023 09:23:42 +0000
Message-ID:
 <AS8PR08MB79912F294EDAC48F835FBB7A92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-4-Henry.Wang@arm.com>
 <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
In-Reply-To: <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 153C2F97E054314A817D8908F5204979.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB6563:EE_|DBAEUR03FT014:EE_|DB3PR08MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c796484-9d1d-47d4-39aa-08db424a2498
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w2zMQc7dFTP1SLRm1RIpYjOP6xRf4xwd7zB0/Gl14RUdWFLmHNIIcpRWvwWHyJFuKk4QYayJBe0pS0I33krwKJJv3zydHC8Vo5E/gPiGVJxfltNMummQTe3HYLEEUhWfrAgR0kdxi1MQD0SV0D8BMQI5rbDxH4pffuS7yGs6x6o/N9k9lXhY52b/bhaBtjiYjxpu7Q/a33KCDc1TDfi2TzhI9ofCIpZePtNktFPa4+VkllRbSSUHsvMvKN3/UerixOIe8+GrsXegGCvWtSYoVOJViirqtbFh3vbQ/CYod1xsefMixx0x/9xpbKjPCE0rtFuk/XVFbFbaLQv+M4R3WTfFuj7+hkXJH7lVW1WtZ4BcYA/qtmldgHynxmHzEJPDs0BMKuTeteOwW1ySKPxLEjQMLeVoDjNRUkllUbHCInaYA4IetLOMuw5DK1AcFxpjpev1NuV1zyer96m7R6LSYKpBdkuPO+aP+Q2OVV+OlaS0MJvMpVFMJnXYnZToKz8wnMeI1tZ3fvxWmUOVfvbp8/1IrP0Gx/VBmJQrG2Y9FBLY6bpCZSZTZWWPRUGsBy2BrfgAunxrq8rSipM9caXMKmeuKBTCBDsEpFX2AW7x8R4Q3lWUowQlDopbwXyQY0ir
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199021)(122000001)(316002)(64756008)(6916009)(66476007)(54906003)(76116006)(66446008)(66946007)(66556008)(4326008)(9686003)(6506007)(26005)(186003)(38100700002)(83380400001)(41300700001)(8936002)(5660300002)(8676002)(55016003)(478600001)(7696005)(71200400001)(86362001)(33656002)(52536014)(2906002)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6563
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1fa10a5a-cf7d-40cc-ec41-08db424a193f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2DPgF+NiIuG4WyZYQS1vsxbCb5u5TWETyJi0LbFwkJtKpqN4lWTcnCJCdqlO2pRK2CuKmL4jDrrwo7sDIWr15t+6FBafV0jRGvBtfZMvnn1z33hYJ1/Sz32XBhPCm9tXsa0SJz7j3fzZ8HMYukqKDUCHR/XIYEz7wKS6VJd+CsXxuX/bJTS3KtfkfLiMgODrZAOj/TQIMeMoxFS0AiOF2eA9j+LJRzrE1EarK4FWS/wTWg8xqorjQ1YS5yDgLKyW0FANELnlCJ46tAFO0noE125/vySJlYViy2li07o8iyZ/PGAxSUdNI5SDWh11L2sM+R0W+3nhcgtQP5G/VxKkxp0hs74e4gLxXKT1vSqzDY8baalkHjCpsl5Pocl2swFM+gbbkjRDGO195wR9WFmjAFJCyF1l7I3MpijNPQrmj0AKGHu7gLHmz732iYOq5ysFDvrSxm21LEr9+qogv6S2sDEjEI5+6M1yIf2qQxHvqoojr7Cd1FnPKMXF/uHF0tgmr6SUQ6MBTgeqm63qe/0kjhUH6Qu0kvQijlwUkOoDPzdKKZXJeWrNpp77M+tCjIrBM7CNnccER+aRpemcX37/+tu5MMNotjv3LHyBmyVe/oZ7CLkfKr4vHMtamL2raMFwSZo1DvKZrQGDD1DGPvECLzt6eppLtPEWW0h/g1Ey0aV6RvFdDQh+8JUFlIG7C2N553Ge0F1tmAF7Ktln3hstGA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(186003)(6506007)(9686003)(26005)(7696005)(40480700001)(5660300002)(41300700001)(336012)(47076005)(52536014)(4326008)(70586007)(70206006)(8676002)(8936002)(6862004)(54906003)(478600001)(82740400003)(2906002)(316002)(86362001)(40460700003)(83380400001)(33656002)(81166007)(36860700001)(55016003)(356005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 09:24:01.1870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c796484-9d1d-47d4-39aa-08db424a2498
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9087

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMy8xN10g
eGVuL2FybTogaW1wbGVtZW50IG5vZGUgZGlzdGFuY2UgaGVscGVycyBmb3INCj4gQXJtDQo+ID4g
QXMgYm90aCB4ODYgYW5kIEFybSBoYXZlIGltcGxlbWVudGVkIF9fbm9kZV9kaXN0YW5jZSwgc28g
d2UgbW92ZQ0KPiA+IGl0cyBkZWZpbml0aW9uIGZyb20gYXNtL251bWEuaCB0byB4ZW4vbnVtYS5o
Lg0KPiANCj4gTml0OiBZb3UgbWVhbiAiZGVjbGFyYXRpb24iLCBub3QgImRlZmluaXRpb24iLg0K
DQpDb3JyZWN0LCBJIG92ZXJsb29rZWQgdGhpcyBtaXN3b3JkaW5nIGluIGNvbW1pdCBtZXNzYWdl
IHdoaWxlIGdvaW5nDQp0aHJvdWdoIHlvdXIgY29tbWVudHMgaW4gdjIuIHdpbGwgY29ycmVjdCBp
biB2NC4NCg0KPiANCj4gPiBBdCBzYW1lIHRpbWUsIHRoZQ0KPiA+IG91dGRhdGVkIHU4IHJldHVy
biB2YWx1ZSBvZiB4ODYgaGFzIGJlZW4gY2hhbmdlZCB0byB1bnNpZ25lZCBjaGFyLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPiANCj4gbm9uLUFybSBw
YXJ0czsgdG8gbW9yZSBpdCdzIG5vdCBhcHBsaWNhYmxlIGFueXdheToNCj4gQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KSSB3aWxsIGFkZCAjIG5vbi1Bcm0gcGFy
dHMgaW4gdGhlIGVuZCBvZiB0aGUgdGFnIGFuZCB0YWtlIHRoZSB0YWcuDQoNCj4gDQo+ID4gLS0t
IGEveGVuL2FyY2gvYXJtL251bWEuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9udW1hLmMNCj4g
PiBAQCAtMjgsNiArMjgsMTEgQEAgZW51bSBkdF9udW1hX3N0YXR1cyB7DQo+ID4NCj4gPiAgc3Rh
dGljIGVudW0gZHRfbnVtYV9zdGF0dXMgX19yb19hZnRlcl9pbml0IGRldmljZV90cmVlX251bWEg
PQ0KPiBEVF9OVU1BX0RFRkFVTFQ7DQo+ID4NCj4gPiArc3RhdGljIHVuc2lnbmVkIGNoYXIgX19y
b19hZnRlcl9pbml0DQo+ID4gK25vZGVfZGlzdGFuY2VfbWFwW01BWF9OVU1OT0RFU11bTUFYX05V
TU5PREVTXSA9IHsNCj4gPiArICAgIHsgMCB9DQo+ID4gK307DQo+IA0KPiBOaXQ6IFRoZXJlJ3Mg
bm8gKGluY29tcGxldGUgb3IgY29tcGxldGUpIGluaXRpYWxpemVyIG5lZWRlZCBoZXJlLCBpZg0K
PiBhbGwgeW91J3JlIGFmdGVyIGlzIGhhdmluZyBhbGwgc2xvdHMgc2V0IHRvIHplcm8uDQoNClll
YWgsIEkgYWdyZWUgd2l0aCB5b3UsIHNvIEkgd2lsbCBkcm9wIHRoZSBpbml0aWFsaXplciBpbiB2
NCwgaG93ZXZlci4uLg0KDQo+IA0KPiBIb3dldmVyLCBsb29raW5nIGF0IHRoZSBjb2RlIGJlbG93
LCBkb24ndCB5b3UgbWVhbiB0byBoYXZlIHRoZSBhcnJheQ0KPiBwcmUtc2V0IHRvIGFsbCBOVU1B
X05PX0RJU1RBTkNFPw0KDQouLi5JIGFtIGEgYml0IHB1enpsZWQgYWJvdXQgd2h5IHByZS1zZXR0
aW5nIHRoZSBhcnJheSB0byBhbGwNCk5VTUFfTk9fRElTVEFOQ0UgbWF0dGVycyBoZXJlLCBhcyBJ
IHRoaW5rIHRoZSBub2RlIGRpc3RhbmNlIG1hcCB3aWxsDQpiZSBwb3B1bGF0ZWQgd2hlbiBwYXJz
aW5nIHRoZSBkZXZpY2UgdHJlZSBhbnl3YXkgbm8gbWF0dGVyIHdoYXQgdGhlaXINCmluaXRpYWwg
dmFsdWVzLg0KDQo+IA0KPiA+ICsgICAgLyogTlVNQSBkZWZpbmVzIDB4ZmYgYXMgYW4gdW5yZWFj
aGFibGUgbm9kZSBhbmQgMC05IGFyZSB1bmRlZmluZWQgKi8NCj4gPiArICAgIGlmICggZGlzdGFu
Y2UgPj0gTlVNQV9OT19ESVNUQU5DRSB8fA0KPiA+ICsgICAgICAgICAoZGlzdGFuY2UgPj0gTlVN
QV9ESVNUQU5DRV9VREZfTUlOICYmDQo+IA0KPiBDb21waWxlcnMgbWF5IHdhcm4gYWJvdXQgY29t
cGFyaXNvbiBvZiAidW5zaWduZWQgaW50IiB0byBiZSA+PSAwLiBJJ20NCj4gbm90IHN1cmUgYWJv
dXQgdGhlIHVzZWZ1bG5lc3Mgb2YgdGhlIE5VTUFfRElTVEFOQ0VfVURGX01JTiBkZWZpbmUgaW4N
Cj4gdGhlIGZpcnN0IHBsYWNlLCBzbyBtYXliZSBiZXN0IGRyb3AgaXQgYW5kIGl0cyB1c2UgaGVy
ZT8NCg0KWWVhaCwgd2lsbCBkbyB0aGF0IGluIHY0Lg0KDQo+IA0KPiA+ICt1bnNpZ25lZCBjaGFy
IF9fbm9kZV9kaXN0YW5jZShub2RlaWRfdCBmcm9tLCBub2RlaWRfdCB0bykNCj4gPiArew0KPiA+
ICsgICAgLyogV2hlbiBOVU1BIGlzIG9mZiwgYW55IGRpc3RhbmNlIHdpbGwgYmUgdHJlYXRlZCBh
cyByZW1vdGUuICovDQo+ID4gKyAgICBpZiAoIG51bWFfZGlzYWJsZWQoKSApDQo+ID4gKyAgICAg
ICAgcmV0dXJuIE5VTUFfUkVNT1RFX0RJU1RBTkNFOw0KPiANCj4gV291bGRuJ3QgaXQgbWFrZSBz
ZW5zZSB0byBoYXZlIHRoZSAiZnJvbSA9PSB0byIgc3BlY2lhbCBjYXNlIGFoZWFkIG9mDQo+IHRo
aXMgKHJhdGhlciB0aGFuIGZ1cnRoZXIgZG93biksIHRodXMgeWllbGRpbmcgYSBzZW5zaWJsZSBy
ZXN1bHQgZm9yDQo+IGZyb20gPT0gdG8gPT0gMD8gQW5kIGVsc2UgcmV0dXJuIE5VTUFfTk9fRElT
VEFOQ0UsIHRodXMgaGF2aW5nIGENCj4gc2Vuc2libGUgcmVzdWx0IGFsc28gZm9yIGFueSBmcm9t
L3RvICE9IDA/DQoNCkNvdWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRlIGEgYml0IG1vcmUgYWJvdXQg
d2h5IDAgbWF0dGVycyBoZXJlPyBBcyBmcm9tDQpteSB1bmRlcnN0YW5kaW5nLA0KKDEpIElmIGZy
b20gPT0gdG8sIHRoZW4gd2Ugc2V0IHRoZSBkaXN0YW5jZSB0byBOVU1BX0xPQ0FMX0RJU1RBTkNF
DQp3aGljaCByZXByZXNlbnRzIHRoZSBkaWFnb25hbCBvZiB0aGUgbWF0cml4Lg0KKDIpIElmIGZy
b20gYW5kIHRvIGlzIGluIHRoZSBtYXRyaXggcmFuZ2UsIHRoZW4gd2UgcmV0dXJuDQpub2RlX2Rp
c3RhbmNlX21hcFtmcm9tXVt0b10uDQooMykgT3RoZXIgY2FzZXMgd2UgcmV0dXJuIE5VTUFfTk9f
RElTVEFOQ0UuDQoNClNvIHRoaXMgZGlmZiBpcyBlbm91Z2g6DQpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL251bWEuYyBiL3hlbi9hcmNoL2FybS9udW1hLmMNCkBAIC05OCw2ICs5OCw5IEBAIHZv
aWQgbnVtYV9kZXRlY3RfY3B1X25vZGUodW5zaWduZWQgaW50IGNwdSkNCg0KIHVuc2lnbmVkIGNo
YXIgX19ub2RlX2Rpc3RhbmNlKG5vZGVpZF90IGZyb20sIG5vZGVpZF90IHRvKQ0KIHsNCisgICAg
aWYgKCBmcm9tID09IHRvICkNCisgICAgICAgIHJldHVybiBOVU1BX0xPQ0FMX0RJU1RBTkNFOw0K
Kw0KICAgICAvKiBXaGVuIE5VTUEgaXMgb2ZmLCBhbnkgZGlzdGFuY2Ugd2lsbCBiZSB0cmVhdGVk
IGFzIHJlbW90ZS4gKi8NCiAgICAgaWYgKCBudW1hX2Rpc2FibGVkKCkgKQ0KICAgICAgICAgcmV0
dXJuIE5VTUFfUkVNT1RFX0RJU1RBTkNFOw0KQEAgLTEwOSw3ICsxMTIsNyBAQCB1bnNpZ25lZCBj
aGFyIF9fbm9kZV9kaXN0YW5jZShub2RlaWRfdCBmcm9tLCBub2RlaWRfdCB0bykNCiAgICAgICov
DQogICAgIGlmICggZnJvbSA+PSBBUlJBWV9TSVpFKG5vZGVfZGlzdGFuY2VfbWFwKSB8fA0KICAg
ICAgICAgIHRvID49IEFSUkFZX1NJWkUobm9kZV9kaXN0YW5jZV9tYXBbMF0pICkNCi0gICAgICAg
IHJldHVybiBmcm9tID09IHRvID8gTlVNQV9MT0NBTF9ESVNUQU5DRSA6IE5VTUFfTk9fRElTVEFO
Q0U7DQorICAgICAgICByZXR1cm4gTlVNQV9OT19ESVNUQU5DRTsNCg0KICAgICByZXR1cm4gbm9k
ZV9kaXN0YW5jZV9tYXBbZnJvbV1bdG9dOw0KIH0NCg0KV291bGQgeW91IG1pbmQgcG9pbnRpbmcg
b3V0IHdoeSBteSB1bmRlcnN0YW5kaW5nIGlzIHdyb25nPyBUaGFua3MhDQoNCj4gDQo+ID4gKyAg
ICAvKg0KPiA+ICsgICAgICogQ2hlY2sgd2hldGhlciB0aGUgbm9kZXMgYXJlIGluIHRoZSBtYXRy
aXggcmFuZ2UuDQo+ID4gKyAgICAgKiBXaGVuIGFueSBub2RlIGlzIG91dCBvZiByYW5nZSwgZXhj
ZXB0IGZyb20gYW5kIHRvIG5vZGVzIGFyZSB0aGUNCj4gPiArICAgICAqIHNhbWUsIHdlIHRyZWF0
IHRoZW0gYXMgdW5yZWFjaGFibGUgKHJldHVybiAweEZGKQ0KPiA+ICsgICAgICovDQo+ID4gKyAg
ICBpZiAoIGZyb20gPj0gQVJSQVlfU0laRShub2RlX2Rpc3RhbmNlX21hcCkgfHwNCj4gPiArICAg
ICAgICAgdG8gPj0gQVJSQVlfU0laRShub2RlX2Rpc3RhbmNlX21hcFswXSkgKQ0KPiA+ICsgICAg
ICAgIHJldHVybiBmcm9tID09IHRvID8gTlVNQV9MT0NBTF9ESVNUQU5DRSA6IE5VTUFfTk9fRElT
VEFOQ0U7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIG5vZGVfZGlzdGFuY2VfbWFwW2Zyb21dW3Rv
XTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArRVhQT1JUX1NZTUJPTChfX25vZGVfZGlzdGFuY2UpOw0K
PiANCj4gV2hhdCBpcyB0aGlzIG5lZWRlZCBmb3I/DQoNCldpbGwgZHJvcCBpdC4NCg0KS2luZCBy
ZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

