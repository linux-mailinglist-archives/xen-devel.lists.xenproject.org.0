Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8164268BCBE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:23:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490323.758956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0WA-0000hL-79; Mon, 06 Feb 2023 12:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490323.758956; Mon, 06 Feb 2023 12:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0WA-0000fK-46; Mon, 06 Feb 2023 12:22:42 +0000
Received: by outflank-mailman (input) for mailman id 490323;
 Mon, 06 Feb 2023 12:22:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzyl=6C=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pP0W9-0000fE-17
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:22:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f25255de-a618-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 13:22:39 +0100 (CET)
Received: from DB8PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:10:a0::27)
 by AM0PR08MB5410.eurprd08.prod.outlook.com (2603:10a6:208:182::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:21:58 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::43) by DB8PR09CA0014.outlook.office365.com
 (2603:10a6:10:a0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 12:21:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.31 via Frontend Transport; Mon, 6 Feb 2023 12:21:58 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Mon, 06 Feb 2023 12:21:57 +0000
Received: from f91aebf85563.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 732E804C-A809-4A86-B1BF-2C70AB1296FA.1; 
 Mon, 06 Feb 2023 12:21:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f91aebf85563.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Feb 2023 12:21:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8449.eurprd08.prod.outlook.com (2603:10a6:150:81::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:21:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 12:21:48 +0000
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
X-Inumbo-ID: f25255de-a618-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk01eoEzdydpuKXtKkiVQl/biFAmUsr/YQFF4kLQvgQ=;
 b=42ITL4SbcL3/iHWIALjhTKCzgby9KW3qOj9HOpTJH1Et9Z/3ywAC9CKl6oldWzpQ5esXAn1B2FebbN8qbtGDdH35yEVJKUqLzo+Ivy16Y8vnyop9yohk+YAPeg5Xd3dVby4fonbj0hUxgmo3f5XwcQcsr89VJwq/Xvi7GPIZy00=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f1541c4d77ffdee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RP+TP4aIw+RfsgA7is46xI8CyUhqZkbicGWA6SOUfk5mbVIuOaPdA3gb09FNUKqbmkwLGXHAsNjyo0dIi2FtsbmV8DFV8UQ7lE6ji+hHySHFQOYPq6YbNDMlVn8vdrpsVp6w1qxBh8/ow8ULcZKxLrvBPVTScSOWke+zYjq18wGwLqUHh5+1+sSXeMPY+Q1E6+1ClynYLR+GLdT4zM5GodFefYTQL0/WIw80FIZSqVTSnWUa4bbJYVO+tRlrk5gob3BBO/DLu/KhTd2n0mV+6xvPGI3rjlfEEaJMLFIVLch6emac9KeZzEeYxJriVToJcOcPfA1M2u12Q/8RrQJJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk01eoEzdydpuKXtKkiVQl/biFAmUsr/YQFF4kLQvgQ=;
 b=NlZB0wtqfLv3gl4e3h+RC8YMzE2GQpLJYFUIhNWvi7tXGNMocvJM2fj/RYPxWYlPjkIq42M2ARnyauRRNOHdFkf3/d/+mlQykcrPpwDQ+SOxfDbAMuVdSWT/QqrtDsbY8Uv/Pb+jTdcjVl67ktql0Y2W38DD41GpZiXtnFoFx1w1WKpDK6y17kJjfp3Art8jJBIoDMHkaVbt3PF9i7hOCQBM+Ztqam/AB/7YOrwUClLOraf+izOQb7/VwBbJEmZXBEI1TXJVoHRGK9piSVP5f0yDd9lu15/hpu+eLQh3ovmpGtrGMm3kdvTwKwBEC1QGCY2bZycaZbObbjiYBMQn9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk01eoEzdydpuKXtKkiVQl/biFAmUsr/YQFF4kLQvgQ=;
 b=42ITL4SbcL3/iHWIALjhTKCzgby9KW3qOj9HOpTJH1Et9Z/3ywAC9CKl6oldWzpQ5esXAn1B2FebbN8qbtGDdH35yEVJKUqLzo+Ivy16Y8vnyop9yohk+YAPeg5Xd3dVby4fonbj0hUxgmo3f5XwcQcsr89VJwq/Xvi7GPIZy00=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Proposal: List files in Xen originated from external sources
Thread-Topic: Proposal: List files in Xen originated from external sources
Thread-Index: AQHZN7IkxuQrtwTv+0WBDKkxqc3Ztq7BtLQAgAAnBYA=
Date: Mon, 6 Feb 2023 12:21:48 +0000
Message-ID: <9EDE6823-A6EB-4ECF-BFFA-2FE896C076AD@arm.com>
References: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
 <005b7fa3-0f64-b15d-38d5-8135b0da06d2@suse.com>
In-Reply-To: <005b7fa3-0f64-b15d-38d5-8135b0da06d2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8449:EE_|DBAEUR03FT062:EE_|AM0PR08MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad75653-89d7-4179-e5f6-08db083cbde7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZmdE0PBg9LqemmOCZu3hxh1zA44yn/0u12aekb8xQoD9obGNlax35aagx6diQ80bnkRMJTlQeT4vQBM05UFV7xc/KIcoXD8I811/XBwm0smWFxoJWxCaj/kGdIaGwc82amDZZasehZwZmkMV4p2v7idWrGaUvRwMEfmDhOAnBPo3t859fHeVkjA6+mK0qkh32T/TwCP8t2GCj6QgEdW2yDbgfu8Rt/WFHcKNq1kVdivzev13fDAB6u4tKZpSJoeXmBW7SpWjx0GYlN+2FEP9dahEWj7XZ0EK0chrerwG+zUFgXhVvAXJRsLClfX5Q/922V0yj4FuQzGrIS0H5zlTBvhnzfs/MNR1i/VCxZAFjZg3ZWtAAmVMc0kA0psbfw/AAm+h4zHvkKXkfdSflCrhKewgTWB4EY4Q3d9ye443W1UGzt0fydZOQJc1c/xA82CVScHfQGzDPUnKQhtLutZ8iXexokBH+e+tLBY3XHvRotRCvCBRA2u0hrwkvIbMfQ+iqlvYGhYP+tcaB85GLHkE8b43NWDqTlljARH5+63V2Ow2UsJQUa5dUzKarALD5bSl7yPJffMDdG0L8yD2H0dUgJLViIQTYlvJOF9DJ9yH36nTgcclfmB6uUuwnKpqyWPRvvVofa8wC3droltiyLI8Egv9jHwbT5J7s7jGZp7ydVtzYkbmI14UAUFIGpXH3im700E1PSVgaBwU5ajkwpaYHJca50x3rEYuYdhZFYw/Vr5ssAdplIm3ApYpHf+v1s5KGObV/7aShjnSDM8NHigLHA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199018)(36756003)(33656002)(6486002)(71200400001)(66946007)(316002)(54906003)(8676002)(6506007)(53546011)(966005)(478600001)(64756008)(66446008)(5660300002)(2906002)(66476007)(66556008)(8936002)(6916009)(91956017)(76116006)(4326008)(26005)(83380400001)(38070700005)(41300700001)(6512007)(38100700002)(86362001)(122000001)(186003)(2616005)(66899018)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <09510CB97C079D419C5905E39958F19A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8449
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c97ef6e-7d74-4796-d34d-08db083cb808
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OI2DVQG4FcgfW+GyG528cdwbiK1YF+FJfa0y23L5qe7e0IZ0j1nr2+VtorLt9VrwEmfPGTbZFvVBGOZCEOYRuPFrwL+dgWkGIlkILHbnfSfm8heRkfDF6Y6UQqOzTberQ6Ky4Kp7kJt1Vj5fghHQx7Euj4yuI4H2j3C1ZRvjdGddYWBrNgSP+QEpW1wqZZ5Hdoz2ml6Kl5ZyaOUBbUi+FyJqDG4pK4PjHU7HcQwNlbBE3UgeGq1vlWC+rRpeR1c7cks7P98aMxOqybvhbNWTaHXlccGeROIHTO8nGcPnemdT1ts2TihXzOf1KS3p3H6aPQ4tOTnLawvOsy51iJEDdtXIzX4NUeLhGnJKCRFySYgMHEcigMBtiNfuJ2ZGjviW1F2TaBw1EaamoM8sahlIhkx2xBuEMUQhNecr16v4OGEj8VnxetAhHr3LOMgzT2bz8OMwRl7szEb7zj0MHFf5tJQDeWcjL8K/Cc8GANfILvN/KpbPzRQPQdZ9G7uD4s6c6mDgInyH5sC7Jd0x2qwZ08WXZIjqKTi0l5kZX1JFzo3aBDP+Hx8MpLqOluAmiveF2UfwA00O1X5UZefjz4x7tTVOrk2ItqEz2l/CwHSdYyb2gXaDu6ELQYipLIRkuwh/2S+7LhfCsuErgmR767wa1O1mV8i9pZ06JUAPU7b0iwZ1pLzb2nLrITqXWvJCjD4zPMbvOMTUCVFUiywYPYLkmrom2t3EPLAL9Vpzda2So0I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(36840700001)(40470700004)(46966006)(81166007)(356005)(33656002)(86362001)(36756003)(82740400003)(40460700003)(70586007)(41300700001)(36860700001)(8676002)(8936002)(6862004)(54906003)(4326008)(70206006)(316002)(5660300002)(2616005)(47076005)(40480700001)(336012)(83380400001)(6486002)(82310400005)(2906002)(478600001)(6512007)(186003)(26005)(6506007)(966005)(53546011)(66899018);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:21:58.0052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad75653-89d7-4179-e5f6-08db083cbde7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5410

SGkgSmFuLA0KDQpUaGFuayB5b3UgZm9yIGxlYXZpbmcgeW91ciBmZWVkYmFja3MsIHJlYWxseSBh
cHByZWNpYXRlZC4NCg0KPiBPbiA2IEZlYiAyMDIzLCBhdCAxMDowMSwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDAzLjAyLjIwMjMgMTA6MzAsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+PiBJ4oCZbSBzdGFydGluZyBhIHByb3Bvc2FsIGZvciB0aGUgZXh0
ZXJuYWwgZmlsZXMgdGhhdCBuZWVkcyB0byBiZSByZW1vdmVkIGZyb20gdGhlIE1JU1JBIHNjYW4s
DQo+PiB0aGUgd29yayB3YXMgb3JpZ2luYWxseSBzdGFydGVkIGJ5IE1pY2hhbCBoZXJlOg0KPj4g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9wYXRjaC8yMDIy
MTExNjA5MjAzMi40NDIzLTEtbWljaGFsLm9yemVsQGFtZC5jb20vDQo+PiBzbyBJIHN0YXJ0ZWQg
YnkgdGhhdCB0aHJlYWQsIHRoZSBhaW0gb2YgdGhpcyB3b3JrIGlzIHRvIGhhdmUgYW4gaW5pdGlh
bCBmb3JtYXQgdG8gc3RhcnQgYXMgc29vbiBhcyBwb3NzaWJsZSB0bw0KPj4gZXhjbHVkZSB0aGUg
ZXh0ZXJuYWwgZmlsZXMgZnJvbSB0aGUgTUlTUkEgc2NhbiAoYXQgbGVhc3QgaW5pdGlhbGx5IGZy
b20gY3BwY2hlY2spLg0KPj4gDQo+PiBJIHRoaW5rIHdlIGNhbiB1c2UgdGhlIEpTT04gZm9ybWF0
IGJlY2F1c2UgaXTigJlzIGVhc3kgdG8gaW50ZWdyYXRlIGl0IHdpdGggcHl0aG9uIGFuZCBpdOKA
mXMgZWFzeSB0byBhZGQvcmVtb3ZlDQo+PiBmaWVsZHMgZnJvbSB0aGUgc3RydWN0dXJlIHdpdGhv
dXQgaW50ZXJmZXJpbmcgd2l0aCB0aGUgb3RoZXIgZWxlbWVudHMgZHVyaW5nIHRpbWUsIHNvIHdl
IGNhbiBkZWZpbmUgYSBzdHJ1Y3R1cmUNCj4+IG5vdyBidXQgaWYgaW4gdGhlIGZ1dHVyZSB3ZSBz
ZWUgdGhlIG5lZWRzIGZvciBhZGRpdGlvbmFsIGZpZWxkLCB3ZSBjYW4ganVzdCBhZGQgdGhlbSB3
aXRob3V0IGNoYW5nZXMgdG8gdGhlDQo+PiBhbmFseXNpcyBzY3JpcHQuDQo+PiANCj4+IEluIG15
IG9waW5pb24gbWFueSBvZiB0aGVzZSBmaWVsZHMgY2FuIGJlIGxlZnQgZW1wdHkgaW4gYSBmaXJz
dCBwdXNoLCB0byBsZXQgdGhlIHNjcmlwdCBleGNsdWRlIHRoZSBmaWxlcyBhbmQgZHVyaW5nDQo+
PiB0aW1lIHdpdGggdGhlIGNvbnRyaWJ1dGlvbnMgb2YgdGhlIGNvbW11bml0eSB3ZSBjYW4gYWRk
IHRoZSBtaXNzaW5nIGluZm9ybWF0aW9ucy4NCj4gDQo+IEknbSBoYXZpbmcgdHJvdWJsZSBtYWtp
bmcgYSBjb25uZWN0aW9uIGJldHdlZW4gYSBmaWxlIGhhdmluZyBhbiBlbnRyeSBoZXJlDQo+IGFu
ZCB0aGUgbmVlZC9kZXNpcmUgdG8gaW5jbHVkZSBpdCBpbiBzY2FubmluZy4gQ2FuIHlvdSBjbGFy
aWZ5IHBsZWFzZSB3aHkNCj4geW91IHNlZSBhbiBpbXBsaWNhdGlvbiBmcm9tIG9uZSB0byB0aGUg
b3RoZXIgaGVyZT8NCg0KTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGFuIGV4dGVybmFsIGZpbGUg
c2hvdWxkIG5vdCBiZSBpbmNsdWRlZCBpbiB0aGUgcmVwb3J0LCBiZWNhdXNlIHdlIGNhbuKAmXQg
ZG8gZGlyZWN0IGNoYW5nZXMNCnNvIHRoZXJlIG1pZ2h0IGJlIHNpdHVhdGlvbnMgd2hlcmUgdGhl
IGZpeCBjYW7igJl0IGJlIGluY2x1ZGVkIGluIHRoZSBvcmlnaW5hbCBwcm9qZWN0IGFuZCBiYWNr
IHBvcnRlZCBhZnRlcndhcmRzIGJlY2F1c2UNCnRoZSBvcmlnaW5hbCBwcm9qZWN0IGRvZXNu4oCZ
dCBhcHBseSB0aGUgc2FtZSBjb2Rpbmcgc3RhbmRhcmQsIG9yIGNvZGUgdGhhdCBuZWVkcyB0byBi
ZSBqdXN0aWZpZWQgc2ltcGx5IGNhbuKAmXQgYmUganVzdGlmaWVkDQpiZWNhdXNlIHRoZSB0YWcg
d2UgdXNlIGRvZXNu4oCZdCBtYWtlIHNlbnNlIGluIHRoZSBvcmlnaW5hbCBwcm9qZWN0Lg0KU28g
d2UgZGVjaWRlZCAoPykgdG8gbGVhdmUgdGhpcyBidXJkZW4gdG8gdGhlIGZpbmFsIHVzZXIgdGhh
dCBtaWdodCBqdXN0IGNvbnN1bHQgdGhlIGxpc3Qgb2YgZXh0ZXJuYWwgZmlsZXMgdG8gZml4L2p1
c3RpZnkgd2hhdA0KaXMgbm90IGNvbXBsaWFudCB3aXRoIHRoZSBjb2Rpbmcgc3RhbmRhcmQgdGhh
dCBuZWVkcyB0byBiZSBmb2xsb3dlZC4NCg0KPiANCj4+IEkgdGhpbmsgaXTigJlzIGVhc2llciBm
b3IgdGhlIGNvbW11bml0eSB0byBwaWNrIGFuIGVudHJ5LCBkbyBzb21lIHJlc2VhcmNoIHRvIGZp
bGwgdGhlIGdhcHMgYW5kIHB1c2gsIGluc3RlYWQgdG8gd2FpdA0KPj4gdW50aWwgaGF2aW5nIGFs
bCB0aGUgaW5mb3JtYXRpb25zIGJlZm9yZSBhZGRpbmcgdGhlIGVudHJ5Lg0KPiANCj4gTWF5YmUg
aXQncyBlYXNpZXIsIGJ1dCBpdCdzIHRoZW4gYWxzbyBsZXNzIHVzZWZ1bC4gRm9yIGV4YW1wbGUg
SSB2aWV3DQo+IGl0IGFzIHF1aXRlIHJlbGV2YW50IHdoYXQgdGhlIG9yaWdpbiBvZiBhIGZpbGUg
aXMuIFRoYXQgbWF5LCBmb3INCj4gZXhhbXBsZSwgaGF2ZSBhbiBpbXBsaWNhdGlvbiBvbiB3aGV0
aGVyICJiYWNrcG9ydCIgaXMgc2Vuc2libGUgdG8gc2V0DQo+IHRvICJ0cnVlIiAob3JpZ2luIHBy
b2plY3RzIGNvdWxkLCBhZnRlciBhbGwsIGJlIGxhcmdlbHkgdW5tYWludGFpbmVkLA0KPiBhbmQg
aGVuY2UgaXQgbWF5IGJlIGRpZmZpY3VsdCB0byBnZXQgYW55IGNoYW5nZXMgaW50byB0aGVyZSku
DQoNCkl04oCZcyBhIGZpcnN0IHN0ZXAgdG8gdW5ibG9jayB0aGUgY29kZSBzY2FubmVyIHRvIGRv
IHByb3Blcmx5IGl0cyBqb2IsIHRoYXQgaXMgcHJvZHVjZSBhIHJlcG9ydCBvZiBmaW5kaW5ncyB3
ZSBuZWVkIHRvIGZpeC9qdXN0aWZ5DQp3aXRob3V0IHRoZSBwcm9ibGVtIG9mIGhhdmluZyBleHRl
cm5hbCBmaWxlcyBpbiB0aGUgcmVwb3J0ICh0aGF0IGNhbuKAmXQgYmUgdG91Y2hlZCkuDQoNClNv
IEkgZ2V0IHlvdXIgcG9pbnQgdGhhdCBhIGxpc3Qgb2YgZmlsZXMgd2l0aG91dCBvdGhlciBkYXRh
IGlzIG5vdCByZWFsbHkgdXNlZnVsLCBidXQgaXQgZW5hYmxlcyB0aGUgY29tbXVuaXR5IG1lbWJl
ciB0byBzaGFyZQ0KdGhlIGJ1cmRlbiBvZiBmaW5kaW5nIHRoZSBoaXN0b3J5IG9mIGl0LCBjdXJy
ZW50bHkgd2Uga25vdyB3aGljaCBmaWxlcyBhcmUgZXh0ZXJuYWwgKG1vc3Qgb2YgdGhlIHRpbWVz
IGJ5IGV4cGVyaWVuY2Ugb3IganVzdCBieSBsb29raW5nDQppbnRvIGl0cyBjb2Rlc3R5bGUpLCB3
ZSBsaXN0IHRoZW0gYW5kIGZyb20gdGltZSB0byB0aW1lIGNvbW11bml0eSBtZW1iZXJzIGNhbiBw
aWNrIG9uZSBlbnRyeSBhbmQgZG8gc29tZSBhcmNoZW9sb2d5IG9uIGl0DQp0byByZWNvbnN0cnVj
dCBpdHMgb3JpZ2luLg0KV2UgbWlnaHQgZW5kIHVwIGV2ZW50dWFsbHkgdG8gcmVjb2duaXNlIHRo
YXQgZm9yIGEgcGFydGljdWxhciBmaWxlIHdlIGNvdWxkIGp1c3QgbWFrZSBkaXJlY3QgbW9kaWZp
Y2F0aW9ucw0KYmVjYXVzZSBpdCBjYW7igJl0IGJlIGFueW1vcmUgc3ViamVjdCB0byBiYWNrIHBv
cnRzIChvcmlnaW4gZGl2ZXJnZWQgdG9vIG11Y2ggbWF5YmUsIGJ1dCBJ4oCZbSBvcGVuIHRvIHN1
Z2dlc3Rpb25zIGFib3V0IHRoaXMgY2FzZSkuDQoNCk15IHBlcnNvbmFsIG9waW5pb24gaXMgdGhh
dCB3ZSBjYW7igJl0IGdpdmUgdGhlIGJ1cmRlbiBvZiBkb2luZyB0aGF0IGZyb20gQSB0byBaIGZv
ciBldmVyeSBlbnRyeSB0byB0aGUgY29udHJpYnV0b3JzLCBpdCB3aWxsIHJlc3VsdHMgb24NCm5v
dCBoYXZpbmcgYW55dGhpbmcgYXQgYWxsLCB0aGUgY29tbXVuaXR5IHNob3VsZCBzcHJlYWQgdGhl
IGJ1cmRlbiBpbiB0aGVzZSBzaXR1YXRpb25zLCBpdOKAmXMgbm90IGxpa2UgYSBmZWF0dXJlIHRo
YXQgaW50cm9kdWNlcyBpc3N1ZXMNCmluIFhlbiBhbmQgdGhlIHBlcnNvbiBzaG91bGQgbWFrZSBp
dCBjb21wbGV0ZSBmcm9tIHRoZSBiZWdpbm5pbmcsIGl04oCZcyBkb2N1bWVudGF0aW9uIHRoYXQg
Y2FuIGJlIHByb2R1Y2VkIGR1cmluZyB0aW1lIGFuZCBjb250cmlidXRpb25zDQphcmUgd2VsY29t
ZS4NCg0KPiANCj4+IFRoaXMgaXMgbXkgZmlyc3QgdGhvdWdoIGZvciB0aGUgZmllbGRzLCBsZXQg
bWUga25vdyB5b3VyczoNCj4+IA0KPj4gZG9jcy9taXNyYS9leHRlcm5hbC1maWxlcy5qc29uOg0K
Pj4gew0KPj4gInZlcnNpb24iOiAiMS4w4oCdLA0KPj4gImNvbnRlbnQiOiBbDQo+PiAgIHsNCj4+
ICAgICAicGF0aCI6ICJyZWxhdGl2ZS9wYXRoL2Zyb20veGVuL+KAnCwNCj4+ICAgICAiYmFja3Bv
cnQiOiBUcnVlL0ZhbHNlLA0KPj4gICAgICJvcmlnaW5fcHJvamVjdCI6ICJVUkwgdG8gb3JpZ2lu
IHByb2plY3QiLA0KPj4gICAgICJvcmlnaW5fcGF0aCI6ICJyZWxhdGl2ZSBwYXRoIGluIHRoZSBv
cmlnaW5hbCBwcm9qZWN0IiwNCj4+ICAgICAib3JpZ2luX3JldmlzaW9uIjogInJldmlzaW9uIGlu
IG9yaWdpbmFsIHByb2plY3TigJ0NCj4+ICAgfQ0KPj4gXQ0KPj4gfQ0KPj4gDQo+PiANCj4+IE1h
eWJlLCBkb2N1bWVudGF0aW9uIGZvciB0aGlzIGZpbGUgYW5kIHRoZSBmaWVsZHMgY2FuIHJlc2lk
ZSBpbiBkb2NzL21pc3JhL2V4dGVybmFsLWZpbGVzLnJzdC4NCj4gDQo+IENvdWxkbid0IGRvY3Vt
ZW50YXRpb24gb2YgdGhlIGZpZWxkcyBsaXZlIGF0IHRoZSB0b3Agb2YgdGhlIGZpbGUgaXRzZWxm
Pw0KDQpVbmZvcnR1bmF0ZWx5IG5vdCwgSlNPTiBpcyBhIGJpdCBzdHJpY3QgYWJvdXQgdGhhdC4N
Cg0KPiANCj4+IEhlcmUgZm9sbG93cyB0aGUgZXhwbGFuYXRpb24gZm9yIHRoZSBmaWVsZHM6DQo+
PiANCj4+IHBhdGg6IGlzIGEgcmVsYXRpdmUgcGF0aCBmcm9tIHRoZSB4ZW4gYmFzZSBmb2xkZXIs
IGl0IGNhbiByZWZlciB0byBhIGZpbGUgb3IgaXQgY2FuIGJlIGEgcGF0aCB0byBhbiBlbnRpcmUg
Zm9sZGVyDQo+PiAgICAgICAgIChUYWtpbmcgYXMgZXhhbXBsZSBsaWJmZHQpDQo+PiANCj4+IGJh
Y2twb3J0OiBpdOKAmXMgYSBib29sZWFuIGZsYWcgdGhhdCBzYXlzIGlmIHRoZSBmaWxlIGlzIHN1
YmplY3QgdG8gYmFja3BvcnQsIHNvIGV2ZXJ5IGZpbGUgd2hlcmUgdGhpcyBmaWVsZCBpcyB0cnVl
DQo+PiAgICAgICAgICAgICAgICB3b27igJl0IGJlIGluY2x1ZGVkIGluIHRoZSBhbmFseXNpcy4g
QSBmaWxlIGlzIHN1YmplY3QgdG8gYmFja3BvcnQgd2hlbiBpdOKAmXMgZXh0ZXJuYWwgYW5kIGl0
IGRvZXNu4oCZdA0KPj4gICAgICAgICAgICAgICAgYWNjZXB0IGRpcmVjdCBjaGFuZ2VzIChjaGFu
Z2VzIG5lZWRzIHRvIGJlIG1hZGUgaW4gdGhlIG9yaWdpbmFsIHByb2plY3QgYW5kIHRoZW4gYmFj
a3BvcnRlZA0KPj4gICAgICAgICAgICAgICAgdG8gWGVuKQ0KPj4gDQo+PiBvcmlnaW5fcHJvamVj
dDogdXJsIG9mIHRoZSByZXBvc2l0b3J5IHdoZXJlIHRoaXMgZmlsZSB3YXMgb3JpZ2luYXRlZA0K
PiANCj4gUGVyc29uYWxseSBJJ2QgZHJvcCAidXJsIG9mIiAtIHRoZSBzcGVjaWZpY2F0aW9uIG9m
IHRoZSBvcmlnaW4gbmVlZHMgdG8gYmUNCj4gcHJlY2lzZSwgYnV0IEknbSBub3QgY29udmluY2Vk
IGl0IGFic29sdXRlbHkgbmVlZHMgdG8gY29tZSBpbiB0aGUgZm9ybSBvZg0KPiBhIFVSTC4gV2hh
dCB3b3VsZCBpbW8gYmUgbW9yZSBpbXBvcnRhbnQgdG8gbWFuZGF0ZSBpcyB0aGF0IHRoZSByZWZl
cmVuY2UNCj4gYmUgdG8gdGhlICJjYW5vbmljYWwiIGNvcHkgb2YgdGhlIHByb2plY3QsIG5vdCBl
LmcuIHNvbWUgZ2l0aHViIGNsb25lLg0KDQpTdXJlLCBjb3VsZCB5b3UgZXhwbGFpbiBpdCBhIGJp
dCBtb3JlLCBtYXliZSB3aXRoIGFuIGV4YW1wbGU/DQoNCj4gDQo+PiBvcmlnaW5fcGF0aDogcmVs
YXRpdmUgcGF0aCBpbiB0aGUgb3JpZ2luYWwgcHJvamVjdCwgbW9zdGx5IGxpbmtlZCB0byB0aGUg
b3JpZ2luYWxfcmV2aXNpb24gZmllbGQNCj4+IA0KPj4gb3JpZ2luX3JldmlzaW9uOiByZXZpc2lv
biBvZiB0aGUgY2hhbmdlcyBpbiB0aGUgcmVwb3NpdG9yeSB3aGVuIHRoaXMgZmlsZSB3YXMgdGFr
ZW4uDQo+IA0KPiBJIGd1ZXNzIHRoaXMgbmVlZHMgY2xhcmlmeWluZzogV2hhdCByZXZpc2lvbiBp
cyBtZWFudCBoZXJlPyBUaGUgb25lIG9yaWdpbmFsbHkNCj4gaW1wb3J0ZWQsIHRoZSBvbmUgbGFz
dCB1cGRhdGVkIGZyb20sIG9yIHlldCBzb21ldGhpbmcgZWxzZT8gS2VlcCBpbiBtaW5kIHRoYXQN
Cj4gd2UgbWF5IGFsc28gYmUgc2VsZWN0aXZlbHkgaW1wb3J0aW5nIGNoYW5nZXMsIGluIHdoaWNo
IGNhc2UgYW55IHBhcnRpY3VsYXINCj4gInJldmlzaW9uIiBjYW4gZWFzaWx5IGVuZCB1cCBtaXNs
ZWFkaW5nLiBUaGUgZm9ybWF0IGxpa2VseSBhbHNvIHdhbnRzDQo+IHNwZWNpZnlpbmcsIGUuZy4g
KGxpa2Ugd2UgZG8gZm9yIEZpeGVzOiB0YWdzKSB0aGUgZmlyc3QgMTIgZGlnaXRzIG9mIGEgY29t
bWl0DQo+IGhhc2guIEZvciBzYWlkIHNlbGVjdGl2ZSB1cGRhdGluZyB0aGlzIG1pZ2h0IHRoZW4g
YWxsb3cgZm9yIHNvbWV0aGluZyBsaWtlDQo+IDxiYXNlLWhhc2g+KzxjaGVycnktcGljaz4rLi4u
DQoNClRoaXMgaXMgYSBnb29kIHBvaW50LCB3aGF0IHdvdWxkIGl0IGJlIHRoZSBiZXN0IGZvcm1h
dCBpbiB5b3VyIG9waW5pb24/DQpNYXliZSB3ZSBzaG91bGQgaGF2ZSB0aGUgZmllbGQgYXMgYW4g
YXJyYXkgb2YgcmV2aXNpb25zPw0KDQoib3JpZ2luX3JldmlzaW9uIjogWw0KICAgIlJldmlzaW9u
IG9mIGxhdGVzdCBiYWNrcG9ydOKAnSwNCiAgIFsuLi5dDQogICAib3JpZ2luYWxseSBpbXBvcnRl
ZCByZXZpc2lvbuKAnSwNCl0NCg0KV2hhdCBzaG91bGQgYmUgdGhlIGJlc3QgdG8gY2FwdHVyZSB0
aGUgaGlzdG9yeSBvZiB0aGUgZmlsZT8NCg0KDQo+IA0KPiBKYW4NCg0KPiBPbiA2IEZlYiAyMDIz
LCBhdCAwOTo0OSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+
IE9uIDAzLjAyLjIwMjMgMjA6NTUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIEZy
aSwgMyBGZWIgMjAyMywgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+PiBBbmQgdGhlbiwgaWYgdGhl
IGZpbGUgaXMgbm90IHN1YmplY3QgdG8gYmFja3BvcnQgYW5kIG5vdyB3ZSDigJxvd27igJ0gdGhl
IGZpbGUsIHRoZXJlIGlzIG5vIG1vcmUgdGhlIG5lZWQgdG8gbGlzdCBpdA0KPj4+IGluIHRoZSBl
eHRlcm5hbCBmaWxlLCBhIGNvbW1pdCBzZWFyY2ggY2FuIHJldmVhbCB3aGVuIGl0IHdhcyBjb252
ZXJ0ZWQgdG8gWGVuIGNvZGVzdHlsZSBhbmQgcmVtb3ZlZCBmcm9tDQo+Pj4gdGhlIGV4dGVybmFs
IGZpbGUgbGlzdCBzbyB3ZSBkb27igJl0IGxvc2UgdGhlIGhpc3RvcnkuDQo+PiANCj4+IFllcywg
SSBhZ3JlZS4gSWYgYSBmaWxlIGlzIGNvdmVydGVkIHRvIFhlbiBjb2Rpbmcgc3R5bGUgYW5kIGZv
bGxvd3MNCj4+IE1JU1JBIHJ1bGVzLCB0aGVuIHRoZXJlIGlzIG5vIG5lZWQgdG8gbGlzdCB0aGUg
ZmlsZSBpbg0KPj4gZG9jcy9taXNyYS9leHRlcm5hbC1maWxlcy5qc29uLg0KPj4gDQo+PiANCj4+
PiBTbyB3ZSB3b3VsZCBlbmQgdXAgZXhjbHVkaW5nIGp1c3QgYWxsIHRoZSBmaWxlIGxpc3RlZCBp
biBleHRlcm5hbC1maWxlLmpzb24gYnkgdGhlIGFuYWx5c2lzLg0KPj4gDQo+PiBSaWdodCwgSSB0
aGluayBzbyB0b28NCj4gDQo+IFBlcnNvbmFsbHkgSSB0aGluayB0aGlzIGlzIHRvbyBmb2N1c2Vk
IG9uIE1pc3JhLiBUaGVyZSBhcmUgb3RoZXIgdXNlcyBvZg0KPiBzdWNoIGRhdGEsIGxpa2UgYXV0
b21hdGljYWxseSBpZGVudGlmeWluZyBjaGFuZ2VzIHRvIHRoZSBvcmlnaW4gZmlsZShzKQ0KPiB3
aGljaCB3ZSBvdWdodCB0byBiZSBwdWxsaW5nIGluIChyZWNhbGwgdGhhdCB3ZSd2ZSBiZWVuIGRv
aW5nIGEgcHJldHR5DQo+IGJhZCBqb2IgaW4gdGhpcyByZWdhcmQpLg0KDQpZZXMsIHdlIGNvdWxk
IGZpbmQgYSBwbGFjZSBvdXRzaWRlIHRoZSAvbWlzcmEvIGZvbGRlcg0KDQo+IA0KPiBKYW4NCg0K
DQoNCg0K

