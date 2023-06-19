Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA6734DC7
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 10:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550880.860082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBAIb-0003Ww-3h; Mon, 19 Jun 2023 08:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550880.860082; Mon, 19 Jun 2023 08:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBAIb-0003Ub-0v; Mon, 19 Jun 2023 08:31:45 +0000
Received: by outflank-mailman (input) for mailman id 550880;
 Mon, 19 Jun 2023 08:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=78w0=CH=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qBAIZ-0003UV-2z
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 08:31:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b0b710-0e7b-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 10:31:40 +0200 (CEST)
Received: from DB9PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:1da::17)
 by VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 08:31:37 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::87) by DB9PR05CA0012.outlook.office365.com
 (2603:10a6:10:1da::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Mon, 19 Jun 2023 08:31:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.20 via Frontend Transport; Mon, 19 Jun 2023 08:31:36 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Mon, 19 Jun 2023 08:31:36 +0000
Received: from 0de62ca4dba8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16408CA4-49FB-4FDB-9EB0-337A27576920.1; 
 Mon, 19 Jun 2023 08:31:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0de62ca4dba8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 19 Jun 2023 08:31:28 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB8225.eurprd08.prod.outlook.com (2603:10a6:10:39d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 08:31:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 08:31:25 +0000
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
X-Inumbo-ID: b6b0b710-0e7b-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+MM568G307h7Hdb9YhZKvFBcPqXRGgeXKReaksfkoM=;
 b=vZFRnEFZl4uxTLHZrZnn6D8IOxVh4Y69ys7ESXzvHCcIEiJgAfW32NEPypzT2PAWhujSTKJf0GyS5rKHCwDLk/bllMH+/2cgzQS4pGZ33VkD6M9JsN41ipP3yNsfAcJy+3ImmuTuKwvFdhKXUf2EFrx5KyGhx9HXIuM8J2UbNTs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a302b7742668dd31
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hravEeVZLMHGWhvA2y7803vuCPuTSWXR6Af1yHYx2BeCU+oIFTcCj2smTCli0mbzXmOKrGn5fAuxSm3RZDpy0UmWIQR631rn0+B9ouuRHz9UEYoF8cnALvdDI7x3AlH6e95t0fXyfvCxZKzl6DrQZNa7NmSbBuiBjbbygWo7YqMrDW1zkV5ZdXNXK6C0tCkAiXNiXUvVZsNlKgpKVkIpJJYVlwD8jaRinyf2h/AOthato4BhxkomeZKCwvnXZS2UIMhHmOfiv+AP3zbwsckq2S2x3EK37ioKQc37RDOQj+RwUwFIuIQvEKgXzSt6ym6sA5MDgtROqw5iF9tMQps+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+MM568G307h7Hdb9YhZKvFBcPqXRGgeXKReaksfkoM=;
 b=Wa0bc4XdUPbnCLNmOdEmIuzDwc/mq0KmX23G4eVgXSW7f5KLTl/scu3fLuKnQ7dtHnE1+3ERw4cyJXv8y0jVnqN2Ybo7EZon7d6nxAg/nw34qJb2rn4sirJAqyKRSgfenM9UWAB31/wkXnu7OUs2OFd5owlqD0ebe5PX7b2gHuJ4uUGmZ/pU9ttvvg7cfVKJ/nw7dTC59NY/p6Ix64/7MfxDjnMTFCI9NJZpcsPv4nqBizoJc45EPx06pgZF8PMxCJYLX/TgY52Sbxw16ZhpWQOxOxIjDr/r8GP+ZZhPkDU0HgGz/bYm6xFW3lgRuicvGMFkWqvjY3Dlu0I7sxTN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+MM568G307h7Hdb9YhZKvFBcPqXRGgeXKReaksfkoM=;
 b=vZFRnEFZl4uxTLHZrZnn6D8IOxVh4Y69ys7ESXzvHCcIEiJgAfW32NEPypzT2PAWhujSTKJf0GyS5rKHCwDLk/bllMH+/2cgzQS4pGZ33VkD6M9JsN41ipP3yNsfAcJy+3ImmuTuKwvFdhKXUf2EFrx5KyGhx9HXIuM8J2UbNTs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Refactoring of a possibly unsafe pattern for variable
 initialization via function calls
Thread-Topic: Refactoring of a possibly unsafe pattern for variable
 initialization via function calls
Thread-Index:
 AQHZn6gWgGF2ZXPPc02I099nu6PTEa+NBmIAgAAYV4CAAMv8AIAD4yaAgAABdQCAAAIygA==
Date: Mon, 19 Jun 2023 08:31:25 +0000
Message-ID: <FFDFE558-B7CE-4145-9036-05268FDE9E6E@arm.com>
References: <d0eed387-0f96-f7c4-0e66-f5109eac2e9c@bugseng.com>
 <3fc32674-af28-2a04-4eb8-059364a6a6fb@suse.com>
 <4522eead-bcc3-a735-3293-54ec457e83eb@bugseng.com>
 <alpine.DEB.2.22.394.2306161354070.897208@ubuntu-linux-20-04-desktop>
 <ddbd283d-2d6e-cef5-f2a2-de7fb8a4fe3f@suse.com>
 <1d34618d-2796-e26a-b339-ac8f1fcb8c82@xen.org>
In-Reply-To: <1d34618d-2796-e26a-b339-ac8f1fcb8c82@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB8225:EE_|DBAEUR03FT012:EE_|VI1PR08MB5517:EE_
X-MS-Office365-Filtering-Correlation-Id: be21498a-9847-4a6c-e081-08db709f9884
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UcGXMfCOcAt576xoow42W+77lH1evDh46Z1WCJW5YtqLqL1rfoN3NZRHUh/UjUGK4/+BPeWdtiNsozpABeJfH3Y41dKN+8jZUoXWhcQ4PYD6kGlfDaHbNm87eX3hMgVx74vT9+jT+heFDT68lVbSn6+T8fgprZ1dLn5Ir2mT23AT2xjbAyheOv1XEL3rmA41Vd92rmpdsbxYJIEHxvx4AURCpWRvgXJM+yZoi3TpNkgFDoiQeRX4RgFQsQppEMuDBw1iEwsGSlcH1cT2XguysQ3mYji6Kywunhrqbc0P7707AqotadY7xJ579ZsrOVeJL5Mgzw5Kjhmzi+O2ppQ4VxUXeAKbl3gxiMJuHnK5tFFMfqxfq5KRnCUlPqAM3a35HhjMeIN7zg5qauodYGmw6Ek5wx2hY/n7TWSvj4gCrLtR64j+9H5APnkH1CfRHMrWFrCr+oMUJWUJD8ySUbqPAOpqKXt6pFt/Va0fMCETcsnvOZEMQoCCd7C/vErMdg7TVhj7tUy505AGUkWjz50CrJTqsT4++JvPsRtkquMqwt0Ugusp0OXKvFu/5m5FtR+HYYjkeOPpfGHcRgp2n5qSvIy/D5ewehP/tNrB6Kf6+EiY1seHmiuI8Mui1CS6CsW0HRCnGVmETosfYmjzzaQ4qQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(2906002)(41300700001)(5660300002)(38070700005)(8676002)(8936002)(33656002)(36756003)(86362001)(53546011)(478600001)(26005)(6506007)(6512007)(186003)(54906003)(71200400001)(6486002)(122000001)(76116006)(66946007)(66476007)(64756008)(66446008)(66556008)(91956017)(6916009)(4326008)(316002)(38100700002)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0597F386FA0AE408C787C219F1C99DF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8225
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa72b667-aef3-4af9-3d6b-08db709f9236
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WSN+ysFh3MJ+2q5C+7AISrUjGp1ti9yDSNa6g0g5TBdJWr/xJ79wSf8SnOYcc8rDY6mS1bn/BTb5/+8poT12ry7SBan0tj0jnTqG4G7u5Wh7/+fkQv/yyrWjCefI9+Uhu8tQp8Ln262NfVuxhhm5Nzwt+1bhogRFtbJbuvbzCxxiUiOZXLejgMl6Eq+f8fPhDnoEd0nNc/gmBtDylIUbQMl3+AV8kxfGqI7YmtashOKE6QCKZYuisozTmgj3nwj1Tj8Fvk0FsaryB2LkCHCDd0e69PUE2RRsf6YkJ34ryHPNTq08fGbNB8ld+VpMZcYCQ5/XF26IzPpFOYDP6jghJr9W4kFpc6Fj5LKuKFeo1i4CbawS/sSn22ySA2S140mwFc+jX0CfIzsfHqs9vFjQ7YeQgdpGR6Q2FPmfF4qJJEuaKPkeOuSV8h+slRyR1bX5ekkfgSV97C2w1PpRDbbE+I0KCWTjV2WsoSBEBn+JIYAg5aSiiR0jG7MpRnz2TbqE8+FIcgdan2dK+6mHtZZx1GbFp8U4efRlXhr/imnhjqTYwxpzc41A1dxEGJg400a51gcbZVl2Np65UInLc/nhNDNb0h2oVfUJWaj5ywAERL6hWeUqiPy47BsKE8fiEQzhQCTAtUemX4sxForfODwXday+U+A5ZC9oJeWSxkb31XfxR4k1igH3uYmILtwUbMM1oJ5DAd8BNZ11leiUv4+4UQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39850400004)(451199021)(46966006)(36840700001)(478600001)(40480700001)(2906002)(54906003)(6486002)(81166007)(2616005)(356005)(47076005)(336012)(86362001)(33656002)(36756003)(26005)(186003)(6506007)(6512007)(82310400005)(53546011)(70586007)(8936002)(8676002)(70206006)(6862004)(5660300002)(36860700001)(316002)(4326008)(82740400003)(83380400001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 08:31:36.4013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be21498a-9847-4a6c-e081-08db709f9884
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5517

DQoNCj4gT24gMTkgSnVuIDIwMjMsIGF0IDA5OjIzLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTkvMDYvMjAyMyAwOToxOCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+PiBPbiAxNi4wNi4yMDIzIDIyOjU2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6DQo+Pj4gT24gRnJpLCAxNiBKdW4gMjAyMywgTmljb2xhIFZldHJpbmkgd3JvdGU6DQo+Pj4+
IE9uIDE2LzA2LzIzIDA5OjE5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDE1LjA2LjIw
MjMgMTg6MzksIG5pY29sYSB3cm90ZToNCj4+Pj4+PiB3aGlsZSBpbnZlc3RpZ2F0aW5nIHBvc3Np
YmxlIHBhdGNoZXMgcmVnYXJkaW5nIE1hbmRhdG9yeSBSdWxlIDkuMSwgSQ0KPj4+Pj4+IGZvdW5k
IHRoZSBmb2xsb3dpbmcgcGF0dGVybiwgdGhhdCBpcyBsaWtlbHkgdG8gcmVzdWx0cyBpbiBhIGxv
dCBwb3NzaWJsZQ0KPj4+Pj4+IHBvc2l0aXZlcyBmcm9tIG1hbnkgKGFsbCkgc3RhdGljIGFuYWx5
c2lzIHRvb2xzIGZvciB0aGlzIHJ1bGUuDQo+Pj4+Pj4gDQo+Pj4+Pj4gVGhpcyBpcyB0aGUgY3Vy
cmVudCBzdGF0dXMgKHRha2VuIGZyb20gYHhlbi9jb21tb24vZGV2aWNlX3RyZWUuYzoxMzUnKQ0K
Pj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IGNvbnN0IHN0cnVjdCBkdF9wcm9wZXJ0eSAqZHRfZmlu
ZF9wcm9wZXJ0eShjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUNCj4+Pj4+PiAqbnAsDQo+Pj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hh
ciAqbmFtZSwgdTMyICpsZW5wKQ0KPj4+Pj4+IHsNCj4+Pj4+PiAgICAgICBjb25zdCBzdHJ1Y3Qg
ZHRfcHJvcGVydHkgKnBwOw0KPj4+Pj4+IA0KPj4+Pj4+ICAgICAgIGlmICggIW5wICkNCj4+Pj4+
PiAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+Pj4+Pj4gDQo+Pj4+Pj4gICAgICAgZm9yICggcHAg
PSBucC0+cHJvcGVydGllczsgcHA7IHBwID0gcHAtPm5leHQgKQ0KPj4+Pj4+ICAgICAgIHsNCj4+
Pj4+PiAgICAgICAgICAgaWYgKCBkdF9wcm9wX2NtcChwcC0+bmFtZSwgbmFtZSkgPT0gMCApDQo+
Pj4+Pj4gICAgICAgICAgIHsNCj4+Pj4+PiAgICAgICAgICAgICAgIGlmICggbGVucCApDQo+Pj4+
Pj4gICAgICAgICAgICAgICAgICAgKmxlbnAgPSBwcC0+bGVuZ3RoOw0KPj4+Pj4+ICAgICAgICAg
ICAgICAgYnJlYWs7DQo+Pj4+Pj4gICAgICAgICAgIH0NCj4+Pj4+PiAgICAgICB9DQo+Pj4+Pj4g
DQo+Pj4+Pj4gICAgICAgcmV0dXJuIHBwOw0KPj4+Pj4+IH0NCj4+Pj4+PiANCj4+Pj4+PiANCj4+
Pj4+PiANCj4+Pj4+PiANCj4+Pj4+PiBJdCdzIHZlcnkgaGFyZCB0byBkZXRlY3QgdGhhdCB0aGUg
cG9pbnRlZSBpcyBhbHdheXMgd3JpdHRlbiB3aGVuZXZlciBhDQo+Pj4+Pj4gbm9uLU5VTEwgcG9p
bnRlciBmb3IgYGxlbnAnIGlzIHN1cHBsaWVkLCBhbmQgaXQgY2FuIHNhZmVseSBiZSByZWFkIGlu
DQo+Pj4+Pj4gdGhlIGNhbGxlZSwgc28gYSBzb3VuZCBhbmFseXNpcyB3aWxsIGVyciBvbiB0aGUg
Y2F1dGlvdXMgc2lkZS4NCj4+Pj4+IA0KPj4+Pj4gSSdtIGhhdmluZyB0cm91YmxlIHNlZWluZyB3
aHkgdGhpcyBpcyBoYXJkIHRvIHJlY29nbml6ZTogVGhlIGxvb3AgY2FuDQo+Pj4+PiBvbmx5IGJl
IGV4aXRlZCB0d28gd2F5czogcHAgPT0gTlVMTCBvciB3aXRoICpsZW5wIHdyaXR0ZW4uDQo+Pj4+
PiANCj4+Pj4+IEZvciBydWxlIDkuMSBJJ2QgcmF0aGVyIGV4cGVjdCB0aGUgc2Nhbm5pbmcgdG9v
bCAoYW5kIG9mdGVuIHRoZSBjb21waWxlcikNCj4+Pj4+IHRvIGdldCBpbnRvIHRyb3VibGUgd2l0
aCB0aGUgTlVMTCByZXR1cm4gdmFsdWUgY2FzZSwgYW5kICpsZW5wIG5vdCBiZWluZw0KPj4+Pj4g
d3JpdHRlbiB5ZXQgYXBwYXJlbnRseSBjb25zdW1lZCBpbiB0aGUgY2FsbGVyLiBUaGVuLCBob3dl
dmVyLCAuLi4NCj4+Pj4gDQo+Pj4+IA0KPj4+PiBZb3UncmUgcmlnaHQsIEkgbWFkZSBhIG1pc3Rh
a2UsIHRoYW5rIHlvdSBmb3IgZmluZGluZyBpdC4NCj4+Pj4gSSBtZWFudCB0byB3cml0ZSBvbiBg
KmxlbnAnIGluIGFsbCBleGVjdXRpb24gcGF0aHMuDQo+Pj4+IFBsZWFzZSwgdGFrZSBhIGxvb2sg
YXQgdGhpcyByZXZpc2VkIHZlcnNpb246DQo+Pj4+IA0KPj4+PiANCj4+Pj4gY29uc3Qgc3RydWN0
IGR0X3Byb3BlcnR5ICpkdF9maW5kX3Byb3BlcnR5KGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9k
ZSAqbnAsDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpuYW1lLCB1MzIgKmxlbnApDQo+Pj4+IHsNCj4+Pj4gICAgIHUzMiBsZW4gPSAw
Ow0KPj4+PiAgICAgY29uc3Qgc3RydWN0IGR0X3Byb3BlcnR5ICpwcCA9IE5VTEw7DQo+Pj4+IA0K
Pj4+PiAgICAgaWYgKCBucCApDQo+Pj4+ICAgICB7DQo+Pj4+ICAgICAgICAgZm9yICggcHAgPSBu
cC0+cHJvcGVydGllczsgcHA7IHBwID0gcHAtPm5leHQgKQ0KPj4+PiAgICAgICAgIHsNCj4+Pj4g
ICAgICAgICAgICAgaWYgKCBkdF9wcm9wX2NtcChwcC0+bmFtZSwgbmFtZSkgPT0gMCApDQo+Pj4+
ICAgICAgICAgICAgIHsNCj4+Pj4gICAgICAgICAgICAgICAgIGxlbiA9IHBwLT5sZW5ndGg7DQo+
Pj4+ICAgICAgICAgICAgICAgICBicmVhazsNCj4+Pj4gICAgICAgICAgICAgfQ0KPj4+PiAgICAg
ICAgIH0NCj4+Pj4gICAgIH0NCj4+Pj4gDQo+Pj4+ICAgICBpZiAoIGxlbnAgKQ0KPj4+PiAgICAg
ICAgICpsZW5wID0gbGVuOw0KPj4+PiAgICAgcmV0dXJuIHBwOw0KPj4+PiB9DQo+Pj4gDQo+Pj4g
TmVzdGluZyBtb3JlIHdpbGwgbWFrZSB0aGUgY29kZSBsZXNzIHJlYWRhYmxlIGFuZCBhbHNvIGNh
dXNlIG90aGVyIGNvZGUNCj4+PiBxdWFsaXR5IG1ldHJpY3MgdG8gZGV0ZXJpb3JhdGUgKGN5Y2xv
bWF0aWMgY29tcGxleGl0eSkuDQo+Pj4gDQo+Pj4gV291bGQgdGhlIGJlbG93IHdvcms/DQo+Pj4g
DQo+Pj4gDQo+Pj4gY29uc3Qgc3RydWN0IGR0X3Byb3BlcnR5ICpkdF9maW5kX3Byb3BlcnR5KGNv
bnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbnAsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIHUzMiAqbGVucCkNCj4+PiB7
DQo+Pj4gICAgIHUzMiBsZW4gPSAwOw0KPj4+ICAgICBjb25zdCBzdHJ1Y3QgZHRfcHJvcGVydHkg
KnBwID0gTlVMTDsNCj4+PiANCj4+PiAgICAgaWYgKCAhbnAgKQ0KPj4+ICAgICAgICAgcmV0dXJu
IE5VTEwNCj4+IFRoYXQncyB3aGF0IHdlIHN0YXJ0ZWQgZnJvbSwgYnV0IGxlYXZpbmcgKmxlbnAg
bm90IHdyaXR0ZW4gdG8uIEhvdw0KPj4gYWJvdXQgLi4uDQo+Pj4gICAgIGZvciAoIHBwID0gbnAt
PnByb3BlcnRpZXM7IHBwOyBwcCA9IHBwLT5uZXh0ICkNCj4+ICAgICBmb3IgKCBwcCA9IG5wID8g
bnAtPnByb3BlcnRpZXMgOiBOVUxMOyBwcDsgcHAgPSBwcC0+bmV4dCApID4gPiA/DQo+IA0KPiBJ
IHdvdWxkIGJlIE9LIHdpdGggdGhhdC4gTWF5YmUgd2l0aCBhbiBleHRyYSBzZXQgb2YgcGFyZW50
aGVzZXMgYXJvdW5kICcgbnAgPyAuLi4gOiBOVUxMJyBqdXN0IHRvIG1ha2UgdmlzdWFsbHkgZWFz
aWVyIHRvIHBhcnNlLg0KDQpBZ3JlZSwgYW5kIGZvciBNSVNSQSwgd2Ugc2hvdWxkIHVzZSBhIGJv
b2xlYW4gZXhwcmVzc2lvbiBhcyBjb25kaXRpb24sIGV2ZW4gaWYgSSBrbm93IHRoYXQgd2Ugd291
bGQgbGlrZSB0byBkZXZpYXRlIGZyb20gdGhhdCwNCndoaWNoIEkgZGlzbGlrZS4NCg0KQW55d2F5
IEkgYWxzbyB0aGluayB0aGF0IGl04oCZcyBkaWZmaWN1bHQgdG8gaGF2ZSBhIGdlbmVyaWMgcnVs
ZSBmb3IgY2FzZXMgbGlrZSB0aGF0LCBhbHNvIGJlY2F1c2UgZm9yIHNvbWUgZnVuY3Rpb24NCm1h
eWJlIHRoZSBhdXRob3IgaW50ZW50aW9uIHdhcyB0byBkb27igJl0IHdyaXRlIHRoZSAqbGVucCBp
biBjYXNlIHNvbWUgZXJyb3Igb2NjdXIgYmVmb3JlLCBhbnl3YXkgdGhpcyBjYW4NCmJlIGVhc2ls
eSBtYWRlIGNsZWFyIGFkZGluZyBkb2N1bWVudGF0aW9uIHRvIHRoZSBmdW5jdGlvbiwgZm9yIHRo
ZXNlIGNhc2VzLg0KDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwN
Cj4gDQoNCg==

