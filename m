Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E19792002
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 04:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595354.928890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdLUR-0002fF-GQ; Tue, 05 Sep 2023 02:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595354.928890; Tue, 05 Sep 2023 02:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdLUR-0002cO-CV; Tue, 05 Sep 2023 02:08:27 +0000
Received: by outflank-mailman (input) for mailman id 595354;
 Tue, 05 Sep 2023 02:08:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qilU=EV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qdLUP-0002cI-SE
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 02:08:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17cabc05-4b91-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 04:08:23 +0200 (CEST)
Received: from DUZPR01CA0168.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::24) by AS4PR08MB8217.eurprd08.prod.outlook.com
 (2603:10a6:20b:51c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 02:08:20 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::60) by DUZPR01CA0168.outlook.office365.com
 (2603:10a6:10:4b3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 02:08:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.24 via Frontend Transport; Tue, 5 Sep 2023 02:08:20 +0000
Received: ("Tessian outbound 5c548696a0e7:v175");
 Tue, 05 Sep 2023 02:08:20 +0000
Received: from c05aeaf24d72.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 31CF3D25-6F7A-4F68-88DD-31A18E64A720.1; 
 Tue, 05 Sep 2023 02:08:14 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c05aeaf24d72.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Sep 2023 02:08:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9697.eurprd08.prod.outlook.com (2603:10a6:102:31c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 02:08:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 02:08:11 +0000
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
X-Inumbo-ID: 17cabc05-4b91-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siZ6A8anDTZdFmb643EEAVg6Cf9ogYSzQ3fyBkqOWI8=;
 b=40Iv3H3N0xPGWpqqsdyoMPJGvQdvxZyDe3AxD5kie2RXPc4rXWpZPR0xxoAOdgc+z85/LtIh2vf205S/IDwjoPyAowi+VjTyGv47I6mcSl56+GHbBQioj+8fg3AJmwHV6Ld5KRX75eA8xHCFhlp5aruTn2Gd1Zedw5rj28Xj53k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 014ef8d8630aaae5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+4dV6e+YQGv1DKO3jx4F0GYPi3thyCaXV/6oihoCiRYRmyhQ7kmEqdYNL5LLVhlR7iGi4ZdKn31OBH1EKJkXE0s8iSbaTCp5cHl17VjhMqu/pNrio1hYKLOyMgsNxpLE9LuM6VQXxMF4tpToq+IYrE7GDmyty0JOuJSCngOj8eOPA+sBSOT6IIxonxa2S0f9wVngkXCurFQ2IPFT6UBBPcElaW3+ziZBBwtaA/7RYB+G2e7Gjjz8E08Xvj5m8e1E39mD6Qk6JRun/vVIpnsqz3I+lmQ0a58GyjNfHta4LTH/gVljFkEDiLyuyRMkanflx1LzKYHfvdHVIbrX/zdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siZ6A8anDTZdFmb643EEAVg6Cf9ogYSzQ3fyBkqOWI8=;
 b=Irdsr/14+ocv5THUb/jUU65hjA2sAzjmWCov4W9NRk0Cam/wQjbE6JUaLamOIdKL0fn7PvgfXvdeRe2XkBYwgvqGfHyMuPMN9iW1BOfRXDka7sWlqphhsIK4NRLtvJSNP0ar/kp8mHh2aq0eO6Pg9h8HJZ1Hz7r2tS66ZZxDwvGJro2N0YBje/qUf6qp+8lfIyRyYiUtN1l524XIARngSFZ9+zgtQDJz8TVTdSrg4pRwiBMBxkNPNJE6lk/sV+Kkez5jwklXwE58ux3vFyJ7e63YiJWpfFqVtLr8TkSwZ9jKAhzZFLxdfOeMGJ0AmK5yB+lqRyh9mu3Bx295ENMnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siZ6A8anDTZdFmb643EEAVg6Cf9ogYSzQ3fyBkqOWI8=;
 b=40Iv3H3N0xPGWpqqsdyoMPJGvQdvxZyDe3AxD5kie2RXPc4rXWpZPR0xxoAOdgc+z85/LtIh2vf205S/IDwjoPyAowi+VjTyGv47I6mcSl56+GHbBQioj+8fg3AJmwHV6Ld5KRX75eA8xHCFhlp5aruTn2Gd1Zedw5rj28Xj53k=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Thread-Topic: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Thread-Index: AQHZ3KW1QbAyYFQEp0mKJtVOIbYC5LALgkkA
Date: Tue, 5 Sep 2023 02:08:10 +0000
Message-ID: <5FA473DD-FC52-4F55-8B49-69E75752112A@arm.com>
References: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
In-Reply-To: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9697:EE_|DBAEUR03FT062:EE_|AS4PR08MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd04524-c824-4b6f-a04c-08dbadb4f9e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VxdKUeqyI379k++4wmux1GjBVHIO3eHUmuF0dc38UGT258f3dvx+7BPlhh60lvHPV41+Z5dUX2mal4jDs6M9T0PVHbWvr06ymZKChJLxQpCLNndMOje3FZPTi3VdffQp9usCjTU1iqiHrOfzsb/NQWO/Y1sDZWXLVs7IDeVw7EmXGQPdQKpIqi9ROQTVVb1OBtHcrLIRx/C1gG7sPabgZ5apc8xz0lqPOh9kVLMUy857XDZF5p11c9E92jK+UnuaTUKrtyTMWC9UwxTL+Vxu3nwFYEBNOwmTiCM1OrYca3lPvi570pDMVu5ensqwOttZ2eZWu2ilURMSjq/jc6UGOuH8F/rXnxFFEKuxAeWxe+c4mznFU+EauI8CjgYVYHQLyUvuQjFSdDu1Yeu8WgK9ZVelmKOq48DxafNi5Rtq3144hOasfBP2EulOJLE9HugVqgcKR7cS5Lsi9mgd+eaB892h5MKaHtI9ZtI0pbE/UpBYSSmMcK3vuVm4/yQHD8BKVcffOY04Hvfa1BE43Rpq3CfyDpoGQTv08hqvebLyDeVHI+9QZ2eRjaxU/2NLaCsgfV7mZMbWA1YqAxHZo1KJY16dD1zpF7NIYH3VPJ/WNfBPobIri850tm8NTkADl5GyXtOUPRUpIOXNPzrNNPGnGZIE6OaFPsAXAOa52tEMdpc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(53546011)(26005)(5660300002)(2616005)(66556008)(66946007)(66446008)(66476007)(6512007)(316002)(64756008)(54906003)(6916009)(6506007)(91956017)(76116006)(41300700001)(122000001)(71200400001)(4326008)(8676002)(8936002)(478600001)(6486002)(83380400001)(966005)(2906002)(86362001)(36756003)(38100700002)(38070700005)(33656002)(10126625003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D012867EFB50C14BAD3B9706699CC53B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9697
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3770609-c171-4785-63e7-08dbadb4f45a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z9COxa2iKYAw3dNxxzzGdGYHODW18WeNbG0AAY2PrDAWOeXvG93CaO6lkS/wSHgXAf5uE7HotT7+nto2CgXFJzQiGcuReNpQ+MCFPJZSr0+5H4dQnY6f42F+ZWlnpb/ZWUomNtwcSK7Gw7OzXZfr/rsPoSLJKZmhcvWrmRlPUUjzTcT4WJD2ZmrvM9zMLHCAQuoeuKDgbinOa2yKagJbIculn0azIbJeEHDfhYnCgxHTOWyGJ+rl+oat4B7JE1VPCrJUWGo4k2IYgCTE+5nb1JSnM1QonT0zhJEyuh4ew7Bu/HsdEAUzLBarL44lClwvKO9yOpzK1Zgu5ylhfgmTB8bW+FRDeqvKvW1SEusNgWRocfFVW4DYhIPtiWmU1vyiobBECtZBRlBi7nVEpWm1d+s0sFSHacRy6bhqw68xRYmN3w0r9iKnPfy9Y25/gtQQBvAXY9yD9c/uXYIBOipo53E9LfrE2geltiuGaT2rlyUpIm7SNLq8UC3Tz1U2PAtLq4L+SGuMZB/hWGmtqbHDgACKGuks2xXcxq+uFA6jVmXP8fnGZez7Kfn+BgAwiwQTDmLF0UN9EMcNgFekWm0ai0IswXWrkFwd/XjtkCf/UBGsnXhdU+kNrFTs9zNo0cskuEX14Uda94ZQ6aJEHELm4dlp4sH9+2GcAz/Ja43Tmr4y9Hq6zmp83XIDu9iTk804j2+BPCW70xN21dd4Nd+eP75wycXIMuTltXsH8NR8oqBEG3pz5qtQq2sWS4aG4h4s8cIbBBdR3NFA1hWBvRq6CQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(478600001)(966005)(26005)(2616005)(70206006)(70586007)(54906003)(336012)(6506007)(6486002)(6512007)(316002)(2906002)(8676002)(6862004)(4326008)(53546011)(8936002)(5660300002)(86362001)(356005)(36756003)(81166007)(33656002)(82740400003)(47076005)(41300700001)(40460700003)(83380400001)(36860700001)(40480700001)(10126625003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 02:08:20.1457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd04524-c824-4b6f-a04c-08dbadb4f9e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8217

SGkgSmFuLA0KDQo+IE9uIFNlcCAxLCAyMDIzLCBhdCAxNToyNiwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IFRoaXMgdXNpbmcgYSBHTlUgZXh0ZW5zaW9uLCBp
dCBtYXkgbm90IGJlIGV4cG9zZWQgaW4gZ2VuZXJhbCwganVzdCBsaWtlDQo+IGlzIGRvbmUgb24g
eDg2LiBFeHRlcm5hbCBjb25zdW1lcnMgbmVlZCB0byBtYWtlIHRoaXMgdHlwZSBhdmFpbGFibGUg
dXANCj4gZnJvbnQgKGp1c3QgbGlrZSB3ZSBleHBlY3Qgeyx1fWludDxOPl90IHRvIGJlIHN1cHBs
aWVkKSAtIHVubGlrZSBvbiB4ODYNCj4gdGhlIHR5cGUgaXMgYWN0dWFsbHkgbmVlZGVkIG91dHNp
ZGUgb2YgdG9vbHMtb25seSBpbnRlcmZhY2VzLCBiZWNhdXNlDQo+IGd1ZXN0IGhhbmRsZSBkZWZp
bml0aW9ucyB1c2UgaXQuDQo+IA0KPiBXaGlsZSB0aGVyZSBhbHNvIGFkZCB1bmRlcnNjb3JlcyBh
cm91bmQgImFsaWduZWQiLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiANCj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmgN
Cj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmgNCj4gQEAgLTE1Miw4ICsxNTIs
MTAgQEANCj4gDQo+ICNkZWZpbmUgWEVOX0hZUEVSQ0FMTF9UQUcgICAwWEVBMQ0KPiANCj4gLSNk
ZWZpbmUgIGludDY0X2FsaWduZWRfdCAgaW50NjRfdCBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDgp
KSkNCj4gLSNkZWZpbmUgdWludDY0X2FsaWduZWRfdCB1aW50NjRfdCBfX2F0dHJpYnV0ZV9fKChh
bGlnbmVkKDgpKSkNCj4gKyNpZiBkZWZpbmVkKF9fWEVOX18pIHx8IGRlZmluZWQoX19YRU5fVE9P
TFNfXykNCj4gKyNkZWZpbmUgIGludDY0X2FsaWduZWRfdCAgaW50NjRfdCBfX2F0dHJpYnV0ZV9f
KChfX2FsaWduZWRfXyg4KSkpDQo+ICsjZGVmaW5lIHVpbnQ2NF9hbGlnbmVkX3QgdWludDY0X3Qg
X19hdHRyaWJ1dGVfXygoX19hbGlnbmVkX18oOCkpKQ0KPiArI2VuZGlmDQoNClRvZGF5IEkgdGVz
dGVkIHRoaXMgcGF0Y2ggYnkgb3VyIENJIChvbiB0b3Agb2YgdG9kYXnigJlzIHN0YWdpbmcpLCBh
bmQgaXQgbG9va3MNCmxpa2UgYmVsb3cgZXJyb3Igd2lsbCBoYXBwZW4gZm9yIGJvdGggYXJtMzIg
YW5kIGFybTY0IFlvY3RvIGJ1aWxkOg0KDQpUaGUgYXJtMzIgZmFpbHVyZToNCmh0dHBzOi8vcGFz
dGViaW4uY29tL3Jhdy9TN1pxbUc2eg0KDQpUaGUgYXJtNjQgZmFpbHVyZToNCmh0dHBzOi8vcGFz
dGViaW4uY29tL3Jhdy9ITUZoNXR1Uw0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiAj
aWZuZGVmIF9fQVNTRU1CTFlfXw0KPiAjZGVmaW5lIF9fX0RFRklORV9YRU5fR1VFU1RfSEFORExF
KG5hbWUsIHR5cGUpICAgICAgICAgICAgICAgICAgXA0KPiANCg0K

