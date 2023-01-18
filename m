Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8A6671390
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 07:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480132.744352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI1dr-0006oN-4x; Wed, 18 Jan 2023 06:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480132.744352; Wed, 18 Jan 2023 06:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI1dr-0006ma-0m; Wed, 18 Jan 2023 06:09:47 +0000
Received: by outflank-mailman (input) for mailman id 480132;
 Wed, 18 Jan 2023 06:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyUV=5P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pI1dq-0006mU-4w
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 06:09:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f0a708-96f6-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 07:09:43 +0100 (CET)
Received: from DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) by PA4PR08MB7620.eurprd08.prod.outlook.com
 (2603:10a6:102:261::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 06:09:40 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::33) by DUZPR01CA0013.outlook.office365.com
 (2603:10a6:10:3c3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Wed, 18 Jan 2023 06:09:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 06:09:40 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Wed, 18 Jan 2023 06:09:40 +0000
Received: from a8a662c84299.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC0C3C80-9503-47A8-A524-0A7F4B67E2EC.1; 
 Wed, 18 Jan 2023 06:09:29 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8a662c84299.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 06:09:29 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AM9PR08MB6276.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 18 Jan
 2023 06:09:21 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%7]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 06:09:21 +0000
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
X-Inumbo-ID: b2f0a708-96f6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdcxqi7XguLN86UZ9ocP990VjgUdyOog0lWV2zlPOrE=;
 b=Z6A7bOW/bLtjlvP3WG/Pxt6oIn1usi+GaDLBQ77jJLo4MXF/9CFmLW1LtwoLUOUmeIwwCrPqki/WkQVw7qGoT1wnAe9xXvn9vMfDTLfWl5VanM2Ow/TcY+5YJ8M1dahBu5H4tYGklubopR09arZrcuoA4p5zXKsjGG2mfL2ORiY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtHBJq0cTxlgKp6yy28XPcbztdgLvFgjfNVDUwPu8QqbmqZzGuZwon4sTC9PQrjESvhsIIfMh42cUQoFDoQY6x5q9qQes91TMRDyocWdhVemi/WJNknewgATlG9LXaWu1C66kNptGHXFv45iDt2qWrouXrQS9/grs+4Y15OMrEN3L4VFR+nGCtdsxtMvRklHb86pRQBkjnTN2/bs42VM98UDlpkGJOvWGrhKw5Kjn6uhURibc9OB9bEXazUCBQiVu6s+yIQROmvrp0AZ7VWph0W6m0lCyiKXdpkXBT46SUOWEj53ypISgFdHY4kF/VsaY+611T/ER12Gh/QfSlODsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdcxqi7XguLN86UZ9ocP990VjgUdyOog0lWV2zlPOrE=;
 b=jOb0roRqbo5ZlALgyCsI8lYR8nETM7qC5eZS+mE+EIa1JvyqS6VirEbjzZ4YxzYPsvJt8MWAimxe6Z34Y/YUF4Tl5MsGGRCPPc7MGdYr1OztiS1iu2Xx4Fkbt+dn7zdmKH1fODhCkEi3YNom1WfOq6LndUGRb1JjWUoaNfDHCcuNAiqT8FWLJuJ6gKTKTa61BkucHu//d2QmdZejAA46VlSR4fkr76ulmaXH1PmxU3UD3VvaOd/ZNzNFCC7sNOQq1rs3BLDBc+SYnkWb6ASEi4EWjrSRCPKXv+ovDdfsNXimuMoFIBNsieVHAJVOfy0BVp0NXvunSggRgNB1UQj3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdcxqi7XguLN86UZ9ocP990VjgUdyOog0lWV2zlPOrE=;
 b=Z6A7bOW/bLtjlvP3WG/Pxt6oIn1usi+GaDLBQ77jJLo4MXF/9CFmLW1LtwoLUOUmeIwwCrPqki/WkQVw7qGoT1wnAe9xXvn9vMfDTLfWl5VanM2Ow/TcY+5YJ8M1dahBu5H4tYGklubopR09arZrcuoA4p5zXKsjGG2mfL2ORiY=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 06/13] xen/arm: assign shared memory to owner when host
 address not provided
Thread-Topic: [PATCH v1 06/13] xen/arm: assign shared memory to owner when
 host address not provided
Thread-Index: AQHY+J1pmmYEajWz5UynKX+c5rdEZK6UzwiAgAEQoXCAAGGAAIANzbrg
Date: Wed, 18 Jan 2023 06:09:21 +0000
Message-ID:
 <AM0PR08MB45301DB151AA42174CA8326BF7C79@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-7-Penny.Zheng@arm.com>
 <d7f12897-c6cc-0895-b70e-53c0b88bd0f9@xen.org>
 <AM0PR08MB453041150588948050F718D4F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <6db41bd2-ab71-422a-4235-a9209e984915@xen.org>
In-Reply-To: <6db41bd2-ab71-422a-4235-a9209e984915@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A51278E297A39A4F8E5EB4019398EF65.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|AM9PR08MB6276:EE_|DBAEUR03FT024:EE_|PA4PR08MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: d44d024e-c65e-413d-36ca-08daf91a959f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q12qNdVLzDK3iskNSLVqrDITxFwMbQ5oVBnxZohZB5CwW36U6bO9j4aXgtBLdDDRCNdYqlu/mv54iUGOh/pSFlBwwJw9OfFQulT+BhiwBw28TW3a1faQd1XYEiFRNUpWtDupap7YBw2qI04tyzUdMBDm6IyOR8iZJrrME/kUo5UYU0iSeW7D8IsPRmsCPt5Igu2UMuxIyD0xbpSaUp0WR9+nQlpnzZAxGE1HebcT2yUMYrHWdPHpbke1/4DyJMDUmANqP8AOn20O/g9HYmog51a/Zj+fPxetYRBhfxoo6ikm170LK3etS8DUnR9wrd1imdgk33caTgZNoSbxCVZAUMNs6XNSrvrz1KCIf2JKE5fV7GNWENJWRR068eD0Ej3K/GfABT2eWhIAvDk/LyRJrpHb1CNcNtteeXth26/0XuPesjPFeDJyvao5zIuriDq6tt1cDYhmwow1q1LuHnR72M5rTAfPrsqTGowr/4T/2Q//TUZwslPGgLCO9ug6BzIPe92LKhOE6Q+CCMBhKWFgZr5pZzNVK8B0z3apjXvafajwIVAiScfVxead9SsY3lNmXvCGuWRQubvxUMdLEWdJGOBnHn7FhyPxrNs9HFBOuLap/f4XGIFFkHMcNMtqclcyFQMi79/gh2ZqkJIMUWTW8wSK6ol+knhgcKd4FWdApCFnWZDwF787xFLKjaLQldvaTZVXzdZkoQzDA3t7pjtnWQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(71200400001)(186003)(52536014)(55016003)(26005)(9686003)(7696005)(122000001)(86362001)(66556008)(66946007)(66446008)(66476007)(76116006)(4326008)(8676002)(5660300002)(33656002)(64756008)(478600001)(38070700005)(38100700002)(54906003)(8936002)(41300700001)(316002)(2906002)(53546011)(6506007)(110136005)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6276
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bfd70c7a-2b6a-411e-8946-08daf91a8a54
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qfTrySxE/5WfcZTKQflKGKv192mPdgSe6FvlHu85npTx2YCSdYL3awAUbb8G2j2EAtjoTiEZBHmlYuNToJVBfMpH/K8TkzsWboXoE7sYZwpGxZ5mhEtqXM4wWBWhfZOsPzbmfk4l5dWUYj5q0ROatRtU35aF+0IOjLAU44CIiGhGbkh5FeED7EwVA3XjT0A2zmbuws0//Zdj/+UtiNkFdZXhCWsnAm1diYjSs7RwEbqFxmxg5Jv4AtxVp4OEAMnjMbcR/ThQWUIxJJ6t+K/X71j9yK5w6WPfl7oNYxcq+medwavbb1dfQv+N8/rTELYu1bGiYmjYymo99lQfwuUjkQ9re0Y6SrnrJOVpcVCs+JVdnZyk+6qq2sGOCuXkGuZayqPPEtNcTKa3yeOUQuuzRk/wlnoJOuqjD7tgrdU8Dqdj/K7O4qWkMKHf5T8GH1Wdb7ABIayeJD0larNm19ZkAOW112Eobcbxn7wtYsO3zW+7aqFg23wxqO8ZtT6pUSQfkGcK+nrDXlDwMqZqryxyy2LTyK5U/FAeu92mz8eRlTLV3sLqVYs6S9E4g8okjKOSe2i6KtCwjhE4Cunaqm0XXKi4+n7iOpzPl4+AAmkwya88d2sU4ZmWpJWWFFOXodfZ9lBBobikcDCWyv8xEoF1BD+p2wb0hmDl3OYaifo49HHKP3O8E1a6mR7zOh/RW4xBoqkYwaFdR5JLoi2PhI14Vw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(81166007)(82740400003)(36860700001)(86362001)(356005)(33656002)(5660300002)(8936002)(52536014)(2906002)(70586007)(70206006)(55016003)(40480700001)(41300700001)(8676002)(4326008)(82310400005)(40460700003)(26005)(9686003)(186003)(336012)(83380400001)(47076005)(53546011)(316002)(54906003)(110136005)(107886003)(7696005)(6506007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 06:09:40.0895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d44d024e-c65e-413d-36ca-08daf91a959f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7620

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDksIDIwMjMg
Njo1OCBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNo
dWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYx
IDA2LzEzXSB4ZW4vYXJtOiBhc3NpZ24gc2hhcmVkIG1lbW9yeSB0byBvd25lcg0KPiB3aGVuIGhv
c3QgYWRkcmVzcyBub3QgcHJvdmlkZWQNCj4gDQo+IA0KPiANCj4gT24gMDkvMDEvMjAyMyAwNzo0
OSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuDQo+IA0KPiBIaSBQZW5ueSwNCj4g
DQo+ID4gSGFwcHkgbmV3IHllYXJ+fn5+DQo+IA0KPiBIYXBweSBuZXcgeWVhciB0b28hDQo+IA0K
PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50OiBTdW5kYXksIEphbnVhcnkgOCwgMjAyMyA4OjUz
IFBNDQo+ID4+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi0NCj4g
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBh
cm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+ID4+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgQmVydHJhbmQgTWFycXVpcw0KPiA+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9s
b2R5bXlyIEJhYmNodWsNCj4gPj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiA+PiBT
dWJqZWN0OiBSZTogW1BBVENIIHYxIDA2LzEzXSB4ZW4vYXJtOiBhc3NpZ24gc2hhcmVkIG1lbW9y
eSB0byBvd25lcg0KPiA+PiB3aGVuIGhvc3QgYWRkcmVzcyBub3QgcHJvdmlkZWQNCj4gPj4NCj4g
Pj4gSGksDQo+ID4+DQo+ID4+IE9uIDE1LzExLzIwMjIgMDI6NTIsIFBlbm55IFpoZW5nIHdyb3Rl
Og0KPiA+Pj4gQEAgLTkyMiwzMyArOTI3LDgyIEBAIHN0YXRpYyBtZm5fdCBfX2luaXQNCj4gPj4g
YWNxdWlyZV9zaGFyZWRfbWVtb3J5X2Jhbmsoc3RydWN0IGRvbWFpbiAqZCwNCj4gPj4+ICAgICAg
ICBkLT5tYXhfcGFnZXMgKz0gbnJfcGZuczsNCj4gPj4+DQo+ID4+PiAgICAgICAgc21mbiA9IG1h
ZGRyX3RvX21mbihwYmFzZSk7DQo+ID4+PiAtICAgIHJlcyA9IGFjcXVpcmVfZG9tc3RhdGljX3Bh
Z2VzKGQsIHNtZm4sIG5yX3BmbnMsIDApOw0KPiA+Pj4gLSAgICBpZiAoIHJlcyApDQo+ID4+PiAr
ICAgIHBhZ2UgPSBtZm5fdG9fcGFnZShzbWZuKTsNCj4gPj4+ICsgICAgLyoNCj4gPj4+ICsgICAg
ICogSWYgcGFnZSBpcyBhbGxvY2F0ZWQgZnJvbSBoZWFwIGFzIHN0YXRpYyBzaGFyZWQgbWVtb3J5
LCB0aGVuIHdlDQo+IGp1c3QNCj4gPj4+ICsgICAgICogYXNzaWduIGl0IHRvIHRoZSBvd25lciBk
b21haW4NCj4gPj4+ICsgICAgICovDQo+ID4+PiArICAgIGlmICggcGFnZS0+Y291bnRfaW5mbyA9
PSAoUEdDX3N0YXRlX2ludXNlIHwgUEdDX3N0YXRpYykgKQ0KPiA+PiBJIGFtIGEgYml0IGNvbmZ1
c2VkIGhvdyB0aGlzIGNhbiBoZWxwIGRpZmZlcmVudGlhdGluZw0KPiA+PiBiZWNhUEdDX3N0YXRl
X2ludXNlIGlzIDAuIFNvIGVmZmVjdGl2ZWx5LCB5b3UgYXJlIGNoZWNraW5nIHRoYXQgY291bnRf
aW5mbw0KPiBpcyBlcXVhbCB0byBQR0Nfc3RhdGljLg0KPiA+Pg0KPiA+DQo+ID4gV2hlbiBob3N0
IGFkZHJlc3MgaXMgcHJvdmlkZWQsIHRoZSBob3N0IGFkZHJlc3MgcmFuZ2UgZGVmaW5lZCBpbg0K
PiA+IHhlbixzdGF0aWMtbWVtIHdpbGwgYmUgc3RvcmVkIGFzIGEgInN0cnVjdCBtZW1iYW5rIiB3
aXRoIHR5cGUgb2YNCj4gPiAiTUVNQkFOS19TVEFUSUNfRE9NQUlOIiBpbiAiYm9vdGluZm8ucmVz
ZXJ2ZWRfbWVtIg0KPiA+IFRoZW4gaXQgd2lsbCBiZSBpbml0aWFsaXplZCBhcyBzdGF0aWMgbWVt
b3J5IHRocm91Z2ggImluaXRfc3RhdGljbWVtX3BhZ2VzIg0KPiA+IFNvIGhlcmUgaXRzIHBhZ2Ut
PmNvdW50X2luZm8gaXMgUEdDX3N0YXRlX2ZyZWUgfFBHQ19zdGF0aWMuDQo+ID4gRm9yIHBhZ2Vz
IGFsbG9jYXRlZCBmcm9tIGhlYXAsIGl0cyBwYWdlIHN0YXRlIGlzIGRpZmZlcmVudCwgYmVpbmcN
Cj4gUEdDX3N0YXRlX2ludXNlLg0KPiA+IFNvIGFjdHVhbGx5LCB3ZSBhcmUgY2hlY2tpbmcgcGFn
ZSBzdGF0ZSB0byB0ZWxsIHRoZQ0KPiBkaWZmZXJlbmNlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4NCj4gDQo+IE9rLiBUaGlzIGlzIGRlZmluaXRl
bHkgbm90IG9idmlvdXMgZnJvbSB0aGUgY29kZS4gQnV0IEkgdGhpbmsgdGhpcyBpcyBhIHZlcnkN
Cj4gZnJhZ2lsZSBhc3N1bXB0aW9uLg0KPiANCj4gSW5zdGVhZCwgaXQgd291bGQgYmUgYmV0dGVy
IGlmIHdlIGFsbG9jYXRlIHRoZSBtZW1vcnkgaW4NCj4gYWNxdWlyZV9zaGFyZWRfbWVtb3J5X2Jh
bmsoKSB3aGVuIHRoZSBob3N0IGFkZHJlc3MgaXMgbm90IHByb3ZpZGVkLg0KPiANCg0KUmlnaHQg
bm93LCBhY3F1aXJlX3NoYXJlZF9tZW1vcnlfYmFuayBpcyBjYWxsZWQgb25seSB3aGVuIGRvbWFp
biBpcyBvd25lciBkb21haW4uDQpJdCBpcyBhcHBsaWNhYmxlIHdoZW4gaG9zdCBhZGRyZXNzIGlz
IHByb3ZpZGVkLCB3ZSBjb3VsZCBzdGlsbCBkbyBndWVzdCBwaHlzbWFwIHdoZW4NCmJvcnJvd2Vy
IGFjY2Vzc2VkIGJlZm9yZSBvd25lciwgYXMgYWRkcmVzcyBpcyBwcm92aWRlZC4NCkhvd2V2ZXIg
d2hlbiBob3N0IGFkZHJlc3MgaXMgbm90IHByb3ZpZGVkLCB3ZSBtdXN0IGFsbG9jYXRlIG1lbW9y
eSBhdCBmaXJzdCBkb21haW4uDQpTbyBhbGxvY2F0aW5nIHRoZSBtZW1vcnkgc2hhbGwgYmUgY2Fs
bGVkIG91dHNpZGUgYWNxdWlyZV9zaGFyZWRfbWVtb3J5X2JhbmsNCg0KPiA+DQo+ID4+IEJ1dCBh
cyBJIHdyb3RlIGluIGEgcHJldmlvdXMgcGF0Y2gsIEkgZG9uJ3QgdGhpbmsgeW91IHNob3VsZCBj
b252ZXJ0DQo+ID4+IHt4ZW4sZG9tfWhlYXAgcGFnZXMgdG8gYSBzdGF0aWMgcGFnZXMuDQo+ID4+
DQo+ID4NCj4gPiBJIGFncmVlIHRoYXQgdGFraW5nIHJlZmVyZW5jZSBjb3VsZCBhbHNvIHByZXZl
bnQgZ2l2aW5nIHRoZXNlIHBhZ2VzIGJhY2sgdG8NCj4gaGVhcC4NCj4gPiBCdXQgbWF5IEkgYXNr
IHdoYXQgaXMgeW91ciBjb25jZXJuIG9uIGNvbnZlcnRpbmcge3hlbixkb219aGVhcCBwYWdlcyB0
bw0KPiBhIHN0YXRpYyBwYWdlcz8NCj4gDQo+IEEgZmV3IHJlYXNvbnM6DQo+ICAgMSkgSSBjb25z
aWRlciB0aGVtIGFzIHR3byBkaXN0aW5jdCBhbGxvY2F0b3JzLiBTbyBmYXIgdGhleSBoYXZlIHRo
ZSBzYW1lDQo+IGJlaGF2aW9yLCBidXQgaW4gdGhlIGZ1dHVyZSB0aGlzIG1heSBjaGFuZ2UuDQo+
ICAgMikgSWYgdGhlIHBhZ2UgaXMgZnJlZWQgeW91IHJlYWxseSBkb24ndCB3YW50IHRoZSBkb21h
aW4gdG8gYmUgYWJsZSB0byByZS11c2UNCj4gdGhlIHBhZ2UgZm9yIGEgZGlmZmVyZW50IHB1cnBv
c2UuDQo+IA0KPiANCj4gSSByZWFsaXplIHRoYXQgMikgaXMgYWxyZWFkeSBhIHByb2JsZW0gdG9k
YXkgd2l0aCBzdGF0aWMgcGFnZXMuIFNvIEkgdGhpbmsgdGhlDQo+IGJlc3QgaXMgdG8gZW5zdXJl
IHRoYXQgcGFnZXMgYWxsb2NhdGVkIGZvciBzaGFyZWQgbWVtb3J5IG5ldmVyIHJlYWNoIHRoZQ0K
PiBhbnkgb2YgdGhlIGFsbG9jYXRvcnMuDQo+IA0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4g
SnVsaWVuIEdyYWxsDQoNCkNoZWVycywNCg0KLS0NCkp1bGllbiBHcmFsbA0K

