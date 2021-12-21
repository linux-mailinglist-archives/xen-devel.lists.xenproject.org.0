Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560DA47BCF6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 10:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250257.431063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbYc-0001a6-Gp; Tue, 21 Dec 2021 09:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250257.431063; Tue, 21 Dec 2021 09:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbYc-0001XA-Dd; Tue, 21 Dec 2021 09:35:42 +0000
Received: by outflank-mailman (input) for mailman id 250257;
 Tue, 21 Dec 2021 09:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nh4l=RG=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mzbYa-0001X4-MS
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 09:35:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b3032ad-6241-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 10:35:39 +0100 (CET)
Received: from AS8PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:20b:312::31)
 by DBBPR08MB4629.eurprd08.prod.outlook.com (2603:10a6:10:f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Tue, 21 Dec
 2021 09:35:36 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::66) by AS8PR04CA0056.outlook.office365.com
 (2603:10a6:20b:312::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14 via Frontend
 Transport; Tue, 21 Dec 2021 09:35:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Tue, 21 Dec 2021 09:35:33 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Tue, 21 Dec 2021 09:35:33 +0000
Received: from 611ff812d540.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 054EC4EC-EA1E-46C3-8BEB-7E3D8659227A.1; 
 Tue, 21 Dec 2021 09:35:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 611ff812d540.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Dec 2021 09:35:27 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3240.eurprd08.prod.outlook.com (2603:10a6:209:49::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Tue, 21 Dec
 2021 09:35:25 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e%9]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 09:35:25 +0000
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
X-Inumbo-ID: 5b3032ad-6241-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAxc/67Ajslel3QVBXvxCdXspomx3Qeuxrd1LiKlQbs=;
 b=wwInxNDeZ3s6w6vJlc2KP+LsPwUpvBGiMnlZ8Me9+RBYeLDpmRq9GGY7wlpqTJrXatUwIpmB3JNao5uSCeSyNG5p1Pye+PSDJ2hA0B3hIirwz/Mlw8Kjwa6/8RNPxfqSD2GXgN8ds0cJFzK9E6LNptdUxFGfMxAnNXiOyIyeI5g=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6fba49813af44f5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXw63b0SD9IM72yTTlVUnlegMACPhRLfIPbBZ6nfwod8//ygmcW6tvwFkQzSu91PXxCbt37zedD3ITksNQiHSgLWw1Lj8NyKCKnqpAHxkaGmpJV8O9gzRp47n7IIcM1TFk2DFmEMdIuA6D6vzhT8jFN/06xHEiW/cYit/b0Zi6EBhFAr0VN+zR3y8v9GczXrcRT17ohdEu6h/pVQvkhSD7W+UYGIeNhEAOZFh2UDRjjO3ZQf5kDOdR+qLClbuE+ImQfc3nbSsYJ62fkl+ALIvXSpZVXRQ340RnasZFCTHlNctaxmtiASmz92mtDdTgrU5RIjhBKYUDwBKZ9oXkO+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAxc/67Ajslel3QVBXvxCdXspomx3Qeuxrd1LiKlQbs=;
 b=Em/m1sjAsY7Trtv6EV5kBPnGLmT0TRSAxZpIMHwqpoT0JGraC9Nia9xLLBHusMzeyj13I7wFlRYcSe4Gn/YMrjGuWzyfUxxbeHBNBpipgNybfheE7DKnGp4NIKTU/aP5KyaJTyVh9/ZWD8xEgjpO0kWk51heHvsCBdZxPob8wuOUymVhpK9NweL4BBZ96veKUaUaEDhBAtResqazssasurrbH1O8SkTZZnG9PavfMX6SCkCx3TPA9uWKT/uRUuU4+JBRjGC0HKouBDvLGFc40MeXAN7WTmRyC3FRr3SvRrnBCYcSNKkJiunXHPoGI8K9IHTo2D/NEj9vu0xWn5XPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAxc/67Ajslel3QVBXvxCdXspomx3Qeuxrd1LiKlQbs=;
 b=wwInxNDeZ3s6w6vJlc2KP+LsPwUpvBGiMnlZ8Me9+RBYeLDpmRq9GGY7wlpqTJrXatUwIpmB3JNao5uSCeSyNG5p1Pye+PSDJ2hA0B3hIirwz/Mlw8Kjwa6/8RNPxfqSD2GXgN8ds0cJFzK9E6LNptdUxFGfMxAnNXiOyIyeI5g=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Thread-Topic: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Thread-Index:
 AQHX8NfN625eD/1es0eaHkpOvTmQ3Kwx7OWAgAL9+QCAAAwcgIAAK1kAgAGhwICABdZ2AIAAH+6A
Date: Tue, 21 Dec 2021 09:35:24 +0000
Message-ID: <EB3D122A-92B9-42AE-919B-7092B8F6822C@arm.com>
References:
 <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
 <YbiP7YlpY22llB5Y@Air-de-Roger>
 <621259B5-E5EB-4ED9-A836-B6E17C0D6E36@arm.com>
 <YbscoZG/NRP6lMof@Air-de-Roger>
 <b3488523-489e-abb7-59f1-74c86e842060@suse.com>
 <5270d46a-a1ce-e361-dfeb-54408e9ba6f0@xen.org>
 <26968841-9b8a-757a-b9af-ba34a20fe576@suse.com>
In-Reply-To: <26968841-9b8a-757a-b9af-ba34a20fe576@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f3f95e33-f90a-49f7-5135-08d9c4653cc7
x-ms-traffictypediagnostic:
	AM6PR08MB3240:EE_|AM5EUR03FT007:EE_|DBBPR08MB4629:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB462928A74CDA8419C23C78ECFC7C9@DBBPR08MB4629.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d07j+SMm7S10W35qrn+cGcWEYPNKAK6RwjanMDpNSch8s9tnGGxnoUN5gmjmOvWnJQwY4CVtuDOitcoV2pZvtnBa6lCpaF9FE4ZbhSUkF+IfF/Iju16s5Njx7AbHVw7j42rUTlw27fzCVlmeLuLuPvd9x5MMTulyyvb4Kjt5yxyNvNTAqrFZgs7vCgf1zwk9Pb9aG2/kRukqCrwh9K7XENdVlrxFZOa8IDl2cyhg+/LcNysGMB/vFpqmfhCYRgEVivEXmOcwcN5PecUgwoB+hH7PetegfEemkmAg/hwcq1KlZ0FWR6LuqywhO7X9zFOWacgTFE0N3TnAlE8YP/sU8Ch1Oh2OGba8AFbJcvJGlVsF+n21da32rvfUaHdCeM7PH4WAaTrIWSOSvOw/V77dYBOToQCvnYCyirIrxSI4TECHcnE/OEktBQWwcbhs1nkggmpcfadu/v1SDxzMj5Lr1X2wzpfCSNlg6BSgsTLh86ol0TYh6px4k0dzwHwMbnv3+d9BKqH22m16XDEkZnHJ3ktRnhiBPmRx+Pf7y99/kExkDNywxfQhgXMGKwiZ0FnchtGYaSsMtFbZY4obuhuc1q1UThlD2VbQrEGjbGkLCZNOrEa0GZ3dHJyMCR1+Qdh9tNPWr1wU2IhqL9qq0elryOnENwhOU2h6GY1MuZCoTmIJy8CgwG+f63/yfxXucTi0ud6NUkv2pXxsUh1cL4L0xsUWB6cpHX75lFUyQNO00dKubaI+g7Rn+9P/mHYpAnd6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66946007)(4326008)(26005)(36756003)(76116006)(186003)(122000001)(91956017)(33656002)(5660300002)(6486002)(6512007)(2616005)(6506007)(316002)(53546011)(508600001)(83380400001)(64756008)(66446008)(8936002)(6916009)(66476007)(38070700005)(86362001)(54906003)(8676002)(2906002)(66556008)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CDE381EAAE9614FA4CF7043921AC037@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3240
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a8971d2-dde9-4e7a-214d-08d9c4653781
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/xJmJpl+HZ5AIjQy/JkasQyv0rcqswQbDPyQSKDJRUuJOiZn4EjiZUaUZz7TEpHEWGxruKkEDKqSdIbjsb9JWMx6dU2IZM17T1rUupXYPtDbkBdOsvACEWe++R3QFJvXHQvsgCd+9G3NYG8qMmZHin0YS04Qp524rM5W/XwJYzzg0sACuc6h9wXN1StXXkxjMCOOAipW3F39wjfjvG7V2LP4h/3Uw3wSxLHHqAuoaKXMfwNnpjzwWALvuD/5zj90bQVYIzmCSaNmz50IID2+d7E6n3TFd+E/TdksQgc2t02cWYb8sIxQ/N3BZtc5/pq/6OBgDDWVtGc5lovC4bSn7SW8IAx/tuS2uHspj7jzc3H2RD1iXzurYYdfpxlAVhGnF8flNLWIbp0XR36194P0jPYnoipEjTdr1++Aa52PX3kAhN2pCTUJ71P0Q6eB/a6raymjzFgKzqgAtVue6MZ8f+uspn6B2o6XNgKibcW8gStB52eD3eeM5ux+j2+DylVHM17N3kLorB3lehIcmk5dzBBI61hgAlPexnZDxUdnWwt/B5cwFlRrTOdx47hCqMIW/O6bnepUXIxnb8r2tSmctVQAR1NqNEvoaymHQCQk1kxfB/1ZE40hx610UIAOIw97HQkUYxDDERukgEGwpvZpxHyjK5AnnERM+0+nBacDvfhqLv9OTLt9Ozew6chyKfU4dXcegRGBtD3sCvJW+e6AHgZ+OZECR9E9zxkwD0+TlrJXAnUeHDNO+Vw2bYwBKv1LuuC+Ha/FyOu2zfXUzy5wuxvQLdRKpP1sANJt4SL2elM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(33656002)(40460700001)(63370400001)(8936002)(2906002)(5660300002)(6486002)(70586007)(83380400001)(6512007)(47076005)(36756003)(336012)(54906003)(63350400001)(8676002)(81166007)(316002)(356005)(6862004)(186003)(6506007)(82310400004)(508600001)(4326008)(26005)(107886003)(70206006)(2616005)(36860700001)(53546011)(86362001)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 09:35:33.9134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f95e33-f90a-49f7-5135-08d9c4653cc7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4629

SGkgSmFuDQoNCj4gT24gMjEgRGVjIDIwMjEsIGF0IDc6NDEgYW0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxNy4xMi4yMDIxIDE1OjMyLCBKdWxpZW4g
R3JhbGwgd3JvdGU6DQo+PiBPbiAxNi8xMi8yMDIxIDEzOjM3LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+PiBPbiAxNi4xMi4yMDIxIDEyOjAxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBP
biBUaHUsIERlYyAxNiwgMjAyMSBhdCAxMDoxODozMkFNICswMDAwLCBSYWh1bCBTaW5naCB3cm90
ZToNCj4+Pj4+PiBPbiAxNCBEZWMgMjAyMSwgYXQgMTI6MzcgcG0sIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+PiBPbiBUdWUsIERlYyAxNCwgMjAy
MSBhdCAxMDo0NToxN0FNICswMDAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4gKyAgICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyAqZGF0YSkNCj4+Pj4+Pj4gew0KPj4+Pj4+PiAtICAgIGNv
bnN0IHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47DQo+Pj4+Pj4+IC0gICAgc3RydWN0IHZw
Y2lfbXNpeCAqbXNpeCA9IG1zaXhfZmluZChkLCBhZGRyKTsNCj4+Pj4+Pj4gICAgIGNvbnN0IHN0
cnVjdCB2cGNpX21zaXhfZW50cnkgKmVudHJ5Ow0KPj4+Pj4+PiAgICAgdW5zaWduZWQgaW50IG9m
ZnNldDsNCj4+Pj4+Pj4gDQo+Pj4+Pj4+ICAgICAqZGF0YSA9IH4wdWw7DQo+Pj4+Pj4+IA0KPj4+
Pj4+PiAgICAgaWYgKCAhbXNpeCApDQo+Pj4+Pj4+IC0gICAgICAgIHJldHVybiBYODZFTVVMX1JF
VFJZOw0KPj4+Pj4+PiArICAgICAgICByZXR1cm4gVlBDSV9FTVVMX1JFVFJZOw0KPj4+Pj4+PiAN
Cj4+Pj4+Pj4gICAgIGlmICggIWFjY2Vzc19hbGxvd2VkKG1zaXgtPnBkZXYsIGFkZHIsIGxlbikg
KQ0KPj4+Pj4+PiAtICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOw0KPj4+Pj4+PiArICAgICAg
ICByZXR1cm4gVlBDSV9FTVVMX09LQVk7DQo+Pj4+Pj4+IA0KPj4+Pj4+PiAgICAgaWYgKCBWTVNJ
WF9BRERSX0lOX1JBTkdFKGFkZHIsIG1zaXgtPnBkZXYtPnZwY2ksIFZQQ0lfTVNJWF9QQkEpICkN
Cj4+Pj4+Pj4gICAgIHsNCj4+Pj4+Pj4gQEAgLTIxMCwxMSArMTk0LDExIEBAIHN0YXRpYyBpbnQg
bXNpeF9yZWFkKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGlu
dCBsZW4sDQo+Pj4+Pj4+ICAgICAgICAgc3dpdGNoICggbGVuICkNCj4+Pj4+Pj4gICAgICAgICB7
DQo+Pj4+Pj4+ICAgICAgICAgY2FzZSA0Og0KPj4+Pj4+PiAtICAgICAgICAgICAgKmRhdGEgPSBy
ZWFkbChhZGRyKTsNCj4+Pj4+Pj4gKyAgICAgICAgICAgICpkYXRhID0gdnBjaV9hcmNoX3JlYWRs
KGFkZHIpOw0KPj4+Pj4+IA0KPj4+Pj4+IFdoeSBkbyB5b3UgbmVlZCBhIHZwY2kgd3JhcHBlciBh
cm91bmQgdGhlIHJlYWQvd3JpdGUgaGFuZGxlcnM/IEFGQUlDVA0KPj4+Pj4+IGFybTY0IGFsc28g
aGFzIHtyZWFkLHdyaXRlfXtsLHF9LiBBbmQgeW91IGxpa2VseSB3YW50IHRvIHByb3RlY3QgdGhl
DQo+Pj4+Pj4gNjRiaXQgcmVhZCB3aXRoIENPTkZJR182NEJJVCBpZiB0aGlzIGNvZGUgaXMgdG8g
YmUgbWFkZSBhdmFpbGFibGUgdG8NCj4+Pj4+PiBhcm0zMi4NCj4+Pj4+IA0KPj4+Pj4gSSBuZWVk
IHRoZSB3cmFwcGVyIGJlY2F1c2Uge3JlYWQsd3JpdGV9e2wscX0gZnVuY3Rpb24gYXJndW1lbnQg
aXMgZGlmZmVyZW50IGZvciBBUk0gYW5kIHg4Ni4NCj4+Pj4+IEFSTSB7cmVhZCx3cmllfShsLHF9
ICBmdW5jdGlvbiBhcmd1bWVudCBpcyBwb2ludGVyIHRvIHRoZSBhZGRyZXNzIHdoZXJlYXMgWDg2
ICB7cmVhZCx3cmllfShsLHF9DQo+Pj4+PiBmdW5jdGlvbiBhcmd1bWVudCBpcyBhZGRyZXNzIGl0
c2VsZi4NCj4+Pj4gDQo+Pj4+IE9oLCB0aGF0J3MgYSBzaGFtZS4gSSBkb24ndCB0aGluayB0aGVy
ZSdzIGEgbmVlZCB0byB0YWcgdGhvc2UgaGVscGVycw0KPj4+PiB3aXRoIHRoZSB2cGNpXyBwcmVm
aXggdGhvdWdoLiBDb3VsZCB3ZSBtYXliZSBpbnRyb2R1Y2UNCj4+Pj4gYnVzX3tyZWFkLHdyaXRl
fXtiLHcsbCxxfSBoZWxwZXJzIHRoYXQgdGFrZSB0aGUgc2FtZSBwYXJhbWV0ZXJzIG9uIGFsbA0K
Pj4+PiBhcmNoZXM/DQo+Pj4+IA0KPj4+PiBJdCB3b3VsZCBiZSBldmVuIGJldHRlciB0byBmaXgg
dGhlIGN1cnJlbnQgb25lcyBzbyB0aGV5IHRha2UgdGhlIHNhbWUNCj4+Pj4gcGFyYW1ldGVycyBv
biB4ODYgYW5kIEFybSwgYnV0IHRoYXQgd291bGQgbWVhbiBjaGFuZ2luZyBhbGwgdGhlIGNhbGwN
Cj4+Pj4gcGxhY2VzIGluIG9uZSBvZiB0aGUgYXJjaGVzLg0KPj4+IA0KPj4+IFlldCBzdGlsbDog
KzEgZm9yIHJlbW92aW5nIHRoZSBleHRyYSBsZXZlbCBvZiBpbmRpcmVjdGlvbi4gSW1vIHRoZXNl
DQo+Pj4gdHJpdmlhbCBoZWxwZXJzIHNob3VsZCBuZXZlciBoYXZlIGRpdmVyZ2VkIGJldHdlZW4g
YXJjaGVzOyBJIGhhdmUNCj4+PiBhbHdheXMgYmVlbiB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0
IG9uIExpbnV4IHRoZXkgY2FuIGJlIHVzZWQgYnkNCj4+PiBhcmNoLWluZGVwZW5kZW50IGNvZGUg
KG9yIGVsc2UgZHJpdmVycyB3b3VsZCBiZSBxdWl0ZSBoYXJkIHRvIHdyaXRlKS4NCj4+IA0KPj4g
U28gdGVjaG5pY2FsbHkgYm90aCBoZWxwZXJzIGFyZSBhYmxlIHRvIGNvcGUgd2l0aCBwb2ludGVy
LiBUaGUgeDg2IG9uZSANCj4+IGlzIGFsc28gYWxsb3dpbmcgdG8gcGFzcyBhbiBhZGRyZXNzLg0K
Pj4gDQo+PiBGcm9tIGEgYnJpZWYgbG9vayBhdCB0aGUgeDg2LCBpdCBsb29rcyBsaWtlIG1vc3Qg
b2YgdGhlIHVzZXJzIGFyZSB1c2luZyANCj4+IGEgcG9pbnRlci4gSG93ZXZlciwgdGhlIHZQQ0kg
bXNpeCBjb2RlIGlzIG9uZSBleGFtcGxlIHdoZXJlIGFkZHJlc3NlcyANCj4+IGFyZSBwYXNzZWQu
DQo+IA0KPiBPa2F5LCBmaXJzdCBvZiBhbGwgSSBuZWVkIHRvIGNsZWFuIHVwIHNvbWUgY29uZnVz
aW9uIGNhdXNlIGJ5IFJhaHVsDQo+IHNheWluZyAicG9pbnRlciB0byB0aGUgYWRkcmVzc+KAnToN
Cg0KU29ycnkgZm9yIHRoZSBjb25mdXNpb24uDQo+IFRoYXQncyB3aGVyZSBteSAiZXh0cmEgbGV2
ZWwgb2YNCj4gaW5kaXJlY3Rpb24iIGNhbWUgZnJvbS4gSSB3b3VsZCByZWFsbHkgd2lzaCBvbmUg
d291bGRuJ3QgbmVlZCB0byBnbw0KPiB0byB0aGUgY29kZSBhbmQgdmVyaWZ5IHN1Y2ggYmFzaWMg
c3RhdGVtZW50cy4gVGhlcmUncyBubyAicG9pbnRlcg0KPiB0byB0aGUgYWRkcmVzcyIgaGVyZS4g
VGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhlIGFyZ3VtZW50IGhhcyB0bw0KPiBiZSBhIHBvaW50
ZXIgKEFybSkgb3IgaXMgY29udmVydGFibGUgdG8gYSBwb2ludGVyICh4ODYpLiBUaGVyZWZvcmUN
Cj4gLi4uDQo+IA0KPj4gQUZBSUNULCB0aGUgcmVhZCovd3JpdGUqIGhlbHBlcnMgb24gTGludXgg
b25seSB3b3JrcyB3aXRoIHBvaW50ZXJzLiBTbyBJIA0KPj4gdGhpbmsgdGhlIGFjdGlvbnMgc2hv
dWxkIGJlOg0KPj4gICAgMSkgTW9kaWZ5IHRoZSB2UENJIE1TSXggY29kZSB0byB1c2UgcG9pbnRl
cg0KPj4gICAgMikgTW9kaWZ5IHRoZSB4ODYgcmVhZCovd3JpdGUqIGhlbHBlcnMgdG8gZm9yYmlk
IGFueSBhY2Nlc3Mgb3RoZXIgDQo+PiB0aGFuIHBvaW50ZXIuDQo+IA0KPiAuLi4gSSdkIHN1Z2dl
c3QgdG8gZ28gd2l0aCAxKSwgdG8gYXZvaWQgaW1wYWN0aW5nIG90aGVyIHg4NiBjb2RlLg0KPiBM
b25nZXIgdGVybSBJIHdvdWxkbid0IG1pbmQgc3dpdGNoaW5nIHRvIDIpICh1bmxlc3MgdlBDSSBy
ZWFsbHkgaXMNCj4gdGhlIG9ubHkgcGxhY2UgdXNpbmcgbm9uLXBvaW50ZXIgYXJndW1lbnRzLCBp
biB3aGljaCBjYXNlIGRvaW5nDQo+IHRoZSAybmQgc3RlcCByaWdodCBhd2F5IFtidXQgc3RpbGwg
aW4gYSBzZXBhcmF0ZSBwYXRjaF0gd291bGQgc2VlbQ0KPiBxdWl0ZSByZWFzb25hYmxlKS4NCg0K
SSB3aWxsIGNob29zZSBvcHRpb24gMSBhcyBvZiBub3cgdG8gYXZvaWQgYW55IHg4NiBzcGVjaWZp
YyBjaGFuZ2UgdG8gDQoge3JlYWQsd3JpdGV9e2IsdyxsLHF9Lg0KDQpSZWdhcmRzLA0KUmFodWwN
Cj4gSmFuDQo+IA0KDQo=

