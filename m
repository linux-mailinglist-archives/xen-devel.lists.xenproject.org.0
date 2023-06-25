Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059E473D17A
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 16:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554847.866256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDQjB-0005x9-3a; Sun, 25 Jun 2023 14:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554847.866256; Sun, 25 Jun 2023 14:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDQjB-0005uR-0m; Sun, 25 Jun 2023 14:28:33 +0000
Received: by outflank-mailman (input) for mailman id 554847;
 Sun, 25 Jun 2023 14:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxbT=CN=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1qDQj9-0005uL-N4
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 14:28:31 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cbeffd4-1364-11ee-8611-37d641c3527e;
 Sun, 25 Jun 2023 16:28:28 +0200 (CEST)
Received: from DB7PR05CA0041.eurprd05.prod.outlook.com (2603:10a6:10:2e::18)
 by DU0PR08MB8884.eurprd08.prod.outlook.com (2603:10a6:10:47f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 14:28:24 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::c9) by DB7PR05CA0041.outlook.office365.com
 (2603:10a6:10:2e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Sun, 25 Jun 2023 14:28:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.14 via Frontend Transport; Sun, 25 Jun 2023 14:28:23 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Sun, 25 Jun 2023 14:28:23 +0000
Received: from e804cd5a517f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A947F473-BCA2-4FF9-86C1-83043F45123E.1; 
 Sun, 25 Jun 2023 14:28:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e804cd5a517f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 25 Jun 2023 14:28:12 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com (2603:10a6:20b:41f::23)
 by PA4PR08MB7388.eurprd08.prod.outlook.com (2603:10a6:102:2a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 14:28:08 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::a4db:63a3:ef32:ffd3]) by AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::a4db:63a3:ef32:ffd3%4]) with mapi id 15.20.6521.026; Sun, 25 Jun 2023
 14:28:07 +0000
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
X-Inumbo-ID: 8cbeffd4-1364-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANaoh4H2IU1H+49jUIcLNOQtDeymUMOLFQWr6x2Z3p4=;
 b=g3RMIcU3ZLUpBwERBaO1JGQaQQ4+h1dhvlGSlmO/8C+X0HvwpSIy0Bp7Rw/jFOSEouHFn0hoDrTMCPbAe0+6Zwm6rTBeOvRY+iArrHNmzaXizpNBeFfjEQVI/+xs8rdiNicqmXMmeZCQwLbRVDTKsxsqMxN4pm4wrVxzlH1p1fs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36ead1edd061a34d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T05QuoRckaSmcd5xVcLRSpcRi06mIoYNx/DnxHBVNtFxoGDZT7JeJ71CkHNQ9xAeDSWjIeFdhn7/UbfwuvxTu7i7qESRCnjj9K/vYttbpo1DwLsRBJ1dlhzqiqL1AqSpnwkgSiLWBWy1hwTEidkjbbsYUn7nQL+50tLqbbiLTppSQJR5d+GEPSKarLcQdweOBmQTiTyrkgfl29IOvLkoM+cQpEyevghnNNrcCKsPGVIFWzPO4BwbdDrI554tAKW5m7XogZsXiQR0gU532tevyQx4bXZtrpfovd5lwY7W+ZWvbxEYnd9rNrtp0OFR/rAX9JC4WRipU5tzcT75QcglwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANaoh4H2IU1H+49jUIcLNOQtDeymUMOLFQWr6x2Z3p4=;
 b=UTO6XYVVyDo3KtnVRQZ75U4POg08ryu/qn8ZuoKkM6xVweNhQP2llXw9uL/yGyzB7eco6Icru7laR64eVI1NQx49APx7CZGq4D3ClchqOJ0HXA0W/TSvpZLytnOuDuL2m/QsAnj34qdK/cpPyrDy9Dx/e3LCUhs/AsOwebMnfTZch4Dta1aOuCH1CEhEzIOj0KyiRzbR78iwFnBkPuKq1lFMoPoKY1dAlO1+cCkx7ou9m0P/qP3kBTPlHkDLvm/j7nRy+nQ3S8EzpaUYN9ErvTSV6e+xpiS97ltN+YLy6/aneTYmqxm1nar1OLSSO0lqWZWH5S6pMAY5DPvzsLs9Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANaoh4H2IU1H+49jUIcLNOQtDeymUMOLFQWr6x2Z3p4=;
 b=g3RMIcU3ZLUpBwERBaO1JGQaQQ4+h1dhvlGSlmO/8C+X0HvwpSIy0Bp7Rw/jFOSEouHFn0hoDrTMCPbAe0+6Zwm6rTBeOvRY+iArrHNmzaXizpNBeFfjEQVI/+xs8rdiNicqmXMmeZCQwLbRVDTKsxsqMxN4pm4wrVxzlH1p1fs=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 0/7] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v4 0/7] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHZmOzwkN/rzzqOXEeFGAJzMhA6y69+7w0AgA15XICADy6aAIAAGZ8A
Date: Sun, 25 Jun 2023 14:28:05 +0000
Message-ID: <CEDEAB6E-3790-476C-A260-F0AFDD863116@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <1f5aa53c-a9ed-41c3-2a4d-38538912cdd5@xen.org>
 <4b08b38e-3beb-6b72-83fb-6dd8c8702718@amd.com>
 <5f0b5a38-710f-f820-1dc7-345ae16047ad@xen.org>
In-Reply-To: <5f0b5a38-710f-f820-1dc7-345ae16047ad@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM9PR08MB7165:EE_|PA4PR08MB7388:EE_|DBAEUR03FT005:EE_|DU0PR08MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bbcc2f-0d80-44c3-32e7-08db75886e98
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 atzxHMVBMSBJYwZnJ28Pl5VSbf1dbm2ptDs1nlR+BUABkJjTO7mX9F1YIijD2Ldp5bexXer73ATht+7C8A8Vhjp+3GD/ha9xjnzeVGjJakVOa7/feDlO7B1CA9HXFEj34vLcbyg6AvUpGIIgQiru1CjhHrZr0Z9iaKeRbM5yG9kf4bS8efyUSSupn4aZtF8p0kQWW1CsHiD3wWAxg/0XWar5hNc482i3jfiB15c877J2mCzHuqKqxuyOUMF+a2cs3+SqJfxC4uDk0NlNV0NdFpFq0K7EpG50dQHHC787zuD3/MOG0sCDIRI9y6pYE8cVG5NZfX/AiKv3wlP9uzELMUqeCDtDAdKYGInhZOJ7WEn7qRFr4rjdjW6lPn7uczP6cpAflPTHZMKsRo+9n/Yx8F/nvJcQanR0Vi5jkf18Rj9lI53cSAg4vzd7d8EQF1NkpX5Aev1GU2qGNf3k1igaNIWNPhGBGAXGbg4Ub2kNi1tRVEV/nLJqCJEwfx1+nI8R9bZRMopBKlsIuKjsRxelJgsSiCCE1cZFVRvI4fhuLn2doGA1sWs9O7kIVOeu65JQFDARv53Hz3x7d85JNjNsHBk3WwePhqC0OE9jR2cXqGMfhGcn8gejocrN1ehNpMkNNFGaMWYHWJPJyoKdFZVLpg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7165.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(2906002)(6486002)(71200400001)(122000001)(38100700002)(83380400001)(2616005)(6506007)(26005)(186003)(53546011)(41300700001)(54906003)(86362001)(38070700005)(6512007)(478600001)(316002)(36756003)(91956017)(66476007)(66556008)(4326008)(64756008)(66946007)(66446008)(6916009)(33656002)(76116006)(5660300002)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <07C818235510CE4FAE17730D687D0912@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7388
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8f85017-a7f5-4617-990a-08db75886403
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gLR7JAO0qPr5ivbOOEzKnEhBSKpAev+XmgYDEHO13Q59MhDRDP1HCDM3RHV9Gfq2CdQQf1C/CBEU6/HhKA7ipUbQx6Tz7Pr5iX6QtFVL84Qa+26lWnqvh2DtbvpBRIc/YPDifrzTAw8IouHOoKrHURJZ5TMzf/hTqT88hRIlCFLO0pgvo2RO49z/FQhLnCXkfm7PUPtWv156vi4CrQl62Ph065avQOozuVaJKvW8foWpFQEahpJ4hy+Mcc48io/bzXdjO5+fs3d21IOmCjtDsBbJbSiumGDBWjS82XB2G5KPM4wP1x/dl2DQFeH2oVlVk66sgYck9h9CgeEbGYf2yj22OZlBYdZA6Uxgr3QVahQ00Nh6/1X87gwSCOwIalBl0IkcHh7Erl5t9kIg5RKFem9G6iouQp7BqkTeSxVLMKdmrz7FxCchzNkGMFTF/GZoSYZZImN9kyaOXMnXJXzbIUVeZssJMpi44VqAkglJyl37W46Al/Qz4ERngzClqthiSIzfvpfmtrFlESW1XQMy0dLyRz3HSV16IqAxXnRQ5arpy92+p2ujQqd78k6nToszjLWsCZeJHmExi6lNOPpaRm33xB/n7jYyXMxk4J3zlXoNsL+6Cm/wyuf8AOILb+HjdR4i/D3HHB+Et+/gxu8hUDHz1SN9mUDFNP6KTIm6k4tyleWh8NvvN8+IxB6OmDVcVU/695GvkztjEPMDmrFXsA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(46966006)(36840700001)(5660300002)(70586007)(70206006)(4326008)(33656002)(478600001)(36756003)(316002)(8676002)(6862004)(8936002)(2906002)(40480700001)(36860700001)(54906003)(86362001)(41300700001)(6486002)(82310400005)(186003)(53546011)(47076005)(336012)(6512007)(6506007)(26005)(356005)(82740400003)(107886003)(83380400001)(81166007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 14:28:23.4527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bbcc2f-0d80-44c3-32e7-08db75886e98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8884

SGkgSnVsaWVuLA0KDQo+IE9uIDI1IEp1biAyMDIzLCBhdCAxOjU2IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTUvMDYvMjAyMyAy
MjowNSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOg0KPj4gT24gNi83LzIzIDAzOjE5LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQo+Pj4gT24gMDcvMDYvMjAyMyAwNDowMiwgU3Rld2FydCBIaWxkZWJy
YW5kIHdyb3RlOg0KPj4+PiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIFNNTVUgaGFuZGxpbmcgZm9y
IFBDSWUgcGFzc3Rocm91Z2ggb24gQVJNLiBUaGVzZSBwYXRjaGVzDQo+Pj4+IGFyZSBpbmRlcGVu
ZGVudCBmcm9tIChhbmQgZG9uJ3QgZGVwZW5kIG9uKSB0aGUgdlBDSSByZWZlcmVuY2UgY291bnRp
bmcvbG9ja2luZw0KPj4+PiB3b3JrIGluIHByb2dyZXNzLCBhbmQgc2hvdWxkIGJlIGFibGUgdG8g
YmUgdXBzdHJlYW1lZCBpbmRlcGVuZGVudGx5Lg0KPj4+IA0KPj4+IENhbiB5b3UgY2xhcmlmeSBo
b3cgdGhpcyBjb2RlIHdhcyB0ZXN0ZWQ/IERvZXMgdGhpcyByZXF1aXJlIGNvZGUgbm90IHlldA0K
Pj4+IHVwc3RyZWFtZWQ/DQo+PiBJJ20gdGVzdGluZyB0aGUgc2VyaWVzIHN0YW5kYWxvbmUgKCsg
Y29uZmlnIGNoYW5nZXMpIGJ5IHVzaW5nIGEgUENJIGRldmljZSBpbiBkb20wLCBhbmQgYWxzbyBp
biBjb21iaW5hdGlvbiB3aXRoIHRoZSB2UENJIHNlcmllcyBbM10gWzRdIGZvciBwYXNzdGhyb3Vn
aCB0byBhIGRvbVUuDQo+PiBIZXJlIGFyZSBzb21lIG1vcmUgZGV0YWlscyBvbiB0aGUgdGVzdCBj
YXNlcyBJJ20gdXNpbmcuDQo+IA0KPiBUaGFua3MgdGhhdCdzIGhlbHBmdWwhIE9uZSBjb21tZW50
IGFib3V0IHRoZSBmaXJzdCB0ZXN0IGNhc2UuDQo+IA0KPj4gMS4gVXNpbmcgdGhlIFBDSSBkZXZp
Y2UgaW4gZG9tMCB3aXRoIHRoZSBwY2ktcGFzc3Rocm91Z2g9eWVzIGFyZy4gSW4gdGhpcyBjYXNl
IGEgY291cGxlIG9mIGFkZGl0aW9uYWwgY29uZmlnIGNoYW5nZXMgWzFdIFsyXSBhcmUgbmVlZGVk
IHRvIHNlbGVjdCBDT05GSUdfSEFTX1BDST15LCBDT05GSUdfSEFTX1ZQQ0k9eSwgYW5kIG1ha2Ug
aGFzX3ZwY2koKSByZXR1cm4gdHJ1ZS4gQXNpZGUgZnJvbSB0aGlzIHNlcmllcyBpdHNlbGYgYW5k
IHRoZSBjb25maWcgY2hhbmdlcywgbm90aGluZyBlbHNlIG5vdC15ZXQtdXBzdHJlYW1lZCBpcyBy
ZXF1aXJlZCBmb3IgdGhpcyB0ZXN0IGNhc2UuIEl0IGlzIG9uIG15IFRPRE8gbGlzdCB0byB1cHN0
cmVhbSB0aGVzZSBjb25maWcgY2hhbmdlcywgd2hpY2ggSSB0aGluayB3aWxsIGJlIHVzZWZ1bCBv
biB0aGVpciBvd24sIG5vdCBuZWNlc3NhcmlseSBhcyBwYXJ0IG9mIGFueSBvdGhlciBzZXJpZXMu
DQo+IA0KPiBJIGZpbmQgYSBiaXQgY29uZnVzaW5nIHRoYXQgdGhlIElPTU1VIHN1cHBvcnQgZm9y
IGRvbTAgaXMgZ2F0ZWQgYmVoaW5kICdwY2ktcGFzc3Rocm91Z2gnLiBJIHdhcyBleHBlY3Rpbmcg
dGhhdCB0aGUgaW9tbXUgd291bGQgYWxzbyBiZSBwcm9wZXJseSBjb25maWd1cmVkIGZvciBQQ0kg
aWYgd2UgdXNpbmcgJ2lvbW11PXllcycuDQoNCkFzIHBlciBteSB1bmRlcnN0YW5kaW5nIFhlbiBj
YW4gY29uZmlndXJlIHRoZSBpb21tdXMgZm9yIFBDSSBkZXZpY2Ugd2l0aG91dCAicGNpLXBhc3N0
aHJvdWdo4oCdIGVuYWJsZWQNCmlmIHdlIGZvbGxvdyBiZWxvdyBwYXRoOg0KDQogICAxKSBQQ0kg
aG9zdCBicmlkZ2UgaXMgYWxyZWFkeSBlbnVtZXJhdGVkIGFuZCBwb3dlcmVkIG9uIGluIGZpcm13
YXJlIGJlZm9yZSBYZW4gYm9vdA0KICAgMikgUENJIGRldmljZXMgYXJlIHNjYW5uZWQgaW4gWGVu
Lg0KICAgICAgIChodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2JtYXJxdWlz
L3hlbi1hcm0tcG9jLy0vY29tbWl0L2JjZTQ2M2UxNTg4YTQ1ZTFiZmRmNTlmYzBkNWY4OGIxNjYw
NGU0MzkpDQogICAzKSBBZnRlciBzY2FubmluZyB0aGUgUENJIGRldmljZXMgYWRkIFBDSSBkZXZp
Y2VzIHRvIGlvbW11ICggaW9tbXVfYWRkX2RldmljZSgpICkNCg0KSWYgUENJIGhvc3QgYnJpZGdl
IGlzIG5vdCBlbnVtZXJhdGVkIHRoZW4gd2UgbmVlZCAicGNpLXBhc3N0aHJvdWdo4oCdIGVuYWJs
ZWQgdG8gYWxsb3cgTGludXggdG8gZG8NCmVudW1lcmF0aW9uIGFuZCB0byBpbmZvcm0gWGVuIHZp
YSBQSFlTREVWT1BfcGNpX2RldmljZV9hZGQgaHlwZXIgY2FsbCB0byBhZGQgUENJIGRldmljZXMg
aW4gWGVuDQpUaGlzIGlzIGltcGxlbWVudGVkIGFzIHBhcnQgb2YgUENJIHBhc3N0aHJvdWdoIGZl
YXR1cmUuDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo=

