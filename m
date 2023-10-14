Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9507C91B6
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 02:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616973.959410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrSFa-0006kC-T7; Sat, 14 Oct 2023 00:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616973.959410; Sat, 14 Oct 2023 00:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrSFa-0006hJ-Pz; Sat, 14 Oct 2023 00:11:26 +0000
Received: by outflank-mailman (input) for mailman id 616973;
 Sat, 14 Oct 2023 00:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUN7=F4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qrSFa-0006hD-1x
 for xen-devel@lists.xenproject.org; Sat, 14 Oct 2023 00:11:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35fe4d0c-6a26-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 02:11:24 +0200 (CEST)
Received: from DUZPR01CA0213.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::27) by AS8PR08MB6182.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Sat, 14 Oct
 2023 00:11:21 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::64) by DUZPR01CA0213.outlook.office365.com
 (2603:10a6:10:4b4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.29 via Frontend
 Transport; Sat, 14 Oct 2023 00:11:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Sat, 14 Oct 2023 00:11:21 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Sat, 14 Oct 2023 00:11:20 +0000
Received: from 45118b4d0f31.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 239AB7F6-D6DE-42D7-A9FB-479DE18962E5.1; 
 Sat, 14 Oct 2023 00:11:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45118b4d0f31.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 14 Oct 2023 00:11:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7538.eurprd08.prod.outlook.com (2603:10a6:20b:482::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Sat, 14 Oct
 2023 00:11:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Sat, 14 Oct 2023
 00:11:13 +0000
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
X-Inumbo-ID: 35fe4d0c-6a26-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJirgkc+PBmwlTGucvBwdTikJ33tgo+Nl/klEuf009k=;
 b=62Dtk1azFX8zwqjPhUnGl8Bw6zUpPlyPoKTUJwgGi8sfl5jul1kj9XZWz3EXiMlUIUSREbMgAm+uKp/lYRo5Eg/Zpj9IURBjZIfXDVNgyO5/csQbav5R2Dme+vhyw0ZUy7SdMzbU9jRdN2ATGRfZBaNuBeL0YCFWauaqNdKKsDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f9affdc20cf9ff0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uhgk2VsqgzTvPv7MR6DkSo9Z3DBLp0bORK8WNPvr2/Ya63LFRGWxEeRMuuX68SCqZrlmW+lD6g5IfINcj8XtDfCO3W2kpKcSkFZj5Vq2mnVmDhtP24mE1+iBw5q2QRBhjPKeP6RxiqmG6xkuAMEhRarQWubz357sVR9HFGUG/2jR6KpgXoJrHvF4pQJQGYfE9ZVMKsInAPcze7WjQcbTnYfBTkf4Z83Vztz3d1q5t5nA110XWkGGC2vMRI0DmXveaDpX2zpOyWzYlF+sF7ofmVcpwsZxb7TgqzCvkI4wWHUrpxpuAvHLYS7UJriJDIF8r2h1MYOG4NRtL4PJ+0UnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJirgkc+PBmwlTGucvBwdTikJ33tgo+Nl/klEuf009k=;
 b=i4OCpPow5UMg/OSEDldlLAGKXj18+KoSxqE/NRerJUHOG1g7RyOqh3rr3X7kYrSU9sxDEtKQdIAN9u8XKzOUTe1NVN4J62cKUG2ez7fVKRbtugWdG86hu9BrjAFaZY5TypTF3JhAwKgqpazNS2/VYPOCnBWtxAlz9PL/2WIZebXl9tvk5t/yQ5BfmcXHDpCMlT6A9LLbhw4Di0Pny9eeqwjxRikQpiKovHBiL2rKOWwN5LHS3rLks3ujeFqQ3aQm0zj5GqqsQJdn54Er4tX3RziFHsGmWP9VnqQ2Y7yaOO0G3A98PuqjvFwsGZFgEk4oGwRidn185uF49p3SH/Rkkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJirgkc+PBmwlTGucvBwdTikJ33tgo+Nl/klEuf009k=;
 b=62Dtk1azFX8zwqjPhUnGl8Bw6zUpPlyPoKTUJwgGi8sfl5jul1kj9XZWz3EXiMlUIUSREbMgAm+uKp/lYRo5Eg/Zpj9IURBjZIfXDVNgyO5/csQbav5R2Dme+vhyw0ZUy7SdMzbU9jRdN2ATGRfZBaNuBeL0YCFWauaqNdKKsDM=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v7 6/8] xen/arm: Fold pmap and fixmap into MMU system
Thread-Topic: [PATCH v7 6/8] xen/arm: Fold pmap and fixmap into MMU system
Thread-Index: AQHZ+kx8olLPGtaa90qvzUCne3k+lbBIBR+AgABsGgA=
Date: Sat, 14 Oct 2023 00:11:13 +0000
Message-ID: <A418CEB5-F606-4123-B806-17CE0A6FE69D@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-7-Henry.Wang@arm.com>
 <9346ebac-748d-4d12-95ca-31af5483640a@xen.org>
In-Reply-To: <9346ebac-748d-4d12-95ca-31af5483640a@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7538:EE_|DB1PEPF00039231:EE_|AS8PR08MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f6c367-98c8-44ee-10df-08dbcc4a1857
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IWMKsMBvsbCE9h/RW7TnbjrL9ihiXdJeLOTJFsto14wr7sP2m5qgn2dLeZfrtZZukw4w52JJjHEK3YQNJgw0TETRFmMHpjwtcSy0p5LzhtzYHn8uKhA7y+95VAyV22AcNnoI593SD8OK0jVnGnYQh4RgDT4q/aOii5+UG5BwCbAVcvaCwbE0XVj1aCviLr9pmO4qJZrkY+qNfiYQ00A8/7pU6+z1UDcmMInGAdZa2eCKlM54kgFe6jOsgUH0YOt9sSqQTco5z613F7LHK1XryFzs9NyvgDkFTQ57k6IxGtDXXTn9P6CsuiSMbctm9Tl9Wb8ZZEJD9zN47vk/+v7iWDak5N3iik1Z4krA2kociyd7Frfu9Tuiep76spL7hEkBg/+1ltB43DZD7C4o9UO2KDzu6sstm1Ylcr8pAriD6vP60+0qvxnqXj0gYlV2167B6vGqMXn93JvRjKsLcVOl0FsDn+MLX2rnKcQnHm6uiSdSARaRWrnfDM+P0hcHEXj2EHZBvlZdd7wAFhMXdQH8ZFOWS17rXi5TPt+fYI+KpOyoqRimCUALJm9mKhFrgCxhTQul8jIdiw4GsFY8+XEUYLmT4CFfmxoxfRaAuzW0xsuy/wKth2vY+28uhY5q8OOQRJ7jy8qfTMOZ6a51sL5qew==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8676002)(8936002)(4326008)(316002)(53546011)(6506007)(41300700001)(5660300002)(64756008)(76116006)(91956017)(66946007)(66446008)(66476007)(54906003)(6916009)(66556008)(478600001)(6486002)(86362001)(38100700002)(83380400001)(71200400001)(6512007)(33656002)(26005)(36756003)(2616005)(122000001)(38070700005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8393C7EE36B144197C623F26ED1FC38@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7538
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1741a7d1-eb43-437e-7933-08dbcc4a13d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4x7Of4ODIv85KjfLrNyobMKh8MBlkwxg3rscWgaqb6bjtnlo12WDw4bZmRYCYZ9LCgm6JKDGpF4mPMAA9IhxF6M5QfcqvSE5bNOCEBGVe7W9HC/rJMzFYBWjLc/pcOBZ2QV8Vb8AtApHmqTaQb1LT1ckQiJicXhbizdex2CLavu8i7VjQGU+sMlXx56+UednTweNyfhsl0Wa3qUVgzGNCBFmsZqK0xxlAm5S58ppZeYkJC7ATEkM/guoBczoZrw9dK4K7rm5wMNbIyoCPCldHQ0tNMQ/oXS6kdmasvZSvD+5UR/kG8rdFXRdUxUvDC/bco0/GWNL94VAhNwWDtg1+3V2BPV0k4ZsqPO9BXZul3TH1T/yYFmITlHD36dzo3FMgcyWzCIabmCboboQO6CCXv8ZFwPCkkptHumkAoNYxmZquP78v7Jb29UtSsOpBoRAaMiDBPaWuPXlJTGahkArViOCv3UstaMBoDqPje5arGb3dm+h3g+etsk8KUoAJy0GicdxNI2eKcnGkm2YM1fDt0O9h0wJ32s9f969+gY2mzWIl1gV2GuHQDrJlxd17619i5CMzaMRAt1jZSRuL9Rt7V4P/SfPxXvpBWZZL5ofeXsPKQT/r1MivFJCAeAQgxaTzAK0adAo6J4vbeQpApsR32eISSPBXqNxcGLzxJ+OKFHDCYu2w+45SHrPm6D6edT/RGFJu/1Egkh/FySENOqCFDP62qKOjpxPWpXvDMdiynk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(6506007)(6486002)(6512007)(53546011)(54906003)(316002)(70206006)(2616005)(70586007)(478600001)(6862004)(8676002)(8936002)(336012)(4326008)(2906002)(41300700001)(36756003)(83380400001)(36860700001)(86362001)(356005)(26005)(5660300002)(40480700001)(40460700003)(47076005)(81166007)(33656002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:11:21.0750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f6c367-98c8-44ee-10df-08dbcc4a1857
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182

SGkgSnVsaWVuLA0KDQo+IE9uIE9jdCAxNCwgMjAyMywgYXQgMDE6NDQsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAwOS8xMC8y
MDIzIDAyOjAzLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9tbXUvc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9tbXUvc2V0dXAuYw0KPj4gaW5kZXggYzJkZjk3
NmFiMi4uZGZmODFmNjEyNSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbXUvc2V0dXAu
Yw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL21tdS9zZXR1cC5jDQo+PiBAQCAtMzM5LDYgKzMzOSwz
MyBAQCB2b2lkIGZyZWVfaW5pdF9tZW1vcnkodm9pZCkNCj4+ICAgICAgcHJpbnRrKCJGcmVlZCAl
bGRrQiBpbml0IG1lbW9yeS5cbiIsIChsb25nKShfX2luaXRfZW5kLV9faW5pdF9iZWdpbik+PjEw
KTsNCj4+ICB9DQo+PiAgKy8qKg0KPj4gKyAqIGNvcHlfZnJvbV9wYWRkciAtIGNvcHkgZGF0YSBm
cm9tIGEgcGh5c2ljYWwgYWRkcmVzcw0KPj4gKyAqIEBkc3Q6IGRlc3RpbmF0aW9uIHZpcnR1YWwg
YWRkcmVzcw0KPj4gKyAqIEBwYWRkcjogc291cmNlIHBoeXNpY2FsIGFkZHJlc3MNCj4+ICsgKiBA
bGVuOiBsZW5ndGggdG8gY29weQ0KPj4gKyAqLw0KPj4gK3ZvaWQgX19pbml0IGNvcHlfZnJvbV9w
YWRkcih2b2lkICpkc3QsIHBhZGRyX3QgcGFkZHIsIHVuc2lnbmVkIGxvbmcgbGVuKQ0KPj4gK3sN
Cj4+ICsgICAgdm9pZCAqc3JjID0gKHZvaWQgKilGSVhNQVBfQUREUihGSVhNQVBfTUlTQyk7DQo+
PiArDQo+PiArICAgIHdoaWxlIChsZW4pIHsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgbCwg
czsNCj4+ICsNCj4+ICsgICAgICAgIHMgPSBwYWRkciAmIChQQUdFX1NJWkUtMSk7DQo+IA0KPiBO
SVQ6IEkgd291bGQgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gYWRkIGEgbWlzc2luZyBzcGFjZSBi
ZWZvcmUvYWZ0ZXIgJy0nLg0KDQpTb3VuZHMgZ29vZCwgSeKAmXZlIGRvbmUgdGhhdCBpbiBteSBs
b2NhbCB2OCBhbmQgYWxzbyBtZW50aW9uZWQgdGhpcyBjaGFuZ2UNCmluIGNvbW1pdCBtZXNzYWdl
IGFzOg0KYGBgDQpUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBhZGQgYSBtaXNzaW5nIHNwYWNlIGJl
Zm9yZSBhbmQgYWZ0ZXIgJy0nIGluDQoicyA9IHBhZGRyICYgKFBBR0VfU0laRS0xKTsiIG9mIGNv
cHlfZnJvbV9wYWRkcigpLg0KYGBgDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPg0KDQpUaGFua3MhDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoN
Cj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

