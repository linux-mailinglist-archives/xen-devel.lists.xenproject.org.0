Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F718791765
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 14:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595146.928650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8wM-0004P0-NZ; Mon, 04 Sep 2023 12:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595146.928650; Mon, 04 Sep 2023 12:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8wM-0004MG-JW; Mon, 04 Sep 2023 12:44:26 +0000
Received: by outflank-mailman (input) for mailman id 595146;
 Mon, 04 Sep 2023 12:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5g5r=EU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qd8wL-0004MA-FG
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 12:44:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5cf836d-4b20-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 14:44:22 +0200 (CEST)
Received: from DU2PR04CA0186.eurprd04.prod.outlook.com (2603:10a6:10:28d::11)
 by AS2PR08MB9619.eurprd08.prod.outlook.com (2603:10a6:20b:608::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 12:44:10 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::d1) by DU2PR04CA0186.outlook.office365.com
 (2603:10a6:10:28d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 12:44:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.23 via Frontend Transport; Mon, 4 Sep 2023 12:44:09 +0000
Received: ("Tessian outbound 5c548696a0e7:v175");
 Mon, 04 Sep 2023 12:44:09 +0000
Received: from bf157b4599c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 662CB877-9702-47F9-9A25-E9F9B20A0EF3.1; 
 Mon, 04 Sep 2023 12:43:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf157b4599c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 12:43:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8904.eurprd08.prod.outlook.com (2603:10a6:20b:5f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 12:43:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 12:43:40 +0000
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
X-Inumbo-ID: c5cf836d-4b20-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFklO5b2f6dOhFRf87IcVWpkw9/3z5lUCgxCbIbtKEw=;
 b=CBufgoNq9rjPwZFvcZotJF46wUZ98b3+uzCdOgXA2Sk9gBxBb+PEzaFuI1e6tk69hHuEqfFjdrPzkSZWYDGL5dmidzYXbmVv8t/pDzEvmt1SUsRObu0SPhCkl7XuhsPT5tCxnoAtsUcs2zyJwIMTc+aKsqPjN2cSuPftxB5Db2k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5565f4239582139f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQzoN/YmQBEBwa2GU50uFznCfssKwxp11kxGDPObqsWA1DyB07oLGNB4zVYTu5/EWqIl9byALfA4rb13wEZn5wHdndEMQIWfs1sAHHxiRkyqlLvVpj2PU5soLwnNghsl9J27j82JwNUQk8UjaOs6DtV3XugaN0iGeyoFjFrQKqZYZtY45XS/f+qBJ6zFz4UxNDphZkyEJ0horqV9NAo6VYsmvrYhGTMcjZ2Mk2ZeFkb1Aqi4Fjopg0LT9WGGW/3bySofW75nJ9iIm6iARwccH9hPyLbqBXifo/+Qo2g+4Q3fkCxrXiVI+1o56NQjmyJOlVPfGr/fbejicWqxwjHqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFklO5b2f6dOhFRf87IcVWpkw9/3z5lUCgxCbIbtKEw=;
 b=VWow8GoG7DgBhmVYywVKVgwVTAJEC/jL6d4tosymP2rlJKhgfA2Q+4Atf1MBtCUKE8JYmY/ZZFbfl4ipX/qQ/dCSI8b9bY1RDnpnnT1KeabiKu7PNNueKIfePIJNNZvib9uFET64WMAOgBGr1AB7nAMwskFecg74JFl18Iq8oqNRKXU0P8sV7oVCVrhO3O6rl58I65gXwx1OvzXVi5pUBeZBIXFFx/p5kRmUZewM4Ihwl2D4frskMa7L2VY6Fx+j8fYONEG8SIO+/lMrCnsOML8wDRht3s7ZcUjhRStEYmlFn4skmQTUv8npq4GlknFhqcWl+GdoxLcdaNdEkSVjrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFklO5b2f6dOhFRf87IcVWpkw9/3z5lUCgxCbIbtKEw=;
 b=CBufgoNq9rjPwZFvcZotJF46wUZ98b3+uzCdOgXA2Sk9gBxBb+PEzaFuI1e6tk69hHuEqfFjdrPzkSZWYDGL5dmidzYXbmVv8t/pDzEvmt1SUsRObu0SPhCkl7XuhsPT5tCxnoAtsUcs2zyJwIMTc+aKsqPjN2cSuPftxB5Db2k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Simone Ballarin <simone.ballarin@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, "nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>
Subject: Re: [XEN PATCH 05/13] automation/eclair: add deviation for usercopy.c
Thread-Topic: [XEN PATCH 05/13] automation/eclair: add deviation for
 usercopy.c
Thread-Index: AQHZ2b5Rm/+16tf7DEqQZJ2JP8GC+7AASiEAgApdMAA=
Date: Mon, 4 Sep 2023 12:43:39 +0000
Message-ID: <002EA5BA-DD4A-44ED-8DCE-94E67A786DC5@arm.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <4039623dc4341758f383ec49228c1e55e5862b0f.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281512360.6458@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2308281512360.6458@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8904:EE_|DBAEUR03FT021:EE_|AS2PR08MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c1420d-0885-4fb0-dc12-08dbad44a265
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bnFhgCOePLh1flN/MdpmRCFA5DHd095/T5695oiGbP96ZDzS4bogN8FdwqLNqTkcFw9M/T7NteQ9lVweRONnT5DLSGU0NqdaHU69OSbHxN+oawP0vjkIqj3eXxRSJKmw3n/Xoo/AOk8T9VVAUGtCmfKOWBI9365ZGVK4awMUeXeK7RxHHJ5Z5jzUBJ+nDhow+PaUVGdvlxinEiWB/vpunD+oLATORS7S1dJQyVgHW91RCd/AqUiWq06Uz5P46TzX5vOIS/+NaLTUfcL3BjEeewDvYyFpfWPTIhBYm1rlGNX16EyTkWiowmJNdePWzHdPHDSNyA55aln7yParrEtb4OuzHy2QvXe2Rjo6zr+mIfIwxE+iB2eNLTWfORSO0NzKqnPaQq+myfeWPdh5kPyvfTBeo9HhQ666hmWSfQCm+kjK/ZWHI2WC3keGqlYWcV+fPuLWOxQapfj7SZ7xqCijGj7B+WG2KhhYWfsId1ckSx8GPPWQBTOtVVW0S002xujJf1cGHwDqQ9TRJy3Oo2HUMCh4BMm/BvPAtII/O0xaRR2OUeoj/nAd++iwyE+A0drZA8ZOfHRulYDT4nadD8PVOkPLNbbbNVxmOTJ8D0GRLNBhNPLtzII4yXA8USAPPCiiadDDuZqU97xo7XbFVgEnHQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(186009)(1800799009)(451199024)(41300700001)(7416002)(71200400001)(38070700005)(122000001)(478600001)(33656002)(86362001)(2616005)(83380400001)(38100700002)(26005)(6512007)(53546011)(6506007)(6486002)(64756008)(76116006)(66446008)(91956017)(36756003)(54906003)(2906002)(316002)(6916009)(66476007)(66556008)(66946007)(8676002)(8936002)(5660300002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9F0718B8DB95746A53B1D591BAEEF96@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d2290d1-e990-4232-6796-08dbad4490af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hhf8wpkddghFcxuh2nuqkyGjTWQesoVo/jkeKgP56WfEN4u+8wni8PrRI+LCVLUV3Oy5ArLMi3/auCaemKOL/2IeViHOHYgTGpGH8x2ueULAik/WtoBi5ism/RuNDH7TGXoNK3Rbt/AGKfGFbg+m9H1j0lWq+FWRpsvkNUdTlQ+O4mfzYE532rXP2n37ZV7dSJ5IXxlMvWGgH68ix4Ffz1iG64nlW2hZDcmg7GwtT1Hdky2dqgfyM0yU89VRB/0smHPA1wr4tw5o7rFJaKcY/F8GH+Rb2ngpmQUnkd8jQ7HXC6n2JFjkcba/vHC8bzql+pbFNRxvjDyVTeJfCJXalCQRHIyM9+r2oBCWrtm5vz679lLm/4tLoagBL0njm3zyeU5n9NMJWBHIOpBn9TwXm5AqhkYBv4Y7nJLX7M5gv0J7WwfqIAjg7A9tzfpZwEJJMpljjymMYMLxPpraMTniyQnrpgcFGwMGjWXHTi1+ABhiGWWmnK9zCqRwST56SPnYnKmf/PqOPKV8ZTHjVJZaIU+3WI7iSxAf07zfIHm1+Tvu7vEvISQN7YTQrn+iQxQDxLBFpivWJkCwBChgYs4VTjme99Bl4Bg3g1/47bVkiBpvuY29AG8BIBfWPGK9ZNPDUmxQBLqriN/qHENWpwm2GCFFca2qsGi37UPN2JmIgGKbfYf8sKRsIgRZYMn1ruL93qik6WZk+bBB4878lUeD42sw7YBjJ1UrNTZ2D8cp0UOKMme/UA5sBcFJ1HHZQYlh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(41300700001)(356005)(82740400003)(81166007)(478600001)(33656002)(86362001)(2616005)(83380400001)(336012)(26005)(6512007)(47076005)(53546011)(6506007)(6486002)(36860700001)(40480700001)(70206006)(70586007)(36756003)(54906003)(2906002)(316002)(8676002)(8936002)(6862004)(5660300002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 12:44:09.6866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c1420d-0885-4fb0-dc12-08dbad44a265
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9619

DQoNCj4gT24gMjggQXVnIDIwMjMsIGF0IDIzOjI3LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gK05pY29sYSwgTHVjYQ0KPiANCj4gT24g
TW9uLCAyOCBBdWcgMjAyMywgU2ltb25lIEJhbGxhcmluIHdyb3RlOg0KPj4geGVuL2FyY2gveDg2
L3VzZXJjb3B5LmMgaW5jbHVkZXMgaXRzZWxmLCBzbyBpdCBpcyBub3Qgc3VwcG9zZWQgdG8NCj4+
IGNvbXBseSB3aXRoIERpcmVjdGl2ZSA0LjEwOg0KPj4gIlByZWNhdXRpb25zIHNoYWxsIGJlIHRh
a2VuIGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIGNvbnRlbnRzIG9mIGENCj4+IGhlYWRlciBmaWxl
IGJlaW5nIGluY2x1ZGVkIG1vcmUgdGhhbiBvbmNlIg0KPj4gDQo+PiBUaGlzIHBhdGNoIGFkZHMg
YSBkZXZpYXRpb24gZm9yIHRoZSBmaWxlLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBTaW1vbmUg
QmFsbGFyaW4gPHNpbW9uZS5iYWxsYXJpbkBidWdzZW5nLmNvbT4NCj4+IA0KPj4gLS0tDQo+PiBh
dXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wgfCA0ICsrKysN
Cj4+IGRvY3MvbWlzcmEvcnVsZXMucnN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIg
KysNCj4+IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYgLS1n
aXQgYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wgYi9h
dXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+IGluZGV4
IDI2ODFhNGNmZjUuLmE3ZDRmMjliNDMgMTAwNjQ0DQo+PiAtLS0gYS9hdXRvbWF0aW9uL2VjbGFp
cl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+ICsrKyBiL2F1dG9tYXRpb24vZWNs
YWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPj4gQEAgLTk2LDYgKzk2LDEwIEBA
IGNvbmZvcm0gdG8gdGhlIGRpcmVjdGl2ZS4iDQo+PiAtY29uZmlnPU1DM1IxLkQ0LjEwLHJlcG9y
dHMrPXtzYWZlLCAiZmlyc3RfYXJlYSh0ZXh0KF4gXFwqIEluIHRoaXMgY2FzZSwgbm8gaW5jbHVz
aW9uIGd1YXJkcyBhcHBseSBhbmQgdGhlIGNhbGxlciBpcyByZXNwb25zaWJsZS4qXFwqLyQsIGJl
Z2luLTEpKSJ9DQo+PiAtZG9jX2VuZA0KPj4gDQo+PiArLWRvY19iZWdpbj0ieGVuL2FyY2gveDg2
L3VzZXJjb3B5LmMgaW5jbHVkZXMgaXRzZWxmOiBpdCBpcyBub3Qgc3VwcG9zZWQgdG8gY29tcGx5
IHdpdGggdGhlIGRpcmVjdGl2ZSINCj4+ICstY29uZmlnPU1DM1IxLkQ0LjEwLHJlcG9ydHMrPXtk
ZWxpYmVyYXRlLCAiYWxsX2FyZWEoYWxsX2xvYyhmaWxlKCJeeGVuL2FyY2gveDg2L3VzZXJjb3B5
XFwuYyQiKSkpIn0NCj4+ICstZG9jX2VuZA0KPj4gKw0KPj4gIw0KPj4gIyBTZXJpZXMgNS4NCj4+
ICMNCj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc3JhL3J1bGVzLnJzdCBiL2RvY3MvbWlzcmEvcnVs
ZXMucnN0DQo+PiBpbmRleCA0YjFhN2IwMmI2Li40NWUxM2QwMzAyIDEwMDY0NA0KPj4gLS0tIGEv
ZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4+ICsrKyBiL2RvY3MvbWlzcmEvcnVsZXMucnN0DQo+PiBA
QCAtNjIsNiArNjIsOCBAQCBtYWludGFpbmVycyBpZiB5b3Ugd2FudCB0byBzdWdnZXN0IGEgY2hh
bmdlLg0KPj4gICAgICAtIEZpbGVzIHRoYXQgYXJlIGludGVuZGVkIHRvIGJlIGluY2x1ZGVkIG1v
cmUgdGhhbiBvbmNlIGRvIG5vdCBuZWVkIHRvDQo+PiAgICAgICAgY29uZm9ybSB0byB0aGUgZGly
ZWN0aXZlLiBGaWxlcyB0aGF0IGV4cGxpY2l0bHkgYXZvaWQgaW5jbHVzaW9uIGd1YXJkcw0KPj4g
ICAgICAgIHVuZGVyIHNwZWNpZmljIGNpcmN1bXN0YW5jZXMgZG8gbm90IG5lZWQgdG8gY29uZm9y
bSB0aGUgZGlyZWN0aXZlLg0KPj4gKyAgICAgICB4ZW4vYXJjaC94ODYvdXNlcmNvcHkuYyBpbmNs
dWRlcyBpdHNlbGY6IGl0IGlzIG5vdCBzdXBwb3NlZCB0byBjb21wbHkNCj4+ICsgICAgICAgd2l0
aCB0aGUgZGlyZWN0aXZlLg0KPiANCj4gDQo+IFdlIG5lZWQgdG8gZmluZCBhIGNvbnNpc3RlbnQg
d2F5IHRvIGRvY3VtZW50IHRoaXMga2luZCBvZiBkZXZpYXRpb25zIGluDQo+IGEgbm9uLUVDTEFJ
UiBzcGVjaWZpYyB3YXksIHdpdGhvdXQgYWRkaW5nIHRoZSBjb21wbGV0ZSBsaXN0IG9mDQo+IGRl
dmlhdGlvbnMgdG8gcnVsZXMucnN0Lg0KPiANCj4gQ2FuIHdlIHVzZSBzYWZlLmpzb24gYW5kIGFk
ZCBhbiBpbi1jb2RlIGNvbW1lbnQgYXQgdGhlIHRvcCBvZg0KPiB1c2VyY29weS5jPyBFLmcuOg0K
PiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni91c2VyY29weS5jIGIveGVuL2FyY2gveDg2
L3VzZXJjb3B5LmMNCj4gaW5kZXggYjhjMmQxY2MwYi4uOGJiNTkxZjQ3MiAxMDA2NDQNCj4gLS0t
IGEveGVuL2FyY2gveDg2L3VzZXJjb3B5LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L3VzZXJjb3B5
LmMNCj4gQEAgLTEsMyArMSw0IEBADQo+ICsvKiBTQUYtMS1zYWZlICovDQo+IC8qIA0KPiAgKiBV
c2VyIGFkZHJlc3Mgc3BhY2UgYWNjZXNzIGZ1bmN0aW9ucy4NCj4gICoNCj4gDQo+IE90aGVyd2lz
ZSwgbWF5YmUgd2Ugc2hvdWxkIGV4dGVuZCBzYWZlLmpzb24gdG8gYWxzbyBoYXZlIGFuIGV4dHJh
IGZpZWxkDQo+IHdpdGggYSBsaXN0IG9mIHBhdGhzLiBGb3IgaW5zdGFuY2Ugc2VlICJmaWxlcyIg
YmVsb3c6DQo+IA0KPiB7DQo+ICAgICJ2ZXJzaW9uIjogIjEuMCIsDQo+ICAgICJjb250ZW50Ijog
Ww0KPiAgICAgICAgew0KPiAgICAgICAgICAgICJpZCI6ICJTQUYtMC1zYWZlIiwNCj4gICAgICAg
ICAgICAiYW5hbHlzZXIiOiB7DQo+ICAgICAgICAgICAgICAgICJlY2xhaXIiOiAiTUMzUjEuUjgu
NiIsDQo+ICAgICAgICAgICAgICAgICJjb3Zlcml0eSI6ICJtaXNyYV9jXzIwMTJfcnVsZV84XzZf
dmlvbGF0aW9uIg0KPiAgICAgICAgICAgIH0sDQo+ICAgICAgICAgICAgIm5hbWUiOiAiUnVsZSA4
LjY6IGxpbmtlciBzY3JpcHQgZGVmaW5lZCBzeW1ib2xzIiwNCj4gICAgICAgICAgICAidGV4dCI6
ICJJdCBpcyBzYWZlIHRvIGRlY2xhcmUgdGhpcyBzeW1ib2wgYmVjYXVzZSBpdCBpcyBkZWZpbmVk
IGluIHRoZSBsaW5rZXIgc2NyaXB0LiINCj4gICAgICAgIH0sDQo+ICAgICAgICB7DQo+ICAgICAg
ICAgICAgImlkIjogIlNBRi0xLXNhZmUiLA0KPiAgICAgICAgICAgICJhbmFseXNlciI6IHsNCj4g
ICAgICAgICAgICAgICAgImVjbGFpciI6ICJNQzNSMS5ENC4xMCINCj4gICAgICAgICAgICB9LA0K
PiAgICAgICAgICAgICJuYW1lIjogIkRpciA0LjEwOiBmaWxlcyB0aGF0IGluY2x1ZGUgdGhlbXNl
bHZlcyIsDQo+ICAgICAgICAgICAgInRleHQiOiAiRmlsZXMgcHVycG9zZWx5IHdyaXR0ZW4gdG8g
aW5jbHVkZSB0aGVtc2VsdmVzIGFyZSBub3Qgc3VwcG9zZWQgdG8gY29tcGx5IHdpdGggRDQuMTAu
IiwNCj4gICAgICAgICAgICAiZmlsZXMiOiBbInhlbi9hcmNoL3g4Ni91c2VyY29weS5jIl0NCg0K
V2h5IGNvdWxkbuKAmXQgd2UgZG8gaXQgd2l0aG91dCB0aGUg4oCcZmlsZXPigJ0gZmllbGQ/IFRo
ZSBwcmVzZW5jZSBvZiB0aGUgdGFnIGluIHRoZSBmaWxlIGFuZCB0aGUganVzdGlmaWNhdGlvbiAo
SSB0aGluaykNCmFyZSBlbm91Z2guIA0KDQo+ICAgICAgICB9LA0KPiAgICAgICAgew0KPiAgICAg
ICAgICAgICJpZCI6ICJTQUYtMi1zYWZlIiwNCj4gICAgICAgICAgICAiYW5hbHlzZXIiOiB7fSwN
Cj4gICAgICAgICAgICAibmFtZSI6ICJTZW50aW5lbCIsDQo+ICAgICAgICAgICAgInRleHQiOiAi
TmV4dCBJRCB0byBiZSB1c2VkIg0KPiAgICAgICAgfQ0KPiAgICBdDQo+IH0NCg0K

