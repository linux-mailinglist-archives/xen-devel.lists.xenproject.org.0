Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA9454A4F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 16:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226901.392256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNCC-0007f0-0Q; Wed, 17 Nov 2021 15:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226901.392256; Wed, 17 Nov 2021 15:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNCB-0007cB-TY; Wed, 17 Nov 2021 15:49:59 +0000
Received: by outflank-mailman (input) for mailman id 226901;
 Wed, 17 Nov 2021 15:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5X4Q=QE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mnNCA-0007c5-2a
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 15:49:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02f3a780-47be-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 16:49:56 +0100 (CET)
Received: from DB6PR0202CA0036.eurprd02.prod.outlook.com (2603:10a6:4:a5::22)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 15:49:50 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::49) by DB6PR0202CA0036.outlook.office365.com
 (2603:10a6:4:a5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 15:49:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 15:49:49 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Wed, 17 Nov 2021 15:49:49 +0000
Received: from 4ef8ac4021c4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC406BEC-895F-4369-91BF-F06FEE7AB627.1; 
 Wed, 17 Nov 2021 15:48:47 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ef8ac4021c4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Nov 2021 15:48:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB7028.eurprd08.prod.outlook.com (2603:10a6:20b:34f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 15:48:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 15:48:45 +0000
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
X-Inumbo-ID: 02f3a780-47be-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqNeQg0bMhGZ+WBUbxRjqfnIBylKjZKx5WHeToWR4l0=;
 b=AkPsxFMbiSBOyWZaqBssNPyjd9M5xRbk3N+vkDy2S+n21FSKnMJdkaozrRevQegtJg3esqD2ufwD98uKJFTqLyfJGci2JkhhQvOlMB83HETeu4hx+tUTfgdFUAh2Gr4Iawt905bkPYBZD8O9bFOmfqCJwUm1QdOl0pWSnsme2hw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f645883b1e3f8676
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrY7g+m8vqJ2K3Mg5zh6KNXURfsf8HzU4FpZifRvsaTVRba/lT/ACCG/tJx+8lisdFkwct36x9S9yUyn39CEUbRqel0F+PI5PfOG4VIVdu6BjW+H2YOSkmxx8SYZnThMdUSNiCbDZF3N++oSj+vY1VjIXtIvTDJzZjVF3dOzjuTS4CJPN6WZ8euz8Ujm5p7E3TIoFbXpoYF4KEjv6c7lI49KkQIe6mz1/qKUbWlOn75sZrhe5l700rbaWBKuJRYJsUozJ5ldDzEMsmN9I24P5lZ9K8t9Y/nfZRumeVGl3XlQwIDy4g+mE3Tpxjga/qdHc/crx2QxQqfnOBAwAoQUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqNeQg0bMhGZ+WBUbxRjqfnIBylKjZKx5WHeToWR4l0=;
 b=ZtSwxkPlW9PycMyBoSRAkqBOcUNRoQNSS10L7Cb8olxC01WvZKD/vOwvqa3tF7b8u9qntu6N7Hr4p8LCF8kIbJEk2XgUKF9jw1AkQUeVAvoguYKO6+FV3bNNPQdZSop2NnQ1+xnB6hQJUuwnKKZ1pYUsNa2HAp9iQ5ToBpPwJXAhC/0rqkw94oyUjI+pgUfEmi9QTmdaX1+1lcKZF/eii8b3avqcmPQypFUm/0NfuEUF/tGmjvTOJZulrOSwRgVbrkEtUHmAsBpJ/xHGCkwaZX0W2A/OQ7VHKOCN0MgFwLkfbNHP6nEg1NdrOiltqCj+UGR7Yr3hCgQVNOxkNxvSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqNeQg0bMhGZ+WBUbxRjqfnIBylKjZKx5WHeToWR4l0=;
 b=AkPsxFMbiSBOyWZaqBssNPyjd9M5xRbk3N+vkDy2S+n21FSKnMJdkaozrRevQegtJg3esqD2ufwD98uKJFTqLyfJGci2JkhhQvOlMB83HETeu4hx+tUTfgdFUAh2Gr4Iawt905bkPYBZD8O9bFOmfqCJwUm1QdOl0pWSnsme2hw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen/ARM - Query about a data abort seen while reading GICD
 registers
Thread-Topic: Xen/ARM - Query about a data abort seen while reading GICD
 registers
Thread-Index: AQHX2v69rH0Wb2BjYUqXheWDWZOLqqwGSWAAgAANoACAAYg3gA==
Date: Wed, 17 Nov 2021 15:48:45 +0000
Message-ID: <0ACF6308-EDB0-4B98-A029-1C7B23820198@arm.com>
References: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com>
 <CED537AF-44AA-41B8-9458-17A5C43FBECC@arm.com>
 <f91fd718-040e-88a3-ca96-30d1efe9a689@xilinx.com>
In-Reply-To: <f91fd718-040e-88a3-ca96-30d1efe9a689@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 38780fb6-75d8-4714-282c-08d9a9e1e378
x-ms-traffictypediagnostic: AS8PR08MB7028:|PR3PR08MB5868:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB5868DD2A76736FFB49DAF4459D9A9@PR3PR08MB5868.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CqREF7sjpQWpPWiUBaJwShXM8Lnscgi/qzgJPQXLICIFLuEAPomVDErY5q03r3HHD5hUPTEKpMkPqt4/hJGh16sasVUfa7uNQEXJy+4r+mw5onv045YzH8NsIu4xGGtAlkwpfRBR3nngha34d9Ruq1Jp3llcSJt1qhtYSQIGTiKfzjfkP+KDA/l0jZ5M/qNIaiJLJqz4/fxwSHNkG+xiX1ROesKY9sznvuJAz/fjAIROmZDNDhRg8z7c95fL+AIQPvm7YkgveSZmY6Iffa9MxOHJCUBPFa6fBToue62ONHZwU9ir+RDsdgaVBuM3hx2KaWU8EIvalQ9mhzejkwdaaK2Kp3xx174yoIiMRYmchEc3dKWuZc76zuiA490ZGuT0QiP6laaeD5rhJOpqEXcKov9CO8JqQLet5I+YyT4SWrZ4eD0u+kCh+8S4eez+dL+pnDynwRuj1qe/nqyutqml5fh5yPQiwfTVqSKFpcZ/tD5zczD9KFtWvQAicAhdU30B0DpE8zt8X5fEKklELl0hQcgFsUmFwzUAFlnLAEBYLxJUqhUMVP0eWPjx6a7XTJmrX826qg6QGSaKHVeJBx28/FmihWufbinXBjWeZQzJoE/XknO/FSwl03EVQVbIquV+2svMA2NadtG/wv+gWcAepiwMEkvCbhPEEh957itkoDN6VriOGiJjOctg0dhi0M+jVHmVdCQ9nGBJiusbrvoXZhMJUBBMDZ92oMRu/eIYglmlUABb/IvihXTwl7NZGRGh
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(2616005)(38100700002)(5660300002)(316002)(186003)(8676002)(53546011)(6506007)(66556008)(26005)(71200400001)(66446008)(83380400001)(76116006)(4326008)(66946007)(66476007)(6486002)(64756008)(91956017)(38070700005)(6512007)(2906002)(122000001)(36756003)(86362001)(33656002)(54906003)(6916009)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5161781E93623440B586A213CB7039A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7028
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13f0840f-d974-4567-9ccd-08d9a9e1bd32
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	py0O5G8Lmyer9KN2LVlgX+Eg8I9wBAQqNp3/+zx3e3Czsz0yJ76umdRCKzq0mctBqlF+F7MqrSgV/JY4fLyjHy+yveyrirKqyFOTilJWgmO794ss4oJSComI0T0Ge12DpZSPfau8usk0HA6904CcNgm7NS0ZozDYW3JwT6f2uVCE+l60V1Z2sHoC0ufaUhPWDbBfWgvMRveWOsMFfGLRofpb1mJidG3hA+QT43XHSoEfTl0KQCA+Hnlj3eiY952DTEnrXMD0cT8mYY9T0GMxAULX0Zxvv7QFYTblHqqFjTUB4Fvi6pTNo7sth3n0KA+ewfaMsykS/Zekfc2p5tVa+Qmc7es/CaeVEXhFp8XwHp+AELu9IRuOYFamPdvbhgqExcGwrOV3ydKEcJJY0CeaWeMJvy/PLijf2HpCn+/NpSkQ5KLO9zq1lakLHM3GI5UBysTZRXAGpnNC7QBAiT9pIh0E4fFYorueE6qXUyxbo0trbI9yc1ju+4tp//GFW+RH2Wd8ElMEw1QMxmZu2QalYgAZjEYRfa8fE1XE/3J1JXp0teKxHU78vgi7viFMBXN5lY/dcTMM8ZtyjegIVpb6/9M19r58Kk+cL1TsytLNmpIkqH2n2QavhAjBFKZ1DG4SUlWEVa8jnQasXNCF4coTsnOBtd1Ma1yFRQoCsLYjGSQfsyYzHvlt3T7wqY+5o/oJLD/bCPQZXy1ZYBC97NWlqQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(8936002)(82310400003)(508600001)(107886003)(54906003)(8676002)(81166007)(26005)(36860700001)(4326008)(83380400001)(36756003)(70206006)(86362001)(70586007)(356005)(2906002)(6862004)(186003)(316002)(336012)(47076005)(33656002)(6506007)(6486002)(2616005)(6512007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 15:49:49.8594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38780fb6-75d8-4714-282c-08d9a9e1e378
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

SGkgQXlhbiwNCg0KPiBPbiAxNiBOb3YgMjAyMSwgYXQgMTY6MjQsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckB4aWxpbnguY29tPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5k
LA0KPiANCj4gVGhhbmtzIGZvciBsb29raW5nIGludG8gaXQuDQo+IA0KPiBPbiAxNi8xMS8yMDIx
IDE1OjM2LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgQXlhbiwNCj4+PiBPbiAxNiBO
b3YgMjAyMSwgYXQgMTU6MjcsIEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmt1bWFyLmhhbGRlckB4
aWxpbnguY29tPiB3cm90ZToNCj4+PiANCj4+PiBIaSBYZW4vQXJtIGV4cGVydHMsDQo+Pj4gDQo+
Pj4gSSBhbSBmYWNpbmcgYSB2ZXJ5IHN0cmFuZ2UgaXNzdWUgd2hpbGUgcnVubmluZyBhIGJhcmVt
ZXRhbCBhcHBsaWNhdGlvbiBhcyBhIERvbVUgZ3Vlc3Qgb24gYXJtNjQgcGxhdGZvcm0uDQo+Pj4g
DQo+Pj4gVGhlIGJhcmVtZXRhbCBhcHAgdHJpZXMgdG8gcmVhZCB0aGUgR0lDRCByZWdpc3RlciB3
aXRoIHBvc3QgaW5kZXhpbmcgYXMgZm9sbG93cyA6LQ0KPj4+IGxkciB4MSwgPTB4MzAwMTAwMA0K
Pj4+IGxkciB3MiwgW3gxXSwgIzQgPDw8LS0tLS0tIFBDID0gMHg0MDAwMGNhOA0KPj4gSW5jcmVt
ZW50IG9uIG9uIGxvYWQgaXMgbm90IHN1cHBvcnRlZCBieSB0aGUgZW11bGF0aW9uIGxheWVyLg0K
PiANCj4gVGhhdCBpcyBzdXJwcmlzaW5nLiBUaGUgcmVhc29uIGJlaW5nIGlmIEkgdHJ5IHRvIHJl
YWQgdGhlIEdJQ0MgcmVnaXN0ZXIgKDB4MzAwMjAwMCkgd2l0aCBwb3N0IGluZGV4aW5nIHRoZW4g
aXQgd29ya3MgZmluZS4NCg0KV2hlbiB0aGUgSVNWIGJpdCBpcyBub3Qgc2V0LCBYZW4gd291bGQg
aGF2ZSB0byBkZWNvZGUgdGhlIGluc3RydWN0aW9uIHRvIGFjdHVhbGx5IGVtdWxhdGUgdGhlIGFj
Y2VzcyBhbmQgcHJvcGVybHkgbW9kaWZ5IHRoZSByZWdpc3RlcnMgdmFsdWVzIGFzIGxvbmcgYXMg
cHJvdmlkaW5nIHRoZSDigJxlbXVsYXRlZOKAnSBhY2Nlc3MgdmFsdWUuDQpUaGVyZSBpcyBub3Qg
c3VjaCBhIGRlY29kZXIgaW4gWGVuIHJpZ2h0IG5vdyB3aGljaCBtZWFucyB0aG9zZSBraW5kIG9m
IGFjY2Vzc2VzIGFyZSBub3Qgc3VwcG9ydGVkIGZvciBlbXVsYXRlZCBtbWlvIGFjY2Vzc2VzLg0K
DQo+IA0KPiBDYW4geW91IHBvaW50IG1lIGluIHNvdXJjZSB3aGVyZSB0aGlzIGxpbWl0YXRpb24g
aXMgc2V0ID8NCg0KSW4gdGhpcyBjYXNlIHRoZSBpc3YgZmllbGQgaXMgc2V0IHRvIDAgd2hlbiB0
aGUgZXhjZXB0aW9uIGlzIHJlY2VpdmVkIGJ5IFhlbiB3aGljaCBtZWFucyB0aGUgZGVjb2Rpbmcg
cGFydCBvZiBIU1IgaXMgaW52YWxpZCBzbyBYZW4gaXMgbm90IGhhbmRsaW5nIHRoZSBlbXVsYXRp
b24gb2YgdGhlIGFjY2Vzcy4NCg0KQGp1bGllbiBhbmQgU3RlZmFubzogSSBoYXZlIGJlZW4gZ29p
bmcgYXJvdW5kIGFuZCBhcm91bmQgdGhlIGNvZGUgYnV0IEkgY2Fubm90IGZpbmQgd2hlcmUgdGhl
IHZhbGlkIGJpdCBvZiBoc3JfZGFidCBpcyBjaGVja2VkLCBjb3VsZCB5b3UgaGVscCBtZSBoZXJl
ID8NCg0KPj4gQ291bGQgeW91IHRyeSB3aXRoOg0KPj4gYWRkIHgxLCB4MSwgIzQNCj4+IGxkciB3
MiwgW3gxXQ0KPiANCj4gVGhpcyB3b3JrZWQgZmluZS4NCg0KR29vZCA6LSkNCg0KQmVydHJhbmQN
Cg0KPiANCj4gLUF5YW4NCj4+IFJlZ2FyZHMNCj4+IEJlcnRyYW5kDQo+Pj4gDQo+Pj4gQW5kIHRo
ZW4gSSBnZXQgOi0NCj4+PiBIU1I9MHg5MjAwMDAwNSBwYz0weDAwMDAwMDQwMDAwY2E4IGd2YT0w
eDMwMDEwMDAgZ3BhPTB4MDAwMDAwMDMwMDEwMDANCj4+PiANCj4+PiBUaGlzIHByb2JsZW0gb2Nj
dXJzIG9ubHkgd2hpbGUgcmVhZGluZyB0aGUgR0lDRCByZWdpc3RlcnMgd2l0aCBwb3N0IGluZGV4
aW5nLiBJZiBJIHJlYWQgdGhlIHJlZ2lzdGVyIHdpdGggcHJlLWluZGV4aW5nLCB0aGVuIEkgZG8g
bm90IHNlZSBhbnkgYWJvcnQuIEFsdGVybmF0aXZlbHksIGlmIEkgcmVhZCBHSUNDIHJlZ2lzdGVy
IHdpdGggcG9zdCBpbmRleGluZywgSSBkb24ndCBzZWUgdGhlIGFib3J0IGVpdGhlci4NCj4+PiAN
Cj4+PiBGcm9tIHRoZSBIU1IgdmFsdWUsIEkgaW50ZXJwcmV0IGl0IGFzDQo+Pj4gRUMgPSAxMDAx
MDBiICMgRGF0YSBhYm9ydCBmcm9tIGxvd2VyIGV4Y2VwdGlvbg0KPj4+IElMID0gMWIgIyAzMiBi
aXQgaW5zdHJ1Y3Rpb24gdHJhcHBlZA0KPj4+IERGU0MgPSAxMDEgIyBUcmFuc2xhdGlvbiBmYXVs
dCBsZXZlbCAxDQo+Pj4gDQo+Pj4gT24gZGVidWdnaW5nLCBJIGZvdW5kIHRoYXQgdGhlIGFib3J0
IGlzIHRyaWdnZXJlZCBmcm9tDQo+Pj4gDQo+Pj4gdHJ5X2hhbmRsZV9tbWlvKCkNCj4+PiB7IC4u
Lg0KPj4+ICAgIC8qIEFsbCB0aGUgaW5zdHJ1Y3Rpb25zIHVzZWQgb24gZW11bGF0ZWQgTU1JTyBy
ZWdpb24gc2hvdWxkIGJlIHZhbGlkICovDQo+Pj4gICAgaWYgKCAhZGFidC52YWxpZCApIHsNCj4+
PiANCj4+PiAgICAgICAgcmV0dXJuIElPX0FCT1JUOw0KPj4+ICAgIH0NCj4+PiAuLi4NCj4+PiB9
DQo+Pj4gDQo+Pj4gRnJvbSB0aGUgQXJtIFY4IEFybSBzcGVjcywgSSB1bmRlcnN0YW5kIHRoYXQg
ZGFidC52YWxpZCBpcyBJU1YsIGJpdFsyNF0gaW4gIklTUyBlbmNvZGluZyBmb3IgYW4gZXhjZXB0
aW9uIGZyb20gYSBEYXRhIEFib3J0Ii4NCj4+PiANCj4+PiANCj4+PiBJIHNhdyB0aGF0IHRoZSBj
YWxsZXIgaXMNCj4+PiANCj4+PiBkb190cmFwX2d1ZXN0X3N5bmMoKSAiY2FzZSBIU1JfRUNfREFU
QV9BQk9SVF9MT1dFUl9FTCINCj4+PiB3aGVyZSBkYWJ0LnZhbGlkIGlzIGZhbHNlLg0KPj4+IElu
IHRoZSBzdWNjZXNzIHNjZW5hcmlvLCBkYWJ0LnZhbGlkIGlzIHRydWUuDQo+Pj4gDQo+Pj4gSSBj
b3VsZCBub3QgZmluZCB0aGUgY2FsbGVyIGZvciBkb190cmFwX2d1ZXN0X3N5bmMoKQ0KPj4+IA0K
Pj4+IFNvLCBjYW4gYW55b25lIGhlbHAgbWUgaGVyZQ0KPj4+IDEuIFdobyBpcyB0aGUgY2FsbGVy
IGZvciBkb190cmFwX2d1ZXN0X3N5bmMoKSA/DQo+Pj4gMi4gQW55IGlkZWEgb24gd2hhdCB0aGUg
aXNzdWUgaXMgYW5kIGhvdyBJIGNhbiBkZWJ1ZyBpdCBmdXJ0aGVyID8NCj4+PiANCj4+PiBLaW5k
IHJlZ2FyZHMsDQo+Pj4gQXlhbg0KPj4+IA0KDQo=

